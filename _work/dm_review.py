# -*- coding: utf-8 -*-
"""Compact reviewer dump for the 105 dollar-family sites: for each site the raw
context of every interior '$' plus the corrected-grammar verdict."""
import io, json, sys
sys.stdout.reconfigure(encoding='utf-8')

D = chr(36)
BT = chr(96)
recs = json.load(io.open('E:/math/_work/dm_triage.json', encoding='utf-8'))
W = int(sys.argv[1]) if len(sys.argv) > 1 else 60
for rec in recs:
    if rec.get('hit') == 'NOT-REPLAYED':
        print('#%d %s L%d NOT-REPLAYED' % (rec['i'], rec['file'].split('-')[0], rec['line']))
        continue
    surv = [x for x in rec['still'] if x['dollar'] > 0]
    print('#%d %s L%d kind=%s interior=%d survives=%d' % (
        rec['i'], rec['file'].split('-')[0], rec['line'], rec['kind'],
        len(rec['interior']), len(surv)))
    for d in rec['interior']:
        ctx = d['ctx']
        i = ctx.find(D)
        seg = ctx[max(0, i - W):i + W]
        print('   $@%d prov=%s  ...%s...' % (d['raw'], d['prov'], seg.replace('\n', '\\n')))
    # what the corrected grammar does with the region
    for x in rec['still']:
        if x['dollar'] > 0:
            print('   KEPT span L%d kind=%s body=%s' % (x['line'], x['kind'],
                  json.dumps(x['body'][:110], ensure_ascii=False)))
    if not surv:
        print('   KILLED by corrected mask')
    print()
