# -*- coding: utf-8 -*-
# 只读探针 4：在指定篇里按正则找已修正的写法样本，供定形取证。
import io, re, sys, glob

NOTE = u"E:/math/\u7814\u7a76\u7b14\u8bb0/"
JOBS = [
    (u"D25", u"\\\\lVert[^$]{0,40}_\\\\partial"),
    (u"D25", u"FG"),
    (u"D25", u"contraction"),
    (u"D25", u"norm_bloch|\\\\lVert u\\\\rVert"),
    (u"D25", u"\\\\lVert[^$]{0,30}\\\\rVert"),
    (u"D26", u"\\\\lVert|\\\\lvert"),
    (u"D26", u"c_p|gauss|Gauss|\bg\b"),
    (u"D47", u"S\\(p,e\\)|\\\\lVert S|\\\\lvert S"),
    (u"D47", u"\\\\lVert p_1|p_1\\\\rVert|\\\\lvert p_1"),
    (u"D29", u"\\\\lVert A\\\\rVert_F"),
    (u"D68", u"\\\\Vert|\\\\mid"),
    (u"D36", u"\\\\lvert B|\\\\lvert T_d|\\\\lvert \\\\Pi T_d"),
    (u"D28", u"\\\\lvert\\\\Omega|\\\\lvert S_n|3-s|3\\\\u2212s"),
    (u"D24", u"\\\\lVert P|P\\^\\*P"),
    (u"D30", u"\\\\lVert f\\\\rVert"),
    (u"D34", u"\\\\lVert\\\\\\\\cdot|\\\\lVert [a-z]"),
    (u"D364", u"\\\\lVert f\\\\rVert|H\\^\\{1/3\\}"),
    (u"D44", u"\\\\lvert Z_m\\\\rvert"),
    (u"D41", u"\\\\lvert\\\\\\\\mathcal"),
    (u"D65", u"\\\\lVert x\\\\rVert|\\\\lVert y\\\\rVert|x\\\\\\\\pm z"),
    (u"D50", u"\\\\mid|upharpoonright|\u5927"),
    (u"D32", u"\\\\lvert D_q|\\\\lVert D_q"),
]
out = []
for ID, pat in JOBS:
    p = sorted(glob.glob(NOTE + ID + u"-*.md"))[0]
    t = io.open(p, encoding=u"utf-8").read()
    res = []
    for m in re.finditer(pat, t):
        a = max(0, m.start() - 80)
        res.append(t[a:m.end() + 80].replace(u"\n", u"\\n"))
        if len(res) >= 8:
            break
    out.append(u"%%%% %s PAT=%s hits=%d" % (ID, pat, len(res)))
    for r in res:
        out.append(u"   " + r)
io.open(u"E:/math/_work/pipe_probe4_out.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
sys.stdout.buffer.write((u"written %d\n" % len(out)).encode(u"utf-8"))
