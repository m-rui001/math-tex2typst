import io, glob, sys, os
sys.stdout.reconfigure(encoding="utf-8")
p = glob.glob(os.path.join(u"\u7814\u7a76\u7b14\u8bb0", "D472-*.md"))[0]
raw = io.open(p, encoding="utf-8", newline="").read()
L = raw.split(u"\n")
row = L[527]
assert row.startswith(u"|") and u"(F1)" in row, row[:60]
assert L[288].startswith(u"|") and L[290].startswith(u"## \u00a720")
del L[527]
L.insert(289, row)
out = u"\n".join(L)
print("bytes %d->%d" % (len(raw.encode("utf-8")), len(out.encode("utf-8"))))
print("lines %d->%d" % (len(raw.split(u"\n")), len(L)))
assert sorted(raw.split(u"\n")) == sorted(L)
io.open(os.path.join(u"_work", "D472.pre-rowmove.md"), "w", encoding="utf-8", newline="").write(raw)
io.open(p, "w", encoding="utf-8", newline="").write(out)
sys.path.insert(0, u".tools")
import gate
print(gate.chk(p, quiet=True))
