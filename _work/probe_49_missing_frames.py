r"""Where the three missing `stroke: none` frames went.

The tally says a fresh build writes 430 frames and the pages carry 427, and names the two papers. This
takes those papers picture by picture: builds each one, counts its frames, and asks whether the canvas
lines it produced actually stand in the emitted `main.typ`. A picture the batch quoted as LaTeX, or
folded into a float it drew another way, shows up here as a canvas with frames and no home on the page.
"""
import pathlib
import re
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from probe_tip_product import canvases  # noqa: E402
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NAMES = ["A-projective-fourfold-with-large-fundamental-group-and-its-étale-fundamental-group-of-a-Cayley-plane",
         "Self-dual-random-cluster-interfaces-below-one-dimensional-criticality-September-23-2026"]


def frame_args(line):
    """The `#box(` argument lists of one line, cut where the node's body starts.

    A whole line cannot be compared to the page: the batch resolves a `\ref` inside a node's text and
    this probe has no book, so only the frame's own arguments are the same on both sides.
    """
    out = []
    i = 0
    while True:
        j = line.find("#box(", i)
        if j < 0:
            return out
        k = j + 4
        depth = 0
        end = None
        while k < len(line):
            if line[k] == "(":
                depth += 1
            elif line[k] == ")":
                depth -= 1
                if not depth:
                    break
            elif line[k] == "[" and depth == 1:
                end = k
                break
            k += 1
        out.append(line[j + 5:end if end else k])
        i = k + 1


def main():
    for want in NAMES:
        src = next(iter((ROOT / "_work" / "flat").glob(want[:40] + "*.tex")), None)
        if src is None:
            print("no flat source for %s" % want[:40])
            continue
        text = src.read_text(encoding="utf-8", errors="replace")
        try:
            wide = line_cm(prep.parse_preamble(text))
        except Exception:
            wide = None
        page = (ROOT / "typst" / src.stem / "main.typ").read_text(encoding="utf-8",
                                                                                   errors="replace")
        on_page = Counter()
        for body in canvases(page):
            for line in body:
                for arg in frame_args(line):
                    if "stroke: none" in arg:
                        on_page[arg] += 1
        print("== %s" % src.stem[:58])
        for n, m in enumerate(PIC.finditer(text)):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
            canvas = cetz.build(core)
            if canvas is None:
                print("   pic%-3d refuses a build" % n)
                continue
            mine = Counter(arg for line in canvas.splitlines()
                           for arg in frame_args(line) if "stroke: none" in arg)
            if not mine:
                continue
            gone = mine - on_page
            print("   pic%-3d frames %d, matched on the page %d%s"
                  % (n, sum(mine.values()), sum(mine.values()) - sum(gone.values()),
                     "" if not gone else "   MISSING: %s" % gone.most_common(1)[0][0][:96]))


if __name__ == "__main__":
    main()
