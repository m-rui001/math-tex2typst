# -*- coding: utf-8 -*-
import io
P = 'E:/math/研究笔记/D225-高标记数下的Pixton完备性Chow反例.md'
src = io.open(P, encoding='utf-8', newline='').read()
assert '\r' not in src
L = src.split('\n')

HDR = L[222]
assert HDR.startswith(u'| 符号 |') and L[223] == u'| --- | --- | --- | --- | --- |'
cells = [c.strip() for c in HDR.strip().strip('|').split('|')]
assert len(cells) == 5 and cells[0] == u'符号'
HDR2 = u'| 记号 | ' + u' | '.join(cells[1:]) + u' |'
assert HDR2 == HDR.replace(u'符号', u'记号', 1), 'spacing drift vs canonical header'
SEP2 = u'| ' + u' | '.join([u'---'] * 5) + u' |'
assert HDR2 != HDR and HDR.count('|') == 6 and HDR2.count('|') == 6 and SEP2 == L[223]

first = 409
assert L[first].startswith(u'| ') and L[first - 1] == u'' and L[first - 2].startswith(u'下表接续')
last = first
while L[last + 1].startswith(u'| '):
    last += 1
assert last == 449 and L[450] == u'' and L[451].startswith(u'## ')
S35 = 451

ORPH = L[471]
assert ORPH.count('|') == 6 and ORPH.startswith(u'| $F') and u'04-tensors.tex:303-305' in ORPH
decl = [i for i in range(452, len(L)) if u'其余各项申报' in L[i]]
assert len(decl) == 1 and L[decl[0]].count(ORPH) == 0
decl2 = [i for i in range(452, len(L)) if u'末段补记' in L[i]]
assert len(decl2) == 1 and L[decl2[0]].count(ORPH) == 0

new = list(L)
new.pop(471)
new.insert(last, ORPH)
new.insert(first, HDR2)
new.insert(first + 1, SEP2)
assert len(new) == len(L) + 2
assert new.count(HDR) == 1
assert new.count(SEP2) == 2
assert sum(1 for x in new if x.startswith(u'| ')) == sum(1 for x in L if x.startswith(u'| ')) + 2

out = u'\n'.join(new)
assert u'。## ' not in out and u'\r' not in out
def st(s, lines):
    return (len(s.encode('utf-8')), lines, s.count(u'$'), s.count(u'`'),
            s.count(u'{'), s.count(u'}'), s.count(u'|'))
b, a = st(src, len(L)), st(out, len(new))
print('before bytes/lines/dollar/bt/brace/br/pipe =', b)
print('after  bytes/lines/dollar/bt/brace/br/pipe =', a)
print('delta =', tuple(x - y for x, y in zip(a, b)))
hdr_rows = new.index(HDR2) + 1
print('cont_hdr_line=%d cont_sep_line=%d orphan_lines=%s' %
      (hdr_rows, hdr_rows + 1, [i + 1 for i, l in enumerate(new) if l == ORPH]))
io.open(P, 'w', encoding='utf-8', newline='').write(out)
print('written')
