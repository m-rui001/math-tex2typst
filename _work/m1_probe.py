import io, glob, sys, os, time, re
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
B = chr(92)
IDS = [u'D89', u'D92', u'D86', u'D90', u'D91', u'D78', u'D81', u'D85', u'D12']
for nid in IDS:
    c = glob.glob(u'研究笔记/' + nid + u'-*.md')
    if not c:
        print(nid, u'NOFILE')
        continue
    p = c[0]
    raw = io.open(p, 'rb').read()
    t = raw.decode('utf-8')
    ls = t.split(NL)
    hs = [i + 1 for i, l in enumerate(ls) if l[:3] == u'## ']
    hdr = [i + 1 for i, l in enumerate(ls) if l.startswith(u'| 符号')]
    sep = [i + 1 for i, l in enumerate(ls) if l.strip() == u'| --- | --- | --- | --- | --- |']
    math = t.count(u'$')
    # material pointers: lines naming a lean path / yaml / 素材 dir
    src = []
    for i, l in enumerate(ls):
        if (u'formalization.yaml' in l) or (u'研究笔记/素材' in l) or (u'lean/' in l) or (u'.tex' in l and i < 40):
            src.append((i + 1, l[:110]))
        if len(src) >= 3:
            break
    print(u'=== %s  %s' % (nid, os.path.basename(p)))
    print(u'  bytes=%d lines=%d cr=%d math=%d heads=%d mtime=%s' % (
        len(raw), len(ls) - 1, raw.count(chr(13).encode()), math, len(hs),
        time.strftime('%m-%d %H:%M', time.localtime(os.path.getmtime(p)))))
    print(u'  first head=%r  last head line=%d %r' % (ls[hs[0] - 1][:50], hs[-1], ls[hs[-1] - 1][:50]))
    print(u'  hdr=%s sep=%s' % (hdr, sep))
    for ln, s in src:
        print(u'  src line %d: %s' % (ln, s))
