# -*- coding: utf-8 -*-
# 用 arXiv API 取 wave-1 被引论文的元数据（题名/作者/日期/摘要首句），落 _work/cited_meta2.json
import io, os, re, sys, json, time, subprocess
sys.stdout.reconfigure(encoding='utf-8')

ids = [l.strip() for l in io.open('_work/cite_w2.txt', encoding='utf-8') if l.strip()]
meta = {}
CHUNK = 8
for i in range(0, len(ids), CHUNK):
    grp = ids[i:i + CHUNK]
    url = 'https://export.arxiv.org/api/query?id_list=' + ','.join(grp) + '&max_results=%d' % len(grp)
    dst = '_work/_api.xml'
    r = subprocess.run(['curl', '-sL', '--max-time', '90', '-o', dst, url])
    xml = io.open(dst, encoding='utf-8', errors='replace').read()
    for ent in re.findall(r'<entry>(.*?)</entry>', xml, re.S):
        idu = re.search(r'<id>https?://arxiv.org/abs/([^<]+)</id>', ent)
        ti = re.search(r'<title>(.*?)</title>', ent, re.S)
        su = re.search(r'<summary>(.*?)</summary>', ent, re.S)
        pu = re.search(r'<published>([^<]+)</published>', ent)
        au = re.findall(r'<name>([^<]+)</name>', ent)
        if not idu:
            continue
        a = idu.group(1).strip()
        a = re.sub(r'v\d+$', '', a)
        clean = lambda s: re.sub(r'\s+', ' ', s.replace('&#39;', "'").replace('&quot;', '"').replace('&amp;', '&')).strip()
        meta[a] = dict(
            arxiv=a,
            title=clean(ti.group(1)) if ti else '',
            authors=au[:12],
            published=pu.group(1)[:10] if pu else '',
            abstract=clean(su.group(1)) if su else '',
        )
    time.sleep(3)

# 按 cite_top 顺序对齐（去掉版本号再查）
order = []
for a in ids:
    base = re.sub(r'v\d+$', '', a)
    m = meta.get(a) or meta.get(base) or {}
    m = dict(m)
    m['req'] = a
    order.append(m)
json.dump(order, io.open('_work/cited_meta2.json', 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
print('ids=%d resolved=%d' % (len(ids), sum(1 for o in order if o.get('title'))))
for o in order:
    print('%-16s %-12s %s' % (o['req'], o.get('published', '?'), o.get('title', '???')[:78]))
