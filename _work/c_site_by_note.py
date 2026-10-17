# -*- coding: utf-8 -*-
# 只读量具：普查站点按稿号分组（代码跨度外的非 KaTeX 控制字），标出在飞那三单。
# 用法（cwd=E:\math）：python -X utf8 _work/c_site_by_note.py
import io, json, sys, collections, re

sys.stdout.reconfigure(encoding='utf-8')
rows = [json.loads(l) for l in io.open('_work/_c_sites.jsonl', encoding='utf-8') if l.strip()]
by = collections.defaultdict(collections.Counter)
for r in rows:
    cid = r['file'].split('-')[0]
    by[cid][r.get('tok') or ('NULL:' + (r.get('errClass') or '')[:26])] += 1
for cid in sorted(by):
    print('%-5s %2d  %s' % (cid, sum(by[cid].values()),
                            ' '.join('%s×%d' % kv for kv in sorted(by[cid].items()))))
print('总站点=%d 命中稿=%d' % (len(rows), len(by)))
