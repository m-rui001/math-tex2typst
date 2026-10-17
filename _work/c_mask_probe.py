# -*- coding: utf-8 -*-
# 只读：全局宏表与本篇凭据「同名不同义」的站点清单（这就是普查报成 parse error 的那族）。
import io, json, sys, re, glob
sys.stdout.reconfigure(encoding='utf-8')

DEFS = json.load(io.open('_work/macro_defs.json', encoding='utf-8'))
GLOB = json.load(io.open('_work/katex_macros.json', encoding='utf-8'))
rows = [json.loads(l) for l in io.open('_work/_c_sites.jsonl', encoding='utf-8') if l.strip()]
CS = re.compile(r'\\([A-Za-z]+)(?![A-Za-z])')

seen = {}
for r in rows:
    if r['tok']:
        continue
    cid = r['file'].split('-')[0]
    d = DEFS.get(cid, {})
    for m in CS.finditer(r['body']):
        nm = m.group(1)
        local = d.get(nm)
        gl = GLOB.get('\\' + nm)
        if local is not None and gl is not None:
            seen.setdefault((cid, nm), []).append((r['line'], local, gl['tex'], r['body'][:70]))
for (cid, nm), v in sorted(seen.items()):
    print(cid, '\\' + nm, '本篇=%r 全局=%r 站点=%d' % (v[0][1], v[0][2], len(v)), v[0][3])
print('--- C29/C33 的 red/wt 到底有没有本篇定义')
for cid, nm in (('C29', 'red'), ('C33', 'wt'), ('C29', 'Exc'), ('C13', 'iX')):
    print(cid, nm, repr(DEFS.get(cid, {}).get(nm)), '全局', repr(GLOB.get('\\' + nm, {}).get('tex') if GLOB.get('\\' + nm) else None))
