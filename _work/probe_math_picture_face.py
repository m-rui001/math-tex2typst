r"""#70's face before the fix: how many pictures stand inside a display equation?

`picture_scopes` and `convert_paper` both walk `TIKZ_SPAN` in document order, so the set of pictures
that get lifted has to be decided in one place.  Before that place is written, the corpus answers two
questions: which display shapes actually hold a picture, and whether the letter-spaced marker
(`grep 'Z Q T'`) names the same population or only part of it.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

TOKEN = re.compile(r"(?m)^[ \t]*\\\[|\\\]|\\begin\{tikzpicture\}|"
                   r"\\(?:begin|end)\{(?:equation|eqnarray|align|alignat|gather|multline|flalign|D|math)\*?\}")


def faces(text):
    """(picture ordinal -> the display shape holding it), walking the tokens in order."""
    got, depth, shape, n = {}, 0, None, 0
    for m in TOKEN.finditer(text):
        t = m.group(0)
        if t == "\\begin{tikzpicture}":
            if depth:
                got[n] = shape
            n += 1
        elif t == "\\[":
            depth, shape = depth + 1, "display \\[ \\]"
        elif t == "\\]":
            depth = max(0, depth - 1)
            shape = None if depth == 0 else shape
        elif t.startswith("\\begin"):
            depth, shape = depth + 1, "env " + re.search(r"\{(\w+)", t).group(1)
        else:
            depth = max(0, depth - 1)
            shape = None if depth == 0 else shape
    return got, n


def main():
    by_shape, papers = {}, {}
    total = pics = 0
    for src in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(src)[:-4]
        text = open(src, encoding="utf-8", errors="replace").read()
        got, n = faces(text)
        pics += n
        if got:
            total += len(got)
            by_shape[stem] = sorted(set(got.values()))
    print("pictures in the corpus: %d ; standing inside a display: %d over %d papers"
          % (pics, total, len(by_shape)))
    for stem, shapes in sorted(by_shape.items()):
        typ = os.path.join(ROOT, "typst", stem, "main.typ")
        ink = "-"
        if os.path.isfile(typ):
            body = open(typ, encoding="utf-8", errors="replace").read()
            ink = "marker on page" if "Z Q T" in body else "no marker"
        print("  %-60s %-28s %s" % (stem[:60], ",".join(shapes)[:28], ink))


if __name__ == "__main__":
    main()
