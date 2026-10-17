# -*- coding: utf-8 -*-
# 回引腿的**覆盖率**量具（c_cite_audit2 验的是「plan 名单里的挂上了没」，这里验名单本身全不全）。
# 两步一把尺：①拿 plan['bib_keys'] 的键名扫全部 D 稿，取「出现该键却不在 plan notes 里」的候选；
# ②证据闸——候选那篇 D 稿里要同时出现该 C 的 arXiv id 或题名串才算漏挂。
# 闸是必需的：键名会撞车（实测 `Wilson` 在 D109 是 Du–Guth–Ou–Wang–Wilson–Zhang 那位，不是 C47 那位）。
import io, json, os, sys, glob, re

sys.stdout.reconfigure(encoding='utf-8')
plan = json.load(io.open('_work/cited_plan.json', encoding='utf-8'))
notes_by_cid, keys_by_cid, meta = {}, {}, {}
for r in plan:
    cid = r['cid']
    notes_by_cid[cid] = set(n if isinstance(n, str) else n.get('dn') for n in r['notes'])
    bk = r.get('bib_keys') or {}
    ks = set()
    for v in (bk.values() if isinstance(bk, dict) else []):
        ks.update(v if isinstance(v, list) else [v])
    keys_by_cid[cid] = ks
    meta[cid] = ((r.get('arxiv') or u'').strip(), (r.get('title') or u'').strip())

texts = {}
for p in glob.glob(u'研究笔记/D*.md'):
    texts[os.path.basename(p).split(u'-')[0]] = io.open(p, encoding='utf-8').read()

cand = []
for cid, ks in sorted(keys_by_cid.items()):
    if not ks:
        continue
    rx = re.compile(u'(?<![A-Za-z0-9])(' + u'|'.join(re.escape(k) for k in sorted(ks)) + u')(?![A-Za-z0-9])')
    cand += [(cid, d) for d, t in sorted(texts.items()) if rx.search(t) and d not in notes_by_cid[cid]]

confirmed = []
for cid, d in cand:
    ax, title = meta[cid]
    t = texts[d]
    base = re.sub(r'v\d+$', u'', ax)
    ev = (base and len(base) >= 7 and base in t) or \
         (title and u' '.join(title.split()[:4]) in t)
    if ev:
        confirmed.append((cid, d))

print('D 稿=%d  plan 对子=%d  键名候选=%d  证据确认的漏挂=%d'
      % (len(texts), sum(len(v) for v in notes_by_cid.values()), len(cand), len(confirmed)))
for cid, d in confirmed:
    print(u'   漏挂 %s <- %s' % (cid, d))
