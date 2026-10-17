# -*- coding: utf-8 -*-
import io, re, sys, glob, os

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8') if l.strip()]
idx = {}
for n, d in enumerate(queue, 1):
    idx.setdefault(d.split('/')[0].lower(), n)

srcpat = re.compile(u'preprints[/\\\\]+([A-Za-z0-9][A-Za-z0-9._-]*)')
HDR = u'| \u7b26\u53f7 |'
for pid in sys.argv[1:]:
    f = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % pid)
    if not f:
        print(pid, 'NOFILE')
        continue
    t = io.open(f[0], encoding='utf-8', errors='replace').read()
    dirs = [d for d in srcpat.findall(t) if d.lower() in idx]
    dl = [n for n in re.findall(u'\u961f\u5217[^\n]{0,8}?\u884c\u53f7[^\d]{0,4}(\d{1,3})', t[:5000])]
    lines = t.split('\n')
    rowsn = 0
    if HDR in t:
        h = max(i for i, l in enumerate(lines) if l.startswith(HDR))
        j = h + 2
        while j < len(lines) and lines[j].startswith('| '):
            rowsn += 1
            j += 1
    print('%s | dir=%s | queue_line=%s | decl=%s | hdr=%d | rows=%d | size=%d' % (
        pid, dirs[0] if dirs else 'NONE', idx[dirs[0].lower()] if dirs else '?',
        ','.join(dl), t.count(HDR), rowsn, len(t.encode('utf-8'))))
