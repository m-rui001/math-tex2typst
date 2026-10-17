import glob, os, sys

i = sys.argv[1]
p = glob.glob(os.path.join('E:\\math', '*', i + '-*.md'))[0]
L = open(p, encoding='utf-8').read().split('\n')
print('bytes=%d lines=%d' % (os.path.getsize(p), len(L)))
for n, l in enumerate(L):
    s = l.strip()
    if s.startswith('#'):
        print('%4d| %s' % (n + 1, s[:70].encode('unicode_escape').decode()))
