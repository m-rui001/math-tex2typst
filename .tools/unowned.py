# -*- coding: utf-8 -*-
# 对 objects.txt 的 UNCLAIMED 行：列出提及该词干的笔记，并打印笔记标题与首行，供人工判定归属。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
stems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
txt = io.open('.tools/objects.txt', encoding='utf-8').read().split('\n')
free = [int(re.match(r'L(\d+)', x).group(1)) for x in txt[txt.index('UNCLAIMED') + 1:]
        if re.match(r'^L\d+ ', x)]
notes = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    k = os.path.basename(p).split(u'-')[0]
    notes[k] = io.open(p, encoding='utf-8', errors='replace').read()
out = io.open('.tools/unowned.txt', 'w', encoding='utf-8')
for ln in free:
    s = stems[ln - 1]
    who = sorted((notes[k].count(s), k) for k in notes if s and notes[k].count(s))
    out.write(u'=== L%d | %s | mentions=%s\n' % (ln, s[:60], u','.join(u'%s x%d' % (k, c) for c, k in who[-4:]) or u'NONE'))
    for c, k in who[-3:]:
        head = [l.strip() for l in notes[k].split('\n') if l.strip()][:3]
        out.write(u'    %s: %s\n' % (k, u' / '.join(head)[:260]))
out.close()
print('free=%d' % len(free))
