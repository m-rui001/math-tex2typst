# -*- coding: utf-8 -*-
# Roll up _work/exec_order_apply_log.txt into a per-note table (read-only on notes).
import io, re, json, collections

t = io.open(r'E:\math\_work\exec_order_apply_log.txt', encoding='utf-8').read().split('\n')
sites = json.load(io.open(r'E:\math\_work\order_sites.json', encoding='utf-8'))
nsites = collections.Counter(s['note'] for s in sites)

# occurrences replaced per note, straight from the "hit" lines
nocc = collections.Counter()
for l in t:
    m = re.match(r'^   hit (D\d+):\d+ ', l)
    if m:
        nocc[m.group(1)] += 1

rows = []
cur = None
for l in t:
    m = re.match(r'^== (D\d+)\s+(.+?)\s+size=(\d+) lines=(\d+) CR=(\d+)', l)
    if m:
        cur = [m.group(1), m.group(2), int(m.group(3)), int(m.group(4))]
        continue
    m = re.match(r'^   edited_lines=(\d+) groups=(\d+) bytes (\d+) -> (\d+) \(delta ([+-]\d+)\) parity_ok=(\w+)', l)
    if m and cur:
        rows.append(dict(note=cur[0], name=cur[1], lines=cur[3], before=int(m.group(3)), after=int(m.group(4)),
                         delta=m.group(5), groups=int(m.group(2)), edited_lines=int(m.group(1)), parity=m.group(6)))
        cur = None

out = ['note     sites occ groups ed_lines before    after   delta  lines parity  file']
for r in sorted(rows, key=lambda x: int(x['note'][1:])):
    out.append('%-8s %4d %3d %5d %7d %9d %9d %7s %6d %-6s %s'
               % (r['note'], nsites[r['note']], nocc[r['note']], r['groups'], r['edited_lines'],
                  r['before'], r['after'], r['delta'], r['lines'], r['parity'], r['name']))
out.append('TOTAL notes=%d  declared_sites=%d  occurrences_replaced=%d  groups=%d  sum_delta=%+d'
           % (len(rows), sum(nsites[r['note']] for r in rows), sum(nocc.values()),
              sum(r['groups'] for r in rows), sum(int(r['delta']) for r in rows)))
out.append('CR before/after = 0 on every note (a note with CR!=0 is refused, not rewritten)')
io.open(r'E:\math\_work\orderleg_bytes_table.txt', 'w', encoding='utf-8').write('\n'.join(out) + '\n')
print('rows=%d occ=%d' % (len(rows), sum(nocc.values())))
