# -*- coding: utf-8 -*-
import io, glob

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D33-*.md')[0]
lines = io.open(p, encoding='utf-8').read().split('\n')
n = 0
out = []
for l in lines:
    if l.startswith('| ') and l.count('|') > 6:
        parts = l.split(' || ')
        if len(parts) == 2:
            out.append(parts[0] + ' |')
            out.append('| ' + parts[1])
            n += 1
            continue
    out.append(l)
t = u'\n'.join(out)
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('split', n, 'size', len(t.encode('utf-8')))
