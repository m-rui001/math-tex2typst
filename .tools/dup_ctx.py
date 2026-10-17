import glob, os, sys

cases = [('D464', [112, 266]), ('D465', [139, 181]), ('D475', [114, 177]), ('D492', [658, 735, 660, 737])]
for i, lns in cases:
    p = glob.glob(os.path.join('E:\\math', '*', i + '-*.md'))[0]
    L = open(p, encoding='utf-8').read().split('\n')
    print('==== %s bytes=%d lines=%d' % (i, os.path.getsize(p), len(L)))
    for ln in lns:
        lo, hi = max(1, ln - 2), min(len(L) - 1, ln + 2)
        print('  line %d len=%d' % (ln, len(L[ln - 1].encode())))
        for n in range(lo, hi + 1):
            print('    %4d| %s' % (n, L[n - 1][:70].encode('unicode_escape').decode()))
    for n, l in enumerate(L):
        if l.strip().startswith('#') and ('\u52d8\u8bef' in l or '\u52d8\u8aa4' in l):
            print('  ERRATA heading at line %d' % (n + 1))
