# -*- coding: utf-8 -*-
# 为缺笔记的队列行核验 preprints 目录与 build/*.tex 清单，并取 records.txt 里的 Lean 行。
import io, os, re

queue = [l.strip() for l in io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
qdirs = [x.split('/')[0] for x in queue]
rec = io.open(u'.tools/records.txt', encoding='utf-8', errors='replace').read().split('\n')
for ln in [82, 85, 98, 110, 116, 121, 129, 146, 147]:
    d = qdirs[ln - 1]
    b = os.path.join('preprints', d, 'build')
    if not os.path.isdir(b):
        print('L%d MISSING-DIR %s' % (ln, d))
        continue
    tex = []
    for root, _, fs in os.walk(b):
        for f in fs:
            if f.endswith('.tex'):
                tex.append((f, os.path.getsize(os.path.join(root, f))))
    tot = sum(s for _, s in tex)
    key = re.sub(r'[^A-Za-z]', '', d.lower())[:22]
    rl = [r for r in rec if key[:14] and key[:14] in r.lower()]
    print('L%d %s | tex=%d bytes=%d | rec=%s' % (ln, d[:64], len(tex), tot, (rl[0][:120] if rl else 'NONE')))
