r"""The alias map over the corpus: which dropped labels does it hand back, and to what?

Runs only prep and the new pure function over _work/flat, no pandoc and no typst, so it is safe to
read while a batch is in the air. Prints every float caption chain of length > 1 found in a body the
pipeline would actually hand to pandoc (the same passes convert.py runs before lift_captions).
"""
import io
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import convert, prep  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
total = 0
for tex in sorted(os.listdir(FLAT)):
    if not tex.endswith(".tex") or tex.startswith("_"):
        continue
    path = os.path.join(FLAT, tex)
    src = open(path, encoding="utf-8", errors="replace").read()
    pre, body = prep.split_document(src)
    p = prep.parse_preamble(pre)
    body = prep.fix_dialect_prose(prep.expand_macros(body, p.macros))
    body = prep.array_floats(prep.strip_dropped(body))
    body = prep.lift_captions(body)
    aliases = prep.label_aliases(body)
    if not aliases:
        continue
    total += len(aliases)
    print("%-44s %s" % (tex[:-4][:44], aliases))
print("caption chains with a lost name: %d" % total)
