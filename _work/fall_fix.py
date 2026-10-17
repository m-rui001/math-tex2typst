# -*- coding: utf-8 -*-
# D189 的 \fall 泄漏：按素材 preamble 的定义 \newcommand{\fall}[2]{(#1)_{#2}} 精确展开。
# 只吃两个花括号参数的形态；任何形异的用法一律留下不发明，交人工判定。
import glob, io, re, sys

APPLY = u"--apply" in sys.argv
FALL = u"\\fall"
RX = re.compile(r"\\fall\{([^{}]*)\}\{([^{}]*)\}")
p = glob.glob(u"研究笔记/D189-*.md")[0]
b0 = io.open(p, "rb").read()
L = b0.decode("utf-8").split(u"\n")
hits = 0
for i, l in enumerate(L):
    if FALL not in l:
        continue
    new, n = RX.subn(lambda m: u"(" + m.group(1) + u")_{" + m.group(2) + u"}", l)
    left = new.count(FALL)
    if left:
        print(u"  SHAPE @%d left=%d | %s" % (i + 1, left, new.strip()[:200]))
    hits += n
    L[i] = new
raw = u"\n".join(L).encode("utf-8")
print(u"sites=%d survivors=%d bytes %d->%d (%+d) tick %d->%d dollar %d->%d pipe %d->%d" % (
    hits, raw.decode("utf-8").count(FALL), len(b0), len(raw), len(raw) - len(b0),
    b0.count(b"`"), raw.count(b"`"), b0.count(b"$"), raw.count(b"$"),
    b0.count(b"|"), raw.count(b"|")))
assert u"\r" not in raw.decode("utf-8")
if APPLY:
    io.open(u"_work/D189.pre-fall.md", "wb").write(b0)
    io.open(p, "wb").write(raw)
