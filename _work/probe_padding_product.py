r"""Which pages still spend a padding the current converter would not spend, paper by paper.

The regeneration list cannot come from a guard that only calls `cetz.build` (#45: `expand_linewidth` and
`build_cd` run before it, so a `\linewidth`-sized picture and every tikzcd canvas simply are not on that
basis). It also cannot come from counting one string, because this round changed what a padding LOOKS
LIKE as well as where it comes from: a node whose two axes differ now prints an `inset:` dictionary where
it printed a length. So this reads the `inset:` token off every CANVAS line on the page -- the emitter's
own output, not the page's other boxes, which carry `inset: (left: 0.5em)` for prose layout and are not
this law's business -- builds the same paper's pictures, and compares the two multisets per paper. A
token the page has and a fresh build never emits is a stale line.

The rebuild has to go through `expand_linewidth` with the SAME column width the batch used, or a picture
sized in `\linewidth` builds as nothing and its whole page is reported stale: `Harmonic-heights` was
flagged for 21 lines that were already right, and its three canvases came back unbuilt because the probe
passed `line_cm=None`. That is the #45 trap seen from the other side -- an instrument whose basis is
narrower than the page's. Papers with no padding key in their source are skipped: pgf's default is what
they asked for. Writes the stale papers to `_work/regen_needed.txt`.
"""
import pathlib
import re
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
from probe_tip_product import canvases  # noqa: E402  the proven line-position splitter
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402  the batch's own \linewidth -> cm

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
# one `inset:` on a line: a dictionary (which may nest a `(...)` of its own) or a length to the comma
INSET = re.compile(r"inset: (\((?:[^()]|\([^()]*\))*\)|[^,\]]+)")
KEY = re.compile(r"inner (?:x|y)?sep\s*=")


def tokens(lines):
    got = Counter()
    for line in lines:
        for m in INSET.finditer(line):
            got[m.group(1).strip()] += 1
    return got


def main():
    stale = []
    for typ in sorted((ROOT / "typst").glob("*/main.typ")):
        name = typ.parent.name
        src = ROOT / "_work" / "flat" / (name + ".tex")
        if not src.exists():
            continue
        source = src.read_text(encoding="utf-8", errors="replace")
        if not KEY.search(source):
            continue
        page = Counter()
        for body in canvases(typ.read_text(encoding="utf-8", errors="replace")):
            page += tokens(body)
        try:
            wide = line_cm(prep.parse_preamble(source))
        except Exception:
            wide = None
        fresh = Counter()
        built = 0
        for m in PIC.finditer(source):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
            canvas = cetz.build(core) or cetz.build_cd(core)
            if canvas:
                built += 1
                fresh += tokens(canvas.splitlines())
        gone = page - fresh
        if gone:
            stale.append((sum(gone.values()), name, dict(gone), built))
    stale.sort(reverse=True)
    print("pages spending a padding the converter no longer spends: %d papers" % len(stale))
    for n, name, gone, built in stale[:14]:
        print("  %3d  %s  built %d  %s" % (n, name[:40], built, sorted(gone)[:3]))
    (ROOT / "_work" / "regen_needed.txt").write_text(
        "\n".join(name for _n, name, _g, _b in stale), encoding="utf-8")
    print("wrote _work/regen_needed.txt with %d papers" % len(stale))


if __name__ == "__main__":
    main()
