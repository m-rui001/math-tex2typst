# -*- coding: utf-8 -*-
# D476 收稿判形：新段裸英文词上下文、术语「对偶」误选、§18 前向节号是否错记。
import io, glob, re

p = glob.glob(u'研究笔记/D476-*.md')[0]
L = io.open(p, encoding='utf-8').read().split('\n')
NEW = 230
out = []

WORDS = [u'coeff', u'datum', u'length', u'identification', u'locality', u'limsup',
         u'bigwedge', u'bigoplus', u'Omega', u'downstairs']
for w in WORDS:
    hits = [(i + 1, L[i]) for i in range(len(L)) if w in L[i]]
    out.append(u'=== %s total=%d new=%d' % (w, len(hits), sum(1 for h in hits if h[0] >= NEW + 1)))
    for ln, t in hits[:6]:
        k = t.find(w)
        out.append(u'  %s%s | ...%s...' % (u'*' if ln > NEW else u' ', ln, t[max(0, k - 45):k + 45]))

out.append(u'')
out.append(u'=== 对偶 在标题行的形制（全篇旧用法）')
for i, l in enumerate(L):
    if u'对偶' in l:
        out.append(u'  %d | %s' % (i + 1, l[:110]))

out.append(u'')
out.append(u'=== 小节标题 8/9/16-20')
for i, l in enumerate(L):
    if l.startswith(u'## ') and re.match(u'\u00a7?(8|9|1[6-9]|20)\\b', l[3:]):
        out.append(u'  %d | %s' % (i + 1, l[:80]))

out.append(u'')
out.append(u'=== 新段里提到 §8 或 §9 的句子')
for i in range(NEW, len(L)):
    l = L[i]
    for m in re.finditer(u'§[89]\\b', l):
        k = m.start()
        out.append(u'  %d | ...%s...' % (i + 1, l[max(0, k - 70):k + 60]))

io.open(u'_work/d476_shapes.txt', 'w', encoding='utf-8', newline='\n').write(u'\n'.join(out) + u'\n')
print('lines', len(out))
