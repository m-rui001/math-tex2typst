# -*- coding: utf-8 -*-
import io
P = 'E:/math/研究笔记/D225-高标记数下的Pixton完备性Chow反例.md'
src = io.open(P, encoding='utf-8', newline='').read()
assert '\r' not in src
L = src.split('\n')

OLD1 = (u'另有一处口径差异需要申报：本单续表按派单逐字参数使用与第 223 行完全相同的表头原文，'
        u'首格"符号"保持原样，因此这种五列表的表头行在全文出现两枚，'
        u'规格对续表另有首格换字的要求，此处以本单参数为准并登记在案。')
NEW1 = (u'另有一处口径差异需要申报：本单续表按派单逐字参数使用与第 223 行完全相同的表头原文，'
        u'首格"符号"未换字，因此这种五列表的表头行在全文出现两枚，规格对续表另有首格换字的要求，'
        u'此处以本单参数为准并登记在案；收稿时该重复表头已按机械通道删除，'
        u'续表现带一枚首格换字的表头行与一枚分隔行，台账块的锚点仍在第 223 行那张标准表上。')
OLD2 = (u'其余各项申报（§32 的两处转折连读与整系数三处断点、§33 的三条更正、'
        u'续表表头重复、辛群记号在锚点复写中被统一）维持原状。')
NEW2 = (u'其余各项申报（§32 的两处转折连读与整系数三处断点、§33 的三条更正、'
        u'辛群记号在锚点复写中被统一）维持原状；其中续表表头重复一项已由收稿侧的机械通道去重，'
        u'并按规格补回一枚首格换字的续表表头行，该项申报不再指向当前文件。')

for i, x in enumerate(L):
    if OLD1 in x:
        assert x.count(OLD1) == 1
        L[i] = x.replace(OLD1, NEW1)
    elif OLD2 in x:
        assert x.count(OLD2) == 1
        L[i] = x.replace(OLD2, NEW2)
out = u'\n'.join(L)
assert out.count(NEW1) == 1 and out.count(NEW2) == 1
assert OLD1 not in out and OLD2 not in out
assert '\r' not in out
def st(s, n):
    return (len(s.encode('utf-8')), n, s.count(u'$'), s.count(u'`'),
            s.count(u'{'), s.count(u'}'), s.count('|'))
b, a = st(src, len(L)), st(out, len(L))
print('before', b)
print('after ', a)
print('delta ', tuple(x - y for x, y in zip(a, b)))
assert a[2] % 2 == 0 and a[3] % 2 == 0 and a[4] == a[5]
io.open(P, 'w', encoding='utf-8', newline='').write(out)
print('written')
