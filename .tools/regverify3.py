# -*- coding: utf-8 -*-
# 校验批量补登记：目标笔记只多登记行及其前空行，其余与快照逐字节相同。
# 用法: python .tools/regverify3.py <快照目录> <日志文件>
import io, glob, os, re, sys

snap, log = sys.argv[1], sys.argv[2]
tgt = set(l.split()[1] for l in io.open(log, encoding='utf-8') if l.startswith('REG '))
REG = re.compile(u'^\u672c(\u884c\u53ea\u8865\u767b\u8bb0\uff1a|\u7b14\u6ce8\u53d9\u4e8b)')
bad = []
for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    b = os.path.basename(p)
    key = b.split(u'-')[0]
    sp = os.path.join(snap, b)
    if not os.path.exists(sp):
        continue
    a = io.open(p, encoding='utf-8', errors='strict').read().split('\n')
    o = io.open(sp, encoding='utf-8', errors='strict').read()
    idx = [i for i, l in enumerate(a) if REG.match(l)]
    if key in tgt:
        if len(idx) != 1:
            bad.append(('REGCOUNT=%d' % len(idx), key))
            continue
        j = idx[0]
        if a[j - 1] != u'':
            bad.append(('NOBLANK', key))
            continue
        if '\n'.join(a[:j - 1] + a[j + 1:]) != o:
            bad.append(('DIFF', key))
    elif '\n'.join(a) != o:
        bad.append(('TOUCHED', key))
print('targets=%d problems=%d' % (len(tgt), len(bad)))
for x in bad[:20]:
    print(x[0], x[1])
