import torch
torch.set_default_tensor_type('torch.cuda.FloatTensor')
import torch.nn as nn
import torch.nn.functional as F
from Doping.pytorchtreelstm.treelstm import TreeLSTM
import Doping.pytorchtreelstm.treelstm.util as TLUtil
class Model(torch.nn.Module):
    def __init__(self, vocab_size, sort_vocab_size, emb_dim = 10, tree_dim = 10, out_dim = 3, use_c = True, use_const_emb = True, device = torch.device('cuda')):
        super().__init__()
        print("VOCAB SIZE:", vocab_size)
        print("SORT SIZE", sort_vocab_size)
        print("USE C", use_c)
        print("USE CONSTANT EMB", use_const_emb)
        self._emb_dim = emb_dim
        self._tree_dim = tree_dim
        self._use_c = use_c
        self._use_const_emb = use_const_emb
        self.emb = nn.Embedding(vocab_size, emb_dim )
        self.sort_emb = nn.Embedding(sort_vocab_size, emb_dim )
        self.device = device
        if self._use_const_emb:
            self.treelstm = TreeLSTM(emb_dim*3, tree_dim)
        else:
            self.treelstm = TreeLSTM(emb_dim*2, tree_dim)
        if self._use_c:
            self.fc1 = nn.Linear(tree_dim*3, int(tree_dim))
        else:
            self.fc1 = nn.Linear(tree_dim*2, int(tree_dim))
        self.fc2 = nn.Linear(int(tree_dim), out_dim)

    def forward(self, cube, lit_a, lit_b):
        h_a, c_a, a_sz = self.forward_a_tree(lit_a)
        h_b, c_b, b_sz = self.forward_a_tree(lit_b)

        h_a = TLUtil.stack_last_h(h_a, a_sz)
        h_b = TLUtil.stack_last_h(h_b, b_sz)

        assert(h_a.shape[0] == h_b.shape[0])
        # assert(h_a.shape[0] == h_c.shape[0])
        batch_size = h_a.shape[0]
        h_a = h_a.view(batch_size, 1, -1)
        h_b = h_b.view(batch_size, 1, -1)
        # print(h_a.shape, h_b.shape, h_c.shape)
        # fuse_a_b = torch.matmul(h_a, h_b)
        # print(fuse_a_b.shape)

        if self._use_c:
            h_c, c_c, c_sz = self.forward_a_tree(cube)
            # print(h_a.shape, h_b.shape, h_c.shape)
            h_c = TLUtil.stack_last_h(h_c, c_sz)
            h_c = h_c.view(batch_size, 1, -1)
            h = torch.cat((h_c, h_a, h_b), dim = -1)
        else:
            h = torch.cat((h_a, h_b), dim = -1)
        # h = torch.matmul(h_c, fuse_a_b)
        # print(h.shape)
        logits = self.fc2(F.relu(self.fc1(h)))
        return logits.view(batch_size, -1)

    def forward_a_tree(self, tree):
        features = tree["features"].to(self.device)
        node_order = tree["node_order"].to(self.device)
        adjacency_list = tree["adjacency_list"].to(self.device)
        edge_order = tree["edge_order"].to(self.device)
        # print(features.shape)
        token_feat = features[:,0]
        sort_feat = features[:,1]
        token_emb = self.emb(token_feat)
        sort_emb = self.sort_emb(sort_feat)
        # print(token_emb.shape)
        # print(const_emb.shape)
        if self._use_const_emb:
            const_emb = features[:, 2:2+self._emb_dim]*1.0
            features = torch.cat((token_emb, sort_emb, const_emb), dim = 1)
        else:

            features = torch.cat((token_emb, sort_emb), dim = 1)
        
        # features = token_emb
        # print(features.shape)
        h, c = self.treelstm(features, node_order, adjacency_list, edge_order)
        return h,c, tree["tree_sizes"] 
 