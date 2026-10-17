# -*- coding: utf-8 -*-
# Locate the writer-declared residues in D535's appended region: latin words sitting
# between Chinese characters (untranslated terms) and doubled adverbs / near-shape typos.
import io
import os
import re

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
OUT = os.path.join('E:', BS, BS, 'math', '_work', 'd535_residue.txt')
CJK = u'[\u4e00-\u9fff]'
SP = u' ?'
LAT = re.compile(u'(' + CJK + SP + u')([A-Za-z][A-Za-z ]{2,20})(' + SP + CJK + u')')
rows = []
cand = [f for f in os.listdir(NOTES) if f.startswith('D535-')]
p = os.path.join(NOTES, cand[0])
t = io.open(p, encoding='utf-8').read()
lines = t.split('\n')
rows.append('lines=%d' % len(lines))
for i in range(208, len(lines)):
    l = lines[i]
    if not l.strip():
        continue
    for m in LAT.finditer(l):
        if m.group(2).strip() in ('the', 'and', 'of'):
            continue
        rows.append('L%d latin=%s ctx=...%s...' % (i + 1, m.group(2), l[max(0, m.start() - 20):m.end() + 20]))
    # doubled single CJK char adjacency like 很很 / 恰恰恰 style anomalies
    for m in re.finditer(u'([\u4e00-\u9fff])\\1\\1', l):
        rows.append('L%d triple=%s ctx=...%s...' % (i + 1, m.group(0), l[max(0, m.start() - 15):m.end() + 15]))
io.open(OUT, 'wb').write((u'\n'.join(rows) + u'\n').encode('utf-8'))
print('rows', len(rows))
