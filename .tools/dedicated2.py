# -*- coding: utf-8 -*-
# 队列行的"专门笔记"判定：笔记开头 3000 字符内出现该论文的规整英文题名、或目录词干。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
stems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]


def norm(s):
    return re.sub(r'[^a-z0-9]', '', s.lower())

titles = [norm(s.replace('-', ' ')) for s in stems]
decl = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    k = os.path.basename(p).split(u'-')[0]
    raw = io.open(p, encoding='utf-8', errors='replace').read()
    head_n = norm(raw[:3000])
    for i in range(len(queue)):
        if titles[i] and titles[i] in head_n:
            decl.setdefault(i + 1, []).append(k)
none = [i + 1 for i in range(len(queue)) if (i + 1) not in decl]
many = {k: v for k, v in decl.items() if len(v) > 1}
out = io.open('.tools/dedicated2.txt', 'w', encoding='utf-8')
out.write('lines-with-dedicated=%d missing=%d shared=%d\n\nMISSING\n' % (len(decl), len(none), len(many)))
for ln in none:
    out.write('L%-4d %s\n' % (ln, qdirs[ln - 1][:82]))
out.write('\nSHARED\n')
for k in sorted(many):
    out.write('L%-4d %-42s %s\n' % (k, qdirs[k - 1][:42], ','.join(sorted(many[k]))))
out.close()
print('dedicated=%d missing=%d shared=%d' % (len(decl), len(none), len(many)))
