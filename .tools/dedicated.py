# -*- coding: utf-8 -*-
# 判定"专门笔记"：队列词干出现在笔记开头 1500 字符内，视为该笔记自报的对象。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
stems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
own = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    k = os.path.basename(p).split(u'-')[0]
    head = io.open(p, encoding='utf-8', errors='replace').read()[:1500]
    hits = [i + 1 for i, s in enumerate(stems) if s and s in head]
    own[k] = hits
decl = {}
for k, hs in own.items():
    for ln in hs:
        decl.setdefault(ln, []).append(k)
none = [i + 1 for i in range(len(queue)) if (i + 1) not in decl]
many = {k: v for k, v in decl.items() if len(v) > 1}
out = io.open('.tools/dedicated.txt', 'w', encoding='utf-8')
out.write('notes=%d lines-with-dedicated=%d missing=%d shared=%d\n\nMISSING\n'
          % (len(own), len(decl), len(none), len(many)))
for ln in none:
    out.write('L%-4d %s\n' % (ln, qdirs[ln - 1][:80]))
out.write('\nSHARED\n')
for k in sorted(many):
    out.write('L%-4d %-45s %s\n' % (k, qdirs[k - 1][:45], ','.join(sorted(many[k]))))
out.close()
print('notes=%d dedicated=%d missing=%d shared=%d' % (len(own), len(decl), len(none), len(many)))
