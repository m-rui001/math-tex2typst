# -*- coding: utf-8 -*-
# Decisive check on hdrless_census' 17 "split" verdicts: for each reported block, walk the
# rows that sit directly above the run and test whether their non-6 pipe count is fully
# explained by escaped pipes (\| inside math cells), which GFM does not treat as a divider.
import io, glob, re

B = chr(92)
COORDS = {
    'D24': [707], 'D28': [1167, 1177], 'D30': [805],
    'D32': [655, 663, 677, 684], 'D34': [571], 'D36': [604], 'D37': [1487],
    'D44': [451], 'D50': [439], 'D65': [343, 349], 'D68': [1348, 1371],
}


def raw(s):
    return s.count('|')


def eff(s):
    return len([m.start() for m in re.finditer(r'\|', s)
                if m.start() == 0 or s[m.start() - 1] != B])


out = []
tot = art = real = 0
for d, starts in sorted(COORDS.items()):
    p = glob.glob(u'研究笔记/%s-*.md' % d)[0]
    L = io.open(p, encoding='utf-8').read().split('\n')
    for st in starts:
        i = st - 1
        # walk upward over lines that carry any pipe
        k = i - 1
        seen = []
        while k >= 0 and (u'|' in L[k]) and (L[k].startswith(u'| ') or L[k].startswith(u'|')):
            seen.append(k)
            k -= 1
        seen.reverse()
        for x in seen:
            l = L[x]
            if l.startswith(u'| ') and raw(l) != 6:
                tot += 1
                if eff(l) == 6:
                    art += 1
                else:
                    real += 1
                    out.append(u'  REAL %s line %d raw=%d eff=%d | %s' % (d, x + 1, raw(l), eff(l), l[:100]))
        out.append(u'%s block@%d: 上方 %d 行, 其中非 6 枚竖线的行 %d, 全部由转义竖线解释 = %s'
                   % (d, st, len(seen), sum(1 for x in seen if L[x].startswith(u'| ') and raw(L[x]) != 6),
                      all(eff(L[x]) == 6 for x in seen if L[x].startswith(u'| ') and raw(L[x]) != 6)))
out.append(u'TOTAL blocking rows=%d  escaped-explained=%d  genuine=%d' % (tot, art, real))
io.open(u'_work/split_adjud2.txt', 'w', encoding='utf-8', newline='\n').write(u'\n'.join(out) + u'\n')
print('ok', tot, art, real)
