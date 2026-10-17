# -*- coding: utf-8 -*-
import io, glob
p = glob.glob(u'被引笔记/C13-*.md')[0]
ls = io.open(p, encoding='utf-8').read().split(u'\n')
for i in (197, 198, 199, 200):
    l = ls[i - 1]
    print('L%d  $枚=%d' % (i, l.count(u'$')), l[:260])
