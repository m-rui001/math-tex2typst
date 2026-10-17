# -*- coding: utf-8 -*-
r"""通用素材取证：`python _work/needle.py <cid|Cid> <needle> [<needle> ...] [--raw]`。
cid 从 `_work/preamble_tables.json` 取素材目录（`--raw` 时直接把第二个参数当目录名），
逐 .tex/.lean 行匹配（跳过 typst 产物），打印 文件名:行号＋原文前 160 字，最多 24 行。
"""
import io
import json
import os
import sys

B = chr(92)
args = [a for a in sys.argv[1:] if a != u'--raw']
raw = u'--raw' in sys.argv
if len(args) < 2:
    print(__doc__)
    sys.exit(1)
key, pats = args[0], args[1:]
if raw:
    root = os.path.join(u'preprints', key)
else:
    T = json.load(io.open(u'_work/preamble_tables.json', encoding='utf-8'))
    v = T.get(key)
    if not v:
        print(u'台账无此号: %s' % key)
        sys.exit(1)
    root = os.path.join(u'preprints', v[u'dir'])
    print(u'目录 %s' % v[u'dir'])

n = 0
for dirpath, dirs, files in os.walk(root):
    if u'typst' in dirpath:
        continue
    for fn in sorted(files):
        if not fn.endswith((u'.tex', u'.lean')):
            continue
        p = os.path.join(dirpath, fn)
        try:
            ls = io.open(p, encoding='utf-8', errors='replace').read().split(u'\n')
        except Exception:
            continue
        for i, l in enumerate(ls, 1):
            if all(s in l for s in pats):
                print(u'%s:%d  %s' % (fn, i, l.strip()[:160]))
                n += 1
                if n >= 24:
                    sys.exit(0)
