import glob, os, sys

p = glob.glob('E:\\math\\*\\D475-*.md')[0]
L = open(p, encoding='utf-8').read().split('\n')
blk = L[172:178]
print('D475 block 173-178 bytes=%d' % sum(len(x.encode()) + 1 for x in blk))
print('file bytes=%d -> after=%d' % (os.path.getsize(p), os.path.getsize(p) - sum(len(x.encode()) + 1 for x in blk)))
for x in blk:
    print(repr(x[:60].encode('unicode_escape').decode()))
print('---- prev line 172:', repr(L[171][:60].encode('unicode_escape').decode()))
print('---- next line 179:', repr(L[178][:60].encode('unicode_escape').decode()))
q = glob.glob('E:\\math\\*\\D465-*.md')[0]
M = open(q, encoding='utf-8').read().split('\n')
for n, l in enumerate(M):
    s = l.strip()
    if s.startswith('##') and n < 160:
        print('D465 %4d| %s' % (n + 1, s[:50].encode('unicode_escape').decode()))
print('==== D465 errata 354..375')
for n in range(353, len(M)):
    print('%4d| %s' % (n + 1, M[n][:90].encode('unicode_escape').decode()))
