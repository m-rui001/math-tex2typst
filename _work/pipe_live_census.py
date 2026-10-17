# -*- coding: utf-8 -*-
# 活体量尺：台账行内「非代码跨度的 \|」且该行竖线 >6 枚。与冻结普查 pipe_rows_census.txt 同判据，
# 差别只在它是当场读盘，不读任何清单。反引号跨度整段先 mask 掉再数竖线。
import io, re, sys, glob

SP = re.compile(r'`[^`]*`')
BS = chr(92) + '|'
rows = []
files = 0
sites = 0
for p in sorted(glob.glob(u'研究笔记/D*.md')):
    pid = re.match(r'D\d+', p.split(u'\\')[-1].split('/')[-1])
    pid = pid.group(0) if pid else '?'
    t = io.open(p, encoding='utf-8').read()
    hit = 0
    for i, l in enumerate(t.split('\n')):
        if not (l.startswith('| ') and l.endswith('|')):
            continue
        m = SP.sub(lambda mo: '@' * len(mo.group(0)), l)
        if BS in m and m.count('|') > 6:
            rows.append((pid, i + 1, m.count('|'), m.count(BS)))
            hit += m.count(BS)
    if hit:
        files += 1
    sites += hit
print('live rows=%d sites=%d files=%d' % (len(rows), sites, files))
for r in rows[:40]:
    print(r)
