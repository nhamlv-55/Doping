# import Tree
import z3
import Doping.utils.ast_to_tree as Du

def test_1():
    x1, x2, x3 = z3.Reals('x1 x2 x3')
    x1_f = z3.Bool('x1_f')
    expr = z3.And((70/17*x1 + 2*x2)<10, x1_f, (x1>10))
    print(expr)
    tree = Du.ast_to_node(expr)
    print(tree)
test_1()
