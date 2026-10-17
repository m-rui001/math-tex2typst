# -*- coding: utf-8 -*-
import io, re
P = 'E:/math/研究笔记/D225-高标记数下的Pixton完备性Chow反例.md'
src = io.open(P, encoding='utf-8', newline='').read()
assert '\r' not in src
L = src.split('\n')
CJK = u'\\u4e00-\\u9fff\\u3000-\\u303f\\uff00-\\uffef'
line = L[319]
assert line.count(u'filtración') == 2, line.count(u'filtración')
old = line
line = line.replace(u'filtración', u'分次过滤')
line = re.sub(u'(?<=[' + CJK + u']) (?=分次过滤)', u'', line)
line = re.sub(u'(?<=分次过滤) (?=[' + CJK + u'])', u'', line)
assert u'filtraci' not in line and u'filtraci' not in u'\n'.join(L[:319] + L[320:])
new = L[:319] + [line] + L[320:]
out = u'\n'.join(new)
assert out.count(u'分次过滤') == src.count(u'分次过滤') + 2
def st(s, n):
    return (len(s.encode('utf-8')), n, s.count(u'$'), s.count(u'`'), s.count(u'{'), s.count(u'}'))
print('before', st(src, len(L)))
print('after ', st(out, len(new)))
io.open(P, 'w', encoding='utf-8', newline='').write(out)
io.open('E:/math/_work/d225_filt_after.txt', 'w', encoding='utf-8', newline='').write(line[:400])
print('written')
