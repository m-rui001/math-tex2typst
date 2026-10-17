import io, os, time, re

F = {
 'D26': 'E:/math/研究笔记/D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md',
 'D30': 'E:/math/研究笔记/D30-负pinched三维Kähler流形无有界全纯坐标.md',
 'D77': 'E:/math/研究笔记/D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md',
 'D106': 'E:/math/研究笔记/D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md',
 'D238': 'E:/math/研究笔记/D238-平方差自由集的固定幂节省.md',
}
CHECKS = {
 'D26': [r'\inner', 'rangleG'],
 'D30': [r'\math P', r'E:\math'],
 'D77': [r'\two'],
 'D106': [r'\root', r'\mathtt{root}'],
 'D238': [r'\math P', r'\mathcal Z_{\math P}', r'\mathcal Z_{\mathcal P}'],
}
out = io.open('E:/math/_work/probe_state_now.txt', 'w', encoding='utf-8')
now = time.time()
for tag, p in F.items():
    st = os.stat(p)
    t = io.open(p, encoding='utf-8').read()
    out.write('==== %s  mtime=%s (%.0f s ago)  size=%d bytes  lines=%d\n'
              % (tag, time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(st.st_mtime)),
                 now - st.st_mtime, st.st_size, len(t.split('\n'))))
    for c in CHECKS[tag]:
        out.write('   plain count %-24s %d\n' % (c, t.count(c)))
    out.write('   -- current text of the censused lines --\n')
    L = t.split('\n')
    lns = {'D26': [372, 376], 'D30': [827], 'D77': [496, 552],
           'D106': [1750, 1873, 1913, 1914], 'D238': [298, 744]}[tag]
    for n in lns:
        out.write('   L%-5d| %s\n' % (n, L[n - 1][:300]))
    out.write('\n')
out.close()
print('ok')
