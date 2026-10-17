# -*- coding: utf-8 -*-
"""只读：INDEX 与盘面的一致性（C 号↔文件名一对一、成稿字节＝盘上实测）。

INDEX 是这一条腿的清单：派单领号、回引对照都从它读，所以它的「成稿 N B」必须等于盘上字节，
「待写」必须真的盘上无档。用法：python -X utf8 _work/c_index_check.py
"""
import io
import os
import re
import glob

rows = {}
for ln in io.open(u'被引笔记/INDEX.md', encoding='utf-8').read().split(u'\n'):
    if not ln.startswith(u'| C'):
        continue
    cells = [c.strip() for c in ln.strip(u'|').split(u'|')]
    if len(cells) < 7:
        continue
    rows[cells[0]] = cells

disk = {}
for f in glob.glob(u'被引笔记/C*.md'):
    b = os.path.basename(f)
    cid = re.match(r'(C\d+)', b).group(1)
    disk[cid] = (b, os.path.getsize(f))

bad = []
for cid, cells in sorted(rows.items()):
    link = cells[6]
    m = re.search(r'\(([^)]+\.md)\)', link)
    state = cells[-1]
    if m:
        fname = os.path.basename(m.group(1))
        d = disk.get(cid)
        if d is None:
            bad.append(u'%s INDEX 记档 %s 但盘上无' % (cid, fname))
        elif d[0] != fname:
            bad.append(u'%s 文件名不符 INDEX=%s 盘上=%s' % (cid, fname, d[0]))
        else:
            sm = re.search(r'成稿 (\d+)B', state)
            if sm and int(sm.group(1)) != d[1]:
                bad.append(u'%s 字节不符 INDEX=%s 盘上=%d' % (cid, sm.group(1), d[1]))
    else:
        if cid in disk and u'待写' in state:
            bad.append(u'%s 盘上已有 %d B 但 INDEX 仍记待写' % (cid, disk[cid][1]))

orph = sorted(set(disk) - set(rows))
todo = sorted(c for c, v in rows.items()
              if re.match(r'^C\d+$', c) and not re.search(r'\([^)]*\.md\)', u'|'.join(v)))
print(u'INDEX 行=%d 盘上档=%d 无行孤儿=%s' % (len(rows), len(disk), orph))
print(u'INDEX 未挂档（待写/PDF-only）=%s' % (todo,))
print(u'不一致=%d' % len(bad))
for b in bad:
    print(u'   ' + b)
