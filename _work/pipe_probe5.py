# -*- coding: utf-8 -*-
# 只读探针 5（重写）：纯字面子串上下文，定形取证用。
import io, sys, glob

NOTE = u"E:/math/\u7814\u7a76\u7b14\u8bb0/"
JOBS = [
    (u"D32", [u"u-u'", u"p-p'", u"g(v)-g(v')", u"v-v'", u"pv+rg", u"sw+", u"y-z", u"b-f(z)",
              u"F(m)", u"a-c", u"x_0-ty", u"f(x_0)", u"a_n", u"D_q"]),
    (u"D25", [u"Jensen", u"(Tu)", u"markov", u"Tf", u"b_k(", u"x\\|^4", u"0\\le2\\cdot0",
              u"|_{L^2", u"\\partial"]),
    (u"D26", [u"Gauss", u"g\\|^p", u"c_p"]),
    (u"D68", [u"\\big\\lVert", u"\\big\\rVert", u"\\big\\\\"]),
    (u"D47", [u"S(p,e)", u"P'p"]),
    (u"D41", [u"\\lvert"]),
    (u"D36", [u"\\lvert T_d", u"\\lvert B", u"\\Pi T"]),
    (u"D28", [u"\\lvert\\Omega", u"S_n", u"3\\u2212s"]),
    (u"D29", [u"\\lVert A\\rVert_F", u"F(A)"]),
    (u"D24", [u"P^*P"]),
    (u"D364", [u"H^{1/3}"]),
    (u"D50", [u"\\big\\\\", u"\u6b8b\u91cf"]),
    (u"D34", [u"\\lVert"]),
]
out = []
for ID, needles in JOBS:
    p = sorted(glob.glob(NOTE + ID + u"-*.md"))[0]
    t = io.open(p, encoding=u"utf-8").read()
    out.append(u"########## %s" % ID)
    for nd in needles:
        c = t.count(nd)
        out.append(u"  <%s> count=%d" % (nd, c))
        i = 0
        shown = 0
        while shown < 4:
            j = t.find(nd, i)
            if j < 0:
                break
            a = max(0, j - 110)
            out.append(u"     ..." + t[a:j + len(nd) + 110].replace(u"\n", u"\\n"))
            i = j + 1
            shown += 1
io.open(u"E:/math/_work/pipe_probe5_out.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
sys.stdout.buffer.write(u"ok\n".encode(u"utf-8"))
