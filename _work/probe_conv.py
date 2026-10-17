import io, re

D106 = 'E:/math/研究笔记/D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md'
D77 = 'E:/math/研究笔记/D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md'
D238 = 'E:/math/研究笔记/D238-平方差自由集的固定幂节省.md'
D26 = 'E:/math/研究笔记/D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md'
D30 = 'E:/math/研究笔记/D30-负pinched三维Kähler流形无有界全纯坐标.md'

out = io.open('E:/math/_work/probe_conventions.txt', 'w', encoding='utf-8')

t = io.open(D106, encoding='utf-8').read()
L = t.split('\n')
out.write('D106 \\mathtt total = %d ; \\mathtt{root} = %d\n' %
          (len(re.findall(r'\\mathtt', t)), len(re.findall(r'\\mathtt\{root\}', t))))
for i, l in enumerate(L, 1):
    for m in re.finditer(r'\\mathtt\{root\}', l):
        s = max(0, m.start() - 50); e = min(len(l), m.end() + 40)
        out.write('  L%-5d| ...%s...\n' % (i, l[s:e]))
out.write('\n')

for name, p in [('\\mathtt', r'\\mathtt'), ('\\text{', r'\\text\{'),
                ('\\mathrm{', r'\\mathrm\{'), ('\\operatorname{', r'\\operatorname\{'),
                ('\\mathbb', r'\\mathbb'), ('binary-free-Lie phrase', '二元自由 Lie'),
                ('^{...}', r'\^\{[^}]{1,8}\}')]:
    t77 = io.open(D77, encoding='utf-8').read()
    out.write('D77 %-22s %d\n' % (name, len(re.findall(p, t77))))
out.write('\n-- D77 all superscript-brace forms (unique) --\n')
t77 = io.open(D77, encoding='utf-8').read()
sup = re.findall(r'\^\{[^{}]{1,12}\}', t77)
import collections
for k, v in collections.Counter(sup).most_common(30):
    out.write('   %-20s %d\n' % (k, v))
out.write('\n-- D77 lines with 二元自由 Lie --\n')
for i, l in enumerate(io.open(D77, encoding='utf-8').read().split('\n'), 1):
    if '二元自由 Lie' in l:
        for m in re.finditer('二元自由 Lie', l):
            s = max(0, m.start() - 60); e = min(len(l), m.end() + 130)
            out.write('   L%-4d| ...%s...\n' % (i, l[s:e]))

# D238: exact strings around the two \math P sites + \mathcal P neighbours
out.write('\n-- D238 verbatim math spans containing the defect --\n')
t238 = io.open(D238, encoding='utf-8').read()
for i, l in enumerate(t238.split('\n'), 1):
    for m in re.finditer(r'\\math\s+P', l):
        s = max(0, m.start() - 90); e = min(len(l), m.end() + 90)
        out.write('   L%-4d| ...%s...\n' % (i, l[s:e]))
# uniqueness check for proposed OLD strings
CAND = {
 'D238 L298 OLD': r'\lvert\mathcal Z_{\math P}((g_v))\rvert',
 'D238 L744 OLD': r'$\mathcal Z_{\math P}$，应为',
 'D106 L1750 OLD': r'(\root h)^3$ 与',
 'D106 L1873 OLD': r'分母 $\root h$ 的幂',
 'D106 L1913 OLD': r'(-a_1)/(\root T)^3\le',
 'D106 L1914 OLD': r'$(-a_1)/(\root T)^3>0$',
 'D77 L496 OLD': r'L_n^{\two}',
 'D77 L552 OLD-a': r'L_1^{\two}=2',
 'D77 L552 OLD-b': r'L_2^{\two}=1',
 'D30 L827 OLD': r'$E:\math\lean\OAI\Geometry\Kahler$',
}
out.write('\n-- whole-file occurrence counts of candidate OLD strings --\n')
texts = {'D238': t238, 'D106': io.open(D106, encoding='utf-8').read(),
         'D77': io.open(D77, encoding='utf-8').read(),
         'D30': io.open(D30, encoding='utf-8').read(),
         'D26': io.open(D26, encoding='utf-8').read()}
for label, s in CAND.items():
    tag = label.split()[0]
    n = texts[tag].count(s)
    nl = s.encode('utf-8')
    out.write('   %-18s hits=%d  bytes=%d  | %s\n' % (label, n, len(nl), s))
out.close()
print('ok')
