import io, glob, sys, os
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
B = chr(92)
p = glob.glob(u'研究笔记/D84-*.md')[0]
raw = io.open(p, 'rb').read()
assert raw.count(chr(13).encode()) == 0
t = raw.decode('utf-8')
ls = t.split(NL)
IDX = 1095
OLD = B + u'R^n'
NEW = B + u'mathbb{R}^n'
line = ls[IDX - 1]
n = line.count(OLD)
print(u'line %d sites=%d' % (IDX, n))
assert n == 2, n
before_total = t.count(OLD)
ls[IDX - 1] = line.replace(OLD, NEW)
t2 = NL.join(ls)
dollar_ok = t2.count(u'$') == t.count(u'$')
tick_ok = t2.count(chr(96)) == t.count(chr(96))
print(u'bytes %d -> %d delta=%d expect=%d' % (len(raw), len(t2.encode('utf-8')),
      len(t2.encode('utf-8')) - len(raw), n * (len(NEW) - len(OLD))))
assert len(t2.encode('utf-8')) - len(raw) == n * (len(NEW) - len(OLD))
assert dollar_ok and tick_ok
assert len(t2.split(NL)) == len(ls)
assert t2.count(OLD) == before_total - 2, (before_total, t2.count(OLD))
io.open(u'_work/D84.pre-rfix.md', 'wb').write(raw)
w = t2.encode('utf-8')
assert w.count(chr(13).encode()) == 0
io.open(p, 'wb').write(w)
print(u'APPLIED  bsR_total %d -> %d  lines=%d' % (before_total, t2.count(OLD), len(t2.split(NL))))
print(u'getsize=%d' % os.path.getsize(p))
