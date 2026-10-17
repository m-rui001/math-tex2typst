# -*- coding: utf-8 -*-
import io, json
g = json.load(io.open('_work/katex_macros.json', encoding='utf-8'))
for k in sorted(g):
    if k.strip('\\') in ('red', 'Exc', 'wt', 'rfdown'):
        print('%-8s -> %r' % (k, g[k]))
print('全局枚=%d' % len(g))
