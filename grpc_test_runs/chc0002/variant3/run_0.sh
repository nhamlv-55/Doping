#!/usr/bin/env bash

CPU=930
MEM=16384

/home/nv3le/opt/z3grpc/build/z3 fp.spacer.dump_benchmarks=true fp.spacer.dump_threshold=99999 fp.spacer.use_expansion=false fp.spacer.arith.solver=6 fp.print_statistics=true fp.spacer.use_h_inductive_generalizer=42 fp.spacer.use_inductive_generalizer=false fp.spacer.grpc_host_port="localhost:50052" fp.validate=true -tr:spacer.ind_gen -T:$CPU -memory:$MEM $1 
cp .z3-trace solving_z3_trace
