r"""#90 the tests' expected stroke dicts now carry pgf's miter limit.

`stroke_args` says `miter-limit: 10` on every rule it emits (Typst bevels a corner at ratio 4 where
pgf carries it to 10), so every expected string in `tools/test_t2t.py` that quotes a stroke
dictionary has to quote the key too.  Mechanical: `thickness: <n>pt` closes a dict in all 31 of them,
and the emitter puts the limit right after the thickness.
"""
import re

PATH = "tools/test_t2t.py"
src = open(PATH, encoding="utf-8").read()
out, n = re.subn(r"thickness: ([\d.]+)pt\)", r"thickness: \1pt, miter-limit: 10)", src)
open(PATH, "w", encoding="utf-8", newline="").write(out)
print("rewrote %d expected strokes" % n)
