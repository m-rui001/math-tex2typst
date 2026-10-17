# -*- coding: utf-8 -*-
import io
p = u'E:\\math\\被引笔记\\C19-Kähler广义对的BBY分解.md'
B = chr(92)
YP = B + "'"          # LaTeX 里的 Y'
NEW = (u'交换图的箭头依次是 $' + B + u'pi\\colon M\\to X$、$' + B + u'phi\\colon M\\to Y$、$'
       + B + u'tilde f\\colon M\\to Y' + B + u"'$、$" + B + u'f\\colon X' + B + u'dashrightarrow Y'
       + B + u"'$（虚线箭头，即尚未成为态射的有理映射）与 $g\\colon Y" + B + u"'\\to Y$；"
       u'两条路径的相等关系是 $' + B + u'tilde f=f' + B + u'circ' + B + u'pi$ 与 $'
       + B + u'phi=g' + B + u'circ' + B + u'tilde f$。')
lines = io.open(p, encoding='utf-8', newline='').read().split(u'\n')
hits = {}
for i, l in enumerate(lines):
    if B + u'tilde' + B + u'mathcal F' in l:
        lines[i] = l.replace(B + u'tilde' + B + u'mathcal F', B + u'tilde{' + B + u'mathcal F}')
        hits.setdefault('tilde_group', []).append(i + 1)
    if u'|_X_y=0' in l:
        lines[i] = lines[i].replace(u'|_X_y=0', B + u'rvert_{X_y}=0')
        hits.setdefault('rvert', []).append(i + 1)
    if l.startswith(u'$$' + B + u'begin{tikzcd}'):
        lines[i] = NEW
        hits.setdefault('tikzcd', []).append(i + 1)
t = u'\n'.join(lines)
assert u'\r' not in t
io.open(p, 'w', encoding='utf-8', newline='').write(t)
for k in sorted(hits):
    print(k, hits[k])
print(NEW.encode('unicode_escape').decode('ascii')[:400])
print('bytes %d' % len(t.encode('utf-8')))
