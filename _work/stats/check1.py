import os, re, collections
ROOT = "E:/math/preprints"
rx_nc = re.compile(r"\\\\(?:re)?newcommand")
rx_nc = re.compile(chr(92)*2 + "(?:re)?newcommand")
tot = 0
papers = set()
bundle = []
rx_bpath = re.compile(r"(?:^|[\\\\/])(?:tools|texmf)(?:[\\\\/]|$)|pgfmanual", re.I)
for dp, dn, fn in os.walk(ROOT):
    for f in fn:
        if not f.endswith(".tex"):
            continue
        full = os.path.join(dp, f)
        paper = os.path.relpath(full, ROOT).split(os.sep)[0]
        try:
            s = open(full, encoding="utf-8", errors="ignore").read()
        except OSError:
            continue
        c = len(rx_nc.findall(s))
        if c:
            tot += c
            papers.add(paper)
        if rx_bpath.search(full):
            bundle.append((full, c))
print("newcommand+renewcommand total:", tot, "papers:", len(papers))
print("bundle-like files:", len(bundle))
for b, c in bundle[:20]:
    print(c, b)
