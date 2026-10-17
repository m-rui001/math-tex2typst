# -*- coding: utf-8 -*-
# 单篇闸门读数（只读）：python _work/gate_one.py D68 [D08 ...]
import io, sys, glob
sys.path.insert(0, u".tools")
import gate

out = []
for ID in sys.argv[1:]:
    for p in glob.glob(u"E:/math/" + u"研究笔记" + u"/" + ID + u"-*.md"):
        try:
            r = gate.chk(p, quiet=True)
        except TypeError:
            r = gate.chk(p)
        out.append(u"%s  %s" % (ID, r))
txt = u"\n".join(out) or u"no match: pass note ids"
io.open(u"E:/math/_work/gate_one.txt", u"wb").write(txt.encode(u"utf-8"))
print(txt.encode("utf-8", "replace").decode("utf-8", "replace"))
