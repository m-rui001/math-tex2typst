# -*- coding: utf-8 -*-
r"""取站在笔记里的上下文：`python _work/note_ctx.py D139:228 D302:59 … [--wide]`。
打印该站行（逐字）与前后各一行（默认 1，`--wide` 各 3 行），并在第一行报该篇的素材目录
（`_work/preamble_tables.json`）。凭据要读素材哪一文件的哪一段，看这一段的引用串就知道。
"""
import glob
import io
import json
import sys

wide = 3 if u'--wide' in sys.argv else 1
tab = json.load(io.open(u'_work/preamble_tables.json', encoding=u'utf-8'))
for arg in [a for a in sys.argv[1:] if u':' in a]:
    cid, ln = arg.split(u':')[0], int(arg.split(u':')[1])
    path = glob.glob(u'研究笔记/' + cid + u'-*.md')[0]
    lines = io.open(path, encoding=u'utf-8').read().split(u'\n')
    dirs = [v.get(u'dir') for k, v in (tab.items() if isinstance(tab, dict) else [])
            if isinstance(v, dict) and k.upper().startswith(cid.upper())]
    print(u'\n=== %s:%d  篇=%s  素材目录=%s ===' % (cid, ln, path.split(u'/')[-1], dirs[:1]))
    for i in range(max(0, ln - 1 - wide), min(len(lines), ln + wide)):
        print(u'%5d %s' % (i + 1, lines[i][:400]))
