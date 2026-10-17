# -*- coding: utf-8 -*-
# Re-classify the JUDGMENT bucket of the KaTeX long-tail plan.
# A JUDGMENT site becomes ORDER only when the note's OWN source paper defines
# the macro: then the expansion is credential-backed, not invented.
import io, os, re, sys, glob
from collections import defaultdict

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
B = chr(92)

PLAN = u'_work/katex_undef_plan.txt'
OUT = u'_work/jud_reclass.txt'
SKIP_NOTES = set(['D233', 'D66', 'D278', 'D80', 'D94'])

plan = io.open(PLAN, encoding='utf-8', errors='replace').read().split(NL)

blocks = []  # (macro, class, [(note, line)])
cur = None
site_re = re.compile(u'^\\s+-\\s+(D\\d+):(\\d+)')
hdr_re = re.compile(u'^### ' + re.escape(B) + u'([A-Za-z]+)\\s+count=(\\d+)\\s+class=(\\w+)')
for l in plan:
    h = hdr_re.match(l)
    if h:
        cur = (h.group(1), h.group(3), [])
        blocks.append(cur)
        continue
    if l.startswith(u'### '):
        fam = (u'FAMILY:' + l[4:60]).strip()
        if u'classes=' in l:
            tail = l.split(u'classes=')[1]
            cls = u'JUDGMENT' if u'JUDGMENT' in tail else u'OTHER'
            cur = (fam, cls, [])
            blocks.append(cur)
        else:
            cur = None
        continue
    m = site_re.match(l)
    if m and cur:
        cur[2].append((m.group(1), int(m.group(2))))

jud = [(mac, sites) for mac, cls, sites in blocks if cls == 'JUDGMENT']
tot_sites = sum(len(s) for _, s in jud)
print('JUDGMENT blocks=%d sites=%d' % (len(jud), tot_sites))

tex_cache = None
def all_tex():
    global tex_cache
    if tex_cache is None:
        tex_cache = glob.glob(u'preprints/*/build/**/*.tex', recursive=True)
    return tex_cache

# index: basename -> list of build dirs defining a given macro
note_dir_cache = {}
def note_dir(nid):
    if nid in note_dir_cache:
        return note_dir_cache[nid]
    c = glob.glob(u'研究笔记/' + nid + u'-*.md')
    if not c:
        note_dir_cache[nid] = None
        return None
    t = io.open(c[0], encoding='utf-8', errors='replace').read()
    names = set(re.findall(u'([A-Za-z0-9_./-]+\\.tex)', t))
    votes = defaultdict(int)
    for nm in names:
        base = nm.split('/')[-1]
        for f in all_tex():
            if os.path.basename(f) == base:
                votes[os.path.dirname(f)] += 1
    best = sorted(votes.items(), key=lambda kv: (-kv[1], kv[0]))
    res = best[0][0] if best else None
    note_dir_cache[nid] = res
    return res

defpats = [B + u'newcommand{' + B, B + u'renewcommand{' + B, B + u'providecommand{' + B, B + u'def' + B]
def find_def(d, mac):
    if not d:
        return None
    for f in glob.glob(d + u'/**/*.tex', recursive=True):
        s = io.open(f, encoding='utf-8', errors='replace').read()
        for ln in s.split(NL):
            st = ln.strip()
            if (B + u'newcommand{' + B + mac + u'}') in st or (B + u'renewcommand{' + B + mac + u'}') in st \
               or (B + u'providecommand{' + B + mac + u'}') in st or (B + u'def' + B + mac + u'{') in st \
               or (B + u'DeclareMathOperator{' + B + mac) in st:
                return (os.path.relpath(f, d), st[:200])
    return None

rows = []
counts = defaultdict(int)
for mac, sites in jud:
    if mac.startswith(u'FAMILY:'):
        for nid, ln in sites:
            rows.append((mac, nid, ln, 'ERROR-FAMILY-SITE', u''))
        counts['ERROR-FAMILY-SITE'] += len(sites)
        continue
    for nid, ln in sites:
        if nid in SKIP_NOTES:
            counts['SKIP-INFLIGHT'] += 1
            continue
        d = note_dir(nid)
        if not d:
            counts['NO-SOURCE-DIR'] += 1
            rows.append((mac, nid, ln, 'NO-SOURCE-DIR', u''))
            continue
        df = find_def(d, mac)
        if df:
            counts['DEFINATED -> ORDER'] += 1
            rows.append((mac, nid, ln, 'DEFINATED', u'%s | %s' % (df[0], df[1])))
        else:
            counts['STILL-JUDGMENT'] += 1
            rows.append((mac, nid, ln, 'STILL-JUDGMENT', u''))

out = []
out.append(u'# JUDGMENT 再判：只有该篇素材自己定义了这个宏，才升级成 ORDER')
out.append(u'dir 判定=笔记里出现的 .tex 文件名在 preprints/*/build 下的最多数命中目录')
out.append(u'跳过的在飞笔记: %s' % u','.join(sorted(SKIP_NOTES)))
out.append(u'')
for k in sorted(counts, key=lambda x: -counts[x]):
    out.append(u'%-18s %d' % (k, counts[k]))
out.append(u'')
for mac, nid, ln, st, ev in rows:
    out.append(u'%s %s:%d %s %s' % (B + mac, nid, ln, st, ev))
io.open(OUT, 'wb').write((NL.join(out) + NL).encode('utf-8'))
print('wrote', OUT, os.path.getsize(OUT))
print(NL.join(u'%-18s %d' % (k, counts[k]) for k in sorted(counts, key=lambda x: -counts[x])))
