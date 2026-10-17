# -*- coding: utf-8 -*-
# 打印指定队列行对应 build 目录的 tex 清单（文件名与字节），供派单正文引用。
import io, os, sys

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
for ln in [int(x) for x in sys.argv[1:]]:
    d = qdirs[ln - 1]
    b = os.path.join('preprints', d, 'build')
    print('L%d | %s' % (ln, d))
    for f in sorted(os.listdir(b)):
        p = os.path.join(b, f)
        if os.path.isfile(f and p):
            if f.endswith('.tex') or f.endswith('.bib'):
                print('    %s %d' % (f, os.path.getsize(p)))
    for root, ds, fs in os.walk(b):
        sub = os.path.relpath(root, b)
        if sub != '.':
            tex = [(x, os.path.getsize(os.path.join(root, x))) for x in sorted(fs) if x.endswith('.tex')]
            if tex:
                print('    [%s] %s' % (sub, ' '.join('%s:%d' % t for t in tex[:20])))
