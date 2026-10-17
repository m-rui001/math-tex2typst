import io, re

D77 = 'E:/math/研究笔记/D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md'
D106 = 'E:/math/研究笔记/D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md'
D238 = 'E:/math/研究笔记/D238-平方差自由集的固定幂节省.md'
D26 = 'E:/math/研究笔记/D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md'
D30 = 'E:/math/研究笔记/D30-负pinched三维Kähler流形无有界全纯坐标.md'

Q = [
 (D77, [
   ('backslash two',            r'\\two'),
   ('^{\\two}',                 r'\^\{\\two\}'),
   ('^(2)',                     r'\^\(2\)'),
   ('^{2}',                     r'\^\{2\}'),
   ('^2 bare',                  r'\^2(?![0-9])'),
   ('\\operatorname{Lie}',      r'\\operatorname\{Lie\}'),
   ('\\Lie',                    r'\\Lie(?![A-Za-z])'),
   ('\\mathfrak f',             r'\\mathfrak\s*\{?f'),
   ('\\dim_{\\mathbb Q}',       r'\\dim_\{?\\mathbb\s*\{?Q'),
   ('\\overline L_n',           r'\\overline\s*\{?\\?L_n'),
 ]),
 (D106, [
   ('backslash root',           r'\\root'),
   ('\\text{root }',            r'\\text\{root \}'),
   ('\\text{<lowercase>',       r'\\text\{[a-z]'),
   ('\\text{third }',           r'\\text\{third \}'),
   ('\\text{curvature }',       r'\\text\{curvature \}'),
   ('\\text{slope }',           r'\\text\{slope \}'),
   ('\\sqrt',                   r'\\sqrt'),
   ('\\operatorname',           r'\\operatorname'),
   ('\\mathrm{',                r'\\mathrm\{'),
   ('root bare word (any)',     r'root'),
 ]),
 (D238, [
   ('\\math P',                 r'\\math\s+P'),
   ('\\mathcal P',              r'\\mathcal\s*P(?![A-Za-z])'),
   ('\\mathbb P',               r'\\mathbb\s*\{?P(?![A-Za-z])'),
   ('\\P',                      r'\\P(?![A-Za-z])'),
   ('\\mathcal Z_{\\math P}',   r'\\mathcal\s*\{?Z\?_\{\\math\s+P'),
   ('\\mathcal Z_{\\mathcal P}', r'\\mathcal\s*\{?Z\?_\{\\mathcal\s*P'),
   ('\\mathcal Z',              r'\\mathcal\s*\{?Z'),
 ]),
 (D26, [
   ('\\inner',                  r'\\inner'),
   ('\\norm',                   r'\\norm'),
   ('\\langle',                 r'\\langle'),
   ('\\rangle',                 r'\\rangle'),
 ]),
 (D30, [
   ('\\math then non-letter',   r'\\math(?![A-Za-z])'),
   ('E:\\math path',            r'E:\\math'),
 ]),
]

out = io.open('E:/math/_work/probe_notation.txt', 'w', encoding='utf-8')
for path, pats in Q:
    t = io.open(path, encoding='utf-8').read()
    lines = t.split('\n')
    out.write('==== %s (%d chars, %d lines)\n' % (path.split('/')[-1], len(t), len(lines)))
    for label, p in pats:
        rx = re.compile(p)
        n = len(rx.findall(t))
        out.write('   %-28s %-34s %d\n' % (label, p, n))
    out.write('\n')
out.close()
print('ok')
