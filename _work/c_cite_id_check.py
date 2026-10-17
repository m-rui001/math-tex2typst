# -*- coding: utf-8 -*-
r"""只读：对照行的 arXiv id 与 C 稿自己申报的 id 逐行核，抓「挂错稿」。

行形（citeback 发的）：`- arXiv:<id>，笔记 \`被引笔记/C##-….md\`（英文名）`
C 稿头部与素材目录都带 id，归一化（剥 `math/`、剥 `v\\d+`、下划线还原斜杠）后比对。
用法：python -X utf8 _work/c_cite_id_check.py
"""
import io
import os
import re
import glob

ROW = re.compile(u'- arXiv:([^，]+)，笔记 `被引笔记/([^`]+)`')
IDIN = re.compile(r'([a-z][a-z\-]*/\d{7}(?:v\d+)?|\d{4}\.\d{4,5}(?:v\d+)?)')


def norm(s):
    s = s.strip().lower()
    s = re.sub(r'v\d+$', '', s)
    return s.replace('_', '/')


by_file = {}
for f in glob.glob(u'被引笔记/C*.md'):
    by_file[os.path.basename(f)] = io.open(f, encoding='utf-8').read()

rows = bad = miss = 0
for df in sorted(glob.glob(u'研究笔记/D*.md')):
    text = io.open(df, encoding='utf-8').read()
    note = os.path.basename(df)
    for rid, path in ROW.findall(text):
        rows += 1
        ctext = by_file.get(os.path.basename(path))
        if ctext is None:
            miss += 1
            print(u'缺稿 %s -> %s' % (note, path))
            continue
        head = ctext[:1200] + u'\n' + ctext[-400:]
        ids = set(norm(x) for x in IDIN.findall(head))
        want = norm(rid)
        if want and want not in ids:
            bad += 1
            print(u'挂错 %s 行 id=%s 但 %s 头部 id=%s' % (
                note, want, os.path.basename(path), sorted(ids)[:4]))
print(u'rows=%d 挂错=%d 缺稿=%d C 稿=%d' % (rows, bad, miss, len(by_file)))
