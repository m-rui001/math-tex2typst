# -*- coding: utf-8 -*-
# 上下文打印（带前后一行），输出到 _work/probe_ctx3.txt
import io, glob, sys

NS = u'\u7814\u7a76\u7b14\u8bb0'
JOBS = [('D618', 306), ('D618', 300), ('D634', 373), ('D542', 302), ('D542', 308), ('D545', 451),
        ('D494', 299), ('D580', 242), ('D591', 200), ('D467', 187), ('D687', 337), ('D643', 476),
        ('D422', 268), ('D433', 289), ('D578', 204), ('D576', 232), ('D446', 455), ('D530', 226),
        ('D642', 277), ('D521', 316), ('D478', 248), ('D480', 270), ('D493', 286), ('D551', 224)]
out = []
for did, n in JOBS:
    p = glob.glob(NS + '/' + did + u'-*.md')
    if not p:
        out.append(u'%s NOFILE' % did); continue
    lines = io.open(p[0], encoding='utf-8', errors='replace').read().split(u'\n')
    out.append(u'===== %s L%d =====' % (did, n))
    for k in range(max(0, n - 2), min(len(lines), n + 1)):
        out.append(u'%d| %s' % (k + 1, lines[k]))
io.open('_work/probe_ctx3.txt', 'wb').write((u'\n'.join(out)).encode('utf-8'))
