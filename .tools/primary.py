# -*- coding: utf-8 -*-
# 每篇笔记的主对象：正文首个命中队列的 preprints 目录；无目录则退回头部规整题名匹配。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]


def norm(s):
    return re.sub(r'[^a-z0-9]', '', s.lower())

stems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
stem2line = {}
for i, s in enumerate(stems):
    stem2line.setdefault(s, []).append(i + 1)
titles = [norm(s.replace('-', ' ')) for s in stems]
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
owner = {}
for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    k = os.path.basename(p).split(u'-')[0]
    t = io.open(p, encoding='utf-8', errors='replace').read()
    ln = None
    for m in srcpat.findall(t):
        hit = stem2line.get(re.sub(r'-September-\d+-20\d\d$', '', m), [])
        if len(hit) == 1:
            ln = hit[0]
            break
    if ln is None:
        hn = norm(t[:3000])
        cands = [i + 1 for i in range(len(queue)) if titles[i] and titles[i] in hn]
        ln = cands[0] if len(cands) == 1 else None
    owner[k] = ln
byline = {}
for k, ln in owner.items():
    if ln:
        byline.setdefault(ln, []).append(k)
nodir = sorted(k for k in owner if owner[k] is None)
free = [i + 1 for i in range(len(queue)) if i + 1 not in byline]
out = io.open('.tools/primary.txt', 'w', encoding='utf-8')
out.write('notes=%d owners=%d unowned-notes=%d queue-lines-without-note=%d\n\n'
          % (len(owner), len(byline), len(nodir), len(free)))
out.write('NOTES-WITHOUT-PRIMARY\n%s\n\n' % ','.join(nodir))
out.write('QUEUE-LINES-WITHOUT-NOTE\n')
for ln in free:
    out.write('L%-4d %s\n' % (ln, qdirs[ln - 1][:84]))
out.write('\nSHARED\n')
for ln in sorted(byline):
    if len(byline[ln]) > 1:
        out.write('L%-4d %-42s %s\n' % (ln, qdirs[ln - 1][:42], ','.join(sorted(byline[ln]))))
out.close()
print('notes=%d owners=%d no-primary=%d lines-without-note=%d' % (len(owner), len(byline), len(nodir), len(free)))
