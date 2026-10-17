import glob, io, re, collections, os

SEC = re.compile('^## *' + chr(167) + r'(\d+)')

rows = []
for p in glob.glob(os.path.join(u'研究笔记'.encode('utf8').decode('utf8'), 'D*.md')):
    b = os.path.basename(p)
    m = re.match(r'^(D\d+)-', b)
    if not m:
        continue
    lines = io.open(p, encoding='utf-8').read().split('\n')
    nums = [int(mm.group(1)) for l in lines for mm in [SEC.match(l)] if mm]
    if not nums:
        continue
    c = collections.Counter(nums)
    dup = sorted(k for k, v in c.items() if v > 1)
    mono = nums == sorted(nums)
    if dup or not mono:
        rows.append((m.group(1), len(nums), len(c), dup, mono, os.path.getsize(p)))

rows.sort(key=lambda r: (-len(r[3]), not r[4]))
out = io.open(os.path.join('_work', 'dupsec_census.txt'), 'w', encoding='utf-8')
out.write(u'notes_with_dup_or_nonmono=%d\n' % len(rows))
for r in rows:
    out.write(u'%s secs=%d uniq=%d dup=%s order_ok=%s size=%d\n' % (r[0], r[1], r[2], r[3], r[4], r[5]))
out.close()
print('notes_with_dup_or_nonmono=%d' % len(rows))
for r in rows[:12]:
    print(r[0], 'secs=%d' % r[1], 'uniq=%d' % r[2], 'dup=%s' % r[3], 'order_ok=%s' % r[4])
