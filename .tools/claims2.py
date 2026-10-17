# -*- coding: utf-8 -*-
# 笔记认领：在每篇笔记前 2500 字符内出现的队列目录词干即视为其自报对象；据此找无主队列行。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
stems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
claim = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    key = os.path.basename(p).split(u'-')[0]
    head = io.open(p, encoding='utf-8', errors='replace').read()[:2500]
    for i, s in enumerate(stems):
        if s and s in head.replace('\\', '/'):
            claim.setdefault(i + 1, []).append(key)
free = [i + 1 for i in range(len(queue)) if (i + 1) not in claim]
multi = {k: v for k, v in claim.items() if len(v) > 1}
out = io.open('.tools/claims2.txt', 'w', encoding='utf-8')
out.write('claimed=%d unclaimed=%d multi=%d\n\nUNCLAIMED\n' % (len(claim), len(free), len(multi)))
for ln in free:
    out.write('L%-4d %s\n' % (ln, qdirs[ln - 1][:78]))
out.write('\nMULTI\n')
for k in sorted(multi):
    out.write('L%-4d %-45s %s\n' % (k, qdirs[k - 1][:45], ','.join(sorted(multi[k]))))
out.close()
print('claimed=%d unclaimed=%d multi=%d' % (len(claim), len(free), len(multi)))
