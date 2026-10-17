# -*- coding: utf-8 -*-
import io, os, re, sys, glob, collections
sys.stdout.reconfigure(encoding='utf-8')
PAT = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*[A-Za-z0-9])')
for k in ('D289', 'D305', 'D318', 'D385', 'D447', 'D451', 'D471', 'D476', 'D207', 'D210'):
    hits = glob.glob('研究笔记/%s-*.md' % k)
    if not hits:
        print(k, 'NOFILE'); continue
    p = hits[0]
    head = io.open(p, encoding='utf-8', errors='replace').read(20000)
    c = collections.Counter(PAT.findall(head))
    print(k, '|', os.path.basename(p)[:44])
    for d, n in c.most_common(3):
        print('    %-96s x%d exists=%s' % (d[:96], n, os.path.isdir('preprints/' + d)))
