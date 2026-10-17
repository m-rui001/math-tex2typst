# -*- coding: utf-8 -*-
import io, json
g = json.load(io.open('_work/katex_macros.json', encoding='utf-8'))
d = json.load(io.open('_work/macro_defs.json', encoding='utf-8'))
BS = chr(92)
for cid in ['C29', 'C33', 'C16', 'C13', 'C17', 'C25', 'C27', 'C32']:
    loc = d.get(cid, {})
    print('== %s 本地凭据枚=%d' % (cid, len(loc)))
    for nm, dv in sorted(loc.items()):
        key = nm if nm.startswith(BS) else BS + nm
        gl = g.get(key)
        if gl is not None and gl != dv:
            print('   遮蔽 %-12s 本地=%r 全局=%r' % (nm, dv, gl))
