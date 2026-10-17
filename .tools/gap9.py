# -*- coding: utf-8 -*-
# 对未认领的队列行，列出英文题名逐字出现的笔记，以及这些笔记自报的取材目录。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]


def norm(s):
    s = s.lower()
    s = re.sub(r'[^a-z0-9 ]+', ' ', s)
    return re.sub(r'\s+', ' ', s).strip()

qtitles = [norm(re.sub(r'-September-\d+-20\d\d$', '', d).replace('-', ' ')) for d in qdirs]
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
notes = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    b = os.path.basename(p)
    t = io.open(p, encoding='utf-8', errors='replace').read()
    notes[b.split(u'-')[0]] = (t, norm(t), os.path.getsize(p))

txt = io.open('.tools/claims.txt', encoding='utf-8').read().split('\n')
sec = txt.index('UNCLAIMED') + 1
lines = [int(re.match(r'L(\d+)', x).group(1)) for x in txt[sec:] if re.match(r'^L\d+ ', x)]
for ln in lines:
    i = ln - 1
    cand = [k for k in notes if qtitles[i] and qtitles[i] in notes[k][1]]
    print('=== L%d %s | cands=%s' % (ln, qdirs[i][:58], ','.join(cand) or 'NONE'))
    for k in cand:
        t, _, sz = notes[k]
        own = sorted({re.sub(r'-September-\d+-20\d\d$', '', m) for m in srcpat.findall(t)})
        print('    %s size=%d own=%s' % (k, sz, own[:3]))
