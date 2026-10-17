import io

D106 = 'E:/math/研究笔记/D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md'
D238 = 'E:/math/研究笔记/D238-平方差自由集的固定幂节省.md'
EARLIER_CHARS = {D106: 145349, D238: 44319}   # measured by probe_notation.py before the external edit
PAIRS = {
 D106: [
   (r'$(\root h)^3$', r'$(\mathtt{root}\ h)^3$'),
   (r'$\root h$', r'$\mathtt{root}\ h$'),
   (r'(-a_1)/(\root T)^3\le', r'(-a_1)/(\mathtt{root}\ T)^3\le'),
   (r'$(-a_1)/(\root T)^3>0$', r'$(-a_1)/(\mathtt{root}\ T)^3>0$'),
 ],
 D238: [
   (r'\lvert\mathcal Z_{\math P}((g_v))\rvert', r'\lvert\mathcal Z_{\mathcal P}((g_v))\rvert'),
 ],
}
out = io.open('E:/math/_work/probe_landed.txt', 'w', encoding='utf-8')
for path, ps in PAIRS.items():
    t = io.open(path, encoding='utf-8').read()
    out.write('==== %s  chars=%d (earlier %d, diff %+d)  bytes=%d\n'
              % (path.split('/')[-1], len(t), EARLIER_CHARS[path],
                 len(t) - EARLIER_CHARS[path], len(t.encode('utf-8'))))
    for old, new in ps:
        out.write('   OLD now hits=%d ; NEW hits=%d ; predicted delta=%+d bytes\n'
                  % (t.count(old), t.count(new),
                     len(new.encode('utf-8')) - len(old.encode('utf-8'))))
    out.write('\n')
out.close()
print('ok')
