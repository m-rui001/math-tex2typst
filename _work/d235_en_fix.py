# -*- coding: utf-8 -*-
# D235 中英混排残字四处就地改写（只动词，不动 $ 与反引号，不动行结构）
import io, glob

REPL = [
    (u"第 67 至 74 行接Their 的算术 level-$d$ 不等式", u"第 67 至 74 行接他们的算术 $d$ 层不等式"),
    (u"二是多线性构造 supplied 的局部分布", u"二是多线性构造所给的局部分布"),
    (u"引言自己把 $c_k$ 的定义链条交 complete 了", u"引言自己把 $c_k$ 的定义链条交代完整了"),
    (u"| 对数三 iterated 档 |", u"| 对数三重迭代档 |"),
]

p = glob.glob("E:/math/研究笔记/D235-*.md")[0]
raw = io.open(p, "rb").read()
s = raw.decode("utf-8")
d0, b0 = s.count("$"), s.count("`")
lines0 = len(s.split("\n"))
for old, new in REPL:
    assert s.count(old) == 1, (old[:30], s.count(old))
    s = s.replace(old, new, 1)
io.open(p, "w", encoding="utf-8", newline="\n").write(s)
back = io.open(p, "rb").read()
ns = back.decode("utf-8")
rows = [l for l in ns.split("\n") if l.startswith(u"| ") and l.count("|") == 6]
print("bytes %d->%d CR=%d lines %d->%d dollar %d->%d backtick %d->%d rows6=%d" % (
    len(raw), len(back), back.count(b"\r"), lines0, len(ns.split("\n")),
    d0, ns.count("$"), b0, ns.count("`"), len(rows)))
for w in ("Their", "supplied", "complete", "iterated"):
    print(w, ns.count(w))
