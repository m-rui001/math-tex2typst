# -*- coding: utf-8 -*-
import io, os, re, glob, subprocess

ROOT = r'E:\math'
q = io.open(os.path.join(ROOT, '.tools', 'lean_queue.txt'), encoding='utf-8').read().split('\n')
y = io.open(os.path.join(ROOT, 'lean', 'formalization.yaml'), encoding='utf-8', errors='replace').read().split('\n')

for ln in (74, 77):
    entry = q[ln - 1]
    head = entry.split('/')[0]
    d = os.path.join(ROOT, 'preprints', head)
    if not os.path.isdir(d):
        c = glob.glob(os.path.join(ROOT, 'preprints', head + '*'))
        d = c[0] if c else None
    print('=== queue %d: %s' % (ln, head))
    print('dir exists:', d)
    if d:
        b = os.path.join(d, 'build')
        tot = 0
        rows = []
        for f in glob.glob(os.path.join(b, '**', '*.tex'), recursive=True):
            sz = os.path.getsize(f)
            tot += sz
            rows.append((sz, os.path.relpath(f, b).replace('\\', '/')))
        rows.sort(reverse=True)
        print('tex files=%d total=%d' % (len(rows), tot))
        for sz, r in rows[:12]:
            print('   %7d %s' % (sz, r))
    # yaml: bibliography entry then main_results records
    key = re.sub(r'-', r'[\\s\\-]?', head)[:40]
    hits = [i for i, l in enumerate(y, 1) if head[:38].lower().replace('-', ' ') in l.lower().replace('-', ' ')]
    print('bib-ish hits:', hits[:6])
    seg = [(i, l) for i, l in enumerate(y, 1) if 1280 < i < 1680]
    for i, l in seg:
        if 'id:' in l or 'title:' in l or 'comparator:' in l or 'declaration:' in l or 'path:' in l:
            pass
    # crude: print block containing any of head's words
    words = [w for w in re.split(r'[^A-Za-z]+', head.lower()) if len(w) > 5][:4]
    blocks = []
    cur = []
    for i, l in enumerate(y, 1):
        if not 1280 < i < 1690:
            continue
        if l.strip().startswith('- ') or 'id:' in l:
            if cur:
                blocks.append(cur)
            cur = [(i, l)]
        else:
            cur.append((i, l))
    if cur:
        blocks.append(cur)
    for blk in blocks:
        txt = ' '.join(x[1].lower() for x in blk)
        if all(w in txt for w in words[:2]):
            for i, l in blk:
                print('   Y%d %s' % (i, l[:160]))
