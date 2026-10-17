import io, glob, re, sys
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
LOC = re.compile(u'[A-Za-z0-9_./-]*\\.tex[:\\uFF1A][0-9]')

for nid in ('D93', 'D452', 'D175'):
    p = glob.glob(u'研究笔记/' + nid + u'-*.md')[0]
    ls = io.open(p, encoding='utf-8').read().split(NL)
    inb = out = 0
    ext = {}
    for l in ls:
        parts = l.split(u'`')
        for k, seg in enumerate(parts):
            n = len(LOC.findall(seg))
            if k % 2 == 1:
                inb += n
            else:
                out += n
                for m in LOC.findall(seg):
                    ext[m] = ext.get(m, 0) + 1
    print('=== %s  inside-backticks=%d  outside=%d' % (nid, inb, out))
    tops = sorted(ext.items(), key=lambda kv: -kv[1])[:6]
    for f, c in tops:
        print('    %-46s %d' % (f, c))
