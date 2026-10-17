import io, glob, re

p = glob.glob("研究笔记/D713-*.md")[0]
s = io.open(p, encoding="utf-8", newline="").read()
parts = s.split("\n")
assert len(parts) == 985, len(parts)
pre = "\n".join(parts[:544])
reg = "\n".join(parts[544:])


def inv(x):
    return (len(x.encode("utf-8")), x.count("\n"), x.count(chr(36)), x.count(chr(96)), x.count("\r"))


before = inv(s)
n0 = reg.count("generic")
reg = reg.replace("generic", u"一般")
reg = re.sub(u"(?<=[\\u4e00-\\u9fff]) (?=一般)", "", reg)
reg = re.sub(u"(?<=一般) (?=[\\u4e00-\\u9fff])", "", reg)
out = pre + "\n" + reg
after = inv(out)
assert "\r" not in out
assert after[1] == before[1] and after[2] == before[2] and after[3] == before[3]
assert after[4] == 0
assert out.count("generic") == 0
io.open(p, "w", encoding="utf-8", newline="").write(out)
print("replaced", n0, "before", before, "after", after)
ctx = io.open("_work/d713_left_words.txt", "w", encoding="utf-8")
for w in ["primary", "field", "invert", "regular"]:
    for m in re.finditer(w, out):
        a = max(0, m.start() - 40)
        ctx.write("%s|%s\n" % (w, out[a:m.end() + 30].replace("\n", " ")))
ctx.close()
