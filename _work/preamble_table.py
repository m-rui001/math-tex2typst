# -*- coding: utf-8 -*-
"""Build the authoritative macro table for each note from its own material preamble.

Spec line 28 says custom material-preamble macros must be written out in standard
LaTeX, so the expansion of a shorthand in a note is whatever THAT paper's preamble
defines, not a guess by name. Each note registers its preprints directory in its
opening lines; this reads every .tex under that build directory, parses the
definitions with the conversion pipeline's own parser, and resolves nested macros.

Writes _work/preamble_tables.json: {noteId: {dir, defs: {\\name: body}, unresolved: [...]}}
Usage: python preamble_table.py [IDprefix] [--show]
"""
from __future__ import unicode_literals
import io, os, re, sys, glob, json

sys.path.insert(0, u'E:/math/tools')
from t2t import macros as M

ROOT = u'E:/math/' + u'研究笔记'
WORK = u'E:/math/_work'
DIRPAT = re.compile(u'preprints' + u'[\\\\/]' + u'([A-Za-z0-9._%+\\-]+)')


def load_rescue():
    """Directories recovered from the .tex filenames a note already cites.

    _work/dir_rescue.py scores every build dir by how many of the note's cited
    filenames exist inside it. Only an unambiguous recovery is taken here: an 80%
    cover with a real margin over the runner-up. A tie stays unresolved, because a
    wrong preamble would rewrite formulas into the wrong paper's notation.
    """
    p = os.path.join(WORK, u'dir_rescue.json')
    if not os.path.exists(p):
        return {}
    ok = {}
    for k, v in json.load(io.open(p, encoding='utf-8')).items():
        ncit, nmat = v.get(u'ncite', 0), v.get(u'nmatch', 0)
        if not ncit or v.get(u'tied', 1) > 1:
            continue
        margin = v.get(u'runner_up_match', 0)
        if nmat == ncit or (nmat >= 4 and 1.0 * nmat / ncit >= 0.8 and nmat >= 2 * (margin + 1)):
            ok[k] = v[u'dir']
    return ok


RESCUE = load_rescue()


def note_dir(path):
    """The note's own material directory.

    Most notes register it in the first lines, but a few write it only deep in the body,
    so every mention counts: the directory named most often is the one the note works on.
    A tie between two distinct directories is left unresolved rather than guessed,
    because a wrong preamble would rewrite formulas into the wrong paper's notation.
    """
    t = io.open(path, encoding='utf-8').read()
    counts = {}
    for m in DIRPAT.finditer(t):
        name = m.group(1).rstrip(u'.')
        cand = os.path.join(u'E:/math/preprints', name)
        if not os.path.isdir(cand):
            pats = glob.glob(os.path.join(u'E:/math/preprints', name[:40] + u'*'))
            if not pats:
                continue
            cand = pats[0]
            name = os.path.basename(cand)
        counts[name] = counts.get(name, 0) + 1
    key = re.match(u'(D\\d+)', os.path.basename(path)).group(1)
    if not counts:
        if key in RESCUE:
            return RESCUE[key], os.path.join(u'E:/math/preprints', RESCUE[key])
        return None, None
    top = sorted(counts.items(), key=lambda kv: (-kv[1], kv[0]))
    if len(top) > 1 and top[1][1] == top[0][1]:
        if key in RESCUE:
            return RESCUE[key], os.path.join(u'E:/math/preprints', RESCUE[key])
        return top[0][0], None
    return top[0][0], os.path.join(u'E:/math/preprints', top[0][0])


# The converter's own parser drops \renewcommand / \providecommand on purpose: inside a
# pandoc formula a redefinition of a LaTeX builtin turns into plumbing pandoc refuses
# (tools/t2t/macros.py OVERRIDE_KEYWORDS). Our question is the opposite one -- a note that
# quotes that paper's '\H' needs the paper's redefinition, which is the strongest credential
# the material offers. Same parser, no change to it: one extra text pass with the keyword
# normalised to \newcommand. A plain \newcommand of the same name still wins, and every name
# taken this way is listed under 'override' so the provenance is readable.
REDEF = re.compile(u'\\\\(renew|provide)(command)(\\*?)')


