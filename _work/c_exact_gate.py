# -*- coding: utf-8 -*-
# 只读：同名宏的「全库精确凭据」够不够格当一条规则——同名、normalize 后逐字同形、见证篇数 ≥3。
# 再和今天普查的活站点求交，看这条规则今天真能吃掉几枚（本地有定义的一律先让本地，这里只查本篇没定义的）。
import io, re, sys, json, collections

sys.stdout.reconfigure(encoding='utf-8')
src = io.open('_work/c_macro_fix.py', encoding='utf-8').read()
head = src.split(u'\ncid = sys.argv[1]')[0]
ns = {'__name__': 'c_macro_fix_head'}
exec(compile(head, '_work/c_macro_fix.py', 'exec'), ns)
DEFS, normalize = ns['DEFS'], ns['normalize']

MIN = 3
wit = collections.defaultdict(lambda: collections.defaultdict(set))
for cid, defs in DEFS.items():
    for nm, body in defs.items():
        d, ok = normalize(body, defs)
        if ok:
            wit[nm][d.replace(u'\x00', u'~')].add(cid)
uniq = {nm: (d, sorted(ids)) for nm, byd in wit.items() if len(byd) == 1
        for d, ids in byd.items() if len(ids) >= MIN}
print('全库同名唯一形且 ≥%d 篇的名字：%d 枚' % (MIN, len(uniq)))

live = collections.defaultdict(set)
for l in io.open('_work/_c_sites.jsonl', encoding='utf-8'):
    r = json.loads(l)
    if r.get(u'tok'):
        live[r[u'file'].split(u'-')[0]].add(r[u'tok'][1:])

hit = 0
for cid in sorted(live):
    defs = DEFS.get(cid, {})
    fire = sorted(n for n in live[cid] if n not in defs and n in uniq)
    if fire:
        hit += len(fire)
        print('   %s 可吃 %s' % (cid, u' '.join(
            u'\\%s→%s（%d 篇）' % (n, uniq[n][0], len(uniq[n][1])) for n in fire)))
print('活站点里这条规则能覆盖的名字枚数=%d' % hit)
