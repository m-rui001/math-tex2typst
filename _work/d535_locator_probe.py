import io, glob, re, sys, collections
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
p = glob.glob(u'研究笔记/D535-*.md')[0]
ls = io.open(p, encoding='utf-8').read().split(NL)
pat = re.compile(u'([A-Za-z0-9_./-]*\\.tex)([:\\uFF1A])([0-9][0-9*(]{0,14})')
cnt = collections.Counter()
samples = []
for i, l in enumerate(ls):
    for m in pat.finditer(l):
        cnt[(m.group(1), m.group(2))] += 1
        if len(samples) < 12:
            samples.append((i + 1, l[max(0, m.start() - 25):m.end() + 12]))
print('D535 locator-ish sites=%d distinct=(file,sep)=%d' % (sum(cnt.values()), len(cnt)))
for k, v in cnt.most_common(14):
    print('    %-34s %r %d' % (k[0], k[1], v))
for s in samples:
    print('  line %d: %r' % s)
