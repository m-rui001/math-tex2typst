# -*- coding: utf-8 -*-
u"""主线2 的 §0 双登记机械补齐。

写手偶尔会在 §0 用自己话复述取材，却不落那两条逐字串，`other_cover` 就不给这行号归属，
covered 少一格而闸门不报 defect。这里只做一个动作：把缺的逐字行插进第 0 节开头，
绝不删除、改写或重排任何既有文字。默认干跑，加 --apply 才写盘。
"""
import io
import os
import re
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DISPATCH = os.path.join(BASE, '.tools', 'dispatched.txt')
REG = re.compile(u'其他队列第\\s*(\\d+)\\s*行号')
LIMIT = 5000

notes = {}
for d in os.listdir(BASE):
    p = os.path.join(BASE, d)
    if os.path.isdir(p):
        n = len([x for x in os.listdir(p) if re.match(r'D\d+-.+\.md$', x)])
        if n:
            notes[d] = n
ROOT = os.path.join(BASE, max(notes, key=notes.get))

rows = {}
for line in io.open(DISPATCH, encoding='utf-8').read().split('\n'):
    parts = line.split('\t')
    if len(parts) == 3 and re.match(r'D\d+$', parts[0]):
        rows[parts[0]] = (parts[1], parts[2])

ids = [a for a in sys.argv[1:] if a.startswith('D')] or sorted(rows)
APPLY = '--apply' in sys.argv
fixed = 0
for k in ids:
    if k not in rows:
        print(k, 'NOT-TAKEN')
        continue
    row, d = rows[k]
    hits = [x for x in os.listdir(ROOT) if x.startswith(k + '-') and x.endswith('.md')]
    if not hits:
        print(k, 'NOFILE')
        continue
    p = os.path.join(ROOT, hits[0])
    t = io.open(p, encoding='utf-8').read()
    head = t[:LIMIT]
    dir_reg = ('preprints/' + d) in head
    row_reg = bool([m for m in REG.finditer(head) if m.group(1) == str(int(row))])
    if dir_reg and row_reg:
        continue
    add = []
    if not dir_reg:
        add.append('preprints/' + d)
    if not row_reg:
        add.append(u'其他队列第 %s 行号' % row)
    m = re.search(u'(?m)^##+ .*?\\n', t)
    at = m.end() if m else (t.index('\n') + 1 if '\n' in t else len(t))
    new = t[:at] + '\n' + '\n'.join(add) + '\n' + t[at:]
    ok = ('preprints/' + d) in new[:LIMIT + 200] and bool(REG.search(new[:LIMIT + 200]))
    print(k, 'add=%d' % len(add), 'offset=%d' % at, 'recheck=%s' % (ok and 'OK' or 'OVERFLOW'),
          'size=%d->%d' % (len(t.encode('utf-8')), len(new.encode('utf-8'))))
    if not ok:
        print(k, 'REFUSED: insertion point beyond first 5,000 chars')
        continue
    if APPLY:
        io.open(p, 'w', encoding='utf-8', newline='\n').write(new)
        fixed += 1
print('%s pending=%d applied=%d' % (ROOT and 'notes-root', len(ids), fixed if APPLY else 0))
