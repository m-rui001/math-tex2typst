import io, glob

PAIRS = [
    (u"$\\mathfrak m_x$ -primary", u"$\\mathfrak m_x$ 为准素"),
    (u"为 primary", u"为准素"),
    (u"而 primary 条件", u"而准素条件"),
    (u"的 overfield 里", u"的上域里"),
    (u"都invert", u"都反演"),
]

p = glob.glob("研究笔记/D713-*.md")[0]
s = io.open(p, encoding="utf-8", newline="").read()


def inv(x):
    return (len(x.encode("utf-8")), x.count("\n"), x.count(chr(36)), x.count(chr(96)), x.count("\r"))


before = inv(s)
for old, new in PAIRS:
    n = s.count(old)
    print(repr(old), "count", n)
    assert n == 1, old
    s = s.replace(old, new)
after = inv(s)
assert after[1:] == before[1:], (before, after)
for w in ["primary", "overfield", "invert", "generic"]:
    assert s.count(w) == 0, w
io.open(p, "w", encoding="utf-8", newline="").write(s)
print("before", before, "after", after)
