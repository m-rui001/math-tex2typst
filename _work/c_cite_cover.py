# -*- coding: utf-8 -*-
import io, json, os, re, glob
plan = json.load(io.open('_work/cited_plan.json', encoding='utf-8'))
print('plan 类型=%s' % type(plan).__name__)
# plan: 常见形 {cid: [dnote...]} 或 [{c,d}]；两种都试
pairs = []
if isinstance(plan, dict):
    for k, v in plan.items():
        if isinstance(v, list):
            for d in v:
                pairs.append((k, d if isinstance(d, str) else d.get('d') or d.get('note')))
        elif isinstance(v, dict):
            for d in v:
                pairs.append((k, d))
elif isinstance(plan, list):
    for r in plan:
        pairs.append((r.get('c') or r.get('cid'), r.get('d') or r.get('dn')))
cs = sorted(set(c for c, d in pairs if c))
ds = sorted(set(d for c, d in pairs if d))
print('对照 pairs=%d C=%d D=%d' % (len(pairs), len(cs), len(ds)))
written = set()
for p in glob.glob(u'被引笔记/C*-*.md'):
    m = re.match(r'C\d\d', os.path.basename(p))
    written.add(m.group(0))
print('已写 C=%d' % len(written))
nopair = sorted(written - set(cs))
print('已写但计划里零引用 =', nopair)
print('计划有但未写 =', sorted(set(cs) - written))
# 盘面核验：D 稿里是否真有该 C 稿的对照行
hit = set()
for d in ds:
    p = os.path.join(u'研究笔记', d + u'-*.md')
    fs = glob.glob(p)
    if not fs:
        print('  无 D 稿：', d); continue
    t = io.open(fs[0], encoding='utf-8').read()
    for m in re.finditer(r'C\d\d', t):
        hit.add(m.group(0))
print('D 稿正文实际出现过的 C 号枚数=%d' % len(hit))
print('已写且未被任何 D 稿点名 =', sorted(written - hit))
