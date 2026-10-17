"""Does CeTz's `content(point, body)` anchor the body's top-left on the point, or centre it?

TikZ centres a node on its coordinate. The `text width` fix (adding `width:` to a framed node's
`#box`) is only correct if we also know how CeTz attaches the box it draws -- measured here: one
canvas per spelling, a vertical ruler `line` at x=40 as the coordinate itself, then read the drawn
box's x0/x1 and the glyph x0 relative to that ruler. If the box grows rightward from the ruler, the
attachment is top-left and a widened frame needs half its width taken back off the point.
"""
import os
import subprocess
import sys
import tempfile

import fitz

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
from t2t import cetz  # noqa: E402

sys.stdout.reconfigure(errors="replace")

RULER = 'line((40, -60), (40, 60), stroke: (thickness: 0.3pt, paint: blue))'
BODY = '[#box(%s, stroke: (thickness: 0.4pt), [ABCD ABCD])]'
CASES = {
    "hug, no anchor": RULER + "\n  content((40, 0), " + (BODY % "inset: 0pt") + ")",
    "width 6cm, no anchor": RULER + "\n  content((40, 0), " + (BODY % "width: 6cm, inset: 0pt") + ")",
    "width 6cm, anchor center": RULER + "\n  content((40, 0), " + (BODY % "width: 6cm, inset: 0pt")
                                 + ', anchor: "center")',
    "width 6cm, anchor left": RULER + "\n  content((40, 0), " + (BODY % "width: 6cm, inset: 0pt")
                               + ', anchor: "left")',
    "range spelling": RULER + "\n  content((25, -5), (55, 5), [ABCD ABCD], frame: \"rect\")",
}

with tempfile.TemporaryDirectory() as tmp:
    for name, body in CASES.items():
        src = os.path.join(tmp, "t.typ")
        out = os.path.join(tmp, "t.pdf")
        with open(src, "w", encoding="utf-8") as f:
            f.write(cetz.HEADER + '\n#set page(width: 400pt, height: 200pt)\n'
                    '#cetz.canvas({\nimport cetz.draw: *\n' + body + '\n})\n')
        r = subprocess.run(["typst", "compile", src, out], capture_output=True)
        if r.returncode:
            print("%-24s FAILED %s" % (name, r.stderr.decode("utf-8", "replace")[:120]))
            continue
        doc = fitz.open(out)
        page = doc[0]
        ruler = None
        for d in page.get_drawings():
            if d["rect"].width < 2 and d["rect"].height > 40:
                ruler = d["rect"].x0
        box = [d["rect"] for d in page.get_drawings()
               if d["rect"].width > 20 and d["rect"].height > 6]
        words = [w for w in page.get_text("words") if w[4] == "ABCD"]
        doc.close()
        b = box[0] if box else None
        first = min((w[0] for w in words), default=None)
        print("%-24s ruler=%s box=[%s..%s] w=%s text_x0_rel=%s"
              % (name,
                 "%.1f" % ruler if ruler else "-",
                 "%.1f" % (b.x0 - ruler) if b and ruler else "-",
                 "%.1f" % (b.x1 - ruler) if b and ruler else "-",
                 "%.1f" % b.width if b else "-",
                 "%.1f" % (first - ruler) if first and ruler else "-"))
