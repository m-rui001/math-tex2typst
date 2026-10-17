import io, glob

p = glob.glob("研究笔记/D713-*.md")[0]
s = io.open(p, encoding="utf-8", newline="").read()
OLD = u"$\\mathcal{Q}_i}$"
NEW = u"$\\mathcal{Q}_i$"


def inv(x):
    return (len(x.encode("utf-8")), x.count("\n"), x.count(chr(36)), x.count("{"), x.count("}"), x.count("\r"))


before = inv(s)
assert s.count(OLD) == 1, s.count(OLD)
out = s.replace(OLD, NEW)
after = inv(out)
assert before[1:3] == after[1:3] and after[4] == before[4] - 1 and after[5] == 0, (before, after)
io.open(p, "w", encoding="utf-8", newline="").write(out)
print("before", before, "after", after)
