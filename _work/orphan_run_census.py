import io, glob, os, re, sys

sys.stdout.reconfigure(encoding="utf-8")
CELL = re.compile(u"^:?-+:?$")
FLIGHT = set(u"D149 D10 D06 D681 D682 D683 D684 D685 D686".split())


def is_sep(l):
    if not (l.startswith(u"|") and l.endswith(u"|")):
        return False
    cells = [c.strip() for c in l.strip(u"|").split(u"|")]
    return len(cells) > 1 and all(CELL.match(c) for c in cells)


bad = []
files = 0
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    base = os.path.basename(p)
    if base.split(u"-")[0] in FLIGHT:
        continue
    files += 1
    L = io.open(p, encoding="utf-8").read().split(u"\n")
    i = 0
    while i < len(L):
        l = L[i]
        if l.startswith(u"| ") and not is_sep(l):
            j = i - 1
            while j >= 0 and L[j].strip() == u"":
                j -= 1
            prev = L[j] if j >= 0 else u""
            nxt = L[i + 1] if i + 1 < len(L) else u""
            header_next = nxt.startswith(u"|") and is_sep(nxt)
            if not prev.startswith(u"|") and not header_next:
                bad.append((base[:6], i + 1, l.count(u"|"), prev[:22], l[:30]))
                while i < len(L) and L[i].startswith(u"|"):
                    i += 1
                continue
        i += 1
print(u"files scanned=%d orphan_runs=%d notes=%d" %
      (files, len(bad), len(set(b[0] for b in bad))))
for b in bad[:30]:
    print(u"   %s line%-5d pipes=%d prev=%r row=%r" % b)
