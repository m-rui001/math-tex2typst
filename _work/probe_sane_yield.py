"""Canvases the *retired* bracket count used to refuse although they compile.

`sane` no longer counts `[ ] ( )`: CeTz writes its curved head as ")" and a paper's own `K\"ahler`
leaves a stray quote in node text, so the count refused pictures Typst draws without complaint. The
question is how many canvases that was, across the whole corpus -- those papers must be regenerated
too, or the tree keeps refusing figures it could draw. The rule is replayed here exactly as it shipped
before today: maths spans stripped, then the brackets and parens counted over what is left.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def old_sane(canvas):
    """The shipped guard, count included, replayed as the instrument it is."""
    for line in canvas.splitlines()[2:-1]:
        stripped = re.sub(r"\\.", "", line)
        if stripped.count("$") % 2:
            return False
        plain = re.sub(r"\$[^$]*\$", "", stripped)
        if plain.count("[") != plain.count("]"):
            return False
        if plain.count("(") != plain.count(")"):
            return False
    return True


def main():
    hits = {}
    built = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(text):
            got = cetz.build(p)
            if got is None:
                continue
            built += 1
            if not old_sane(got) and cetz.sane(got):
                name = os.path.basename(src)[:-4]
                hits[name] = hits.get(name, 0) + 1
    total = sum(hits.values())
    print("canvases built %d; refused by the old count alone: %d in %d papers"
          % (built, total, len(hits)))
    for name, n in sorted(hits.items(), key=lambda kv: -kv[1])[:12]:
        print("  %2d  %s" % (n, name[:64]))
    out = os.path.join(ROOT, "_work", "regen_needed.txt")
    open(out, "w", encoding="utf-8").write("\n".join(sorted(hits)))
    print("wrote _work/regen_needed.txt (%d names, count-only refusals)" % len(hits))


if __name__ == "__main__":
    main()
