# -*- coding: utf-8 -*-
import io, re, glob, os

HDR = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
EM = chr(8212)
BC = u'\u800c\u4e0d\u662f'
SCOPE = set('D114 D127 D131 D132 D134 D135 D136 D137 D138 D139 D140 D141 D142 D143 D144'.split())
INFLIGHT = {'D145', 'D146', 'D147'}

for name in sorted(os.listdir(u'\u7814\u7a76\u7b14\u8bb0')):
    if not name.startswith('D') or not name.endswith('.md'):
        continue
    dnum = name[:4]
    if dnum in INFLIGHT or dnum not in SCOPE:
        continue
    p = os.path.join(u'\u7814\u7a76\u7b14\u8bb0', name)
    t = io.open(p, encoding='utf-8').read()
    n0 = t.count(BC) + t.count(EM)
    t = t.replace(u'\uff0c' + BC, u'\uff0c\u4e0d\u662f').replace(BC, u'\u3001\u4e0d\u662f')
    t = t.replace(EM + EM, u'\uff0c').replace(EM, '--')
    lines = t.split('\n')
    h = None
    for i, l in enumerate(lines):
        if l == HDR:
            h = i
    fixed = 0
    if h is not None:
        j = h + 2
        while j < len(lines) and lines[j].startswith('| '):
            if lines[j].count('|') != 6:
                new = re.sub(r'\\\|([^|]{1,60}?)\\\|', r'\\lVert\1\\rVert', lines[j])
                new = new.replace(u'\u2014', '')
                if new.count('|') == 6:
                    lines[j] = new
                    fixed += 1
                else:
                    print('  STILL %s L%d pipes=%d' % (dnum, j + 1, new.count('|')))
            j += 1
        t = '\n'.join(lines)
    if t != io.open(p, encoding='utf-8').read():
        io.open(p, 'w', encoding='utf-8', newline='').write(t)
    print('%s swept=%d ledgerRowsFixed=%d' % (dnum, n0, fixed))
