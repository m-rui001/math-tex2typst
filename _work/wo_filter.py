# -*- coding: utf-8 -*-
# Filter the harvested workorders.tsv down to rows whose fix is machine-checkable:
# print category counts and dump the ORDER rows that carry an explicit fix string.
import io, os, csv, collections

B = chr(92)
P = os.path.join('E:' + B + B, 'math', '_work', 'workorders.tsv')
rows = list(csv.reader(io.open(P, encoding='utf-8', errors='replace'), delimiter='\t'))
head, body = rows[0], rows[1:]
out = ['cols=%d rows=%d' % (len(head), len(body)), 'head=' + '|'.join(head)]
for i, col in enumerate(['cat', 'kind', 'fam', 'verified']):
    c = head.index(col)
    cnt = collections.Counter(r[c] for r in body if len(r) == len(head))
    out.append('-- %s (%d distinct): %s' % (col, len(cnt), ', '.join('%s=%d' % (k or '-', v) for k, v in cnt.most_common(18))))
c_fix = head.index('fix')
c_ver = head.index('verified')
c_cat = head.index('cat')
withfix = [r for r in body if len(r) == len(head) and r[c_fix].strip()]
out.append('rows_with_nonempty_fix=%d' % len(withfix))
out.append('fix_by_cat=' + ', '.join('%s=%d' % (k or '-', v) for k, v in collections.Counter(r[c_cat] for r in withfix).most_common(20)))
io.open(os.path.join('E:' + B + B, 'math', '_work', 'wo_filter.txt'), 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('ok')
