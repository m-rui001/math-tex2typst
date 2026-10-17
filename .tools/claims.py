# -*- coding: utf-8 -*-
# 队列行的认领情况：笔记正文里出现的 preprints 目录串（全名或去日期后缀词干）与 162 行求交。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
stem2line = {}
for i, d in enumerate(qdirs):
    stem2line.setdefault(re.sub(r'-September-\d+-20\d\d$', '', d), []).append(i + 1)
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
claim = {}
notes = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    b = os.path.basename(p)
    key = b.split(u'-')[0]
    t = io.open(p, encoding='utf-8', errors='replace').read()
    notes[key] = t
    for m in srcpat.findall(t):
        stem = re.sub(r'-September-\d+-20\d\d$', '', m)
        for ln in stem2line.get(stem, []):
            claim.setdefault(ln, set()).add(key)
free = [i + 1 for i in range(len(queue)) if (i + 1) not in claim]
multi = {k: sorted(v) for k, v in claim.items() if len(v) > 1}
out = io.open('.tools/claims.txt', 'w', encoding='utf-8')
out.write('notes=%d claimed=%d unclaimed=%d multi=%d\n\n' % (len(notes), len(claim), len(free), len(multi)))
out.write('UNCLAIMED\n')
for ln in free:
    out.write('L%-4d %s\n' % (ln, qdirs[ln - 1][:70]))
out.write('\nMULTI\n')
for k in sorted(multi):
    out.write('L%-4d %-45s %s\n' % (k, qdirs[k - 1][:45], ','.join(multi[k])))
out.close()
print('notes=%d claimed=%d unclaimed=%d multi=%d' % (len(notes), len(claim), len(free), len(multi)))
