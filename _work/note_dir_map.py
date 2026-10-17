# -*- coding: utf-8 -*-
# 建 语料笔记ID <-> preprints目录 映射，再建 arXiv被引id -> 引用它的笔记ID列表
import io, os, re, sys, glob, json, collections
sys.stdout.reconfigure(encoding='utf-8')

# 1) note id -> preprint dir
note_dir = {}
for p in sorted(glob.glob('研究笔记/D*.md')):
    m = re.match(r'(D\d+)', os.path.basename(p))
    if not m:
        continue
    head = io.open(p, encoding='utf-8', errors='replace').read(20000)
    cand = re.findall(r'preprints[\\/]+([A-Za-z0-9][A-Za-z0-9._\-]*[A-Za-z0-9])', head)
    if not cand:
        note_dir[m.group(1)] = None
        continue
    c = collections.Counter(cand)
    best = c.most_common(1)[0][0]
    # 去掉尾部可能吞进来的文件名
    for suf in ('.tex', '.md', '.bib', '.yaml', '.typ'):
        if best.endswith(suf):
            best = best[:-len(suf)]
    note_dir[m.group(1)] = best

with_dir = [k for k, v in note_dir.items() if v]
print('notes=%d  with preprint dir in head=%d' % (len(note_dir), len(with_dir)))
dirs = set(v for v in note_dir.values() if v)
real = set(os.path.basename(x) for x in glob.glob('preprints/*'))
print('distinct dirs=%d  of which exist on disk=%d' % (len(dirs), len(dirs & real)))
miss = sorted(dirs - real)
print('sample unmatched dirs:', miss[:6])

# 2) 目录名 -> 笔记ID（一名可能多篇？先统计）
dir2notes = collections.defaultdict(list)
for k, v in note_dir.items():
    if v:
        dir2notes[v].append(k)
dupe = {d: n for d, n in dir2notes.items() if len(n) > 1}
print('dirs mapped by >1 note:', len(dupe), list(dupe.items())[:3])

# 3) arxiv id -> 引用它的笔记ID
recs = json.load(io.open('_work/cite_crawl_records.json', encoding='utf-8')) if os.path.exists('_work/cite_crawl_records.json') else None
top = json.load(io.open('_work/cite_crawl_top.json', encoding='utf-8'))
print('top rows=%d' % len(top))

# 重算一遍带笔记归属的引用表（bib 路径 -> preprint 目录 -> 笔记）
arx2notes = collections.defaultdict(set)
bib_by_dir = {}
for bp in glob.glob('preprints/*/build/**/*.bib'):
    parts = bp.replace('\\', '/').split('/')
    bib_by_dir.setdefault(parts[1], []).append(bp)
real_dirs = sorted(set(os.path.basename(x) for x in glob.glob('preprints/*')))
for d in list(dir2notes):
    if d in bib_by_dir:
        continue
    pref = [b for b in real_dirs if b.startswith(d) or d.startswith(b)]
    if len(pref) == 1:
        bib_by_dir[pref[0]] = bib_by_dir.get(pref[0], []) + bib_by_dir.get(d, [])
        dir2notes[pref[0]] = dir2notes.get(pref[0], []) + dir2notes[d]
for d, paths in bib_by_dir.items():
    notes = dir2notes.get(d, [])
    if not notes:
        continue
    for bp in paths:
        txt = io.open(bp, encoding='utf-8', errors='replace').read()
        for blk in re.split(r'(?=@\w+\s*\{)', txt)[1:]:
            am = re.search(r'eprint\s*=\s*[{\"]?\s*([0-9]{4}\.[0-9]{4,5}|[a-z\-]+/[0-9]{6,8})', blk, re.I)
            if am:
                a = re.sub(r'v\d+$', '', am.group(1))
                for n in notes:
                    arx2notes[a].add(n)
print('arxiv ids with note attribution=%d' % len(arx2notes))
srt = sorted(arx2notes.items(), key=lambda kv: (-len(kv[1]), kv[0]))
out = [dict(arxiv=a, notes=sorted(n), n=len(n)) for a, n in srt]
io.open('_work/cited_by_notes.json', 'w', encoding='utf-8').write(json.dumps(out, ensure_ascii=False, indent=1))
for o in out[:20]:
    print('%-18s n=%d  %s' % (o['arxiv'], o['n'], ','.join(o['notes'])))
print('>=5:', sum(1 for o in out if o['n'] >= 5), ' >=4:', sum(1 for o in out if o['n'] >= 4),
      ' >=3:', sum(1 for o in out if o['n'] >= 3))
io.open('_work/cite_top.txt', 'w', encoding='utf-8').write('\n'.join(o['arxiv'] for o in out if o['n'] >= 5) + '\n')
