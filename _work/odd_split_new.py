# -*- coding: utf-8 -*-
import io, os, re, glob

D = chr(36)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
CODE = re.compile(u'`[^`]*`')
NEW = set('D04 D235 D718 D137 D06 D701 D225 D713 D499'.split())

rows = []
for p in sorted(glob.glob(os.path.join(ROOT, '*.md'))):
    key = os.path.basename(p).split('-')[0]
    L = io.open(p, encoding='utf-8').read().split(u'\n')
    idx = [i + 1 for i, l in enumerate(L) if CODE.sub(u'', l).count(D) % 2 == 1]
    if idx:
        rows.append((key in NEW, len(idx), key, idx[:8]))
rows.sort(key=lambda z: (-z[1], z[2]))
out = io.open('_work/odd_split_new.txt', 'w', encoding='utf-8')
out.write(u'total_notes=%d lines=%d new_notes=%d new_lines=%d\n' % (
    len(rows), sum(r[1] for r in rows), sum(1 for r in rows if r[0]),
    sum(r[1] for r in rows if r[0])))
for r in rows[:35]:
    out.write(u'%s %s odd=%d lines=%s\n' % (u'NEW' if r[0] else u'old', r[2], r[1], r[3]))
out.close()
print('ok')
