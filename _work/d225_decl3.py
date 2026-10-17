# -*- coding: utf-8 -*-
import io
P = 'E:/math/研究笔记/D225-高标记数下的Pixton完备性Chow反例.md'
src = io.open(P, encoding='utf-8', newline='').read()
assert '\r' not in src
L = src.split('\n')

ADD1 = (u'收稿复量：该重复表头已由机械通道去重，续表现带一枚首格换字的表头行与一枚分隔行，'
        u'台账块的锚点仍在第 223 行那张标准表上，本单参数与规格的那处冲突就此合流。')
ADD2 = (u'本段所列各项里，续表表头重复一项在收稿时已由机械通道去重并按规格补回首格换字的表头行，'
        u'不再指向当前文件；四处应恢复文本与 §24 标题断行也已由本体侧照本段逐字搬正。')

i1 = [i for i, x in enumerate(L) if u'口径差异需要申报' in x]
i2 = [i for i, x in enumerate(L) if x.startswith(u'其余各项申报')]
assert len(i1) == 1 and len(i2) == 1, (i1, i2)
assert L[i1[0]].endswith(u'登记在案。') and L[i2[0]].endswith(u'追加全部以 Edit 在文末完成。')
L[i1[0]] = L[i1[0]] + ADD1
L[i2[0]] = L[i2[0]] + ADD2
out = u'\n'.join(L)
assert out.count(ADD1) == 1 and out.count(ADD2) == 1 and '\r' not in out
def st(s, n):
    return (len(s.encode('utf-8')), n, s.count(u'$'), s.count(u'`'),
            s.count(u'{'), s.count(u'}'), s.count(u'|'))
b, a = st(src, len(L)), st(out, len(L))
print('before', b)
print('after ', a)
print('delta ', tuple(x - y for x, y in zip(a, b)))
print('lines touched', i1[0] + 1, i2[0] + 1)
assert a[2] % 2 == 0 and a[3] % 2 == 0 and a[4] == a[5]
io.open(P, 'w', encoding='utf-8', newline='').write(out)
print('written')
