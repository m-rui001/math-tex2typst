# -*- coding: utf-8 -*-
# 只读探针：c_macro_fix 的 perr_names 在 C32/C17/C25 上拿到什么。
import io, json, re, sys
sys.stdout.reconfigure(encoding='utf-8')

SITES = '_c_sites.jsonl'
DEFS = json.load(io.open('_work/macro_defs.json', encoding='utf-8'))
SUB_CS = re.compile(u'([_^])\\\\([A-Za-z]+)(?![A-Za-z])')

for cid in ('C32', 'C17', 'C25', 'C33'):
    names = set()
    rows = [json.loads(l) for l in io.open('_work/' + SITES, encoding='utf-8') if l.strip()]
    mine = [r for r in rows if r['file'].startswith(cid + u'-') and not r['tok']]
    defs = DEFS.get(cid, {})
    for r in mine:
        for m in SUB_CS.finditer(r['body']):
            if m.group(2) in defs:
                names.add(m.group(2))
    print(cid, 'perr_rows=%d' % len(mine), 'subs=%s' % sorted(names),
          'defs[wt]=%r' % defs.get('wt'), 'defs[quo]=%r' % defs.get('quo'))
