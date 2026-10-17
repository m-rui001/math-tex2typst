import io, json, re, collections, glob, os

NOTES = 'E:/math/研究笔记/'
targets = {
 'D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md': [376],
 'D238-平方差自由集的固定幂节省.md': [298, 744],
 'D30-负pinched三维Kähler流形无有界全纯坐标.md': [827],
 'D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md': [496, 552],
 'D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md': [1750, 1873, 1913, 1914],
}

out = io.open('E:/math/_work/probe_lines.txt', 'w', encoding='utf-8')
for fn, lines in targets.items():
    p = os.path.join(NOTES, fn)
    text = io.open(p, encoding='utf-8').read()
    L = text.split('\n')
    out.write('#' * 90 + '\nFILE %s  (total lines %d)\n' % (fn, len(L)))
    for n in lines:
        for m in range(max(0, n - 3), min(len(L), n + 2)):
            mark = '>>' if (m + 1) == n else '  '
            out.write('%s L%-5d| %s\n' % (mark, m + 1, L[m]))
        out.write('-' * 60 + '\n')
out.close()
print('ok')
