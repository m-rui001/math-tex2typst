import io, re

D106 = 'E:/math/研究笔记/D106-五次Lienard系统的两个极限环：model-fitting-arcs三段论证的反推笔记.md'
D238 = 'E:/math/研究笔记/D238-平方差自由集的固定幂节省.md'
D77 = 'E:/math/研究笔记/D77-特征二下的五边形退化与Deligne--Drinfeld猜想证明反推.md'

PAIRS = [
 # (label, file, expected line, OLD, NEW)
 ('D238-L298', D238, 298,
  r'\lvert\mathcal Z_{\math P}((g_v))\rvert',
  r'\lvert\mathcal Z_{\mathcal P}((g_v))\rvert'),
 ('D106-L1750', D106, 1750, r'$(\root h)^3$', r'$(\mathtt{root}\ h)^3$'),
 ('D106-L1873', D106, 1873, r'$\root h$', r'$\mathtt{root}\ h$'),
 ('D106-L1913', D106, 1913, r'(-a_1)/(\root T)^3\le', r'(-a_1)/(\mathtt{root}\ T)^3\le'),
 ('D106-L1914', D106, 1914, r'$(-a_1)/(\root T)^3>0$', r'$(-a_1)/(\mathtt{root}\ T)^3>0$'),
 ('D77-L496(sugg)', D77, 496, r'L_n^{\two}', r'L_n^{(2)}'),
 ('D77-L552a(sugg)', D77, 552, r'L_1^{\two}=2', r'L_1^{(2)}=2'),
 ('D77-L552b(sugg)', D77, 552, r'L_2^{\two}=1', r'L_2^{(2)}=1'),
]

out = io.open('E:/math/_work/probe_fixverify.txt', 'w', encoding='utf-8')
cache = {}
for label, path, ln, old, new in PAIRS:
    if path not in cache:
        cache[path] = io.open(path, encoding='utf-8').read()
    t = cache[path]
    lines = t.split('\n')
    line = lines[ln - 1]
    hits_old_whole = t.count(old)
    hits_old_line = line.count(old)
    hits_new_whole = t.count(new)
    nb = len(new.encode('utf-8')) - len(old.encode('utf-8'))
    dol_before = line.count('$')
    dol_after = line.replace(old, new).count('$')
    # dollar parity of whole line after replacing ALL old occurrences on that line
    after = line.replace(old, new)
    out.write('%s\n' % label)
    out.write('   file          %s\n' % path.split('/')[-1])
    out.write('   line          %d\n' % ln)
    out.write('   OLD           %r\n' % old)
    out.write('   NEW           %r\n' % new)
    out.write('   OLD hits whole-file=%d  on-that-line=%d   NEW hits whole-file=%d\n'
              % (hits_old_whole, hits_old_line, hits_new_whole))
    out.write('   OLD bytes=%d  NEW bytes=%d  delta=%+d (per occurrence, occurrences on line=%d)\n'
              % (len(old.encode('utf-8')), len(new.encode('utf-8')), nb, hits_old_line))
    out.write('   dollars before=%d after=%d  parity_before=%s parity_after=%s\n'
              % (dol_before, dol_after, dol_before % 2, dol_after % 2))
    out.write('   line after replacement: %s\n\n' % after[:400])
out.close()
print('ok')
