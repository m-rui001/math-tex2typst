import io, glob, sys, os
sys.stdout.reconfigure(encoding="utf-8")
B = chr(92)
p = glob.glob(os.path.join(u"\u7814\u7a76\u7b14\u8bb0", "D711-*.md"))[0]
raw = io.open(p, encoding="utf-8", newline="").read()
old = u"$" + B + u"|k_{x}" + B + u"rangle$"
print("target", repr(old), "count", raw.count(old))
if "--apply" in sys.argv:
    assert raw.count(old) == 1
    new = raw.replace(old, u"$" + B + B + u"Vert k_{x}" + B + u"rangle$")
    io.open(os.path.join("_work", "D711.pre-vert.md"), "w", encoding="utf-8", newline="").write(raw)
    io.open(p, "w", encoding="utf-8", newline="").write(new)
    L = new.split(u"\n")
    bad = [i + 1 for i, l in enumerate(L) if l.strip().startswith(u"|") and l.count(u"|") != 6]
    print("size %d->%d bad_rows=%s" % (len(raw.encode("utf-8")), len(new.encode("utf-8")), bad))
