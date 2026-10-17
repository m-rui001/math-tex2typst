# -*- coding: utf-8 -*-
# Census: every occurrence of 本体侧 in notes with numeric id 1..399.
import io, os, re, glob

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
PHR = u'\u672c\u4f53\u4fa7'  # 本体侧

def idnum(name):
    m = re.match(u'^D([0-9]+)', name)
    if not m:
        return None
    return int(m.group(1))

rows = []
files = sorted(glob.glob(os.path.join(BASE, 'D*.md')))
inn = []
for p in files:
    n = idnum(os.path.basename(p))
    if n is None or n < 1 or n > 399:
        continue
    inn.append(n)
    txt = io.open(p, 'rb').read().decode('utf-8')
    lines = txt.split(u'\n')
    for i, line in enumerate(lines):
        c = line.count(PHR)
        if c:
            for _ in range(c):
                pass
            rows.append((n, os.path.basename(p), i + 1, c, line[:240]))

out = []
out.append(u'notes in range=%d  ids min=%s max=%s' % (len(inn), min(inn), max(inn)))
out.append(u'occurrences=%d  lines=%d  notes=%d' % (
    sum(r[3] for r in rows), len(rows), len(set(r[0] for r in rows))))
for n, name, ln, c, win in rows:
    out.append(u'==== D%03d L%d cnt=%d' % (n, ln, c))
    out.append(win)
io.open(u'E:/math/_work/bodyside_sites.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('occurrences=%d lines=%d notes=%d range_notes=%d' % (
    sum(r[3] for r in rows), len(rows), len(set(r[0] for r in rows)), len(inn)))
