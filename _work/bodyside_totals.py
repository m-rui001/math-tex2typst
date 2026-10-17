# -*- coding: utf-8 -*-
# Cross-check total 本体侧 occurrences corpus-wide vs the historical 714/301.
import io, os, re, glob
BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
PHR = u'\u672c\u4f53\u4fa7'
tot = occ = 0
rng = [0, 0, 0]
buckets = {}
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    b = os.path.basename(p)
    m = re.match(u'^D([0-9]+)', b)
    if not m:
        continue
    n = int(m.group(1))
    txt = io.open(p, 'rb').read().decode('utf-8')
    c = txt.count(PHR)
    if c:
        tot += 1
        occ += c
        k = 'lo' if 1 <= n <= 399 else 'hi'
        buckets[k] = buckets.get(k, [0, 0])
        buckets[k][0] += 1
        buckets[k][1] += c
io.open(u'E:/math/_work/bodyside_totals.txt', 'wb').write(
    (u'all: notes=%d occ=%d\nlow(1-399): %s\nhigh(400+): %s\n' % (
        tot, occ, buckets.get('lo'), buckets.get('hi'))).encode('utf-8'))
print('all notes=%d occ=%d' % (tot, occ))
print('low=%s high=%s' % (buckets.get('lo'), buckets.get('hi')))
