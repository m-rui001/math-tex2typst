# -*- coding: utf-8 -*-
# D49 收稿修补：
#   (1) 三处行内代码的闭合反引号误打成 $（274、326、332），其中 326 是 `eq:` 标签式；
#       只把那一枚 $ 改回反引号，不做任何奇偶补偿。
#   (2) 第 769 行台账格内 $|H|(K)=0$ 是裸竖线（该行因此 8 枚），换成 \lvert...\rvert。
#   (3) §0 的队列登记串缺「其他」前缀；只改 §0 那一处，第 36 节里引用该串的勘误句留在原处。
import glob
import io
import sys

sys.stdout.reconfigure(encoding="utf-8")
B = chr(92)
TICK = chr(96)
D = chr(36)

CLOSES = [274, 326, 332]
ROW = 769
ROW_OLD = D + u"|H|(K)=0" + D
ROW_NEW = D + B + u"lvert H" + B + u"rvert(K)=0" + D
S0_OLD = u"下，队列第 43 行号"
S0_NEW = u"下，其他队列第 43 行号"

APPLY = u"--apply" in sys.argv
p = glob.glob(u"研究笔记/D49-*.md")[0]
raw = io.open(p, encoding="utf-8").read()
assert u"\r" not in raw
L = raw.split(u"\n")
n0 = len(raw.encode("utf-8"))
assert len(L) == 779, len(L)
for ln in CLOSES:
    assert L[ln - 1].count(D) % 2 == 1, (ln, L[ln - 1].count(D))
assert L[ROW - 1].count(u"|") == 8, L[ROW - 1].count(u"|")

# (1) 逐行把「反引号开的引用串末尾那枚 $」改回反引号
import re
PAT = re.compile(TICK + u"([A-Za-z0-9_.\\-]+:[A-Za-z0-9_.\\-]+)[$]")
for ln in CLOSES:
    new, cnt = PAT.subn(lambda m: TICK + m.group(1) + TICK, L[ln - 1])
    assert cnt == 1, (ln, cnt)
    L[ln - 1] = new
    assert L[ln - 1].count(D) % 2 == 0, (ln, L[ln - 1].count(D))

# (2) 裸竖线：同一个式子在正文里也出现，那里的裸竖线不是缺陷，只改台账这一格
assert L[ROW - 1].count(ROW_OLD) == 1, L[ROW - 1].count(ROW_OLD)
L[ROW - 1] = L[ROW - 1].replace(ROW_OLD, ROW_NEW, 1)
assert L[ROW - 1].count(u"|") == 6, L[ROW - 1].count(u"|")

# (3) §0 串
raw = u"\n".join(L)
assert raw.count(S0_OLD) == 1, raw.count(S0_OLD)
raw = raw.replace(S0_OLD, S0_NEW, 1)
assert raw.count(u"\n") == 778, raw.count(u"\n")
assert raw.count(u"\r") == 0
pipes = {}
for l in raw.split(u"\n"):
    if l.startswith(u"| "):
        n = l.count(u"|")
        pipes[n] = pipes.get(n, 0) + 1
print(u"bytes", n0, u"->", len(raw.encode("utf-8")), u"dollar", raw.count(D),
      u"backtick", raw.count(TICK), u"pipes", pipes)
if APPLY:
    io.open(p, "w", encoding="utf-8", newline="\n").write(raw)
    print(u"WROTE", p)
