r"""How many statements a bare `\path` paints, and what the canvas looks like when it does.

TikZ's `\path` is the verb that says nothing: it walks the coordinates, defines nodes and remembers
where things are, and paints only when its brackets ask for paint (`draw=`, a colour, `fill=`, an
arrow head). `translate_path` gives it the same treatment as `\draw`, so every coordinate-to-coordinate
`\path` in the corpus lands on the page as a black rule. The tell in a canvas is a geometry call with
NO style argument at all -- Typst's `line` draws a default 0.4pt stroke when `stroke:` is left off --
so this counts those lines and prints the picture they came from, with the statement that made it.
"""
import pathlib
import re
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
GEOM = re.compile(r"^\s*(line|bezier|arc)\(")
STYLED = re.compile(r"stroke:|fill:|mark:")
PATH_VERB = re.compile(r"\\path\b")


def main():
    papers = Counter()
    path_papers = set()
    canvases = 0
    lines = 0
    samples = []
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        src = path.read_text(encoding="utf-8", errors="replace")
        try:
            wide = line_cm(prep.parse_preamble(src))
        except Exception:
            wide = None
        hit = 0
        for m in PIC.finditer(src):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
            canvas = cetz.build(core)
            if canvas is None:
                continue
            bare = [l.strip() for l in canvas.splitlines()
                    if GEOM.match(l) and not STYLED.search(l)]
            if not bare:
                continue
            canvases += 1
            lines += len(bare)
            hit += len(bare)
            if PATH_VERB.search(core):
                path_papers.add(path.stem)
                if len(samples) < 6:
                    stmt = PATH_VERB.search(core).start()
                    samples.append("%s\n    %s\n    pic: %s"
                                   % (path.stem[:46], bare[0][:110],
                                      core[stmt:stmt + 90].replace("\n", " ")))
        if hit:
            papers[path.stem] = hit
    print("unstyled geometry lines: %d in %d canvases, %d papers (%d of them hold a `\\path`)"
          % (lines, canvases, len(papers), len(path_papers)))
    for s in samples:
        print("  %s" % s)


if __name__ == "__main__":
    main()
