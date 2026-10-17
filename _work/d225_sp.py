# -*- coding: utf-8 -*-
import io
P = 'E:/math/研究笔记/D225-高标记数下的Pixton完备性Chow反例.md'
L = io.open(P, encoding='utf-8').read().split('\n')
FORMS = [u'\\operatorname{Sp}', u'\\Sp', u'Sp_{', u'\\mathfrak{Sp}', u'\\mathrm{Sp}']
for f in FORMS:
    old = sum(x.count(f) for x in L[:273])
    new = sum(x.count(f) for x in L[273:])
    print('%-20s old=%d new=%d' % (f.encode('ascii'), old, new))
print('done')
