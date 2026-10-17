# -*- coding: utf-8 -*-
import io, re, glob, sys

out = []
for pat in sys.argv[1:]:
    p = glob.glob('研究笔记/' + pat + '*.md')[0]
    t = io.open(p, encoding='utf-8').read()
    lines = t.split('\n')
    out.append('=== %s (%d lines) ===' % (pat, len(lines)))
    for i, l in enumerate(lines, 1):
        if '而不是' in l:
            out.append('%s:%d: %s' % (pat, i, l.strip()[:260]))
io.open('.tools/bc_ctx.txt', 'w', encoding='utf-8').write('\n'.join(out))
print(len(out))
