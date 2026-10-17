import io, glob, subprocess, sys
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
S = chr(167)

JOBS = [('D535', u'## 19', u'314')]

def run(cmd, cwd='.'):
    r = subprocess.run(cmd, capture_output=True, text=True, errors='replace', cwd=cwd)
    print('   ', ' '.join(cmd), '->', (r.stdout or '').strip().replace(NL, ' | ')[:300])
    if r.stderr:
        print('    STDERR', r.stderr.strip()[:200])

for nid, mark, r0 in JOBS:
    c = glob.glob(u'研究笔记/' + nid + u'-*.md')
    if not c:
        print(nid, 'NOFILE')
        continue
    p = c[0]
    raw = io.open(p, 'rb').read()
    ls = raw.decode('utf-8', errors='replace').split(NL)
    rs = [i + 1 for i, l in enumerate(ls) if l.startswith(mark)]
    st = [i + 1 for i, l in enumerate(ls) if l[:3] == u'## ']
    print('=== %s bytes=%d lines=%d cr=%d heads=%d region-start=%s first-head-line=%d' % (
        nid, len(raw), raw.count((NL).encode()), raw.count(chr(13).encode()), len(st),
        rs[:1], st[0] if st else 0))
    print('    declared region line %s = %r' % (r0, ls[int(r0) - 1][:80]))
    if not rs:
        print('    NO REGION MARK', mark)
        continue
    run(['python', '.tools/sweep.py', nid])
    run(['python', '.tools/sweep.py', nid])
    run(['python', '_work/gate_one.py', nid])
    run(['python', '_work/region_check.py', nid, r0])
    run(['node', 'newsec_macro.js', nid, r0], '_work')
    run(['python', '_work/fuse_fix.py', '--apply', nid])
    run(['python', '_work/gate_one.py', nid])
    raw2 = io.open(p, 'rb').read()
    print('    post bytes=%d lines=%d cr=%d heads=%d' % (
        len(raw2), raw2.count((NL).encode()), raw2.count(chr(13).encode()),
        raw2.count((NL + u'## ').encode())))
