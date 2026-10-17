# -*- coding: utf-8 -*-
# 台账裸竖线欠账表 17 行的逐枚裁决回改（D68 那一行走 pipe_fix.py 的机械通道）。
# 两副口径：数学跨度里的裸 | -> \lvert \rvert 或限制记号 \upharpoonright；
# 反引号里的逐字源码引文 -> \| 转义（GFM 表格里 \| 连代码跨度内也算转义，引文形状不变）。
# 用法：python _work/pipe_adjudicate.py [--apply]
import io
import os
import sys

B = "\\"
NOTE = u"研究笔记"
APPLY = u"--apply" in sys.argv

# (ID, 行号, 原文片段, 替换片段)
REPL = [
    (u"D09", 379, u"$g|_H=h$", u"$g" + B + u"upharpoonright_H=h$"),
    (u"D34", 533, u"$A_r|_{\\log2=1}$", u"$A_r" + B + u"upharpoonright_{\\log2=1}$"),
    (u"D43", 562, u"$\\deg H|_{\\text{line}}$", u"$\\deg H" + B + u"upharpoonright_{\\text{line}}$"),
    (u"D28", 1162, u"|F|", u"$" + B + u"lvert F" + B + u"rvert$"),
    (u"D28", 1163, u"|R|", u"$" + B + u"lvert R" + B + u"rvert$"),
    (u"D53", 514, u"|S|", u"$" + B + u"lvert S" + B + u"rvert$"),
    (u"D25", 1870, u"|s_{kj}|", B + u"|s_{kj}" + B + u"|"),
    (u"D25", 1886, u"|u|^2-|v|^2", B + u"|u" + B + u"|2-" + B + u"|v" + B + u"|2"),
    (u"D25", 1887, u"|\\zeta_i-\\zeta_j|", B + u"|\\zeta_i-\\zeta_j" + B + u"|"),
    (u"D34", 654, u"2·|E|/|V|", u"2·" + B + u"|E" + B + u"|/" + B + u"|V" + B + u"|"),
    (u"D34", 658, u"(∑|p−q|)/2", u"(∑" + B + u"|p−q" + B + u"|)/2"),
    (u"D34", 660, u"(∑|p−q|)/2", u"(∑" + B + u"|p−q" + B + u"|)/2"),
    (u"D34", 739, u"(∑ i, |p i - q i|)/2", u"(∑ i, " + B + u"|p i - q i" + B + u"|)/2"),
    (u"D49", 444, u"|x-q|", B + u"|x-q" + B + u"|"),
    (u"D103", 598, u"log|Algebra.norm ℚ Δ|", u"log" + B + u"|Algebra.norm ℚ Δ" + B + u"|"),
    (u"D103", 601, u"log|N(Δ)|", u"log" + B + u"|N(Δ)" + B + u"|"),
    (u"D103", 602, u"log|N(Δ)|", u"log" + B + u"|N(Δ)" + B + u"|"),
]

byfile = {}
for ID, ln, old, new in REPL:
    byfile.setdefault(ID, []).append((ln, old, new))

report = []
tot = 0
for ID in sorted(byfile, key=lambda k: (len(k), k)):
    import glob
    gs = glob.glob(u"E:/math/" + NOTE + u"/" + ID + u"-*.md")
    if not gs:
        report.append(u"%s NOFILE" % ID)
        continue
    p = gs[0]
    raw = io.open(p, u"rb").read().decode(u"utf-8")
    lines = raw.split(u"\n")
    n = 0
    d_dol = d_tick = 0
    for ln, old, new in byfile[ID]:
        l = lines[ln - 1]
        c = l.count(old)
        if c != 1:
            report.append(u"%s:%d REFUSE occurrences=%d  %r" % (ID, ln, c, old))
            continue
        d_dol += new.count(u"$") - old.count(u"$")
        d_tick += new.count(u"`") - old.count(u"`")
        lines[ln - 1] = l.replace(old, new)
        n += 1
        report.append(u"%s:%d OK" % (ID, ln))
    tot += n
    if not n:
        continue
    new_text = u"\n".join(lines)
    ok = (new_text.count(u"\n") == raw.count(u"\n")
          and new_text.count(u"$") - raw.count(u"$") == d_dol
          and new_text.count(u"`") - raw.count(u"`") == d_tick
          and u"\r" not in new_text)
    report.append(u"%s applied=%d/%d verify=%s dollars=%+d ticks=%+d delta=%+dB" % (
        ID, n, len(byfile[ID]), ok, d_dol, d_tick,
        len(new_text.encode(u"utf-8")) - len(raw.encode(u"utf-8"))))
    if APPLY and ok:
        io.open(u"E:/math/_work/%s.pre-pipeadj.md" % ID, u"wb").write(raw.encode(u"utf-8"))
        io.open(p, u"wb").write(new_text.encode(u"utf-8"))

report.append(u"NOTES=%d rows=%d/%d %s" % (
    len(byfile), tot, len(REPL), u"APPLIED" if APPLY else u"dry"))
io.open(u"E:/math/_work/pipe_adjudicate_report.txt", u"wb").write(
    u"\n".join(report).encode(u"utf-8"))
print(u"rows=%d/%d %s -> _work/pipe_adjudicate_report.txt" % (tot, len(REPL), APPLY))
