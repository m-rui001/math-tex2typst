# -*- coding: utf-8 -*-
# 收稿链末端复量：D111 与 D207 的字节/CR/gate/宏残留一次读齐。
import glob
import io
import sys

sys.path.insert(0, u".tools")
import gate

o = []
for key in (u"D111", u"D207"):
    f = glob.glob(u"研究笔记/%s-*.md" % key)[0]
    raw = io.open(f, "rb").read()
    g = gate.chk(f, quiet=True)
    o.append(u"%s bytes=%d CR=%d lines=%d gate=%s" % (
        key, len(raw), raw.count(b"\r"), raw.count(b"\n"), repr(g)))
    for mac in (u"\\rank", u"\\norm", u"\\abs", u"\\pair"):
        o.append(u"   %s x%d" % (mac, raw.decode(u"utf-8").count(mac)))
io.open(u"_work/verify_207.txt", "wb").write(u"\n".join(o).encode(u"utf-8"))
print("ok")
