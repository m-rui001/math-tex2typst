# -*- coding: utf-8 -*-
# 收尾对口径：笔记逐字登记的行号 vs other_cover 的 covered
import io, os, re, sys, collections
sys.stdout.reconfigure(encoding='utf-8')
sys.path.insert(0, '.tools')

rows = []
for line in io.open('.tools/other_queue.txt', encoding='utf-8'):
    m = re.match(r'^\s*(\d+)\s+(\S+)\s+(\d+)', line)
    if m:
        rows.append(int(m.group(1)))
ledger = set(rows)

pat = re.compile(u'其他队列第\\s*(\\d{1,3})\\s*行号')
byrow = collections.defaultdict(set)
notes = [f for f in os.listdir(u'研究笔记') if re.match(r'^D\d+-.+\.md$', f)]
for f in notes:
    txt = io.open(os.path.join(u'研究笔记', f), encoding='utf-8', errors='replace').read()
    head = txt
    for n in pat.findall(head):
        byrow[int(n)].add(f)

reg = set(byrow)
print('queue_rows', len(rows))
print('notes_scanned', len(notes))
print('registered_rows', len(reg))
print('bad_row(not in frozen ledger)', len(reg - ledger))
cross = {r: v for r, v in byrow.items() if len(v) > 1}
same = 0
for f in notes:
    txt = io.open(os.path.join(u'研究笔记', f), encoding='utf-8', errors='replace').read()
    if len(pat.findall(txt)) > 1:
        same += 1
print('cross_note_dup', len(cross), sorted(cross)[:8])
print('same_note_repeated_notes', same)
print('rows_without_any_note', sorted(ledger - reg))
