import glob, os

p = glob.glob('E:\\math\\*\\D480-*.md')[0]
raw = open(p, encoding='utf-8').read()
L = raw.split('\n')
line = L[57]
k = line.rindex('## \xa77')
assert k > 0, k
head = line[k:]
assert head.count('\n') == 0 and len(head) < 60, repr(head.encode())
L[57] = line[:k].rstrip()
L.insert(58, '')
L.insert(59, head)
out = '\n'.join(L)
open(p, 'w', encoding='utf-8', newline='').write(out)
print('split ok lines=%d bytes=%d head=%s' % (len(L), len(out.encode()), head.encode('unicode_escape').decode()))
print('ctx:', repr(L[56][:20].encode('unicode_escape').decode()), repr(L[57][-24:].encode('unicode_escape').decode()), repr(L[58]), repr(L[59][:12].encode('unicode_escape').decode()), repr(L[60]))
