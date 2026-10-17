# -*- coding: utf-8 -*-
# 全库 build/ 侧被引清单普查：提取 arXiv eprint / DOI，按「被多少篇语料论文引用」排序
import io, os, re, sys, glob, json, collections
sys.stdout.reconfigure(encoding='utf-8')

BIBS = sorted(glob.glob('preprints/*/build/**/*.bib', recursive=True))
ENTRY = re.compile(r'@\w+\s*\{\s*([^,]+),', re.S)
FIELD = lambda name, blk: (re.search(name + r'\s*=\s*[{\"]?([^,}\"]+)', blk, re.I) or [None, None])[1]

records = []
per_note = {}
for bp in BIBS:
    pre = os.path.basename(os.path.dirname(os.path.dirname(bp)))
    txt = io.open(bp, encoding='utf-8', errors='replace').read()
    # 按 @ 切块
    blocks = re.split(r'(?=@\w+\s*\{)', txt)
    for blk in blocks[1:]:
        m = re.match(r'@\w+\s*\{\s*([^,]+),', blk)
        if not m:
            continue
        key = m.group(1).strip()
        ep = FIELD(r'eprint', blk)
        doi = FIELD(r'doi', blk)
        url = FIELD(r'url', blk)
        title = FIELD(r'title', blk)
        arx = None
        if ep:
            ep = ep.strip().strip('{}')
            am = re.search(r'(\d{4}\.\d{4,5})(v\d+)?', ep)
            arx = am.group(1) if am else ep
        records.append(dict(preprint=pre, key=key, eprint=ep, arxiv=arx, doi=doi, url=url,
                            title=(title or '')[:120]))
        per_note.setdefault(pre, 0)
        per_note[pre] += 1

with_arx = [r for r in records if r['arxiv']]
by_arx = collections.defaultdict(list)
for r in with_arx:
    by_arx[r['arxiv']].append(r['preprint'])

print('bib files =', len(BIBS))
print('entries   =', len(records))
print('with arxiv id =', len(with_arx), ' distinct arxiv =', len(by_arx))
print('papers with >=1 bib =', len(per_note), 'of', len(glob.glob('preprints/*/build')))

top = sorted(by_arx.items(), key=lambda kv: (-len(set(kv[1])), kv[0]))
out = []
for arx, pres in top:
    titles = {r['title'] for r in with_arx if r['arxiv'] == arx}
    out.append(dict(arxiv=arx, cited_by_notes=len(set(pres)), cited_by_rows=len(pres),
                    title=sorted(titles)[0] if titles else ''))
io.open('_work/cite_crawl_top.json', 'w', encoding='utf-8').write(json.dumps(out, ensure_ascii=False, indent=1))
for o in out[:25]:
    print('%-12s notes=%d rows=%d  %s' % (o['arxiv'], o['cited_by_notes'], o['cited_by_rows'], o['title'][:70]))
print('...')
print('notes_citing>=2 :', sum(1 for o in out if o['cited_by_notes'] >= 2))
print('notes_citing>=3 :', sum(1 for o in out if o['cited_by_notes'] >= 3))
print('cited_once      :', sum(1 for o in out if o['cited_by_notes'] == 1))
print('multi_cited distinct papers:', sum(1 for o in out if o['cited_by_notes'] >= 2))
