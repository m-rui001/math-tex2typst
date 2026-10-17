# -*- coding: utf-8 -*-
# 控制字融合体回改：把「命令名吞掉后面那个字母」的写法拆回两枚 token。
# 白名单逐枚手判过（_work/fuse_scan.txt 的窗口），落点只认 _work/texmask.py 标出的数学跨度：
# 围栏行、行内反引号跨度（素材逐字引文）与式外散文一律不动。
# 算子名一类的作者自造记号（\supp \Pic \Proj \range \lem ...）不在表内——那是记号不是融合体。
# 逐篇验收：行数、$ 数、反引号数三项必须不变，字节增量必须等于逐处替换长度差之和。
# 用法：python _work/fuse_fix.py [--apply]
import glob
import io
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from texmask import math_flags

APPLY = u"--apply" in sys.argv
B = chr(92)
INFLIGHT = set()
ip = u"E:/math/.tools/inflight.txt"
if os.path.exists(ip):
    INFLIGHT = set(io.open(ip, encoding=u"utf-8").read().split())

FIX = {}
for c in u"PBE NFG":
    FIX[B + u"cal" + c] = B + u"mathcal{" + c + u"}"
for c in u"vwxygAHFQBVuf":
    FIX[B + u"langle" + c] = B + u"langle " + c
FIX[B + u"ranglem"] = B + u"rangle m"
FIX[B + u"ranglew"] = B + u"rangle w"
FIX[B + u"bigrvert"] = B + u"bigr" + B + u"rvert"
FIX[B + u"Bigrvert"] = B + u"Bigr" + B + u"rvert"
FIX[B + u"inX"] = B + u"in X"
FIX[B + u"toM"] = B + u"to M"
FIX[B + u"toX"] = B + u"to X"
FIX[B + u"mapstoK"] = B + u"mapsto K"
FIX[B + u"hookrightarrowX"] = B + u"hookrightarrow X"
FIX[B + u"leqc"] = B + u"leq c"
FIX[B + u"lceilD"] = B + u"lceil D"
FIX[B + u"sqrtg"] = B + u"sqrt g"
FIX[B + u"sqrth"] = B + u"sqrt h"
FIX[B + u"lambdaG"] = B + u"lambda G"
FIX[B + u"deltaR"] = B + u"delta R"
FIX[B + u"deltaM"] = B + u"delta M"
FIX[B + u"betam"] = B + u"beta m"
FIX[B + u"nuW"] = B + u"nu W"
FIX[B + u"ella"] = B + u"ell a"
FIX[B + u"ellf"] = B + u"ell f"
FIX[B + u"operatornameSm"] = B + u"operatorname{Sm}"

PAT = re.compile(u"|".join(
    re.escape(k) + u"(?![A-Za-z])" for k in sorted(FIX, key=len, reverse=True)))

notes = sites = 0
for f in sorted(glob.glob(u"E:/math/" + u"研究笔记" + u"/D*.md")):
    key = os.path.basename(f).split(u"-")[0]
    if key in INFLIGHT:
        continue
    raw = io.open(f, u"rb").read()
    old = raw.decode(u"utf-8")
    if B not in old:
        continue
    lines = old.split(u"\n")
    flags = math_flags(lines)
    delta = 0
    n = 0
    for i, l in enumerate(lines):
        pieces = []
        pos = 0
        for m in PAT.finditer(l):
            if m.start() < pos or not any(flags[i][m.start():m.end()]):
                continue
            rep = FIX[m.group(0)]
            pieces.append(l[pos:m.start()])
            pieces.append(rep)
            pos = m.end()
            delta += len(rep) - len(m.group(0))
            n += 1
        if pos:
            lines[i] = u"".join(pieces) + l[pos:]
    if not n:
        continue
    new = u"\n".join(lines)
    ok = (new.count(u"\n") == old.count(u"\n") and new.count(u"$") == old.count(u"$")
          and new.count(u"`") == old.count(u"`")
          and len(new.encode(u"utf-8")) - len(raw) == delta)
    notes += 1
    sites += n
    print(u"%s fixed=%d delta=%+dB verify=%s%s" % (
        key, n, delta, ok, u"" if ok else u"  <-- REFUSED"))
    if APPLY and ok:
        io.open(u"E:/math/_work/" + key + u".pre-fuse.md", u"wb").write(raw)
        io.open(f, u"wb").write(new.encode(u"utf-8"))
print(u"notes=%d sites=%d %s" % (notes, sites, u"APPLIED" if APPLY else u"dry"))
