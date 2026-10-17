r"""#52: how many drawn shapes carry a `fill:` and no `stroke:`, so CeTz puts its own rule on them.

Found on the page, not in the code: `_work/render_pair.py` put the pdflatex control of
`A-projective-fourfold…` fig 2 beside the product, and there the eight red dots of
`\fill[arrred] (1.78,{1.78*tan(\angle)}) circle (1.9pt);` are solid red discs while the product's are
red discs wearing a black ring.  The emitted line is `circle(…, fill: rgb("#a53a25"))` with nothing
about a stroke, and `_work/probe_frame_stroke_none.py` already read what CeTz then draws: a default
black rule, which only `stroke: none` takes away.  pgf never had that rule -- `\fill` turns on the
fill mode and nothing else, so a `draw=<colour>` written on a `\fill` statement paints a pen nobody
uses.

So this counts, per verb, the geometry lines the live converter emits with a fill and no stroke.  The
verb comes from `translate_path`'s own argument rather than from a guess about the source text, and
`content(`/`#box(` lines cannot match: a Typst box with a fill and no stroke really is borderless,
which is what #46 and #49 already rely on.
"""
import pathlib
import re
import sys
from collections import Counter, defaultdict

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
GEOM = re.compile(r"^\s*(circle|rect|line|arc|curve|ellipse|polyline|polygon|path)\(")
LC = 15.79

live = cetz.translate_path
shapes = Counter()
bycall = Counter()
papers = defaultdict(set)
canvases = defaultdict(set)
samples = defaultdict(list)
CUR = ["", 0]


def spy(rest, verb, o, *a, **kw):
    out = live(rest, verb, o, *a, **kw)
    for line in out or []:
        # an arrow mark carries its own `fill:` for the tip, and a `draw` path is supposed to have a
        # rule -- look only at the shape's own paint by cutting the mark out
        own = re.sub(r"mark: \(.*\)\)?\s*$", "", line)
        if not (GEOM.match(line) and "fill:" in own and "stroke:" not in own):
            continue
        shapes[verb] += 1
        papers[verb].add(CUR[0])
        canvases[verb].add((CUR[0], CUR[1]))
        call = GEOM.match(line).group(1)
        dark = "fill: black" in own or "fill: rgb(\"#000000\")" in own
        bycall["%s%s" % (call, "" if dark else " (visible ring)")] += 1
        if len(samples[verb]) < 3:
            samples[verb].append("%s#%d  %s" % (CUR[0][:40], CUR[1], line.strip()[:100]))
    return out


def main():
    cetz.translate_path = spy
    walked = built = 0
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(text)}
        for i, m in enumerate(PIC.finditer(text)):
            CUR[0], CUR[1] = path.stem, i
            walked += 1
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
            if cetz.build(core, pal) is not None:
                built += 1
    cetz.translate_path = live
    print("canvases walked %d, built %d" % (walked, built))
    total = sum(shapes.values())
    print("shapes filled with no `stroke:` said: %d   canvases %d   papers %d"
          % (total, len({c for v in canvases.values() for c in v}),
             len({p for v in papers.values() for p in v})))
    for verb, n in shapes.most_common():
        print("   verb %-9s shapes %5d  canvases %4d  papers %4d"
              % (verb, n, len(canvases[verb]), len(papers[verb])))
        for s in samples[verb]:
            print("      " + s)
    print("\nby call, splitting the black fills that hide their ring:")
    for k, v in bycall.most_common():
        print("   %-24s %5d" % (k, v))
    out = ROOT / "_work" / "regen52.txt"
    with open(out, "w", encoding="utf-8") as f:
        for stem in sorted({p for v in papers.values() for p in v}):
            f.write(stem + "\n")
    print("wrote %s" % out)


if __name__ == "__main__":
    main()
