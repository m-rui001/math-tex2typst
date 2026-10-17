"""#100e: the change face of reading `node distance` off the picture head, corpus-wide.

The rule this project prices a change with (轴 68 / #81) is the same base read twice: the committed
products under `typst/` are the run148 emission (the old law, where a head `node distance=` was
ignored and every bare `right=of a` separated by 1cm), and this runs every flat source through the
pipeline's own `convert.convert_paper` into a scratch directory.  A paper whose regenerated `main.typ`
differs is one the fix moves; the count of differing lines is what a regen has to ship.

Nothing here opens `typst` and nothing is written under `typst/`.

  python _work/probe100e_change_face.py            # -> _work/label100e_change_face.txt
  python _work/probe100e_change_face.py <stem> ...  # only those papers, with their changed lines
"""
import difflib
import io
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PROD = os.path.join(ROOT, "typst")
OUTDIR = os.path.join(ROOT, "_work", "_m100_out")
OUT = os.path.join(ROOT, "_work", "label100e_change_face.txt")
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert  # noqa: E402


def main():
    only = set(sys.argv[1:])
    os.makedirs(OUTDIR, exist_ok=True)
    stems = sorted(d[:-4] for d in os.listdir(FLAT) if d.endswith(".tex"))
    if only:
        stems = [s for s in stems if s in only]
    changed = []
    detail = []
    built = refused = 0
    for stem in stems:
        prod = os.path.join(PROD, stem, "main.typ")
        if not os.path.isfile(prod):
            continue  # a paper with no product of its own is not this change's face
        out = os.path.join(OUTDIR, stem)
        os.makedirs(out, exist_ok=True)
        convert.convert_paper(os.path.join(FLAT, stem + ".tex"), out, stem)
        new = os.path.join(out, "main.typ")
        now = io.open(new, encoding="utf-8").read() if os.path.isfile(new) else ""
        was = io.open(prod, encoding="utf-8").read()
        canvases_now = now.count("#cetz.canvas(")
        canvases_was = was.count("#cetz.canvas(")
        if canvases_now != canvases_was:
            # a picture that starts or stops drawing is a different kind of change than a node
            # that moves, and it has to be named rather than buried in a line count
            if canvases_now > canvases_was:
                built += 1
            else:
                refused += 1
            detail.append("CANVAS %s: %d -> %d" % (stem, canvases_was, canvases_now))
        if now == was:
            continue
        lines = [l for l in difflib.unified_diff(was.splitlines(), now.splitlines(), n=0,
                                                 lineterm="")
                 if (l.startswith("+") or l.startswith("-")) and not l.startswith(("+++", "---"))]
        changed.append((stem, len(lines) // 2))
        if only:
            detail.extend("%s  %s" % (stem, l[:220]) for l in lines)
    text = ("papers changed: %d of %d regenerated\n"
            "canvas count changed: %d built / %d refused\n"
            "total changed lines: %d"
            % (len(changed), len(stems), built, refused,
               sum(c for _, c in changed)))
    rows = "\n".join("  %3d  %s" % (c, s) for s, c in sorted(changed, key=lambda x: (-x[1], x[0])))
    io.open(OUT, "w", encoding="utf-8").write(text + "\n" + rows + "\n"
                                               + "\n".join(detail) + "\n")
    print(text)
    print(rows)
    if detail:
        print("\n".join(detail[:60]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
