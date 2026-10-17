import io

F = {
 'D26': 'E:/math/研究笔记/D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md',
 'D30': 'E:/math/研究笔记/D30-负pinched三维Kähler流形无有界全纯坐标.md',
 'D77': 'E:/math/研究笔记/D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md',
 'D106': 'E:/math/研究笔记/D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md',
 'D238': 'E:/math/研究笔记/D238-平方差自由集的固定幂节省.md',
}
LINES = [('D26', 376), ('D30', 827), ('D238', 298), ('D238', 744),
         ('D77', 496), ('D77', 552), ('D106', 1750), ('D106', 1873),
         ('D106', 1913), ('D106', 1914)]
out = io.open('E:/math/_work/probe_lendiff.txt', 'w', encoding='utf-8')
cache = {}
for tag, n in LINES:
    if tag not in cache:
        cache[tag] = io.open(F[tag], encoding='utf-8').read().split('\n')
    l = cache[tag][n - 1]
    out.write('%-5s L%-5d chars=%4d bytes=%4d dollars=%2d backticks=%2d\n'
              % (tag, n, len(l), len(l.encode('utf-8')), l.count('$'), l.count('`')))
t106 = io.open(F['D106'], encoding='utf-8').read()
t77 = io.open(F['D77'], encoding='utf-8').read()
out.write('\nD106 occurrences of (\\root T)^3      = %d\n' % t106.count(r'(\root T)^3'))
out.write('D106 occurrences of \\root            = %d\n' % t106.count(r'\root'))
out.write('D106 occurrences of \\mathtt{root}    = %d\n' % t106.count(r'\mathtt{root}'))
out.write('D106 occurrences of \\sqrt            = %d\n' % t106.count(r'\sqrt'))
out.write('D77  occurrences of L_n^{\\two}        = %d\n' % t77.count(r'L_n^{\two}'))
out.write('D77  occurrences of ^{\\two}           = %d\n' % t77.count(r'^{\two}'))
out.write('D77  occurrences of ^{(2)}            = %d\n' % t77.count('^{(2)}'))
out.close()
print('ok')
