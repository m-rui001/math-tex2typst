# -*- coding: utf-8 -*-
# 派单台账自审：dispatched.txt 是 pick.py --take 写的 `ID<TAB>行号<TAB>目录`。
# 这里核对三件事，任何一条破口都会让某一篇论文永远拿不到专篇或者被写两遍：
#   1) 同一个其他队列行号被派过两次（重复劳动）；
#   2) 派单用的目录不在冻结台账 .tools/other_queue.txt 里（行号坐标系错乱）；
#   3) 派过的号在 研究笔记/ 里没有对应文件（写手中断或被并发上限拒单后没重发）。
#   python .tools/dispatch_audit.py
import io, os, re, sys, glob

d = {}
row2dir = {}
for l in io.open('.tools/other_queue.txt', encoding='utf-8').read().split('\n'):
    if l.strip():
        p = l.split()
        row2dir[p[0]] = p[1]

notes = {}
for p in glob.glob(u'研究笔记/*.md'):
    b = os.path.basename(p)
    m = re.match(r'^(D\d+|\d{3})-', b)
    if m:
        notes[m.group(1)] = p

pairs = []
for l in io.open('.tools/dispatched.txt', encoding='utf-8').read().split('\n'):
    if not l.strip():
        continue
    p = l.split('\t')
    if len(p) < 3 or p[2].startswith('dup-of'):
        continue
    pairs.append((p[0], p[1], p[2]))

rows = {}
badrow = []
nofile = []
mismatch = []
for k, r, dirname in pairs:
    rows.setdefault(r, []).append(k)
    if r not in row2dir:
        badrow.append('%s row=%s' % (k, r))
    elif row2dir[r] != dirname.replace('preprints/', ''):
        mismatch.append('%s row=%s dir=%s expected=%s' % (k, r, dirname, row2dir[r]))
    if k not in notes:
        nofile.append('%s row=%s' % (k, r))

dup = ['row %s: %s' % (r, ','.join(v)) for r, v in sorted(rows.items()) if len(v) > 1]
out = [u'dispatched=%d rows-in-queue=%d notes=%d' % (len(pairs), len(row2dir), len(notes)),
       u'dup-row=%d bad-row=%d dir-mismatch=%d dispatched-without-file=%d'
       % (len(dup), len(badrow), len(mismatch), len(nofile))]
for tag, lst in ((u'DUP', dup), (u'BADROW', badrow), (u'MISMATCH', mismatch),
                 (u'NOFILE', nofile)):
    out.extend(u'%s %s' % (tag, x) for x in lst[:20])
sys.stdout.buffer.write((u'\n'.join(out) + u'\n').encode('utf-8'))