def build_table(build_dir):
    texs = []
    for dp, dn, fn in os.walk(build_dir):
        for f in fn:
            if f.endswith(u'.tex') or f.endswith(u'.sty'):
                p = os.path.join(dp, f)
                try:
                    texs.append(io.open(p, encoding='utf-8', errors='replace').read())
                except Exception:
                    pass
    table = {}
    over = set()
    for t in texs:
        try:
            tab, skipped = M.parse_definitions(t)
        except Exception:
            tab = {}
        try:
            redef, _ = M.parse_definitions(REDEF.sub(u'\\\\newcommand\\3', t))
        except Exception:
            redef = {}
        for k, v in (tab or {}).items():
            table[k] = v
        for k, v in (redef or {}).items():
            if k not in table:
                table[k] = v
                over.add(k)
    return table, len(texs), over


def body_of(mac):
    if isinstance(mac, str):
        return mac
    return getattr(mac, 'body', None) or getattr(mac, 'alias', None) or u''


def resolve(name, body, table, depth=0):
    """Expand a definition body until it names no further table entry.

    Returns (expanded, ok). ok is False when the body still needs an argument or
    recursion does not terminate: those shorthands cannot be written out blindly.
    """
    if depth > 6:
        return body, False
    out = body
    for other in list(table.keys()):
        if other == name:
            continue
        if other in out:
            ob, ok = resolve(other, body_of(table[other]), table, depth + 1)
            if not ok:
                return out, False
            out = out.replace(other, ob)
    return out, u'#' not in out


def run(prefix, show):
    notes = sorted(glob.glob(os.path.join(ROOT, u'D*.md')))
    if prefix:
        notes = [p for p in notes if os.path.basename(p).startswith(prefix)]
    out = {}
    missing = 0
    for p in notes:
        key = re.match(u'(D\\d+)', os.path.basename(p)).group(1)
        name, d = note_dir(p)
        if not d:
            missing += 1
            continue
        table, ntex, over = build_table(d)
        defs = {}
        unres = []
        for k, v in table.items():
            kind = u'macro' if isinstance(v, str) else (getattr(v, 'kind', None) or u'macro')
            if kind == u'env':
                unres.append(k)
                continue
            exp, ok = resolve(k, body_of(v), table)
            if ok and exp.strip():
                out_kind = u'\\operatorname{' + exp + u'}' if kind == u'operator' else exp
                defs[k] = out_kind
            else:
                unres.append(k)
        out[key] = {u'dir': name, u'ntex': ntex, u'ndefined': len(table),
                    u'defs': defs, u'unresolved': unres,
                    u'override': sorted(k for k in over if k in defs)}
        if show and key in (prefix or u'', u'D43', u'D101', u'D111'):
            print(u'=====', key, name, u'tex_files=%d defs=%d unresolved=%d'
                  % (ntex, len(defs), len(unres)))
            for k in sorted(defs)[:25]:
                print(u'  %-12s -> %s' % (k, defs[k][:60]))
            print(u'  unresolved:', unres[:15])
    # 一台量具不许两个口径：带 prefix 跑时 out 只含被筛中的那几篇，直接覆盖会把整张表写成只剩
    # 这几篇，下游 _work/katex_fix.js 于是对其它七百篇失明。部分跑并入既有表，只换自己动过的键。
    json_path = os.path.join(WORK, u'preamble_tables.json')
    rebuilt = len(out)
    if prefix and os.path.exists(json_path):
        base = json.load(io.open(json_path, encoding='utf-8'))
        base.update(out)
        out = base
    io.open(json_path, 'w', encoding='utf-8').write(json.dumps(out, ensure_ascii=False))
    print(u'notes=%d rebuilt=%d total=%d missing_dir=%d  json_bytes=%d'
          % (len(notes), rebuilt, len(out), missing, os.path.getsize(json_path)))


run(sys.argv[1] if len(sys.argv) > 1 and not sys.argv[1].startswith(u'--') else u'',
    u'--show' in sys.argv)
