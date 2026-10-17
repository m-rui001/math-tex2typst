import io, glob

p = glob.glob("研究笔记/D713-*.md")[0]
s = io.open(p, encoding="utf-8", newline="").read()
assert "\r" not in s
L = s.split("\n")

# 1-based: 886 lead sentence of §31's last paragraph, 887 blank, 888 §32 title,
# 908 §32's last paragraph, 909-916 the misplaced block, 917 blank, 918 §33 title
assert L[885].startswith(u"这一条把它的定位讲清了")
assert L[886] == ""
assert L[887].startswith(u"## §32")
assert L[907].startswith(u"最后交代本轮的读取边界")
assert L[908] == "\\["
assert L[915].startswith(u"其中 $L_i$")
assert L[916] == ""
assert L[917].startswith(u"## §33")


def inv(x):
    return (len(x.encode("utf-8")), x.count("\n"), x.count(chr(36)), x.count(chr(96)), x.count("\r"))


before = inv(s)
block = L[908:916]
new = L[:887] + block + [""] + L[887:908] + L[916:]
out = "\n".join(new)
after = inv(out)
assert len(new) == len(L) + 1, (len(new), len(L))
assert after[2:5] == before[2:5], (before, after)
assert after[0] == before[0] + 1
assert new[885] == L[885] and new[886] == "" and new[887] == "\\["
assert new[895] == "" and new[896].startswith(u"## §32")
assert sum(1 for x in new if x.startswith(u"## §")) == sum(1 for x in L if x.startswith(u"## §"))
io.open(p, "w", encoding="utf-8", newline="").write(out)
print("before", before)
print("after ", after)
print("heads", sum(1 for x in new if x.startswith(u"## §")))
print("zone", new[885][:24], "|", new[887][:24], "|", new[894][:24], "|", new[896][:24])
