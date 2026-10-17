"""Where does a CeTz `content(point, [#box(width: ...)])` land on the page?

The `text width` fix adds a `width:` to a box that today hugs its text. If CeTz anchors the
content's TOP-LEFT at the point, the frame grows rightward from the coordinate; if it centres the
laid-out box, the text's left edge moves left by half the added width. The two cases need different
emissions, so measure which one CeTz does before writing the code.
"""
import os
import subprocess
import sys
import tempfile

import fitz

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
from t2t import cetz  # noqa: E402  (the same HEADER the compile gate puts in front of every canvas)

sys.stdout.reconfigure(errors="replace")
HEADER = cetz.HEADER

CASES = {
    "hug (today's spelling)": 'content((40, 40), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), [ABCDABCDABCD])])',
    "width 6cm, inset same": 'content((40, 40), [#box(width: 6cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [ABCDABCDABCD])])',
    "width 6cm, range spelling": 'content((30, 30), (90, 60), [ABCDABCDABCD], frame: "rect")',
}

with tempfile.TemporaryDirectory() as tmp:
    for name, body in CASES.items():
        src = os.path.join(tmp, "t.typ")
        out = os.path.join(tmp, "t.pdf")
        with open(src, "w", encoding="utf-8") as f:
            f.write(HEADER + '\n#set page(width: 300pt, height: 160pt)\n'
                    '#cetz.canvas({\nimport cetz.draw: *\n' + body + '\n})\n')
        r = subprocess.run(["typst", "compile", src, out], capture_output=True)
        if r.returncode:
            print("%-26s COMPILE FAILED %s" % (name, r.stderr.decode("utf-8", "replace")[:200]))
            continue
        doc = fitz.open(out)
        page = doc[0]
        words = [w for w in page.get_text("words") if w[4].startswith("ABCD")]
        rects = [d["rect"] for d in page.get_drawings() if d["rect"].width > 40]
        doc.close()
        w = words[0] if words else None
        rc = rects[0] if rects else None
        print("%-26s text x0=%s  box x0=%s x1=%s width=%s"
              % (name,
                 "%.1f" % w[0] if w else "-",
                 "%.1f" % rc.x0 if rc else "-", "%.1f" % rc.x1 if rc else "-",
                 "%.1f" % rc.width if rc else "-"))
