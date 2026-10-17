# -*- coding: utf-8 -*-
# 每篇笔记按"队列词干提及次数最多"判定其对象；对象为 0 次或无主队列行即为真正缺口。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
stems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
obj = {}
detail = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    key = os.path.basename(p).split(u'-')[0]
    t = io.open(p, encoding='utf-8', errors='replace').read().replace('\\', '/')
    cnt = []
    for i, s in enumerate(stems):
        if not s:
            continue
        c = t.count(s)
        if c:
            cnt.append((c, len(s), i + 1))
    cnt.sort(reverse=True)
    if cnt:
        obj[key] = cnt[0][2]
        detail[key] = cnt[:3]
by_line = {}
for k, ln in obj.items():
    by_line.setdefault(ln, []).append(k)
free = [i + 1 for i in range(len(queue)) if (i + 1) not in by_line]
multi = {k: v for k, v in by_line.items() if len(v) > 1}
out = io.open('.tools/objects.txt', 'w', encoding='utf-8')
out.write('notes=%d lines-with-owner=%d unclaimed=%d shared=%d\n\nUNCLAIMED\n'
          % (len(obj), len(by_line), len(free), len(multi)))
for ln in free:
    out.write('L%-4d %s\n' % (ln, qdirs[ln - 1][:78]))
out.write('\nSHARED\n')
for k in sorted(multi):
    out.write('L%-4d %-45s %s\n' % (k, qdirs[k - 1][:45], ','.join(sorted(multi[k]))))
out.write('\nNOOBJECT\n')
for k in sorted(set(os.path.basename(x).split(u'-')[0] for x in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')) - set(obj)):
    out.write('%s\n' % k)
out.close()
print('notes-with-object=%d owners=%d unclaimed=%d shared=%d noobject=%d'
      % (len(obj), len(by_line), len(free), len(multi), len(obj) and len(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')) - len(obj)))
