import numpy as np
from itertools import combinations
from math import comb, sqrt, factorial

Q = 5
d = Q + 1  # dim U_Q

# basis of wedge^n: increasing tuples
levels = {n: list(combinations(range(d), n)) for n in range(d + 1)}
idx = {n: {t: i for i, t in enumerate(levels[n])} for n in range(d + 1)}


def falling(s, p):
    r = 1.0
    for k in range(p):
        r *= (s - k)
    return r


def vpair(p):
    """coefficients of v_p in basis e_i^e_j (i<j), using eq:pair"""
    v = np.zeros((d, d))
    for i, j in combinations(range(d), 2):
        if i + j != p + 1:
            continue
        val = (i - j) * sqrt(falling(Q, i) * falling(Q, j) * factorial(p) /
                             (Q * falling(2 * Q - 2, p) * factorial(i) * factorial(j)))
        v[i, j] = val
        v[j, i] = -val
    return v


P = [p for p in range(2 * Q - 1)]  # 0..2Q-2
vs = [vpair(p) for p in P]
# orthonormality check
G = np.zeros((len(vs), len(vs)))
for a in range(len(vs)):
    for b in range(len(vs)):
        G[a, b] = 0.5 * np.sum(vs[a] * vs[b])  # <v_a,v_b> for 2-forms with 1/2 convention
print("Gram offdiag max", np.abs(G - np.eye(len(G))).max(), "diag", np.round(np.diag(G), 8))

# B(v) on wedge^n: contraction. Represent state as antisymmetric tensor coeffs in basis tuples.
def wedge2(mat, vec_n):
    """left wedge by 2-form mat on an n-vector given in tuple basis -> (n+2)-vector"""
    out = np.zeros(len(levels[n := 0]))
    return None


def wedge_op(mat, n):
    """matrix of left-wedge by 2-form mat: wedge^n -> wedge^{n+2}"""
    src, tgt = levels[n], levels[n + 2]
    M = np.zeros((len(tgt), len(src)))
    for si, s in enumerate(src):
        for ti, t in enumerate(tgt):
            # sum over pairs (a<b) in t, sign of removing them, times mat[s-complement]
            acc = 0.0
            for ai in range(n + 2):
                for bi in range(ai + 1, n + 2):
                    rest = tuple(t[k] for k in range(n + 2) if k != ai and k != bi)
                    if len(rest) != n:
                        continue
                    # sign of moving t[ai],t[bi] to front (ordered ai<bi)
                    sgn = (-1) ** ((ai) + (bi - 1))
                    if s == rest:
                        acc += sgn * mat[t[ai], t[bi]]
                    elif tuple(sorted(rest)) == rest and False:
                        pass
            # also handle src not equal to rest ordering: rest is increasing since t increasing
            M[ti, si] = acc
    return M


def Bmat(mat, n):
    """B(v): wedge^n -> wedge^{n-2} = adjoint of left wedge by v on wedge^{n-2}"""
    if n < 2:
        return np.zeros((0, len(levels[n])))
    W = wedge_op(mat, n - 2)
    return W.T.conj()


# build H on Fock space (block diag)
blocks = []
Bs = [np.zeros((len(levels[n - 2]) if n >= 2 else 0, len(levels[n]))) for n in range(d + 1)]
dimN = [len(levels[n]) for n in range(d + 1)]
Hb = [np.zeros((dimN[n], dimN[n])) for n in range(d + 1)]
for n in range(d + 1):
    acc = np.zeros((dimN[n], dimN[n]))
    for v in vs:
        Bn = Bmat(v, n)
        if n >= 2:
            acc += Bn.conj().T @ Bn if Bn.shape[0] == dimN[n - 2] else np.zeros((0, 0))
    Hb[n] = acc
# careful: Bv maps n->n-2; B^dag B is n x n
Hb = []
for n in range(d + 1):
    acc = np.zeros((dimN[n], dimN[n]))
    for v in vs:
        if n >= 2:
            Bn = Bmat(v, n)  # (dimN[n-2], dimN[n])
            acc += Bn.conj().T @ Bn
    Hb.append(acc)

# W_3: V_Q (x) U_Q -> wedge^3 : columns = wedge(v_p) e_j
cols = []
for v in vs:
    Wn = wedge_op(v, 1)  # wedge^1 -> wedge^3
    for j in range(d):
        e = np.zeros(dimN[1]); e[j] = 1.0
        cols.append(Wn @ e)
