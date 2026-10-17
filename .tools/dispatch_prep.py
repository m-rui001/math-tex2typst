import io, os, re, glob

ROOT = r'E:\math'
QUEUE = os.path.join(ROOT, '.tools', 'lean_queue.txt')
MAPF = os.path.join(ROOT, r'研究笔记', '覆盖映射.md')
OUT = os.path.join(ROOT, '.tools', 'open_dossier.md')
YAML = os.path.join(ROOT, 'lean', 'formalization.yaml')

INFLIGHT = {37, 39, 52, 58, 61, 62, 63, 65, 67, 68, 70, 71, 72, 76}

open_lines = []
for ln in io.open(MAPF, encoding='utf-8').read().split('\n'):
    m = re.match(r'^\s*(\d+)\s*\|\s*tok\s', ln)
    if m:
        open_lines.append(int(m.group(1)))

qlines = io.open(QUEUE, encoding='utf-8', errors='replace').read().split('\n')
yaml_txt = io.open(YAML, encoding='utf-8', errors='replace').read()
yaml_lines = yaml_txt.split('\n')


def norm_dir(entry):
    head = entry.replace('\\', '/').split('/')[0]
    if head and not os.path.isdir(os.path.join(ROOT, 'preprints', head)):
        cands = glob.glob(os.path.join(ROOT, 'preprints', head + '*'))
        if cands:
            head = os.path.basename(cands[0])
    return head


def build_dir(d):
    for rel in ('build', os.path.join('build', 'source'), ''):
        cand = os.path.join(ROOT, 'preprints', d, rel)
        if os.path.isdir(cand) and glob.glob(os.path.join(cand, '*.tex')):
            return cand
    return os.path.join(ROOT, 'preprints', d, 'build')


def title_and_abstract(d):
    bdir = build_dir(d)
    texs = sorted(glob.glob(os.path.join(bdir, '*.tex')))
    main = None
    for t in texs:
        s = io.open(t, encoding='utf-8', errors='replace').read()
        if '\\title' in s or '\\begin{document}' in s:
            main = (t, s)
            break
    if main is None and texs:
        p = texs[0]
        main = (p, io.open(p, encoding='utf-8', errors='replace').read())
    title, abstract, nsec = '', '', []
    if main:
        path, s = main
        mt = re.search(r'\\title\{(.*?)\}\s*$', s, re.S | re.M)
        if mt:
            title = re.sub(r'\s+', ' ', mt.group(1))
        ma = re.search(r'\\begin\{abstract\}(.*?)\\end\{abstract\}', s, re.S)
        if ma:
            abstract = re.sub(r'\s+', ' ', ma.group(1)).strip()
        if not abstract:
            for extra in glob.glob(os.path.join(bdir, '**', '*.tex'), recursive=True):
                if extra == path:
                    continue
                es = io.open(extra, encoding='utf-8', errors='replace').read()
                em = re.search(r'\\begin\{abstract\}(.*?)\\end\{abstract\}', es, re.S)
                if em:
                    abstract = re.sub(r'\s+', ' ', em.group(1)).strip()
                    break
        nsec = [os.path.basename(x) for x in glob.glob(os.path.join(os.path.dirname(path), 'sections', '*.tex'))]
        nsec = nsec or [os.path.relpath(x, bdir).replace('\\', '/') for x in
                        glob.glob(os.path.join(bdir, '**', '*.tex'), recursive=True)]
    return title, abstract, os.path.relpath(bdir, ROOT), nsec


blocks = []
count = 0
for n in open_lines:
    if n in INFLIGHT or n < 1 or n > len(qlines):
        continue
    entry = qlines[n - 1].strip()
    if not entry:
        continue
    d = norm_dir(entry)
    if not d:
        continue
    title, abstract, bpath, secs = title_and_abstract(d)
    key = re.sub(r'[-_]', ' ', d.split('-September')[0].split('-October')[0]).lower()
    hits = [i + 1 for i, l in enumerate(yaml_lines)
            if key and all(w in l.lower() for w in key.split()[:3])]
    lean = ', '.join(str(h) for h in hits[:6]) if hits else 'NO-HIT'
    blocks.append('### line %d\n- dir: %s\n- build: %s\n- files: %s\n- title: %s\n- abstract: %s\n- yaml-hits: %s\n' % (
        n, d, bpath, ' '.join(secs[:14]), title[:180], abstract[:900], lean))
    count += 1

io.open(OUT, 'w', encoding='utf-8', newline='').write(
    '# OPEN 论文派单卷宗\n\n生成脚本 .tools/dispatch_prep.py。in-flight 行号已剔除：%s。\n\n' % sorted(INFLIGHT) + '\n'.join(blocks))
print('entries', count)
