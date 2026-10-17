import io, glob, sys
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)

p = glob.glob(u'研究笔记/D434-*.md')[0]
raw = io.open(p, 'rb').read()
b0 = len(raw)
s = raw.decode('utf-8')

OLD_A = r'，取 $\ell$ 次方的目标是 $q_J^\ell\geq\bigl(\frac{\ell!}{n^{\ell+1}}\bigr)^{?}$；按素材形式反推最稳：'
NEW_A = r'；按素材形式反推最稳：'
OLD_B = r'，与 $\frac{1}{2C_\ell}=(\frac{(\ell!)^m m!}{2n^{m(\ell+1)\ell}})^{\ell}\cdot$……此处我不再纠缠，结论是素材在'
NEW_B = r'，结论是素材在'

out = s
for old, new, tag in ((OLD_A, NEW_A, 'A'), (OLD_B, NEW_B, 'B')):
    n = out.count(old)
    assert n == 1, (tag, n)
    assert old.count(u'$') % 2 == 0, (tag, old.count(u'$'))
    assert new.count(u'$') == 0 or new.count(u'$') % 2 == 0, tag
    out = out.replace(old, new, 1)
    print('%s removed=%d chars, dollars=%d' % (tag, len(old) - len(new), old.count(u'$')))

assert out.count(u'$') % 2 == 0
assert out.count(NL) == s.count(NL)
assert u'^{?}' not in out
nb = out.encode('utf-8')
assert nb.count(chr(13).encode()) == 0
io.open(p, 'wb').write(nb)
print('bytes %d -> %d  delta=%d  dollar=%d' % (b0, len(nb), len(nb) - b0, out.count(u'$')))
