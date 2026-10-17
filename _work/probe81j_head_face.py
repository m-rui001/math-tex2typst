r"""How many corpus pictures write a shift and a scale in the SAME option list?

The new scope law makes such a list order-dependent, so before pinning anything we check where the
spelling actually occurs: a `\begin{tikzpicture}[...]` head, a `\begin{scope}[...]`, or a node. The
grouping decides whether the difference can even reach the page -- a picture-level translation moves
every point of the canvas, while a scope-level one moves only what is inside it.

  python _work/probe81j_head_face.py
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SCALES = re.compile(r"(?:^|[,:\[{(])\s*(scale|xscale|yscale)\s*=").findall
SHIFTS = re.compile(r"(?:^|[,:\[{(])\s*(xshift|yshift|shift)\s*=").findall
PIC = re.compile(r"\\begin\{tikzpicture\}\s*(\[[^\]]*\])?")
SCOPE = re.compile(r"\\begin\{scope\}\s*(\[[^\]]*\])?")


def main():
    both = {"picture": [], "scope": []}
    for path in glob.glob(os.path.join(ROOT, "preprints", "*", "build", "**", "*.tex"),
                          recursive=True):
        text = open(path, encoding="utf-8", errors="replace").read()
        if "shift" not in text or "scale" not in text:
            continue
        stem = os.path.relpath(path, ROOT).split(os.sep)[1]
        for kind, rx in (("picture", PIC), ("scope", SCOPE)):
            for m in rx.finditer(text):
                opts = m.group(1)
                if not opts:
                    continue
                if SCALES(opts) and SHIFTS(opts):
                    both[kind].append((stem[:44], opts.strip()[:90]))
    for kind in ("picture", "scope"):
        rows = both[kind]
        papers = len(set(r[0] for r in rows))
        print("%-8s option lists with a scale and a shift: %3d   in %d papers" % (kind, len(rows), papers))
        for stem, opts in rows[:12]:
            print("    %-44s %s" % (stem, opts))
        if len(rows) > 12:
            print("    ... %d more" % (len(rows) - 12))
    return 0


if __name__ == "__main__":
    sys.exit(main())
