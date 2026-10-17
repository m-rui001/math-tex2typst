p = r"E:\math\_work\community.md"
lines = open(p, encoding="utf-8").read().split("\n")
s3 = next(i for i, s in enumerate(lines) if s.startswith("## 3."))
s4 = next(i for i, s in enumerate(lines) if i > s3 and s.startswith("## 4."))
print("s3", s3, "s4", s4)
hits = [(i, s) for i, s in enumerate(lines[s3:s4], start=s3) if "probe10" in s or "轴 8" in s]
for i, s in hits[-30:]:
    print(i, len(s), s[:110])
