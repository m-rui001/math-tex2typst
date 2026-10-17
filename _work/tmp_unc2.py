# -*- coding: utf-8 -*-
import io, os, re, glob
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-()]*)')
rows = []
for l in io.open('.tools/other_queue.txt', encoding='utf-8').read().split('\n'):
    if l.strip():
        p = l.split()
        rows.append((p[0], p[1], int(p[2])))
qdir = dict((r[1], r[0]) for r in rows)
for i, l in enumerate(io.open('.tools/lean_queue.txt', encoding='utf-8').read().split('\n')):
    s = l.strip()
    if s:
        qdir.setdefault(re.sub(r'^L\d+-', '', s).split('/')[0], 'L' + str(i + 1))
covered = set()
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/*.md'):
    t = io.open(p, encoding='utf-8', errors='replace').read()
    for m in srcpat.findall(t):
        if m in qdir:
            covered.add(qdir[m])
            break
unc = [r for r in rows if r[0] not in covered]
unc.sort(key=lambda x: -int(x[0]))
print('uncovered', len(unc))
for r in unc:
    print(r[0], r[2], r[1])
