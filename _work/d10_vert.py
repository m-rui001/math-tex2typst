import io, glob

f = glob.glob(u"研究笔记/D10-*.md")[0]
raw = io.open(f, "rb").read()
t = raw.decode("utf-8")
L = t.split(u"\n")
old = L[590]
assert old.count(u"|") == 10, repr(old)
BS = chr(92)
new = old
for sym in (u"c_\u03bd", u"v_\u03bd"):
    pat = BS + u"|" + sym + BS + u"|"
    assert new.count(pat) == 1, (pat, repr(new))
    new = new.replace(pat, BS + u"lvert" + sym + BS + u"rvert")
assert new.count(u"|") == 6, repr(new)
L[590] = new
nt = u"\n".join(L)
nb = nt.encode("utf-8")
assert nb.count(b"\r") == 0
assert nb.count(b"$") == raw.count(b"$")
io.open(u"_work/D10.pre-vert.md", "wb").write(raw)
io.open(f, "wb").write(nb)
print(u"old=%s" % old[:70])
print(u"new=%s" % new[:80])
print(u"bytes %+d -> %d" % (len(nb) - len(raw), len(nb)))
