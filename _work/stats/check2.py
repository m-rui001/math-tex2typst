import os, re
ROOT = "E:/math/preprints"
B = re.compile(r"[\\/](?:tools|vendor|texmf|texdeps)[\\/]", re.I)
rx1 = re.compile(r"\\begin\{tikzpicture\}")
rx2 = re.compile(r"\\begin\s*\{tikzpicture\}")
a = b = 0
papers = set()
for dp, dn, fn in os.walk(ROOT):
    if B.search(dp):
        continue
    for f in fn:
        if not f.endswith(".tex"):
            continue
        try:
            s = open(os.path.join(dp, f), encoding="utf-8", errors="ignore").read()
        except OSError:
            continue
        c2 = len(rx2.findall(s))
        c1 = len(rx1.findall(s))
        a += c1; b += c2
        if c2 and c1 != c2:
            print("diff in", f, c1, c2)
print("strict:", a, "loose:", b)
