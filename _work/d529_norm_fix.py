import io, glob, sys
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
B = chr(92)
NL = chr(10)
PIPE = B + '|'
OPEN = B + 'lVert '
CLOSE = B + 'rVert'

p = glob.glob(u'研究笔记/D529-*.md')[0]
raw = io.open(p, 'rb').read()
ls = raw.decode('utf-8').split(NL)
b0 = len(raw)
tot = 0
for ln in (451, 461, 472):
    old = ls[ln - 1]
    n = old.count(PIPE)
    assert n % 2 == 0 and n > 0, (ln, n)
    segs = old.split(PIPE)
    out = segs[0]
    for k, s in enumerate(segs[1:]):
        out += (OPEN if k % 2 == 0 else CLOSE) + s
    d = len(out.encode('utf-8')) - len(old.encode('utf-8'))
    assert d == 9 * (n // 2), (ln, d, n)
    assert out.count(u'|') == 6, (ln, out.count(u'|'))
    ls[ln - 1] = out
    tot += d
    print(ln, 'pairs=%d delta=%d' % (n // 2, d))
new = NL.join(ls).encode('utf-8')
assert len(new) - b0 == tot, (len(new) - b0, tot)
assert new.count(chr(13).encode()) == 0
io.open(p, 'wb').write(new)
print('bytes %d -> %d' % (b0, len(new)))
