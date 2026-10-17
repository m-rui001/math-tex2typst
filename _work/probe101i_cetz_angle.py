r"""#101 leg D: CeTz's own `content(..., angle:, anchor:)` against pgf's turned-anchor law.

`_work/label101g_rot_face.py` priced the emitter's hand-made step (place the point by the rotated
anchor vector read off `_node_pad`'s estimated box, and drop `anchor:`) at 0.4-1.0pt on five
south-anchored rows and 10pt on `$-1\le y\le1$` -- the whole error is the character-counting box,
not the law.  But the runtime already knows how to do this: `cetz-0.5.0/src/draw/shapes.typ:1097`
`content(pos, body, angle:, anchor:)` measures the body with `util.measure`, builds its anchors as
`center + R(+angle) * (±w, ±h)` (lines 1180-1210) and pins the chosen one at `pos`
(`anchor_.setup(offset-anchor:)`, line 1312) -- which is literally pgf's rule, with Typst's own
glyph metrics instead of our estimate.

This probe writes that form by hand for the same synthetic label #101a/#101d used, and reads the
page with #101a's `ink_offsets()`.  The pgf column is the same ruler on the same statement through
#101b's `run_page()`.  Nothing is decided here about the emitter -- it only says whether the
runtime's `angle:` lands where pgf lands.

  PYTHONIOENCODING=utf-8 python _work/probe101i_cetz_angle.py 2> _work/m101i_err.txt
      # -> _work/label101i_cetz_angle.txt
"""
import io
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(HERE, "label101i_cetz_angle.txt")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe101a_rot_variants as p  # noqa: E402  the ruler
import probe101b_pgf_nodes as b  # noqa: E402  the pgf-side page builder
import probe101d_rot_typst as d  # noqa: E402  the roomy head
import probe101g_rot_face as gg  # noqa: E402  ink_on_page_edge()/read_line, the geometry clip test
import probe81_label_box_face as g  # noqa: E402  the renderer

TEXT = "uncapped band"
# (name, pgf option string, the `content(...)` tail our runtime would carry)
CASES = [
    ("east rot90", "rotate=90,anchor=east", 'angle: 90deg, anchor: "east"'),
    ("west rot90", "rotate=90,anchor=west", 'angle: 90deg, anchor: "west"'),
    ("north rot90", "rotate=90,anchor=north", 'angle: 90deg, anchor: "north"'),
    ("south rot90", "rotate=90,anchor=south", 'angle: 90deg, anchor: "south"'),
    ("center rot90", "rotate=90,anchor=center", 'angle: 90deg, anchor: "center"'),
    ("no anchor rot90", "rotate=90", "angle: 90deg"),
    ("south rot-90", "rotate=-90,anchor=south", 'angle: -90deg, anchor: "south"'),
    ("south rot90 sep3", r"rotate=90,anchor=south,inner sep=3pt",
     'angle: 90deg, anchor: "south"'),
    ("south rot90 footnotesize", r"rotate=90,anchor=south,font=\footnotesize",
     'angle: 90deg, anchor: "south"'),
    ("south rot45", "rotate=45,anchor=south", 'angle: 45deg, anchor: "south"'),
    ("west rot-63", "rotate=-63,anchor=west", 'angle: -63deg, anchor: "west"'),
    ("south rot34", "rotate=34,anchor=south", 'angle: 34deg, anchor: "south"'),
    ("east no rot", "anchor=east", 'anchor: "east"'),
]
# the same forms again with pgf's own default inner sep (.3333em = 3.33pt at 10pt) handed to the
# runtime as `padding:`, since that is the one term of pgf's box this engine can be told
PAD = "padding: 3.33pt"
CASES += [
    ("east rot90 +pad", "rotate=90,anchor=east", 'angle: 90deg, anchor: "east", ' + PAD),
    ("west rot90 +pad", "rotate=90,anchor=west", 'angle: 90deg, anchor: "west", ' + PAD),
    ("north rot90 +pad", "rotate=90,anchor=north", 'angle: 90deg, anchor: "north", ' + PAD),
    ("south rot90 +pad", "rotate=90,anchor=south", 'angle: 90deg, anchor: "south", ' + PAD),
    ("center rot90 +pad", "rotate=90,anchor=center", 'angle: 90deg, anchor: "center", ' + PAD),
    ("south rot-90 +pad", "rotate=-90,anchor=south", 'angle: -90deg, anchor: "south", ' + PAD),
    ("south rot90 sep3 +pad", "rotate=90,anchor=south,inner sep=3pt",
     'angle: 90deg, anchor: "south", padding: 3pt'),
    ("south rot90 fn +pad", r"rotate=90,anchor=south,font=\footnotesize",
     'angle: 90deg, anchor: "south", ' + PAD),
    ("south rot45 +pad", "rotate=45,anchor=south", 'angle: 45deg, anchor: "south", ' + PAD),
    ("west rot-63 +pad", "rotate=-63,anchor=west", 'angle: -63deg, anchor: "west", ' + PAD),
    ("south rot34 +pad", "rotate=34,anchor=south", 'angle: 34deg, anchor: "south", ' + PAD),
    ("east no rot +pad", "anchor=east", 'anchor: "east", ' + PAD),
]
BODY = {
    "south rot90 sep3": '#box(inset: 3pt)[%s]' % TEXT,
    "south rot90 footnotesize": '#text(size: 8pt)[%s]' % TEXT,
    "south rot90 fn +pad": '#text(size: 8pt)[%s]' % TEXT,
}


