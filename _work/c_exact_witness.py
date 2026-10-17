# -*- coding: utf-8 -*-
# 只读：对剩下几枚无凭据宏名，查「同名宏在其它篇素材 preamble 里出现过没有、展开成什么」。
# 同名且同形才谈得上跨篇凭据；一形多义（或只有一篇）就还是不发明。
import io, re, sys, json, collections

sys.stdout.reconfigure(encoding='utf-8')
src = io.open('_work/c_macro_fix.py', encoding='utf-8').read()
head = src.split(u'\ncid = sys.argv[1]')[0]
ns = {'__name__': 'c_macro_fix_head'}
exec(compile(head, '_work/c_macro_fix.py', 'exec'), ns)
DEFS, normalize = ns['DEFS'], ns['normalize']

for target in sys.argv[1:] or [u'A', u'bc', u'rfdown', u'wt', u'HC', u'D', u'dgraph']:
    hits = {}
    for cid, defs in DEFS.items():
        if target in defs:
            d, ok = normalize(defs[target], defs)
            hits.setdefault((d.replace(u'\x00', u'~'), ok), []).append(cid)
    print(u'\\\\%-10s 有该定义的篇=%d  %s' % (
        target, sum(len(v) for v in hits.values()),
        u' | '.join(u'%s(ok=%d)×%d%s' % (k[0], k[1], len(v),
                    u'[' + u','.join(sorted(v)) + u']' if len(v) <= 4 else u'')
                    for k, v in sorted(hits.items(), key=lambda x: -len(x[1]))[:6])))