W3 = np.array(cols).T  # (dimN[3], (2Q-1)*d)
print("W3 shape", W3.shape)
gram3 = W3.T @ W3
ev = np.linalg.eigvalsh(gram3)
print("W3^dag W3 eigenvalues (rounded):", np.unique(np.round(ev, 6)))

# expected 1+q_z with multiplicity d_{3,z}
def q(z):
    return (-1) ** z * falling(Q, z) / falling(2 * Q - 2, z) * (3 * z - 1 - z * (z + 1) / Q)


exp = sorted([1 + q(z)] * (3 * Q - 1 - 2 * z) for z in range(0, Q + 1))
print("expected:", np.unique(np.round(exp, 6)))
print("max diff sorted:", np.abs(np.sort(ev) - np.array(sorted(exp))).max())

# check lem:square on each N sector: H^2 = H + L3(W3(W3t W3 - I)W3t) + L4(W4 W4t)
# L3(X) on wedge^N = sum over ON basis of wedge^3-compression: build lift by matrix units
def lift(k, X, n):
    """L_k(X) on wedge^n = sum_{A,B ON basis of wedge^k} X_{AB} B(A)^dag B(B)  with B(A): n->n-k"""
    if n < k:
        return np.zeros((dimN[n], dimN[n]))
    bas = levels[k]
    out = np.zeros((dimN[n], dimN[n]))
    # build contraction matrices for each k-basis element: wedge by k-form
    Bc = []
    for t in bas:
        W = wedge_op_form(t, n - k)
        Bc.append(W.T.conj())
    for a in range(len(bas)):
        for b in range(len(bas)):
            if X[a, b] != 0:
                out += X[a, b] * (Bc[a].conj().T @ Bc[b])
    return out


def wedge_op_form(t, n):
    """left wedge by the basis t-form: wedge^n -> wedge^{n+k}"""
    k = len(t)
    src, tgt = levels[n], levels[n + k]
    M = np.zeros((len(tgt), len(src)))
    for si, s in enumerate(src):
        for ti, tt in enumerate(tgt):
            # sign: wedge(t, s) = sum ... find permutation putting t first
            acc = 0.0
            # t is increasing, s is increasing, tt is increasing; coefficient of tt in t^ws = sign of shuffle
            # build combined list
            combined = list(t) + list(s)
            if sorted(combined) != list(tt):
                continue
            if len(set(combined)) != k + n:
                continue
            # sign of permutation sorting combined into tt
            inv = 0
            for i2 in range(len(combined)):
                for j2 in range(i2 + 1, len(combined)):
                    if combined[i2] > combined[j2]:
                        inv += 1
            acc = (-1) ** inv
            M[ti, si] = acc
    return M


X3 = W3 @ (gram3 - np.eye(gram3.shape[0])) @ W3.T  # operator on wedge^3 in tuple basis
W4cols = []
for v in vs:
    for w in vs:
        Wf = wedge_op_form(v_to_tuple_form(v), 0) if False else None
# build W4: V_Q x V_Q -> wedge^4 using matrices
W4cols = []
for a in range(len(vs)):
    Wa = wedge_op(vs[a], 2)  # wedge^2 -> wedge^4
    for j in range(len(vs)):
        vj = vs[j]
        # wedge v_a with v_j: apply as 2-form wedge to the 2-vector v_j (expressed in tuple basis)
        vec = np.zeros(dimN[2])
        for ti, t in enumerate(levels[2]):
            vec[ti] = 0.5 * (vj[t[0], t[1]] - vj[t[1], t[0]]) * sqrt(2) / sqrt(2)
            vec[ti] = vj[t[0], t[1]]
        W4cols.append(Wa @ vec)
W4 = np.array(W4cols).T
print("W4 shape", W4.shape)
X4 = W4 @ W4.T
ok = True
for n in range(d + 1):
    lhs = Hb[n] @ Hb[n]
    rhs = Hb[n] + lift(3, X3, n) + lift(4, X4, n)
    err = np.abs(lhs - rhs).max()
    print("sector N=%d dim=%d  ||H^2-RHS||=%.3e" % (n, dimN[n], err))
    ok = ok and err < 1e-9
print("lem:square verified:", ok)
