r"""#103 tier ②/①: does an UNROTATED side-anchored node need `padding:`, and what is its default worth?

`cetz.py:3228` gives CeTz the node's `inner sep` as `padding:` only when the node is also turned
(`if side and width is None and rot`), and the value it gives is `INNER_SEP = 0.1cm`, pgf's `.3333em`
read at 10pt while the corpus prints its nodes at 9pt.  #101i already read the unrotated pair at the
10pt tier (`east no rot`: the right edge +3.49pt off pgf, with `padding: 3.33pt` +0.16pt); this probe
puts the same ruler on all four side anchors at both tiers the emitter actually ships -- the node's
own `#text(size: 9pt)` and the body's 10pt -- and reads three forms per case:

  no pad      what the product does today
  pad 0.1cm   what `INNER_SEP` would give if the branch simply widened
  pad <em>    pgf's default priced at THIS node's font size (3pt at 9pt, 3.333pt at 10pt)

pgf = _work/probe101b_pgf_nodes.run_page; ours = _work/probe81_label_box_face.render
ruler = _work/probe101a_rot_variants.ink_offsets.  Nothing here decides the emitter.

  PYTHONIOENCODING=utf-8 python _work/probe103b_unrotated_pad.py 2> _work/m103b_err.txt
      # -> _work/label103b_unrotated_pad.txt
"""
import io
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(HERE, "label103b_unrotated_pad.txt")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe101a_rot_variants as p  # noqa: E402  the ruler
import probe101b_pgf_nodes as b  # noqa: E402  the pgf-side page builder
import probe101d_rot_typst as d  # noqa: E402  the roomy head
import probe101g_rot_face as gg  # noqa: E402  read_line
import probe81_label_box_face as g  # noqa: E402  the renderer

TEXT = "uncapped band"
ANCHORS = ["east", "west", "south", "north"]
# (tier label, pgf font option, the `#text` our emitter wraps the body in, pgf's default sep here)
TIERS = [("9pt", r"font=\small", "#text(size: 9pt)", "3pt"),
         ("10pt", "", "body", "3.333pt")]
PADS = [("no pad", None), ("pad 0.1cm", "0.1cm"), ("pad em", "AUTO")]


def canvas(tail, body):
    return ("#cetz.canvas({\n  import cetz.draw: *\n"
            "  circle((0, 0), radius: 0.04233, fill: black, stroke: none)\n"
            "  content((0, 0), [%s]%s)\n})\n" % (body, (", " + tail) if tail else ""))


def main():
    lines = ["#103b: unrotated `anchor:` node, both font tiers, three paddings -- pt, relative to the",
             "dot the picture puts at (0,0).  pgf = probe101b.run_page, ours = probe81.render,",
             "ruler = probe101a.ink_offsets.  delta is ours - pgf on the edge the anchor names.",
             ""]
    n = 0
    for anchor in ANCHORS:
        for tier, font_opt, our_font, em in TIERS:
            opts = [x for x in ("anchor=" + anchor, font_opt) if x]
            body = TEXT if our_font == "body" else "%s[%s]" % (our_font, TEXT)
            lines.append("%s / node at %s / pgf [%s]" % (anchor, tier, ",".join(opts)))
            pgf = b.run_page("m103b_pgf_%02d" % n, ",".join(opts), TEXT, "(0,0)")
            n += 1
            lines.append("  pgf   %s  (bytes=%s mtime=%s)"
                         % (gg.read_line(pgf["read"]), pgf["bytes"], pgf["mtime"]))
            which = {"east": "right", "west": "left", "south": "bottom", "north": "top"}[anchor]
            for pad_name, pad in PADS:
                if pad == "AUTO":
                    pad = em
                tail = 'anchor: "%s"' % anchor
                if pad:
                    tail += ", padding: " + pad
                got = g.render(canvas(tail, body), "m103b_our_%02d" % n, head=d.HEAD)
                n += 1
                if got is None:
                    lines.append("  %-9s NO PDF (form refused to compile)" % pad_name)
                    continue
                ours = p.ink_offsets(got[2])
                cut = gg.ink_on_page_edge(got[2])
                note = ""
                if pgf["read"] and ours:
                    idx = {"left": 2, "right": 3, "top": 4, "bottom": 5}[which]
                    note = "  %s edge delta %+6.2f pt" % (which, ours[idx] - pgf["read"][idx])
                lines.append("  %-9s %s%s%s" % (pad_name, gg.read_line(ours), note,
                                                ("  " + cut) if cut else ""))
            lines.append("")
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
