# -*- coding: utf-8 -*-
# Adjudicate hdrless_census' two verdicts: are the 17 "split" blocks real defects,
# and is D53's "headerless" block just the |-|-| separator spelling?
import io, re, glob

B = chr(92)  # backslash: never write a literal backslash in this file's heredoc-free form


def raw(s):
    return s.count('|')


def eff(s):
    # separator pipes are those not escaped as \|
    return len([m.start() for m in re.finditer(r'\|', s) if m.start() == 0 or s[m.start() - 1] != B])


rows_odd = 0
esc_ok = 0
real = []
for d in ['D24', 'D28', 'D30', 'D32', 'D34', 'D36', 'D37', 'D44', 'D50', 'D65', 'D68']:
    p = glob.glob(u'研究笔记/%s-*.md' % d)[0]
    L = io.open(p, encoding='utf-8').read().split('\n')
    for i, l in enumerate(L):
        if l.startswith(u'| ') and raw(l) != 6:
            rows_odd += 1
            if eff(l) == 6:
                esc_ok += 1
            else:
                real.append((d, i + 1, raw(l), eff(l), l[:90]))

out = []
out.append(u'rows with raw!=6 in the 11 flagged files: %d, fully explained by escaped pipe: %d' % (rows_odd, esc_ok))
out.append(u'genuinely miscounted rows: %d' % len(real))
for r in real[:25]:
    out.append(u'  %s line %d raw=%d eff=%d | %s' % r)

p = glob.glob(u'研究笔记/D53-*.md')[0]
L = io.open(p, encoding='utf-8').read().split('\n')
out.append(u'D53 line511 repr: %r' % L[510])
out.append(u'D53 line510 first cell: %s / line515 first cell: %s' % (L[509].split(u'|')[1].strip(), L[514].split(u'|')[1].strip()))
out.append(u'D53 canonical header count: %d' % sum(1 for x in L if x.startswith(u'| 符号 |')))
out.append(u'D53 dash-only separator count: %d' % sum(1 for x in L if re.match(r'^\|[-\s]+\|$', x) and u'---' not in x))

io.open(u'_work/split_adjud.txt', 'w', encoding='utf-8', newline='\n').write(u'\n'.join(out) + u'\n')
print('written', len(out))
