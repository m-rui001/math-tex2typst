# -*- coding: utf-8 -*-
"""只读：素材侧审计——INDEX 每一行的「素材目录／主 tex」在盘上到底成不成立。

goal 的第一条腿是「把关键论文爬下来（tex 或 pdf）」，第二条才是写笔记；
`c_index_check.py` 量的是 C 号↔成品档，本工具量的是 C 号↔素材盘面，两把尺各管一头。
判据四条：目录存在、目录里有可读正文（.tex 或 .pdf 至少一类）、INDEX 报的主 tex 真在该目录里、
该号成品笔记的 §0 逐字写着这个素材目录。C52 是规格点名的 PDF-only 豁免：只要它没有 .tex 就不算缺陷。
用法（cwd=E:\\math）：python -X utf8 _work/c_material_audit.py
"""
import glob
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')
ROW = re.compile(r'^\|\s*(C\d{2})\s*\|\s*([^|]*?)\s*\|\s*([^|]*?)\s*\|\s*([^|]*?)\s*\|\s*([^|]*?)\s*\|')
HEAD = re.compile(r'preprints/([A-Za-z0-9_.\-]+)|被引素材[/\\]+([A-Za-z0-9_.\-]+)')

rows = []
for line in io.open(u'被引笔记/INDEX.md', encoding='utf-8'):
    m = ROW.match(line)
    if m:
        rows.append(m.groups())

bad = []
for cid, arxiv, _cited, dircell, maincell in rows:
    d = dircell.strip()
    if not d or d in (u'—', u'-'):
        bad.append('%s 素材目录空格' % cid)
        continue
    path = os.path.join(u'被引素材', d)
    if not os.path.isdir(path):
        bad.append('%s 目录不存在 %s' % (cid, path))
        continue
    texs = [p for p in glob.glob(os.path.join(path, '**', '*.tex'), recursive=True)
            if os.sep + 'typst' + os.sep not in p]
    pdfs = glob.glob(os.path.join(path, '*.pdf'))
    if not texs:
        note = 'PDF-ONLY' if (cid == 'C52' and pdfs) else 'NO-TEX(且无PDF豁免)'
        bad.append('%s %s 目录里 %d 枚 .tex、%d 枚 .pdf ⇒ %s' % (cid, d, len(texs), len(pdfs), note))
        continue
    mt = re.search(r'`?([^`|]+\.tex)`?', maincell)
    main = mt.group(1).strip() if mt else ''
    if main and not any(os.path.basename(p) == main for p in texs):
        bad.append('%s 主 tex %s 不在 %s 目录（实有 %s）' % (cid, main, d, ','.join(sorted({os.path.basename(p) for p in texs})[:6])))
    notes = glob.glob(u'被引笔记/%s-*.md' % cid)
    if len(notes) != 1:
        bad.append('%s 成品档命中 %d 份' % (cid, len(notes)))
        continue
    head = u'\n'.join(io.open(notes[0], encoding='utf-8').read().split(u'\n')[:40])
    if d not in head:
        bad.append('%s 笔记 §0 未逐字写素材目录 %s' % (cid, d))

plan = len(glob.glob(u'被引素材/*'))
print('INDEX 行=%d  被引素材目录=%d  缺陷=%d' % (len(rows), plan, len(bad)))
for b in bad:
    print('   ' + b)
covered = len({os.path.basename(p) for p in glob.glob(u'被引素材/*') if os.path.isdir(p)})
print('目录去重覆盖=%d；未被 INDEX 引用的素材目录=%s' % (
    covered, sorted({os.path.basename(p) for p in glob.glob(u'被引素材/*') if os.path.isdir(p)} -
                    {r[3].strip() for r in rows})))
