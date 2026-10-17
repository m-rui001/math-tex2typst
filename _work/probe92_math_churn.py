r"""Dump one hash per emitted canvas, so #92's change surface is a diff of two runs.

The round changes two things in `_math_body`: the guard now lets an escaped `\\#` through, and a
space is inserted at every letter-then-digit boundary.  The honest measure of what that moves on a
page is the run144 lesson (`_work/probe131_pen_churn.py`): replay every picture the same way twice,
once with the live module and once with the same file edited back to the OLD two lines, and diff the
canvas texts.  Nothing is re-derived here -- the probe only hashes what `cetz.convert` returns.

  python _work/probe92_math_churn.py > _work/m92_churn_<after|before>.tsv

The OLD run is a second pass over the same replay with a package dir pointing at the whole `t2t`
copied and the two lines put back (`_work/_m92old`), so the two dumps differ by exactly the change:
`python _work/probe92_math_churn.py _work/_m92old > _work/m92_churn_before.tsv`
"""
import hashlib
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, convert, prep  # noqa: E402

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
        print("%s\tSKIP\t%s" % (stem[:44], exc))
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
        print("%s\t%d\t%s" % (stem[:60], i, h))
