import numpy as np
from itertools import combinations
from math import sqrt, factorial

Q = 5
d = Q + 1  # dim U_Q
levels = {n: list(combinations(range(d), n)) for n in range(d + 1)}
dimN = [len(levels[n]) for n in range(d + 1)]


def falling(s, p):
    r = 1.0
    for k in range(p):
        r *= (s - k)
    return r


def vpair(p):
    v = np.zeros((d, d))
    for i, j in combinations(range(d), 2):
        if i + j != p + 1:
            continue
        val = (i - j) * sqrt(falling(Q, i) * falling(Q, j) * factorial(p) /
                             (Q * falling(2 * Q - 2, p) * factorial(i) * factorial(j)))
        v[i, j] = val
        v[j, i] = -val
    return v


vs = [vpair(p) for p in range(2 * Q - 1)]
G = np.array([[0.5 * np.sum(a * b) for b in vs] for a in vs])
print("v_p orthonormal: max|G-I| = %.3e" % np.abs(G - np.eye(len(G))).max())


def wedge_op(mat, n):
    """left wedge by antisymmetric 2-form mat: wedge^n -> wedge^{n+2}"""
    src, tgt = levels[n], levels[n + 2]
    M = np.zeros((len(tgt), len(src)))
    for si, s in enumerate(src):
        for ti, t in enumerate(tgt):
            acc = 0.0
            for ai in range(n + 2):
                for bi in range(ai + 1, n + 2):
                    rest = tuple(t[k] for k in range(n + 2) if k != ai and k != bi)
                    if rest == s:
                        acc += (-1) ** (ai + bi - 1) * mat[t[ai], t[bi]]
            M[ti, si] = acc
    return M


def wedge_form(t, n):
    """left wedge by the basis t-form (increasing tuple): wedge^n -> wedge^{n+|t|}"""
    k = len(t)
    src, tgt = levels[n], levels[n + k]
    M = np.zeros((len(tgt), len(src)))
    for si, s in enumerate(src):
        combi = list(t) + list(s)
        if sorted(combi) != list(tgt[0]) * 0 + sorted(combi):
            pass
        if len(set(combi)) != k + n:
            continue
        tt = tuple(sorted(combi))
        if tt not in idx:
            pass
        ti = tgt.index(tt)
        inv = 0
        for i2 in range(len(combi)):
            for j2 in range(i2 + 1, len(combi)):
                if combi[i2] > combi[j2]:
                    inv += 1
        M[ti, si] = (-1) ** inv
    return M


idx = {n: {t: i for i, t in enumerate(levels[n])} for n in range(d + 1)}

# H on each sector
Hb = []
for n in range(d + 1):
    acc = np.zeros((dimN[n], dimN[n]))
    if n >= 2:
        for v in vs:
            Bn = wedge_op(v, n - 2).T  # B(v): wedge^n -> wedge^{n-2}
            acc += Bn.T @ Bn
    Hb.append(acc)

# W_3 and its Gram
cols = []
for v in vs:
    Wo = wedge_op(v, 1)
    for j in range(d):
        e = np.zeros(dimN[1]); e[j] = 1.0
        cols.append(Wo @ e)
W3 = np.array(cols).T
gram3 = W3.T @ W3
ev = np.sort(np.linalg.eigvalsh(gram3))


def q(z):
    return (-1) ** z * falling(Q, z) / falling(2 * Q - 2, z) * (3 * z - 1 - z * (z + 1) / Q)


exp = []
for z in range(0, Q + 1):
    exp += [1 + q(z)] * (3 * Q - 1 - 2 * z)
exp = sorted(exp)
print("lem:q check: max|eig - (1+q_z)| = %.3e" % np.abs(ev - np.array(exp)).max())
print("  q_z for z=0..Q:", [round(q(z), 6) for z in range(Q + 1)])
print("  W3 R_{3,z}=0 for z in {0,1,3}: q_z =", [round(q(z), 6) for z in (0, 1, 3)])

# W_4 : V_Q (x) V_Q -> wedge^4  (ordered pairs)
W4cols = []
for a in range(len(vs)):
    Wo = wedge_op(vs[a], 2)
    vec = np.zeros(dimN[2])
    for ti, t in enumerate(levels[2]):
        vec[ti] = vs[a][t[0], t[1]]
    # for each second factor v_j: wedge v_a with v_j
    for j in range(len(vs)):
        vj = np.zeros(dimN[2])
        for ti, t in enumerate(levels[2]):
            vj[ti] = vs[j][t[0], t[1]]
        W4cols.append(Wo @ vj)
W4 = np.array(W4cols).T


def lift(k, X, n):
    if n < k:
        return np.zeros((dimN[n], dimN[n]))
    Bc = [wedge_form(t, n - k).T for t in levels[k]]
    out = np.zeros((dimN[n], dimN[n]))
    for a, ta in enumerate(levels[k]):
        for b, tb in enumerate(levels[k]):
            if X[a, b] != 0:
                out += X[a, b] * (Bc[a].T @ Bc[b])
    return out


X3 = W3 @ (gram3 - np.eye(gram3.shape[0])) @ W3.T
X4 = W4 @ W4.T
allok = True
for n in range(d + 1):
    lhs = Hb[n] @ Hb[n]
    rhs = Hb[n] + lift(3, X3, n) + lift(4, X4, n)
    err = np.abs(lhs - rhs).max()
    allok = allok and err < 1e-9
    print("lem:square sector N=%d dim=%-3d ||H^2-RHS||=%.3e" % (n, dimN[n], err))
print("lem:square verified:", allok)
