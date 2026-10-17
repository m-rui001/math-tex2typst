# -*- coding: utf-8 -*-
"""Resolve the notes whose material dir the head-window regex never found.

preamble_table.py only reads the first 25 lines, so a note that names its build dir
later — or names it without the `preprints\` prefix — silently joins the
「no table, nothing to expand」 set. Here every missing note is matched by the
*.tex filenames it already cites: a dir is accepted only when the note actually
points at files that exist under <dir>/build, so the expansion credential stays the
paper's own preamble rather than a guessed title similarity.
Writes _work/dir_rescue.json: {noteId: {dir, ncite, nmatch}}
"""
import io, os, re, json, glob

ROOT = u'E:/math/' + u'研究笔记'
PRE = u'E:/math/preprints'
WORK = u'E:/math/_work'

tables = json.load(io.open(os.path.join(WORK, u'preamble_tables.json'), encoding='utf-8'))
missing = sorted(set(re.match(u'(D\\d+)', os.path.basename(p)).group(1)
                     for p in glob.glob(os.path.join(ROOT, u'D*.md'))) - set(tables))

# build dir -> the set of .tex basenames it contains
texsets = {}
for d in os.listdir(PRE):
    b = os.path.join(PRE, d, 'build')
    if not os.path.isdir(b):
        continue
    names = set()
    for dp, dn, fn in os.walk(b):
        for f in fn:
            if f.endswith(u'.tex'):
                names.add(f)
    if names:
        texsets[d] = names

out = {}
for key in missing:
    p = glob.glob(os.path.join(ROOT, key + u'-*.md'))
    if not p:
        continue
    t = io.open(p[0], encoding='utf-8').read()
    # filenames the note cites as 位置串 sources
    cites = set(m for m in re.findall(u'[0-9A-Za-z][0-9A-Za-z._-]*\\.tex', t))
    ranked = []
    for d, names in texsets.items():
        hit = len(cites & names)
        if hit:
            ranked.append((hit, len(cites & names) / max(1.0, len(names)), d, names))
    ranked.sort(key=lambda r: (-r[0], -r[1]))
    if not ranked:
        continue
    best = ranked[0]
    tie = len([r for r in ranked if r[0] == best[0]])
    out[key] = {u'dir': best[2], u'ncite': len(cites), u'nmatch': best[0],
                u'ndir_tex': len(best[3]), u'tied': tie,
                u'runner_up': ranked[1][2] if len(ranked) > 1 else None,
                u'runner_up_match': ranked[1][0] if len(ranked) > 1 else 0}

io.open(os.path.join(WORK, u'dir_rescue.json'), 'w', encoding='utf-8').write(
    json.dumps(out, ensure_ascii=False, indent=1))
print(u'missing_notes=%d rescued=%d unrescued=%d'
      % (len(missing), len(out), len(missing) - len(out)))
for k in sorted(out):
    v = out[k]
    print(u'%-6s match=%2d/%-3d cites=%-3d dir=%s' % (
        k, v[u'nmatch'], v[u'ndir_tex'], v[u'ncite'], v[u'dir'][:64]))
    if v[u'tied'] > 1:
        print(u'        TIED with %d others, runner_up=%s(%d)'
              % (v[u'tied'], (v[u'runner_up'] or u'')[:40], v[u'runner_up_match']))
