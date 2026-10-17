# -*- coding: utf-8 -*-
import io, glob

TOK = {
    u'反道是(BAD)': u'\u53cd\u9053\u662f',
    u'反倒是(SRC)': u'\u53cd\u800c\u662f',
    u'反倒(LEGIT)': u'\u53cd\u5012',
    u'因道是': u'\u56e0\u9053\u662f',
    u'进道是': u'\u8fdb\u9053\u662f',
    u'从道是': u'\u4ece\u9053\u662f',
    u'反是': u'\u53cd\u662f',
}
files = sorted(glob.glob(u'研究笔记/D*.md'))
tot = dict((k, 0) for k in TOK)
rows = []
for p in files:
    t = io.open(p, 'rb').read().decode('utf8')
    hit = {}
    for k, v in TOK.items():
        c = t.count(v)
        if c:
            hit[k] = c
            tot[k] += c
    if hit:
        L = t.split(u'\n')
        lines = [i + 1 for i, l in enumerate(L) if u'\u53cd\u9053\u662f' in l]
        rows.append((p.split(u'\\')[-1][:30], hit, lines))
out = [u'files=%d' % len(files)]
for k in sorted(tot, key=lambda x: -tot[x]):
    out.append(u'%s total=%d' % (k, tot[k]))
out.append(u'--- rows mentioning any hit (%d files):' % len(rows))
for r in rows:
    out.append(u'%s %s lines=%s' % r)
io.open(u'_work/daoshu_census.txt', 'wb').write(u'\n'.join(out).encode('utf8'))
print('written', len(out))
