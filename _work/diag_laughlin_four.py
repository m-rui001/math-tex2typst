import importlib.util, sys, io, contextlib, math
from fractions import Fraction as F
spec = importlib.util.spec_from_file_location("chk", "E:/math/_work/check_laughlin_fourbody.py")
m = importlib.util.module_from_spec(spec)
sys.modules["chk"] = m
with contextlib.redirect_stdout(io.StringIO()):
    spec.loader.exec_module(m)

def mmul(A, B):
    n = len(A); p = len(B[0]); k = len(B)
    return [[sum(A[i][t] * B[t][j] for t in range(k)) for j in range(p)] for i in range(n)]

def tr(A):
    return sum(A[i][i] for i in range(len(A)))

def coeffs(M):
    # Leverrier-Faddeev on -M as in the script
    d = len(M)
    J = [[F(1) if i == j else F(0) for j in range(d)] for i in range(d)]
    MM = [[-M[i][j] for j in range(d)] for i in range(d)]
    cs = []
    for b in range(1, d + 1):
        X = mmul(MM, J)
        c = tr(X) / b
        cs.append(c)
        J = [[c if i == j else F(0) for j in range(d)] for i in range(d)]
        for i in range(d):
            for j in range(d):
                J[i][j] -= X[i][j]
    return cs

def sgn(c):
    return '+' if c > 0 else ('0' if c == 0 else '-')

paper = {1:'0',2:'0',3:'00',4:'00',5:'+00',6:'000',7:'+000',8:'+000',9:'++000',10:'+0000',
         11:'+++000',12:'++0000',13:'++++000',14:'+++0000',15:'+++++000',16:'++++0000',
         17:'++++++000',18:'+++++0000',19:'+++++++000',20:'++++++0000',21:'++++++++000',
         22:'+++++++0000',23:'+++++++++000'}

eps = F(3, 10**6)
for D in [1, 3, 5, 6, 7, 8, 9, 10, 11]:
    R, Y = m.computeY(D)
    Zr, Z = m.computeZ(D)
    d = len(R)
    u = [m.ur(D, r) for r in R]
    DU = [[u[i] * Y[i][j] * u[j] if i == j else F(0) for j in range(d)] for i in range(d)]
    DY = [[u[i] * Y[i][j] * u[j] for j in range(d)] for i in range(d)]
    ZYZ = mmul(mmul(Z, DY), Z)
    diagpart = [[((2 * (1 if R[i] == 1 else 0) + eps) * u[i]) if i == j else F(0) for j in range(d)] for i in range(d)]
    ZDZ = mmul(mmul(Z, diagpart), Z)
    B = [[diagpart[i][j] - DY[i][j] for j in range(d)] for i in range(d)]
    M = mmul(mmul(Z, B), Z)
    cs = coeffs(M)
    mine = ''.join(sgn(c) for c in cs)
    print("D=%2d d=%d  paper=%s mine=%s %s" % (D, d, paper[D], mine, 'OK' if mine == paper[D] else 'BAD'))
    print("     tr(ZDZ)=%s  tr(Z D_u Y D_u Z)=%s" % (float(tr(ZDZ)), float(tr(ZYZ))))
    print("     Y diag floats:", ["%.6g" % float(Y[i][i]) for i in range(d)])
    print("     Z diag floats:", ["%.6g" % float(Z[i][i]) for i in range(d)])
