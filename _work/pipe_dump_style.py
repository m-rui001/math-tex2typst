# -*- coding: utf-8 -*-
# 定形凭据抽查（小样本）：D68 的 \mid 主流写法、D50 的限制号、bare 表兄弟行
import io, os
BASE = r'E:\math\研究笔记'
def find(pref):
    for f in os.listdir(BASE):
        if f.startswith(pref + '-'):
            return os.path.join(BASE, f)
    return None

def dump(pid, needles, samples=3, width=230):
    p = find(pid)
    data = io.open(p, 'rb').read().decode('utf-8')
    lines = data.split('\n')
    out = ['==== %s (%s) lines=%d' % (pid, os.path.basename(p), len(lines))]
    for n in needles:
        hits = [i for i, l in enumerate(lines, 1) if n in l]
        occ = sum(l.count(n) for l in lines)
        out.append('-- needle %-26r lines=%d occ=%d' % (n, len(hits), occ))
        for i in hits[:samples]:
            l = lines[i - 1]
            k = l.find(n)
            a = max(0, k - 90); b = min(len(l), k + 90)
            out.append('   L%d ...%s...' % (i, l[a:b]))
    return '\n'.join(out)

res = []
res.append(dump('D68', ['\\mid', 'D(\\mu\\mid', '\\lVert \\big', '\\big\\lVert', '\\big\\rVert', '\\Vert']))
res.append('')
res.append(dump('D50', ['\\upharpoonright', '\\rvert', '\\lvert', '\\mid', '\\big', '\\bigrvert', '\\rceil', 'F_P']))
res.append('')
res.append(dump('D32', ['\\lVert x\\rVert', '\\lvert D_q\\rvert', '\\lVert g(v)', '\\lvert u-u\\rvert']))
io.open(r'E:\math\_work\dump_style_out.txt', 'wb').write('\n'.join(res).encode('utf-8'))
print('ok')
