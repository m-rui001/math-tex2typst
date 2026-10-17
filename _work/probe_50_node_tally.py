r"""#50's face, counted at the node rather than in the product text.

The colour law `_work/measure_bare_color_node.py` measured (34 node spellings through pdflatex, read
back with fitz) moves a bare colour from a node's border to its words, gates the border on `draw`, and
lets a valueless `fill`/`draw` take the general colour.  Each of those is a different set of option
groups, so this wraps `cetz.emit_node` over every picture of every paper and tags each node with the
faces its option group falls into.  Counts are nodes, canvases and papers per face -- and the union of
papers is the list to regenerate, because a keyword census of the products cannot see a border that
was never there.
"""
import pathlib
import re
import sys
from collections import Counter, defaultdict

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.path.insert(0, str(ROOT / "_work"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
LC = 15.79

live = cetz.emit_node
tags = defaultdict(set)      # face -> {(paper, canvas index)}
counts = Counter()           # face -> node count
samples = defaultdict(list)


def classify(o, pal):
    """Which of #50's faces this node's option group falls into."""
    general = cetz.color_option(o, pal, keys=(), bare=True)
    has_draw = "draw" in o and o.get("draw") != "none"
    old_paint = cetz.stroke_args(o, pal, bare=True)
    framed = cetz.box_visible(o)
    drawn = []
    if old_paint and not has_draw:
        drawn.append("border_from_bare_colour")
    if framed and (general or o.get("text")):
        drawn.append("ink_added_to_framed_node")
    if o.get("text"):
        drawn.append("text_key_never_read")
    val = o.get("fill")
    if val is not None and val != "none" and not (isinstance(val, str) and val):
        drawn.append("valueless_fill")
    if o.get("draw") == "none" and val not in (None, "none"):
        drawn.append("draw_none_with_fill")
    if has_draw and not old_paint:
        drawn.append("valueless_or_unresolved_draw")
    return drawn


def spy(at, inner, o, pal=None, box=None, angle=0.0, width=None, extent=(None, None),
        pad=cetz.INNER_SEP):
    out = live(at, inner, o, pal, box, angle, width, extent, pad)
    for face in classify(o, pal):
        counts[face] += 1
        tags[face].add(CUR[0])
        if len(samples[face]) < 3:
            samples[face].append({k: v for k, v in o.items()
                                  if k in ("draw", "fill", "text", "color", "rounded corners")}
                                 or "(bare colour only)")
    return out


def main():
    cetz.emit_node = spy
    papers = 0
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(text)}
        papers += 1
        for i, m in enumerate(PIC.finditer(text)):
            CUR[0] = (path.stem[:44], i)
            try:
                core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
                # `build` only: this tally counts option groups, and `convert` would put a typst
                # compile behind every one of the 1,046 canvases
                cetz.build(core, pal)
            except Exception as exc:  # a paper that will not parse is not this probe's business
                if i == 0:
                    print("  skip %s: %s" % (path.stem[:40], exc))
    cetz.emit_node = live
    print("papers walked: %d" % papers)
    order = ["border_from_bare_colour", "ink_added_to_framed_node", "text_key_never_read",
             "valueless_fill", "draw_none_with_fill", "valueless_or_unresolved_draw"]
    union = set()
    for face in order:
        union |= tags[face]
        print("%-32s nodes %5d  canvases %4d  papers %4d"
              % (face, counts[face], len(tags[face]), len({p for p, _ in tags[face]})))
        for s in samples[face]:
            print("      %s" % (s,))
    print("union to regenerate: %d canvases, %d papers" % (len(union), len({p for p, _ in union})))
    out = ROOT / "_work" / "regen50.txt"
    with open(out, "w", encoding="utf-8") as f:
        for stem in sorted({p for p, _ in union}):
            f.write(stem + "\n")
    print("wrote %s" % out)


CUR = [("", 0)]

if __name__ == "__main__":
    main()
