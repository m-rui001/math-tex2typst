# -*- coding: utf-8 -*-
# C27 的一处参数宏展开坏形：素材 \rddown 的模板是 \left\lfloor{#1}\right\rfloor（占位符不在尾部），
# 回改链把模板逐字发出后实参组跟在 \right\rfloor 之后，bind_group 只认紧跟 `#N` 的组所以零绑定。
# 这里按模板语义把实参填进 #1 位（KaTeX 判形＝无裸 #N）。
import io, glob, sys

B = chr(92)
BAD = u'$' + B + u'left' + B + u'lfloor{#1}' + B + u'right' + B + u'rfloor{\\Theta' + u"'''" + u'}' + B + u'neq 0$'
GOOD = u'$' + B + u'left' + B + u'lfloor{' + B + u'Theta' + u"'''" + u'}' + B + u'right' + B + u'rfloor ' + B + u'neq 0$'

p = glob.glob(u'被引笔记/C27-*.md')[0]
s = io.open(p, encoding='utf-8').read()
assert s.count(BAD) == 1, u'判形站点数=%d' % s.count(BAD)
out = s.replace(BAD, GOOD)
assert out.count(B + u'#') == s.count(B + u'#')
assert u'{#1}' not in out, u'仍有占位符'
assert out.count(u'$') == s.count(u'$') - 0
assert u'\r' not in out
io.open(p, 'w', encoding='utf-8', newline='').write(out)
sys.stdout.reconfigure(encoding='utf-8')
print('%s %d -> %d B' % (p.split('/')[-1], len(s.encode('utf-8')), len(out.encode('utf-8'))))
