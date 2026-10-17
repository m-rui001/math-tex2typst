# -*- coding: utf-8 -*-
# 只读探针 2：每篇的 \lVert / \lvert / \Vert / \vert / \mid / \| 计数与包裹样本，
# 以及缺陷行按 $…$ 跨度切分后的 \| 配对结构。输出 _work/pipe_probe2_out.txt
import io, re, os, sys, glob

NOTE = u"E:/math/\u7814\u7a76\u7b14\u8bb0/"
IDS = [u"D25", u"D32", u"D65", u"D47", u"D36", u"D26", u"D28", u"D29", u"D41", u"D68",
       u"D30", u"D34", u"D24", u"D364", u"D44", u"D50"]

def path_of(ID):
    return sorted(glob.glob(NOTE + ID + u"-*.md"))[0]

out = []
def w(s):
    out.append(s)

for ID in IDS:
    p = path_of(ID)
    t = io.open(p, encoding=u"utf-8").read()
    lines = t.split(u"\n")
    w(u"########## %s  %s  size=%d lines=%d" % (ID, os.path.basename(p), len(t.encode(u"utf-8")), len(lines)))
    for tok in [u"\\lVert", u"\\rVert", u"\\lvert", u"\\rvert", u"\\Vert", u"\\vert", u"\\mid", u"\\|"]:
        w(u"  count %-10s = %d" % (tok, t.count(tok)))
    # 样本：\lVert / \lvert 各自包裹什么（各取 12 个）
    for tok, cl in ((u"\\lVert", u"\\rVert"), (u"\\lvert", u"\\rvert"), (u"\\Vert", u"\\Vert"), (u"\\mid", None)):
        ms = re.findall(u"\\\\" + tok[1:] + u".{0,60}", t)
        w(u"  SAMPLE %s (%d shown):" % (tok, min(12, len(ms))))
        for m in ms[:12]:
            w(u"     " + m.replace(u"\n", u"\\n"))
    # 正文（非表格行）里的 $a\mid b$ 主流写法样本
    body_mid = [l for l in lines if not l.startswith(u"|") and u"\\mid" in l]
    w(u"  BODY \\MID lines=%d" % len(body_mid))
    for l in body_mid[:6]:
        for m in re.findall(u".{0,30}\\\\mid.{0,30}", l):
            w(u"     " + m)

io.open(u"E:/math/_work/pipe_probe2_out.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
sys.stdout.buffer.write(("written %d lines\n" % len(out)).encode(u"utf-8"))
