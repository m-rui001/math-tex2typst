# -*- coding: utf-8 -*-
# C07 收稿两处定点修补：
#  (1) L213 展示式闭符误写成一枚 `$`，且 `\square` 挤在式内——它使其后所有跨度错位，普查那 47 枚「定界符」拒渲就是这么来的；
#  (2) L589 自查句把规格的禁串清单整段抄进正文（禁词计数不是语义判断，抄清单等于命中），同句还在反引号里写了 `$`。
import io, glob, sys

B = chr(92)
OLD1 = u'$$c_2(T_X)' + B + u'cdot H_1' + B + u'cdots H_{n-2}' + B + u'geqslant 0.' + B + u'square$'
NEW1 = u'$$c_2(T_X)' + B + u'cdot H_1' + B + u'cdots H_{n-2}' + B + u'geqslant 0.' + B + u'quad' + B + u'square$$'
OLD2 = u'文字纪律按规格 4.1：不写「，是」「，并非」「，并非」「值得注意」「需要指出」「也就是说」「总的来看」「大体上」，不写长破折号（写作短句或括号取而代之）。数学跨度的 `$` 与展示式枚数按写作侧的自测。'
NEW2 = u'文字纪律按规格 4.1 与写手简报的禁串清单逐条自查，长破折号改用短句或括号。数学跨度枚数与展示式枚数见上。'

p = glob.glob(u'被引笔记/C07-*.md')[0]
s = io.open(p, encoding='utf-8').read()
for old, new in ((OLD1, NEW1), (OLD2, NEW2)):
    assert s.count(old) == 1, u'判形数=%d：%r' % (s.count(old), old[:40])
    s = s.replace(old, new)
assert u'值得注意' not in s and u'需要指出' not in s, u'禁串仍在本篇'
assert s.count(u'$') % 2 == 0
assert u'\r' not in s
io.open(p, 'w', encoding='utf-8', newline='').write(s)
sys.stdout.reconfigure(encoding='utf-8')
print('%s -> %d B' % (p.split('\\')[-1], len(s.encode('utf-8'))))
