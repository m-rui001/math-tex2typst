import glob, os, re, io

PAT = re.compile(u"\\\\(?:lVert|rVert|Vert|lvert|rvert|mid)[A-Za-z]")

def count(text):
    return len(PAT.findall(text))

pairs = []
for bak in sorted(glob.glob(os.path.join(u"_work", u"*.pre-param.md"))):
    key = os.path.basename(bak).split(u".")[0]
    cur = glob.glob(os.path.join(u"研究笔记", key + u"-*.md"))
    if not cur:
        cur = glob.glob(os.path.join(u"研究笔记", key + u"*.md"))
    if not cur:
        print(u"MISSING " + key)
        continue
    b = io.open(bak, encoding="utf-8", errors="replace").read()
    c = io.open(cur[0], encoding="utf-8", errors="replace").read()
    nb, nc = count(b), count(c)
    if nc != nb:
        pairs.append((key, nb, nc, nc - nb, os.path.basename(cur[0])[:40]))

pairs.sort(key=lambda t: -t[3])
tot_b = sum(p[1] for p in pairs)
tot_c = sum(p[2] for p in pairs)
print(u"changed_notes=%d  backup_total=%d  current_total=%d  delta=%+d" % (len(pairs), tot_b, tot_c, tot_c - tot_b))
for p in pairs:
    print(u"  %-6s %4d -> %4d (%+d)  %s" % p)

allc = 0
allf = 0
for f in glob.glob(os.path.join(u"研究笔记", u"D*.md")):
    t = io.open(f, encoding="utf-8", errors="replace").read()
    n = count(t)
    if n:
        allc += n
        allf += 1
print(u"corpus now: notes=%d occ=%d" % (allf, allc))
