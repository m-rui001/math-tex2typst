import importlib.util, sys, io, contextlib
from fractions import Fraction as F
spec = importlib.util.spec_from_file_location("chk", "E:/math/_work/check_laughlin_fourbody.py")
m = importlib.util.module_from_spec(spec)
sys.modules["chk"] = m
with contextlib.redirect_stdout(io.StringIO()):
    spec.loader.exec_module(m)

eps = F(3, 10**6)

def build(D):
    R, Y = m.computeY(D)
    _, Z = m.computeZ(D)
    d = len(R)
    u = [m.ur(D, r) for r in R]
    diag = [[((2 if R[i] == 1 else 0) + eps) * u[i] if i == j else F(0) for j in range(d)] for i in range(d)]
    DY = [[u[i] * Y[i][j] * u[j] for j in range(d)] for i in range(d)]
    B = [[diag[i][j] - DY[i][j] for j in range(d)] for i in range(d)]
    ZB = [[sum(Z[i][k] * B[k][j] for k in range(d)) for j in range(d)] for i in range(d)]
    M = [[sum(ZB[i][k] * Z[k][j] for k in range(d)) for j in range(d)] for i in range(d)]
    return R, Y, Z, M

for D in [5, 12]:
    R, Y, Z, M = build(D)
    print("D=", D, "R=", R, "d=", len(R))
    print("  M[0][0] =", M[0][0], "=", float(M[0][0]))
    print("  M[1][1] =", float(M[1][1]) if len(M) > 1 else None)
    print("  tr M    =", float(sum(M[i][i] for i in range(len(M)))))

lean_pivot_5 = F(56737668577815655510619653, 300647710720000000000000)
print("Lean Positive05 first pivot =", float(lean_pivot_5))
