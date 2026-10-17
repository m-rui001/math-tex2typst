# -*- coding: utf-8 -*-
# 生成 wave-1 派单计划：每篇外部论文的素材文件清单 + 引用它的语料稿与 bib key + arXiv 元数据
import io, os, re, sys, glob, json, collections
sys.stdout.reconfigure(encoding='utf-8')

meta = {re.sub(r'v\d+$', '', m['req']): m for m in json.load(io.open('_work/cited_meta.json', encoding='utf-8'))}
if os.path.exists('_work/cited_meta2.json'):
    for m in json.load(io.open('_work/cited_meta2.json', encoding='utf-8')):
        meta.setdefault(re.sub(r'v\d+$', '', m['req']), m)
by_notes = {x['arxiv']: x['notes'] for x in json.load(io.open('_work/cited_by_notes.json', encoding='utf-8'))}
tier1 = [l.strip() for l in io.open('_work/cite_top.txt', encoding='utf-8') if l.strip()]
tier2 = [l.strip() for l in io.open('_work/cite_top2.txt', encoding='utf-8') if l.strip()]
crawled = tier1 + tier2
srt = lambda L: sorted([a for a in L if a in by_notes], key=lambda a: (-len(by_notes[a]), a))
ids = srt(tier1) + srt(tier2)
by_notes = {a: by_notes[a] for a in ids}

# bib key：哪个语料稿的哪个 bib 条目指向该 arxiv id
key_map = collections.defaultdict(lambda: collections.defaultdict(set))
for bp in glob.glob('preprints/*/build/**/*.bib'):
    parts = bp.replace('\\', '/').split('/')
    pre, text = parts[1], io.open(bp, encoding='utf-8', errors='replace').read()
    for blk in re.split(r'(?=@\w+\s*\{)', text)[1:]:
        m = re.match(r'@\w+\s*\{\s*([^,]+),', blk)
        am = re.search(r'eprint\s*=\s*[{\"]?\s*([0-9]{4}\.[0-9]{4,5}|[a-z\-]+/[0-9]{6,8})', blk, re.I)
        if m and am:
            key_map[re.sub(r'v\d+$', '', am.group(1))][pre].add(m.group(1).strip())

note2dir = {}

plan = []
for i, a in enumerate(ids, 1):
    d = '被引素材/' + re.sub(r'[^A-Za-z0-9.]', '_', a)
    texs = []
    for root, sub, files in os.walk(d):
        for f in sorted(files):
            if f.endswith('.tex'):
                p = os.path.join(root, f).replace('\\', '/')
                raw = io.open(p, encoding='utf-8', errors='replace').read()
                texs.append(dict(path=p, bytes=os.path.getsize(p), lines=raw.count('\n') + 1))
    texs.sort(key=lambda t: -t['bytes'])
    mt = meta.get(a, {})
    keys = key_map.get(a, {})
    plan.append(dict(
        cid='C%02d' % i, arxiv=a, dir=d,
        title=mt.get('title', ''), authors=mt.get('authors', []), published=mt.get('published', ''),
        abstract=mt.get('abstract', ''),
        tex_total=sum(t['bytes'] for t in texs), texs=texs[:8], tex_n=len(texs),
        notes=by_notes[a],
        bib_keys={p: sorted(s) for p, s in sorted(keys.items())},
    ))
json.dump(plan, io.open('_work/cited_plan.json', 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
print('wave-1 papers=%d' % len(plan))
for p in plan:
    print('%s %-16s notes=%2d tex=%d/%d B  main=%s  %s' % (
        p['cid'], p['arxiv'], len(p['notes']), p['texs'][0]['bytes'] if p['texs'] else 0,
        p['tex_total'], (p['texs'][0]['path'].split('/')[-1] if p['texs'] else '-'), p['title'][:48]))
# INDEX.md
rows = ['| C 号 | arXiv | 引用它的语料稿 | 素材目录 | 主 tex | 题名 |', '| --- | --- | --- | --- | --- | --- |']
for p in plan:
    rows.append('| %s | %s | %s | %s | %s | %s |' % (
        p['cid'], p['arxiv'], ','.join(p['notes']), p['dir'],
        (p['texs'][0]['path'].split('/')[-1] + ':' + str(p['texs'][0]['lines'])) if p['texs'] else '-',
        p['title'][:80]))
io.open('被引笔记/INDEX.md', 'w', encoding='utf-8').write('\n'.join(rows) + '\n')
print('INDEX rows=%d  bytes=%d' % (len(plan), os.path.getsize('被引笔记/INDEX.md')))
