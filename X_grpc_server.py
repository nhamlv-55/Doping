# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""The Python implementation of the GRPC helloworld.Greeter server."""

from concurrent import futures
import logging
import argparse
import grpc

import indgen_conn_pb2
import indgen_conn_pb2_grpc
import glob
import os
import Doping.PySpacerSolver.spacer_solver as SS
import subprocess

import Doping.PySpacerSolver.utils as DPu
from Doping.PySpacerSolver.ExprDb import ExprDb
from X_eval import setup_model
from six.moves import cStringIO

import torch
import torch.nn as nn
from Doping.pytorchtreelstm.treelstm import batch_tree_input
class Lemma_Dp:
    def __init__(self, exp_folder, new_folder, prefix = ""):
        self.lemma = ""
        self.level = -1
        self.smtfile = None
        self.new_folder = new_folder
        self.exp_folder = exp_folder
        self.prefix = prefix

    def to_smt2(self):
        if not os.path.exists(os.path.join(self.exp_folder, self.new_folder)):
            os.makedirs(os.path.join(self.exp_folder, self.new_folder))

        if self.smtfile is None: return
        with open(os.path.join(self.exp_folder, self.smtfile), "r") as f:
            old_file_lines = f.readlines()
            params = old_file_lines[-1]
            if "dump_threshold 5.00 " in params:
                return
        new_filename = self.smtfile + ".with_lemma"+self.prefix+".smt2"
        with open(os.path.join(self.exp_folder, self.new_folder, new_filename), "w") as f:
            f.writelines(old_file_lines)
            f.write("\n")
            f.write("(act-lvl %s)\n"%(self.level))
            f.write("(ind-gen %s)\n"%(self.lemma))

