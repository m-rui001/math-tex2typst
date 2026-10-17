# -*- coding: utf-8 -*-
# 校验 regfix2 --apply：69 篇只多一行登记句（及其前的空行），其余文件与快照逐字节相同。
import io, glob, os, re

REG = re.compile(u'^\u672c\u7b14\u6ce8\u53d9\u4e8b\u5bf9\u5e94\u7684\u8bba\u6587\u76ee\u5f55\u4e3a preprints/')
tgt = set(l.split()[1] for l in io.open('.tools/regfix2.apply', encoding='utf-8') if l.startswith('REG '))
bad = []
for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    b = os.path.basename(p)
    key = b.split(u'-')[0]
    snap = os.path.join('.tools/snap_regfix', b)
    if not os.path.exists(snap):
        bad.append(('NOSNAP', key))
        continue
    a = io.open(p, encoding='utf-8', errors='strict').read().split('\n')
    o = io.open(snap, encoding='utf-8', errors='strict').read()
    idx = [i for i, l in enumerate(a) if REG.match(l)]
    if key in tgt:
        if len(idx) != 1:
            bad.append(('REGCOUNT=%d' % len(idx), key))
            continue
        j = idx[0]
        if a[j - 1] != u'':
            bad.append(('NOBLANK', key))
            continue
        back = '\n'.join(a[:j - 1] + a[j + 1:])
        if back != o:
            bad.append(('DIFF', key))
    elif '\n'.join(a) != o:
        bad.append(('TOUCHED', key))
print('files=%d targets=%d problems=%d' % (len(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')), len(tgt), len(bad)))
for x in bad[:20]:
    print(x[0], x[1])
