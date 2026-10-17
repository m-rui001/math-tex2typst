# -*- coding: utf-8 -*-
import io, os, glob, re, json, collections
NOTES = r"E:\math\研究笔记"
OUT = r"E:\math\_work\_woprep\p_macro.txt"
RX_CAP = re.compile(u"^[A-Z]{3,}([A-Z0-9_\\- ]*)$")
RX_MAC = re.compile(u"\\\\[A-Z]{1,2}(?![a-zA-Z])")
buf = []
p = glob.glob(os.path.join(NOTES, u"D742-*.md"))[0]
ls = io.open(p, "rb").read().decode("utf-8", "replace").split(u"\n")
buf.append(u"D742 L90-97:")
for i in range(90, 98):
    buf.append(u"%d| %s" % (i, ls[i - 1].strip()[:180]))
cap = [(i + 1, l.strip()[:60]) for i, l in enumerate(ls) if RX_CAP.match(l.strip())]
buf.append(u"D742 allcaps_lines=%d %s" % (len(cap), cap[:6]))
for k in (u"D480", u"D467"):
    p = glob.glob(os.path.join(NOTES, k + u"-*.md"))[0]
    t = io.open(p, "rb").read().decode("utf-8", "replace")
    n2 = len(RX_MAC.findall(t))
    nbb = t.count(u"\\mathbb")
    nbf = t.count(u"\\Bbb")
    buf.append(u"%s shortmac=%d mathbb=%d Bbb=%d" % (k, n2, nbb, nbf))
    mm = collections.Counter(RX_MAC.findall(t))
    buf.append(u"  top=%s" % json.dumps(mm.most_common(12)))
io.open(OUT, "w", encoding="utf-8").write(u"\n".join(buf))
print(json.dumps({"ok": 1}))
