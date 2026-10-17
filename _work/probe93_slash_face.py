r"""How many in-figure formulas ship a Typst FRACTION because the author wrote a `/`?

#92's comment family (`L_*/3`, four sites) refused the guard only because `*/` ends a Typst block
comment -- but handing it the spaced form revealed a bigger, pre-existing fact: **Typst draws a
`/` inside a canvas as a stacked fraction**（分母＝紧跟它的那一个 atom，脚本与组下标跟着它走；
「whose denominator runs to the end of the maths」是这支文件当时的说法，轴 77 在页上否证）
(`_work/measure92_math_fidelity.py`: `$E/2$` reaches the page as `E` over `2`, two lines, while
pdflatex sets an inline slash; the guard has always passed `E/2`).  The slash glyph Typst draws for
the author's own ink costs 0.06pt of gap error as `"/"`.

So the population of that shape change has to be counted before any `*/` fix ships: this replays
the batch's own chain (the run133 base) and records every span that travelled as maths with a `/`
left in the emission.  `\frac` is not in it -- `_frac_call` rewrites that to a `frac(a, b)` call,
so a `/` in an emission is the author's character.

  python _work/probe93_slash_face.py > _work/m93_slash_face.txt
"""
import os
import sys
from collections import defaultdict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
current = [None]
sites = []
verdicts = []

_real_body = cetz._math_body
_real_safe = cetz.math_safe


def spy_body(tex):
    verdicts.append([])
    got = _real_body(tex)
    for ok in verdicts[-1]:
        if ok and "/" in got:
            sites.append((current[0], tex.strip(), got))
    verdicts.pop()
    return got


def spy_safe(tex):
    got = _real_safe(tex)
    verdicts[-1].append(got)
    return got


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

print("papers replayed: %d   slash-carrying maths: %d over %d papers"
      % (papers, len(sites), len({s[0] for s in sites})))
by = defaultdict(list)
for stem, src_tex, emitted in sites:
    by[emitted.count("/")].append((stem, src_tex, emitted))
for n in sorted(by):
    print("  %d slash%s: %d spans" % (n, "es" if n > 1 else "", len(by[n])))
print("\nfirst 40:")
for stem, src_tex, emitted in sites[:40]:
    print("   %-44s %-40s %s" % (stem[:44], src_tex[:40], emitted[:70]))