class Greeter(indgen_conn_pb2_grpc.GreeterServicer):
    def __init__(self, exp_folder, new_folder, model, dataset, edb):
        print("init server")
        self.exp_folder = exp_folder
        self.new_folder = new_folder
        self.model = model
        self.dataset = dataset
        self.edb = edb
        self.seed_file = ""
        self.lemmas_q = []
        self.max_q = 50
        
        self.m = nn.Softmax(dim = 1)
        self.is_training = False
    def SayHello(self, request, context):
        return indgen_conn_pb2.HelloReply(message='Hello, %s!' % request.name)

    def SendLemma(self, request, context):
        """
        NOT USED
        """
        if len(self.lemmas_q) < self.max_q:
            self.lemmas_q.append(self.request_to_dp(request))
            logging.info("Before:", request.lemma_before)
            logging.info("After:", request.lemma_after)
            return indgen_conn_pb2.Ack(ack_message=True)
        else:
            if not self.is_training:
                self.train()
                self.is_training = True
            return indgen_conn_pb2.Ack(ack_message=False)

    def QueryModel(self, request, context):
        """
        Input:
        - lemma (a list of literals)
        - kept_lits (a list of indices of literals that are kept)
        - checking_lit (index of the literal we want to check)
        - to_be_checked_lits (a list of indices of literals that we haven't seen yet)

        Output:
        - A list of indices of literal that we should try to drop
        NOTE: for now, we only return either:
        - []: empty list ~ should keep the checking_lit literal
        - [checking_lit]:  should try to drop the checking_lit 
        """

        lemma = request.lemma
        kept_lits = request.kept_lits
        checking_lit = request.checking_lit
        to_be_checked_lits = request.to_be_checked_lits

        print("Receive lemma:", lemma)

        lit_jsons, lits = self.parse_lemma(lemma)
        print("no of lits:", len(lit_jsons))

        """
        example:
        kept_lits = [0, 1, 2, 4]
        checking_lit = 5
        => calculating
        P(l_0|l_5)>THRESHOLD,
        P(l_1|l_5)>THRESHOLD,
        P(l_2|l_5)>THRESHOLD,
        P(l_3|l_5)>THRESHOLD
        """
        #batching inputs
        #L_a_batch = [l_0, l_1, l_2, l_3)
        #L_b_batch = [l_5, l_5, l_5, l_5)
        L_a_trees = []
        L_b_trees = []
        for i in kept_lits:
            print("calculating P({}|{})".format(lits[checking_lit], lits[i]))
            L_a_trees.append(DPu.convert_tree_to_tensors(lit_jsons[i]["tree"]))
            L_b_trees.append(DPu.convert_tree_to_tensors(lit_jsons[checking_lit]["tree"]))
        L_a_batch = batch_tree_input(L_a_trees)
        L_b_batch = batch_tree_input(L_b_trees)

        #run the model
        output = self.model(L_b_batch, L_a_batch)[0]
        values, pred = torch.max(self.m(output), 1)

        pred = pred.tolist()
        print(output, values, pred)
        if 1 in pred: #In kept list there is a lit with high correlation with checking_lit -> skip the checking lit
            return indgen_conn_pb2.Answer(answer = [])
        else:
            return indgen_conn_pb2.Answer(answer = [checking_lit])

    def get_seed_file(self):
        print("\t\tIn get seed file")
        print(self.exp_folder)
        seed_files = glob.glob(self.exp_folder+"/pool_solver*.smt2")
        seed_files = sorted(seed_files)
        print(seed_files)
        self.seed_file = os.path.basename(seed_files[0])

    def dump_lemmas(self):
        """
        NOT USED
        """
        print("\t\tDumping lemmas")
        self.get_seed_file()
        for idx , (l_before, l_after) in enumerate(self.lemmas_q):
            l_after.smtfile = self.seed_file
            l_after.prefix = str(idx)
            l_after.to_smt2()

    def run_spacer_solver(self):
        """
        NOT USED
        """
        print("Running spacer solver")
        dataset = None
        input = os.path.join(self.exp_folder, self.new_folder)
        limit = 4000
        if os.path.isdir(input):
            dataset = SS.DPu.Dataset(folder = input, html_vis_page = "ind_gen_vis.html")
            SS.skip_ind_gen_folder(input, False, dataset = dataset, limit = limit)

        if dataset is not None:
            dataset.dump_html()

    def run_model_training(self):
        """
        NOT USED
        """
        print("\t\tRunning model training")
        my_env = os.environ.copy()
        my_env["PATH"]="/home/nv3le/workspace/"

        training_cmd = ["/home/nv3le/anaconda3/envs/py3/bin/python", "X_train.py"]
        training_cmd.extend(["-input", os.path.join(self.exp_folder, self.new_folder)])
        training_cmd.extend(["-Nr", "5"])
        print("\t\ttraining cmd: {}".format(" ".join(training_cmd)))
        with open("training.log", "w") as training_log:
            subprocess.Popen(training_cmd, stdout = training_log, env=my_env)

    def train(self):
        """
        NOT USED
        """
        print("\tIn Training")
        self.dump_lemmas()
        self.run_spacer_solver()
        self.run_model_training()

    def request_to_dp(self, request):
        """
        NOT USED
        """
        lemma_before = Lemma_Dp(self.exp_folder, self.new_folder)
        lemma_after = Lemma_Dp(self.exp_folder, self.new_folder)

        for l in request.lemma_before.strip().split("\n"):
            lemma_before.lemma +=l

        for l in request.lemma_after.strip().split("\n"):
            lemma_after.lemma +=l

        return (lemma_before, lemma_after)


    def parse_lemma(self, lemma):
        """
        Given a lemma in a str format, parse it into:
        - a list of literals in SMT2 format, and
        - a list of literals in JSON format
        NOTE:This is very ugly for now
        """

        #parse the lemma to PySMT representation
        lemma_cmd = "\n(ind-gen {})\n".format(lemma)
        print(lemma_cmd)
        all_cmds = self.edb.parser.get_script(cStringIO(lemma_cmd)).commands
        assert(len(all_cmds)==1)
        assert(all_cmds[0].name == "ind-gen")
        cmd = all_cmds[0]


        lits = [self.edb.converter.convert(v) for v in cmd.args.args()]
        # Use the dataset object to parse it to JSON.
        try:
            lit_jsons = self.dataset.parse_cube_to_lit_jsons(lits)
        except Exception as e:
            print(lemma)
            print(e)
        assert(len(lit_jsons)==len(lits))
        return lit_jsons, lits

def serve(exp_folder, new_folder, model, dataset, edb):
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    indgen_conn_pb2_grpc.add_GreeterServicer_to_server(Greeter(exp_folder, new_folder, model, dataset, edb), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    server.wait_for_termination()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-input', help='path to the smt2 files generated by running z3')
    parser.add_argument('-seed-smtfile', help='path to the seed pool_solver indgen smt2 query file')
    parser.add_argument("-l", "--log", dest="logLevel", choices=['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL'], default='CRITICAL', help="Set the logging level")
    parser.add_argument('--model-path', help='path to the .pt file')
    args = parser.parse_args()

    exp_folder = args.input
    new_folder = "ind_gen_files"
    seed_smtfile = args.seed_smtfile
    #need the dataset object to parse the received lemma
    dataset = DPu.Dataset(folder = os.path.dirname(args.input) )

    model = setup_model(args.model_path)
    edb = ExprDb(seed_smtfile)
    # logging.basicConfig()
    serve(exp_folder, new_folder, model, dataset, edb)
