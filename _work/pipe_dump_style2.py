# -*- coding: utf-8 -*-
# 定形凭据抽查 2：D26 / D47 / D65 / D25(1884) / D28 / D44 / D36 / D30 / D24 / D364 / D34 / D29
import io, os
BASE = r'E:\math\研究笔记'
def find(pref):
    for f in os.listdir(BASE):
        if f.startswith(pref + '-'):
            return os.path.join(BASE, f)
    return None

def dump(pid, needles, samples=6, span=100):
    p = find(pid)
    lines = io.open(p, 'rb').read().decode('utf-8').split('\n')
    out = ['==== %s lines=%d' % (pid, len(lines))]
    for n in needles:
        hits = [i for i, l in enumerate(lines, 1) if n in l]
        occ = sum(l.count(n) for l in lines)
        out.append('-- needle %-22r lines=%d occ=%d' % (n, len(hits), occ))
        for i in hits[:samples]:
            l = lines[i - 1]; k = l.find(n)
            out.append('   L%d ...%s...' % (i, l[max(0, k - span):k + span]))
    return '\n'.join(out)

res = []
res.append(dump('D26', ['\\lVert', '\\lvert', 'c_p=', '(\\mathbb E']))
res.append('')
res.append(dump('D47', ["P'p", 'S(p,e)', '\\lVert', '\\lvert']))
res.append('')
res.append(dump('D65', ['\\lVert', '\\lvert']))
res.append('')
res.append(dump('D25', ['x^*Ax', 'x_1x_2', '\\lVert z\\rVert']))
res.append('')
res.append(dump('D28', ['\\lvert S_n', '\\lvert 3', 'E\\lvert']))
res.append('')
res.append(dump('D44', ['\\lvert Z_m', 'Z_m']))
res.append('')
res.append(dump('D36', ['\\lvert', '\\lVert']))
io.open(r'E:\math\_work\dump_style2_out.txt', 'wb').write('\n'.join(res).encode('utf-8'))
print('ok')
