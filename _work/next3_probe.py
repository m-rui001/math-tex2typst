import io, glob, sys, os, time
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
S = chr(167)
B = chr(92)

for nid in ('D84', 'D95', 'D535'):
    c = glob.glob(u'研究笔记/' + nid + u'-*.md')
    p = c[0]
    raw = io.open(p, 'rb').read()
    ls = raw.decode('utf-8').split(NL)
    hs = [i + 1 for i, l in enumerate(ls) if l[:3] == u'## ']
    hdr = [i + 1 for i, l in enumerate(ls) if l.startswith(u'| 符号')]
    sep = [i + 1 for i, l in enumerate(ls) if l.strip() == u'| --- | --- | --- | --- | --- |']
    print('=== %s  %s' % (nid, os.path.basename(p)))
    print('  bytes=%d lines=%d cr=%d mtime=%s' % (len(raw), len(ls) - 1, raw.count(chr(13).encode()),
          time.strftime('%H:%M', time.localtime(os.path.getmtime(p)))))
    print('  heads=%d first=%r' % (len(hs), ls[hs[0] - 1][:60]))
    print('  last head line=%d %r' % (hs[-1], ls[hs[-1] - 1][:60]))
    print('  body hdr(符号)=%s  sep(| --- | x5)=%s' % (hdr, sep))
    tail = ls[-1][:120] if ls[-1] else ls[-2][:120]
    print('  last nonblank line=%r' % [l for l in ls if l.strip()][-1][:100])
