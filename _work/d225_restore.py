# -*- coding: utf-8 -*-
import io

P = 'E:/math/研究笔记/D225-高标记数下的Pixton完备性Chow反例.md'
src = io.open(P, encoding='utf-8', newline='').read()
assert '\r' not in src
L = src.split('\n')

def grab(idx, start_marker, end_marker, label):
    line = L[idx]
    assert line.count(start_marker) == 1, (label, 'start', line.count(start_marker))
    a = line.index(start_marker) + len(start_marker)
    if end_marker is None:
        assert line.endswith(u'。')
        return line[a:]
    assert line.count(end_marker) == 1, (label, 'end', line.count(end_marker))
    return line[a:line.index(end_marker)] + u'。'

# declaration paragraphs, 1-indexed lines 448 / 452 / 454 / 456 of this note
rec23 = grab(447, u'原文如下：', None, u's23')
rec25 = grab(451, u'原文如下：', u'。该节现以', u's25')
rec29 = grab(453, u'原文如下：', u'。该节现以', u's29')
rec31 = grab(455, u'原文如下：', u'。恢复时请把', u's31')
assert rec31.count(u'系数挠层构造') == 1
rec31 = rec31.replace(u'系数挠层构造', u'上同调场论构造')

for name, t in [(23, rec23), (25, rec25), (29, rec29), (31, rec31)]:
    print('sec%s chars=%d dollar=%d backtick=%d brace=%d/%d' %
          (name, len(t), t.count('$'), t.count('`'), t.count('{'), t.count('}')))

head24 = u'## \u00a724 ' + u'本征值错配这一锤与 Abel--Jacobi 交叉项'
TAIL = u'特别是 $\\mathcal{F}$ 单射。' + head24
assert L[311].endswith(TAIL), 'line 312 tail mismatch'
assert L[310] == u'' and L[312] == u''
assert L[331].endswith(u'是有限并。') and L[332] == u'' and L[333].startswith(u'## ')
assert L[367].endswith(u'本身就在承认这个核的存在空间。') and L[368] == u'' and L[369].startswith(u'## ')
assert L[381].endswith(u'第三段的口径层。') and L[382] == u'' and L[383].startswith(u'## ')

new = list(L)
new[311] = L[311][:-len(TAIL)] + u'特别是 $\\mathcal{F}$ 单射。' + rec23
for ln, text in [(332, rec25), (368, rec29), (382, rec31)]:
    i = ln - 1
    new[i + 1:i + 1] = [u'', text]
new[312:312] = [u'', head24]

out = '\n'.join(new)
assert '\r' not in out
def stats(s, lines):
    return (len(s.encode('utf-8')), lines, s.count('$'), s.count('`'),
            s.count('{'), s.count('}'), s.count('|'), None)[0:7]
b, a = stats(src, len(L)), stats(out, len(new))
print('before bytes/lines/$/bt/brace/pipe =', b)
print('after  bytes/lines/$/bt/brace/pipe =', a)
print('delta =', tuple(x - y for x, y in zip(a, b)))
assert a[2] % 2 == 0 and a[3] % 2 == 0
assert new.count(head24) == 1 and out.count(u'。## ') == 0
print('heads=', len([x for x in new if x.startswith('## ')]))
print('n24_line=', new.index(head24) + 1)
io.open(P, 'w', encoding='utf-8', newline='').write(out)
print('written')
