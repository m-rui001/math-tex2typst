import io, glob

OLD = "可以扔掉原先把认成两个树偏移之差的方程，因为在上界里"
NEW = "可以扔掉原先把该共同偏移认成两个树偏移之差的方程，因为我们取的是上界"

p = glob.glob("研究笔记/D04-*.md")[0]
s = io.open(p, encoding="utf-8", newline="").read()
n = s.count(OLD)
print("occurrences", n)
assert n == 1
t = s.replace(OLD, NEW)


def inv(x):
    return (len(x.encode("utf-8")), x.count("\n"), x.count("$"), x.count("`"), x.count("\r"))


print("before", inv(s))
print("after ", inv(t))
io.open(p, "w", encoding="utf-8", newline="").write(t)
r = io.open(p, encoding="utf-8", newline="").read()
print("verify", inv(r), "old_gone", r.count(OLD) == 0, "new_once", r.count(NEW) == 1)
