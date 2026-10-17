# -*- coding: utf-8 -*-
# 对指定队列行，统计每篇笔记对该目录名（含去日期后缀的词干）的全文提及次数。
import io, glob, os, re, sys

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
notes = {}
titles = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    b = os.path.basename(p)
    notes[b] = io.open(p, encoding='utf-8', errors='replace').read()
    titles[b] = notes[b].split('\n')[0][:64]
for ln in [int(x) for x in sys.argv[1:]]:
    d = qdirs[ln - 1]
    stem = re.sub(r'-September-\d+-20\d\d$', '', d)
    first = stem.split('-')[0] + '-' + (stem.split('-')[1] if len(stem.split('-')) > 1 else '')
    hits = []
    for b, t in notes.items():
        c = t.count(stem)
        if c:
            hits.append((c, b.split(u'-')[0]))
        c2 = t.count(first)
        if c2 and (c, b.split(u'-')[0]) not in hits:
            hits.append((-c2, b.split(u'-')[0]))
    hits.sort(reverse=True)
    print('L%d %s' % (ln, stem[:58]))
    for c, k in hits[:5]:
        print('    %s x%d  %s' % (k, c, titles[[b for b in titles if b.startswith(k + u'-')][0]].encode('unicode_escape')[:90]))
    if not hits:
        print('    NOHIT')
