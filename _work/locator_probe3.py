import io, glob, re, sys, collections
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
pat = re.compile(u'`([^`\\n]*?\\.tex:[0-9][0-9]*(?:--[0-9]+)?)`')
for nid in ('D84', 'D95', 'D535'):
    p = glob.glob(u'研究笔记/' + nid + u'-*.md')[0]
    s = io.open(p, encoding='utf-8').read()
    ms = pat.findall(s)
    heads = collections.Counter(m.split(chr(58))[0] for m in ms)
    print('=== %s  locator sites=%d  distinct files=%d' % (nid, len(ms), len(heads)))
    for f, k in heads.most_common(8):
        print('    %-42s %d' % (f, k))
    withbuild = sum(1 for m in ms if m.startswith(u'build/'))
    print('    build/-prefixed=%d  bare=%d' % (withbuild, len(ms) - withbuild))
