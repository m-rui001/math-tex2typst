import io, glob, sys, os
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
p = glob.glob(u'研究笔记/D535-*.md')[0]
raw = io.open(p, 'rb').read()
assert raw.count(chr(13).encode()) == 0
t = raw.decode('utf-8')
ls = t.split(NL)
IDX = 381
line = ls[IDX - 1]
OLD = u'^{\\mathrm{cut},+}}$'
NEW = u'^{\\mathrm{cut},+}$'
print(u'target line occurrences=%d  whole-file=%d' % (line.count(OLD), t.count(OLD)))
assert line.count(OLD) == 1 and t.count(OLD) == 1
ls[IDX - 1] = line.replace(OLD, NEW)
t2 = NL.join(ls)
assert len(t2.encode('utf-8')) - len(raw) == -1
assert t2.count(u'$') == t.count(u'$')
assert t2.count(chr(96)) == t.count(chr(96))
assert len(t2.split(NL)) == len(ls)
w = t2.encode('utf-8')
assert w.count(chr(13).encode()) == 0
io.open(u'_work/D535.pre-brace.md', 'wb').write(raw)
io.open(p, 'wb').write(w)
print(u'APPLIED bytes %d -> %d  getsize=%d' % (len(raw), len(w), os.path.getsize(p)))
