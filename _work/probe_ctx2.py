# -*- coding: utf-8 -*-
# 上下文打印：python _work/probe_ctx2.py D437:166,152 D481:182,34 ...
import io, sys, glob

NS = u'\u7814\u7a76\u7b14\u8bb0'
out = []
for job in sys.argv[1:]:
    did, lns = job.split(':')
    p = glob.glob(NS + '/' + did + u'-*.md')
    if not p:
        out.append(u'%s NOFILE' % did); continue
    lines = io.open(p[0], encoding='utf-8', errors='replace').read().split(u'\n')
    out.append(u'########## %s (%d lines)' % (did, len(lines)))
    for s in lns.split(','):
        n = int(s)
        out.append(u'--- L%d ---' % n)
        for k in range(max(0, n - 2), min(len(lines), n + 1)):
            out.append(u'%s' % lines[k])
io.open('_work/probe_ctx2.txt', 'wb').write((u'\n'.join(out)).encode('utf-8'))
print('ok %d' % len(out))
