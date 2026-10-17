r"""Every in-figure formula the live guard STILL refuses, on the batch's own base.

§7's row says 29 sites / 4 families and was measured on `_work/flat` straight through
`cetz.build` (`_work/probe_math_safe_refusals.py`, and B's
`_work/probe_b_math_refusal_spec.py` on the same base).  A rebuild fed the raw source is the
run133 mistake: the picture the converter draws has already been through
`picture_scopes`/`with_declarations`/`prep.expand_macros`, so a node label that holds a paper
macro is a different string on the page than in `_work/flat`.  This probe replays that chain
(`_work/probe101_cd_batch_pictures.py`'s lesson) and asks the emitter: wrap `_math_body` to see
what the author's `$...$` span actually said, and `math_safe` to hear when the guard refuses it.

Read-only.  No typst, no `cetz.py` edit.

  python _work/probe92_refused_sites.py
"""
import os
import re
import sys
from collections import defaultdict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
current = [None]
sites = []
refusals = []

_real_body = cetz._math_body
_real_safe = cetz.math_safe


def spy_body(tex):
    refusals.append([])
    got = _real_body(tex)
    if refusals[-1]:
        sites.append((current[0], tex, refusals[-1][0], got))
    refusals.pop()
    return got


def spy_safe(tex):
    got = _real_safe(tex)
    if not got:
        refusals[-1].append(tex)
    return True


def family(tex):
    if "#" in tex:
        return "hash"
    if "$" in tex:
        return "dollar"
    if re.search(r"\*/|/\*|//", tex):
        return "comment"
    if re.search(r"[A-Za-z][0-9]", tex):
        return "fused"
    if tex[:1] == "/" or tex[-1:] == "/":
        return "slash-edge"
    for m in re.finditer(r"[\^_]", tex):
        base = tex[:m.start()].rstrip()
        if not base or base[-1] in "([{/^_":
            return "no-base"
    if re.search(r"[\^_](?:[\^_]|$)", tex):
        return "double-script"
    return "other"


cetz._math_body = spy_body
cetz.math_safe = spy_safe
papers = 0
for name in sorted(os.listdir(FLAT)):
    if not name.endswith(".tex"):
        continue
    path = os.path.join(FLAT, name)
    src = open(path, encoding="utf-8", errors="replace").read()
    pre, body = prep.split_document(src)
    stem = name[:-4]
    try:
        p = prep.parse_preamble(pre)
        scopes = convert.picture_scopes(body, p.macros)
        pics = convert.lifted_pictures(body)
    except Exception as exc:
        print("SKIP %s: %s" % (stem[:44], exc))
        continue
    papers += 1
    current[0] = stem
    wide = convert.line_cm(p)
    for i, m in enumerate(pics):
        text = m.group(0)
        table = p.macros
        if i < len(scopes):
            table, decls = scopes[i]
            if decls:
                text = convert.with_declarations(text, decls)
        core = prep.expand_macros(text, table)
        cetz.convert(core, p.colors, wide, refs=None)
cetz._math_body = _real_body
cetz.math_safe = _real_safe

by = defaultdict(list)
for stem, src_tex, refused, emitted in sites:
    by[family(refused)].append((stem, src_tex, refused, emitted))

print("papers replayed: %d   guard refusals: %d over %d papers"
      % (papers, len(sites), len({s[0] for s in sites})))
for key in sorted(by, key=lambda k: -len(by[k])):
    rows = by[key]
    print("\n== %s: %d sites / %d papers" % (key, len(rows), len({r[0] for r in rows})))
    for stem, src_tex, refused, emitted in rows:
        print("   %-44s" % stem[:44])
        print("        author   %s" % src_tex.strip()[:110])
        print("        refused  %s" % refused[:110])
        print("        on page  %s" % emitted[:110])
