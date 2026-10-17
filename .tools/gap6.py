# -*- coding: utf-8 -*-
# 对没有笔记完整引用目录串的队列行，列出题名匹配的候选笔记及其自身的取材声明。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
qstems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]


def norm(s):
    s = s.lower()
    s = re.sub(r'[^a-z0-9 ]+', ' ', s)
    return re.sub(r'\s+', ' ', s).strip()

qtitles = [norm(s.replace('-', ' ')) for s in qstems]
notes = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    notes[os.path.basename(p)] = io.open(p, encoding='utf-8', errors='replace').read()
pn = {b: norm(t) for b, t in notes.items()}
dpat = re.compile(r'[A-Za-z0-9][A-Za-z0-9._\-]{8,}')
for ln in [85, 98, 110, 116, 121, 146]:
    i = ln - 1
    cand = [b for b in notes if qtitles[i] in pn[b]]
    print('=== L%d %s' % (ln, qstems[i][:60]))
    print('    title-cands: %s' % ','.join(x.split(u'-')[0] for x in cand) or 'NONE')
    for b in cand:
        t = notes[b]
        own = sorted({m for m in dpat.findall(t[:4000]) if m.startswith(qstems[i][:20])})
        print('    %s cites=%s' % (b.split(u'-')[0], own[:3]))
        for l in t[:6000].split('\n'):
            if u'\u961f\u5217' in l or u'preprints' in l:
                print('        %s' % l.strip()[:150])
