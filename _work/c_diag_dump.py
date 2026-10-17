# -*- coding: utf-8 -*-
import io, json, collections
rows = [json.loads(l) for l in io.open('_work/_diag_sites.jsonl', encoding='utf-8')]
by = collections.OrderedDict()
for r in rows:
    by.setdefault(r['file'][:3], []).append(r)
for f, rs in by.items():
    print('== %s 枚=%d' % (f, len(rs)))
    for r in rs:
        print('   L%-4d tok=%-10s err=%-40s body=%s' % (
            r['line'], str(r['tok']), str(r['errClass'])[:40], r['body'][:70]))
