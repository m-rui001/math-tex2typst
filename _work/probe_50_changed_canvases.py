r"""#50: which canvases really change, decided per node rather than per option spelling.

`_work/probe_50_node_tally.py` tags 390 canvases as carrying a node whose colour keys fall into one of
this round's faces -- that is an UPPER bound, because the same option group can be answered the same
way by the old and the new rule at the site the node actually lands on.  A `\node[draw]` that reaches a
`#box(` already got `stroke: (thickness: 0.4pt)` from the old `box_args`, so nothing moves there, while
the same node on a `frame:` path did move: Typst's own default rule is 1pt and pgf's is 0.4pt
(`_work/probe_frame_stroke_none.py` reads those two widths off the PDFs).

So this reads the site off the emitted lines -- `#box(`, `frame: "..."`, `circle(` or a bare
`content(` -- and compares the three colour decisions the OLD code made there with the three the NEW
code makes: the words' ink, the border's `stroke:`, the field's `fill:`.  The old rules are transcribed
below rather than reached for in `cetz`, because #50 changed `color_option`, `box_visible` and
`box_args` themselves; a replay that called the live helpers would replay the fix, not the past.
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
LC = 15.79
THICK = ["stroke: (thickness: 0.4pt)"]
NONE = ["stroke: none"]

# ---- the pre-#50 rules, transcribed -----------------------------------------------


def old_color_option(o, pal, keys=("color", "draw"), bare=True):
    for key in keys:
        val = o.get(key)
        if isinstance(val, str):  # an empty value answered None here and stopped the lookup
            return cetz.color(val, pal)
    if not bare:
        return None
    for key, val in o.items():
        if val is True:
            c = cetz.color(key, pal)
            if c:
                return c
    return None


def old_stroke_args(o, pal, bare=True):
    paint = old_color_option(o, pal, bare=bare)
    out = []
    if paint:
        out.append("paint: " + paint)
    width = o.get("line width")
    if isinstance(width, str):
        m = re.fullmatch(r"([\d.]+)\s*(pt|mm|cm)", width)
        if m:
            out.append("thickness: %spt" % (float(m.group(1))
                                            * {"pt": 1, "mm": 2.8346, "cm": 28.346}[m.group(2)]))
    dash = "dashed" if o.get("dashed") is True else ("dotted" if o.get("dotted") is True else None)
    if dash:
        out.append('dash: "%s"' % dash)
    return ["stroke: (%s)" % ", ".join(out)] if out else []


live = cetz.emit_node
changed = set()
node_changes = Counter()
face = defaultdict(set)
samples = defaultdict(list)
CUR = ["", 0]


def site(lines):
    text = "\n".join(lines or [])
    if "#box(" in text:
        return "box"
    if 'frame: "' in text:
        return "frame"
    if re.search(r"^\s*circle\(", text, re.M):
        return "point"
    return "bare"


def old_decisions(o, pal, where):
    """(ink, stroke, fill) the pre-#50 code put on the page at this site."""
    sa = old_stroke_args(o, pal, bare=True)
    if where == "box":
        stroke = sa or (THICK if "draw" in o else NONE)
    elif where in ("frame", "point"):
        stroke = sa
    else:
        stroke = []
    ink = old_color_option(o, pal, bare=True) if where == "bare" else None
    fill = old_color_option(o, pal, keys=("fill",), bare=False)
    return ink, stroke, fill


def new_decisions(o, pal, where):
    ink = cetz.node_ink(o, pal)
    fill = cetz.node_fill(o, pal)
    if where == "bare":
        # the live code reaches `node_stroke_args` only from a framed site; a bare node carries its
        # own `fill:` keyword and no stroke
        return ink, [], fill
    return ink, cetz.node_stroke_args(o, pal), fill


def spy(at, inner, o, pal=None, box=None, angle=0.0, width=None, extent=(None, None),
        pad=cetz.INNER_SEP):
    out = live(at, inner, o, pal, box, angle, width, extent, pad)
    if out is None:
        return out
    pal = pal or {}
    where = site(out)
    new = new_decisions(o, pal, where)
    old = old_decisions(o, pal, where)
    if new != old:
        changed.add((CUR[0], CUR[1]))
        for name, a, b in zip(("ink", "stroke", "fill"), new, old):
            if a == b:
                continue
            if name == "stroke":
                # a border can move for two different reasons: its paint, or the thickness the new
                # rule now names where Typst used to answer its own 1pt default
                pa = [p for p in (a or []) if "paint:" in p]
                pb = [p for p in (b or []) if "paint:" in p]
                tag = "stroke-paint@%s" % where if pa != pb else "stroke-width@%s" % where
            else:
                tag = "%s@%s" % (name, where)
            node_changes[tag] += 1
            face[tag].add((CUR[0], CUR[1]))
            if len(samples[tag]) < 4:
                samples[tag].append("%s#%d  %s\n      %s: %s -> %s"
                                    % (CUR[0][:40], CUR[1], o, name, b, a))
    return out


def main():
    cetz.emit_node = spy
    built = walked = 0
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(text)}
        for i, m in enumerate(PIC.finditer(text)):
            # the full stem, not a 44-character ledger truncation: this list names directories
            CUR[0], CUR[1] = path.stem, i
            walked += 1
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
            if cetz.build(core, pal) is not None:
                built += 1
    cetz.emit_node = live
    papers = {p for p, _ in changed}
    print("canvases walked %d, built %d" % (walked, built))
    print("canvases that change: %d   papers: %d" % (len(changed), len(papers)))
    print("decisions that moved, by kind and site:")
    for k, v in sorted(node_changes.items(), key=lambda kv: -kv[1]):
        print("   %-22s nodes %4d  canvases %4d  papers %4d"
              % (k, v, len(face[k]), len({p for p, _ in face[k]})))
    out = ROOT / "_work" / "regen50.txt"
    with open(out, "w", encoding="utf-8") as f:
        for stem in sorted(papers):
            f.write(stem + "\n")
    print("wrote %s (%d papers)" % (out, len(papers)))
    print("the tally's upper bound was 390 canvases / 282 papers")
    for k, _ in sorted(node_changes.items(), key=lambda kv: -kv[1]):
        print("\n== %s" % k)
        for s in samples[k]:
            print("   " + s)


if __name__ == "__main__":
    main()
