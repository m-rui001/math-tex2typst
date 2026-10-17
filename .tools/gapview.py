# -*- coding: utf-8 -*-
# 对普查缺口行，打印确实引用了该目录的笔记里的登记语句原文。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
gaps = [l.split()[0] for l in io.open('.tools/census.txt', encoding='utf-8').read().split('\n') if re.match(r'^L\d+', l)]
notes = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    notes[os.path.basename(p)] = io.open(p, encoding='utf-8', errors='replace').read()
qdirs = [x.split('/')[0] for x in queue]
out = io.open('.tools/gapview.txt', 'w', encoding='utf-8')
for g in gaps:
    i = int(g[1:]) - 1
    who = [b for b, t in notes.items() if qdirs[i] in t]
    out.write(u'=== %s | %s | notes=%s\n' % (g, qdirs[i][:60],
            u','.join(x.split(u'-')[0] for x in who) or 'NONE'))
    for b in who:
        for l in notes[b][:6000].split('\n'):
            if u'\u961f\u5217' in l or u'lean_queue' in l:
                out.write(u'    %s: %s\n' % (b.split(u'-')[0], l.strip()[:220]))
out.close()
print('gaps=%d' % len(gaps))
