r"""Dump one hash per emitted canvas, so #93's change surface is a diff of two runs.

The round changes one thing in the emitter: `_math_body`'s last pass turns every `/` in a canvas
formula into the quoted glyph `"/"`, and the guard loses the three clauses that pass makes
unreachable (`*/`-`/*`-`//`, a leading/trailing slash, and `/` as a script's missing base).  The
honest measure of what that moves on a page is the run144 lesson: replay every picture the same way
twice, once with the live module and once with the same file edited back to the old pass and the old
guard (`_work/_m93old`), and diff the canvas texts.  Nothing is re-derived here -- the probe only
hashes what `cetz.convert` returns.

  python _work/probe93_slash_churn.py > _work/m93_churn_after.tsv
  python _work/probe93_slash_churn.py _work/_m93old > _work/m93_churn_before.tsv

The key is the FULL paper stem: `stem[:60]` collides between papers whose names share a 60-character
prefix, and a colliding key makes the line-by-line diff blind.

  python _work/probe93_slash_churn.py [--no-compile] [tools-dir]
"""
import hashlib
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
args = [a for a in sys.argv[1:] if a != "--no-compile"]
no_compile = "--no-compile" in sys.argv[1:]
sys.path.insert(0, os.path.join(ROOT, args[0]) if args else os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, convert, prep  # noqa: E402

if no_compile:
    cetz.compiles = lambda canvas: True

FLAT = os.path.join(ROOT, "_work", "flat")
for name in sorted(os.listdir(FLAT)):
    if not name.endswith(".tex"):
        continue
    src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
    pre, body = prep.split_document(src)
    stem = name[:-4]
    try:
        p = prep.parse_preamble(pre)
        scopes = convert.picture_scopes(body, p.macros)
        pics = convert.lifted_pictures(body)
    except Exception as exc:
        print("%s\tSKIP\t%s" % (stem, exc))
        continue
    wide = convert.line_cm(p)
    for i, m in enumerate(pics):
        text = m.group(0)
        table = p.macros
        if i < len(scopes):
            table, decls = scopes[i]
            if decls:
                text = convert.with_declarations(text, decls)
        core = prep.expand_macros(text, table)
        canvas = cetz.convert(core, p.colors, wide, refs=None)
        h = "-" if canvas is None else hashlib.sha1(canvas.encode("utf-8")).hexdigest()[:12]
        print("%s\t%d\t%s" % (stem, i, h))
