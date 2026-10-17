# -*- coding: utf-8 -*-
import io, os, sys
BASE = r'E:\math\研究笔记'
NEED = [('D32', [r"$\|pv+rg(v)\|=p+r$", r"$\|pv+rg(v)\rVert=p+r$"]),
        ('D68', [r"\|nu_{*}", r"D(\mu\Vert", r"D(\mu\|"]),
        ('D30', [r"$\|f\|_\infty", r"\lVert f\rVert_\infty"])]
def find(pref):
    for f in sorted(os.listdir(BASE)):
        if f.startswith(pref + '-'):
            return os.path.join(BASE, f)
out = []
for pid, needles in NEED:
    lines = io.open(find(pid), 'rb').read().decode('utf-8').split('\n')
    out.append('==== %s' % pid)
    for n in needles:
        hits = [i for i, l in enumerate(lines, 1) if n in l]
        out.append('-- %r occ_lines=%s' % (n, hits))
        for i in hits[:6]:
            l = lines[i - 1]; k = l.find(n)
            out.append('   L%d ...%s...' % (i, l[max(0, k - 110):k + 110]))
io.open(r'E:\math\_work\dump_amb_out.txt', 'wb').write('\n'.join(out).encode('utf-8'))
print('ok')
