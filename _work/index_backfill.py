# -*- coding: utf-8 -*-
# INDEX.md 由 _work/cited_plan.json ＋ 盘上 C 稿实测生成，不手抄。写手禁读本文件，无并发冲突。
# 用法：python _work/index_backfill.py [--apply]
import io, os, re, sys, glob, json

sys.stdout.reconfigure(encoding='utf-8')
plan = json.load(io.open('_work/cited_plan.json', encoding='utf-8'))
FLOOR = 22000

rows = []
n_done = n_short = n_wait = 0
for p in sorted(plan, key=lambda x: x['cid']):
    hits = glob.glob(u'被引笔记/%s-*.md' % p['cid'])
    cid = p['cid']
    cites = u'、'.join(p['notes']) or u'—'
    tex = u'、'.join(u'`%s`' % t['path'].split('/')[-1] for t in p['texs']) or u'无 tex（PDF-only）'
    if hits:
        rel = hits[0].replace('\\', '/')
        sz = os.path.getsize(hits[0])
        title = re.match(r'(C\d+)-(.*)\.md', os.path.basename(hits[0])).group(2)
        if sz >= FLOOR:
            st = u'成稿 %dB' % sz
            n_done += 1
        else:
            st = u'未达下限 %dB' % sz
            n_short += 1
        cell = u'[%s](%s)' % (title, rel)
    else:
        st = u'待写'
        n_wait += 1
        cell = u'—'
    rows.append(u'| %s | %s | %s | %s | %s | %s | %s |' % (
        cid, p['arxiv'], cites, p['dir'].split('/')[-1], tex, cell, st))

out = [u'# 被引文献笔记 INDEX',
       u'',
       u'本表由 `python _work/index_backfill.py --apply` 从 `_work/cited_plan.json` 与盘上实测字节生成，不手抄。',
       u'体量下限 22,000 字节（`被引笔记/规格.md`）；「未达下限」＝写手仍在落笔，收稿侧不动刀。',
       u'选题尺：本语料引用该 arXiv id 的稿数，n>=3 为第一波（19 篇），n==2 为第二波（38 篇）；n==1 的 358 个 id 不在本目标范围。',
       u'C52（math/0503651）arXiv 源码两条路均 403，按规格 PDF-only 只登记不写，号位永久空着。',
       u'',
       u'| C 号 | arXiv | 引用它的语料稿 | 素材目录 | 主 tex | 成品 | 状态 |',
       u'| --- | --- | --- | --- | --- | --- | --- |'] + rows + [u'']
txt = u'\n'.join(out)
print('rows=%d 成稿=%d 未达下限=%d 待写=%d bytes=%d' % (len(rows), n_done, n_short, n_wait, len(txt.encode('utf-8'))))
cur = io.open(u'被引笔记/INDEX.md', encoding='utf-8').read()
print('与现表差异行数=%d' % sum(1 for a, b in zip(cur.split(u'\n'), txt.split(u'\n')) if a != b))
if '--apply' in sys.argv:
    io.open(u'被引笔记/INDEX.md', 'wb').write(txt.encode('utf-8'))
    print('APPLIED 被引笔记/INDEX.md size=%d' % os.path.getsize(u'被引笔记/INDEX.md'))
else:
    print('DRY（未落盘）')
