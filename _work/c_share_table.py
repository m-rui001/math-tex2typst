# -*- coding: utf-8 -*-
import io, os, re, glob, subprocess, json

SKIP = ('C42', 'C50', 'C51', 'C53', 'C54', 'C55')
rows = []
for p in sorted(glob.glob(u'被引笔记/C*-*.md')):
    b = os.path.basename(p)
    if b[:3] in SKIP:
        continue
    out = subprocess.run(['python', '-X', 'utf8', '_work/ccheck.py', b[:3]],
                         capture_output=True, text=True, encoding='utf-8').stdout
    share = re.search(r'share=([\d.]+)%', out)
    stmt = re.search(r'stmt_lines=(\d+)', out)
    disp = re.search(r'disp=(\d+)', out)
    bs = re.search(r'bytes=(\d+)', out)
    bans = re.search(r'bans=(\S+)', out)
    if share:
        rows.append((float(share.group(1)), int(stmt.group(1)), int(disp.group(1)),
                     int(bs.group(1)), bans.group(1), b[:3]))
rows.sort()
print('参与统计=%d 份（在飞六号跳过）' % len(rows))
print('%-5s %-7s %-5s %-5s %-7s %s' % ('cid', 'share%', 'stmt', 'disp', 'bytes', 'bans'))
for r in rows:
    if r[0] < 30 or r[1] <= 3:
        print('%-5s %-7.1f %-5d %-5d %-7d %s' % (r[5], r[0], r[1], r[2], r[3], r[4]))
med = sorted(x[0] for x in rows)[len(rows) // 2]
print('share 中位数=%.1f%%  最低=%.1f%%  <25%% 的份数=%d' % (
    med, rows[0][0], sum(1 for x in rows if x[0] < 25)))
