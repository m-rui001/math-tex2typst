# Deterministic re-verification of the ORDER rows in _work/workorders.tsv.
# Reads the harvest rows against disk. No judgement, no note writes.
import io, sys, csv, glob, os, re
from collections import defaultdict

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
ARROW = chr(8594)

SRC = u'_work/workorders.tsv'
OUT = u'_work/workorder_exec_queue.txt'
BATCH = u'_work/workorder_batches.txt'
SKIP = set()  # no writer in flight at run time; checked again before any execution batch

rows = list(csv.reader(io.open(SRC, encoding='utf-8', errors='replace'), delimiter=chr(9)))
head = rows[0]
idx = {c: i for i, c in enumerate(head)}
data = [r for r in rows[1:] if len(r) == len(head)]
order = [r for r in data if r[idx['cat']] == 'ORDER']
print('rows', len(data), 'ORDER', len(order))

idre = re.compile(u'^(D\\d+)')
note_cache = {}
def note_path(nid):
    if nid not in note_cache:
        c = glob.glob(u'研究笔记/' + nid + u'-*.md')
        note_cache[nid] = c[0] if c else None
    return note_cache[nid]

status = defaultdict(int)
exec_rows = []
garbled = []
for r in order:
    fld = r[idx['note']]
    m = idre.match(fld)
    nid = m.group(1) if m else fld
    quote = r[idx['quote']]
    fix = r[idx['fix']]
    p = note_path(nid)
    if p is None:
        status['NOFILE'] += 1
        continue
    if nid in SKIP:
        status['SKIP-INFLIGHT'] += 1
        continue
    t = io.open(p, encoding='utf-8', errors='replace').read()
    qhit = t.count(quote) if quote else 0
    fhitt = t.count(fix) if fix else 0
    if ARROW in fix or ARROW in quote:
        status['ARROW-GARBLED'] += 1
        garbled.append((nid, r[idx['sec_line']], r[idx['no']], qhit, fhitt, fix[:80]))
        continue
    if qhit >= 1:
        status['EXEC-CANDIDATE'] += 1
        exec_rows.append((nid, r[idx['sec_line']], r[idx['no']], r[idx['kind']], quote, fix))
    elif fhitt >= 1:
        status['ALREADY-DONE'] += 1
    elif not quote:
        status['EMPTY-QUOTE'] += 1
    else:
        status['NO-VERBATIM'] += 1

print('statuses')
for k in sorted(status, key=lambda x: -status[x]):
    print('  %-18s %d' % (k, status[k]))
notes = defaultdict(int)
for e in exec_rows:
    notes[e[0]] += 1
print('EXEC-CANDIDATE rows', len(exec_rows), 'notes', len(notes))

out = [u'# ORDER 行的盘上复验（脚本判定，零写入）',
       u'# ARROW-GARBLED=harvest 用箭头切期望文本，切点落在正文里，期望形本身残缺，不可机械执行;',
       u'# EXEC-CANDIDATE=申报的逐字原形仍在盘上且期望形没被箭头污染（仍需逐处人核）;',
       u'# NO-VERBATIM=申报原形不在盘上; ALREADY-DONE=只给期望形且期望形已在盘上',
       u'']
for k in sorted(status, key=lambda x: -status[x]):
    out.append(u'%-18s %d' % (k, status[k]))
out.append(u'')
out.append(u'# EXEC-CANDIDATE 逐行')
for nid, sl, no, kind, q, f in exec_rows:
    out.append(u'%s sec=%s no=%s %s' % (nid, sl, no, kind))
    out.append(u'   OLD %s' % q[:120])
    out.append(u'   NEW %s' % f[:120])
out.append(u'')
out.append(u'# ARROW-GARBLED 样本 30 行')
for g in garbled[:30]:
    out.append(u'%s sec=%s no=%s qhit=%d fhit=%d | %s' % g)
io.open(OUT, 'wb').write((NL.join(out) + NL).encode('utf-8'))
print('wrote', OUT, os.path.getsize(OUT))

batches = []
cur, curs = [], 0
for nid in sorted(notes, key=lambda n: (-notes[n], n)):
    n = notes[nid]
    if curs + n > 60 and cur:
        batches.append((list(cur), curs))
        cur, curs = [], 0
    cur.append((nid, n))
    curs += n
if cur:
    batches.append((cur, curs))
bo = [u'# 分批表：每批 <=60 处，同一篇只出现在一批（只含 EXEC-CANDIDATE）']
for i, (items, tot) in enumerate(batches, 1):
    bo.append(u'批 %d: %d 处 / %d 篇 | %s' % (i, tot, len(items), u' '.join(u'%s(%d)' % (a, b) for a, b in items)))
io.open(BATCH, 'wb').write((NL.join(bo) + NL).encode('utf-8'))
print('wrote', BATCH, os.path.getsize(BATCH), 'batches', len(batches))
