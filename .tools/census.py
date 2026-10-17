# -*- coding: utf-8 -*-
# 登记普查：按 lean_queue 162 行逐行检查是否存在笔记同时载明完整目录名与该行号。
import io, glob, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
post = re.compile(u'\u961f\u5217[^\n]{0,8}?\u884c\u53f7?[^0-9\n]{0,4}(\\d{1,3})')
pre = re.compile(u'\u961f\u5217[^0-9\n]{0,6}(\\d{1,3})[^0-9\n]{0,2}\u884c')


def norm(s):
    s = s.lower()
    s = re.sub(r'[^a-z0-9 ]+', ' ', s)
    return re.sub(r'\s+', ' ', s).strip()

notes = {}
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md'):
    notes[os.path.basename(p)] = io.open(p, encoding='utf-8', errors='replace').read()

qdirs = [x.split('/')[0] for x in queue]
qstems = [re.sub(r'-September-\d+-20\d\d$', '', d) for d in qdirs]
head = {b: t[:6000] for b, t in notes.items()}
both = d_only = q_only = nei = 0
missing = []
for i in range(len(queue)):
    hit_b = hit_d = hit_q = False
    for b in notes:
        t = notes[b]
        n = ({int(m) for m in post.findall(head[b])}
             | {int(m) for m in pre.findall(head[b])})
        has_d = qdirs[i] in t
        has_q = (i + 1) in n
        if has_d:
            hit_d = True
        if has_q:
            hit_q = True
        if has_d and has_q:
            hit_b = True
    if hit_b:
        both += 1
    elif hit_d or hit_q:
        if hit_d:
            d_only += 1
        else:
            q_only += 1
        missing.append((i + 1, qstems[i][:44], 'dir' if hit_d else 'q'))
    else:
        nei += 1
        missing.append((i + 1, qstems[i][:44], 'neither'))
out = io.open('.tools/census.txt', 'w', encoding='utf-8')
for m in missing:
    out.write('L%-4d %-45s %s\n' % m)
out.write('both=%d dir_only=%d q_only=%d neither=%d total=%d\n' % (both, d_only, q_only, nei, len(queue)))
out.close()
print('both=%d dir_only=%d q_only=%d neither=%d' % (both, d_only, q_only, nei))
