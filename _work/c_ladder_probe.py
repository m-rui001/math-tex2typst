# -*- coding: utf-8 -*-
"""梯子凭据普查：`cX`／`bX`／`fX` 这类「前缀+大写字母」的简写，素材里到底有没有定义？
有的话它展开成什么形？据此判「全库约定」能不能当凭据用（规格 §3 的 AMS 字体梯子条款）。
只读。"""
import io, json, re, collections

DEFS = json.load(io.open('_work/macro_defs.json', encoding='utf-8'))
LAD = re.compile(u'^([bfcg])([A-Z])$')
witness = collections.defaultdict(collections.Counter)   # (prefix,letter) -> Counter(展开体)
for cid, d in DEFS.items():
    for nm, body in d.items():
        m = LAD.match(nm.lstrip(u'\\'))
        if m:
            witness[m.group(0)][body.strip()] += 1

rows = [json.loads(l) for l in io.open('_work/_c_sites.jsonl', encoding='utf-8')]
need = collections.Counter()
for r in rows:
    if r['tok']:
        need[r['tok'].lstrip(u'\\')] += 1
print('== 无凭据站点里属梯子形的：')
for nm, n in sorted(need.items(), key=lambda e: -e[1]):
    m = LAD.match(nm)
    if not m:
        continue
    w = witness.get(nm)
    print('  \\%-6s 站点=%-3d 全库同名凭据=%s' % (nm, n, dict(w) if w else '无'))
print('== 全库 cA..cZ 凭据样本（前缀 c）：')
for nm in sorted(k for k in witness if k.startswith(u'c')):
    print('  %s -> %s' % (nm, dict(witness[nm])))