def canvas(tail, body):
    return ("#cetz.canvas({\n  import cetz.draw: *\n"
            "  circle((0, 0), radius: 0.04233, fill: black, stroke: none)\n"
            "  content((0, 0), [%s]%s)\n})\n" % (body, (", " + tail) if tail else ""))


def main():
    lines = ["#101i: cetz's own `content(..., angle:, anchor:)` vs pgf on the same label -- pt",
             "label = `%s` at 10pt, both engines relative to the dot the picture puts at (0,0)" % TEXT,
             "pgf = _work/probe101b_pgf_nodes.run_page; ours = _work/probe81_label_box_face.render",
             "ruler = _work/probe101a_rot_variants.ink_offsets",
             ""]
    for i, (name, opt, tail) in enumerate(CASES):
        body = BODY.get(name, TEXT)
        lines.append("%-26s pgf [%s]" % (name, opt))
        pgf = b.run_page("m101i_pgf_%02d" % i, opt, TEXT, "(0,0)")
        lines.append("  pgf   %s  (pdf bytes=%s mtime=%s)"
                     % (gg.read_line(pgf["read"]), pgf["bytes"], pgf["mtime"]))
        got = g.render(canvas(tail, body), "m101i_our_%02d" % i, head=d.HEAD)
        if got is None:
            lines.append("  ours  NO PDF  (form refused to compile)   content((0, 0), [%s], %s)"
                         % (body, tail))
            lines.append("")
            continue
        _, _, pdf = got
        cut = gg.ink_on_page_edge(pdf)
        ours = p.ink_offsets(pdf)
        lines.append("  ours  %s" % gg.read_line(ours))
        lines.append("        content((0, 0), [%s], %s)" % (body, tail))
        if cut:
            lines.append("        %s" % cut)
        if pgf["read"] and ours and not cut:
            pw, ph, pl, pr, pt_, pb = pgf["read"]
            ow, oh, ol, orr, ot, ob = ours
            lines.append("        delta (ours - pgf): box %+6.2f x %+6.2f  left %+6.2f right %+6.2f "
                         "top %+6.2f bottom %+6.2f"
                         % (ow - pw, oh - ph, ol - pl, orr - pr, ot - pt_, ob - pb))
        lines.append("")
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
