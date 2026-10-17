import glob, os, re, sys

pat = re.compile('^##\\s*(?:\xa7)?\\s*(\\d+)')
for i in sys.argv[1:]:
    p = glob.glob('E:\\math\\*\\%s-*.md' % i)[0]
    L = open(p, encoding='utf-8').read().split('\n')
    ns = []
    for l in L:
        m = pat.match(l)
        if m:
            ns.append(int(m.group(1)))
    bad = [k for k in range(1, len(ns)) if ns[k] != ns[k - 1] + 1]
    txt = '\n'.join(L)
    print('%s bytes=%d heads=%s dup=%s jumps_at=%s total$=%d' % (
        i, os.path.getsize(p), (str(ns[0]) + '..' + str(ns[-1]) + '/n=' + str(len(ns))),
        len(ns) != len(set(ns)), bad, txt.count('$')))
