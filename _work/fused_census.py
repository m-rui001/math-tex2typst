# -*- coding: utf-8 -*-
# Census of fused control words: a delimiter or name macro followed with no space by a
# letter or digit is read by TeX as one longer, undefined control word, so the page shows
# the wrong thing while no tool errors. The macro leg cleared these corpus-wide; this
# probe re-measures after each batch lands, skipping notes a writer is appending to now.
import re, glob, os, sys

B = chr(92)
MACROS = ['lvert', 'rvert', 'lVert', 'rVert', 'upharpoonright', 'langle', 'rangle',
          'bigl', 'bigr', 'Bigl', 'Bigr', 'biggl', 'biggr', 'mathcal', 'mathbb',
          'mathrm', 'operatorname', 'colon', 'mid', 'dots', 'to', 'in', 'le', 'ge']
PAT = re.compile(B * 2 + u'(?:' + u'|'.join(MACROS) + u')[A-Za-z0-9]')
SKIP = set(sys.argv[1].split(',')) if len(sys.argv) > 1 else set()

tot = 0
files = 0
samples = []
for f in sorted(glob.glob(u'研究笔记/D*.md')):
    k = re.match(u'D[0-9]+', os.path.basename(f)).group(0)
    if k in SKIP:
        continue
    t = open(f, encoding='utf-8').read()
    hits = [(m.start(), t[:m.start()].count('\n') + 1,
             t[max(0, m.start() - 45):m.start() + 28]) for m in PAT.finditer(t)]
    if hits:
        files += 1
        tot += len(hits)
        for h in hits[:2]:
            if len(samples) < 16:
                samples.append((os.path.basename(f)[:16], h[1], h[2]))
print('fused files=' + str(files) + ' sites=' + str(tot))
for s in samples:
    print(s[0], s[1], repr(s[2]))
