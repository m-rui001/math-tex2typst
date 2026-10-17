# -*- coding: utf-8 -*-
import io, glob

D = chr(36)
BT = chr(96)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'


def flags(p):
    L = io.open(p, encoding='utf-8').read().split('\n')
    odd, infence, insp = [], False, False
    for i, line in enumerate(L):
        if line.lstrip().startswith(BT * 3):
            infence = not infence
            insp = False
            continue
        if infence:
            continue
        cnt, j = 0, 0
        while j < len(line):
            c = line[j]
            if c == '\\':
                j += 2
                continue
            if c == BT:
                insp = not insp
            elif c == D and not insp:
                cnt += 1
            j += 1
        if cnt % 2 == 1:
            odd.append(i + 1)
    return L, odd


out = io.open('_work/odd_v3_detail.txt', 'w', encoding='utf-8')
tot = 0
for p in sorted(glob.glob(ROOT + '/D*.md')):
    L, odd = flags(p)
    if not odd:
        continue
    name = p.split('\\')[-1].split('-')[0]
    pairs = sum(1 for n in odd if n + 1 in odd)
    out.write('== %s odd=%d consecutive=%d\n' % (name, len(odd), pairs))
    for n in odd[:6]:
        tot += 1
        out.write('  %d|%s\n' % (n, L[n - 1][:150]))
        if n + 1 <= len(L):
            out.write('  %d|%s\n' % (n + 1, L[n][:150]))
out.write('printed=%d\n' % tot)
out.close()
print('ok')
