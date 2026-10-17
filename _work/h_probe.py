# _work/h_probe.py — list every line containing the control sequence BACKSLASH-H in the
# notes, so the 33-site '\H' KaTeX family can be attributed per note before any edit.
# Read-only. Windows: paths built with os.path, no glob on backslash paths.
import io, os, re, glob

PAT = re.compile(r'\\H(?![a-zA-Z])')          # \H not the prefix of \Huge etc.
DEF = re.compile(r'(?:re)?newcommand\s*\{?\s*\\H\s*\}?')

files = sorted(glob.glob(os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                                      u'研究笔记', 'D*.md')))
tot = 0
for p in files:
    raw = io.open(p, encoding='utf-8', newline='').read()
    lines = raw.split('\n')
    hits = [(i + 1, l) for i, l in enumerate(lines) if PAT.search(l)]
    if not hits:
        continue
    tot += len(hits)
    print(u'==== ' + os.path.basename(p) + u'  (' + str(len(hits)) + u' lines)')
    for ln, l in hits:
        print(u'%5d  %s' % (ln, l.strip()[:170]))
print(u'total usage lines=' + str(tot) + u' files=' +
      str(sum(1 for p in files if PAT.search(io.open(p, encoding='utf-8', newline='').read()))))
