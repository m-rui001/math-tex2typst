# -*- coding: utf-8 -*-
import io
P = 'E:/math/研究笔记/D225-高标记数下的Pixton完备性Chow反例.md'
L = io.open(P, encoding='utf-8').read().split('\n')
CUT = 274  # first line of this batch's new region
WORDS = ['tautological', 'strata', 'filtraci', 'CohFT', 'Frobenius', 'Chow',
         'kappa', 'Gorenstein', 'Pfaffian', 'Abel', 'Beauville', 'Mukai',
         'Pandharipande', 'Janda', 'Pixton', 'Faber', 'Zvonkine', 'Arbarello',
         'Cornalba', 'Graber', 'Larson', 'Schmitt', 'Canning', 'Mumford', 'Keel',
         'spelling', 'hope', 'generic']
res = []
for w in WORDS:
    old = sum(L[i].lower().count(w.lower()) for i in range(0, CUT - 1))
    new = sum(L[i].lower().count(w.lower()) for i in range(CUT - 1, len(L)))
    if old or new:
        res.append((w, old, new))
out = io.open('E:/math/_work/d225_words.txt', 'w', encoding='utf-8', newline='')
for w, o, n in res:
    out.write('%-16s old=%d new=%d\n' % (w, o, n))
out.write('\n--- non-CJK runs inside new region prose (len>=4) ---\n')
import re
seen = {}
for i in range(CUT - 1, len(L)):
    line = L[i]
    if line.startswith('## '):
        continue
    line = re.sub(r'\$[^$]*\$', ' ', line)
    line = re.sub(r'`[^`]*`', ' ', line)
    for m in re.findall(r'[A-Za-z]{4,}', line):
        if m in ('tex', 'ref', 'label'):
            continue
        seen.setdefault(m, []).append(i + 1)
for k, v in sorted(seen.items(), key=lambda kv: -len(kv[1])):
    out.write('%-24s n=%d lines=%s\n' % (k, len(v), v[:6]))
out.close()
print('ok')
