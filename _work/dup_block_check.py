# -*- coding: utf-8 -*-
import io, os, re, sys
sys.stdout.reconfigure(encoding='utf-8')
SEC = re.compile(u'^## *\u00a7(\\d+)(.*)$')
BASE = u'研究笔记'
i = sys.argv[1]
f = [x for x in os.listdir(BASE) if x.startswith(i + u'-') and x.endswith(u'.md')][0]
p = os.path.join(BASE, f)
L = io.open(p, encoding='utf-8', newline='').read().split('\n')
h = [(k + 1, m.group(1), m.group(2).strip()) for k, l in enumerate(L) for m in [SEC.match(l)] if m]
print('file', f, 'bytes', os.path.getsize(p), 'headings', len(h))
for k, n, t in h:
    print('L%-6d sec=%-3s %s' % (k, n, t[:46]))
# duplicate groups
seen = {}
for k, n, t in h:
    seen.setdefault((n, t), []).append(k)
for key, v in sorted(seen.items()):
    if len(v) > 1:
        a, b = v[0], v[1]
        ia = [x for x, (k, n, t) in enumerate(h) if k == a][0]
        ib = [x for x, (k, n, t) in enumerate(h) if k == b][0]
        ja = ia + 1 if ia + 1 < len(h) else len(h)
        jb = ib + 1 if ib + 1 < len(h) else len(h)
        block_a = '\n'.join(L[h[ia][0] - 1:h[ja - 1][0] - 1])
        block_b = '\n'.join(L[h[ib][0] - 1:h[jb - 1][0] - 1])
        print('DUP sec=%s title=%s lines %s..%s  blockA=%dB blockB=%dB identical=%s'
              % (key[0], key[1][:28], a, b, len(block_a.encode('utf-8')), len(block_b.encode('utf-8')),
                 block_a == block_b))
