# -*- coding: utf-8 -*-
"""Viewer for _work/dm_rows.json: prints per occurrence the raw span, provenance
ribbon, each '$' inside the body with +-30 chars, and the host line."""
import io, json, sys
sys.stdout.reconfigure(encoding='utf-8')

D = chr(36)
rows = json.load(io.open('E:/math/_work/dm_rows.json', encoding='utf-8'))
lo = int(sys.argv[1]); hi = int(sys.argv[2])
only = sys.argv[3] if len(sys.argv) > 3 else None
for r in rows:
    if not (lo <= r['i'] < hi):
        continue
    if only == 'repro0' and r['repro'] != 0:
        continue
    if only == 'repro1' and r['repro'] == 0:
        continue
    print('---- #%d %s L%d kind=%s repro=%d dollars=%d'
          % (r['i'], r['file'].split('-')[0], r['line'], r['kind'], r['repro'], len(r['dollars'])))
    if r['raw'] is not None:
        print('  RAW : ' + json.dumps(r['raw'], ensure_ascii=False)[:400])
        print('  PROV: ' + json.dumps(r['prov'], ensure_ascii=False)[:400])
        for d in r['dollars']:
            print('   $ off=%d p=%s  ctx=[%s|%s]' % (d['off'], d['p'],
                  json.dumps(d['before'], ensure_ascii=False)[1:-1],
                  json.dumps(d['after'], ensure_ascii=False)[1:-1]))
    else:
        print('  (not replayed) BODY: ' + json.dumps(r['body'], ensure_ascii=False)[:300])
    lt = r['lineText'] or ''
    print('  HOST: ' + (lt[:600] + ('...' if len(lt) > 600 else '')))
    print()
