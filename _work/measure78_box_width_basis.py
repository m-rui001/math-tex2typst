r"""Is Typst's `box(width:)` the border box or the content box?

`node_frame_width` answers the OUTER width (for `text width=D` it adds `inner sep` on each side) and
`emit_node` hands that number to Typst as the box's own `width:`.  That is only right if Typst's
`width` measures the box *including* its inset; if it sizes the content, every such frame ships
2 x inset too wide, and the paragraph inside it too.  Draw one box, read the drawn rectangle.
"""
import io
import os
import re
import subprocess
import sys

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")

CM = 28.3464567  # bp per cm

SRC = """#align(center, box(width: 6cm, inset: (x: 1cm, y: 0.5cm), stroke: 0.4pt + red, fill: none)[text])
"""


def main():
    path = os.path.join(HERE, "_78_box.typ")
    open(path, "w", encoding="utf-8").write(SRC)
    pdf = os.path.join(HERE, "_78_box.pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    err = subprocess.run(["typst", "compile", path, pdf], cwd=HERE, capture_output=True)
    if not os.path.exists(pdf):
        print("typst refused: %s" % err.stderr.decode("utf-8", "replace")[:300])
        return
    doc = fitz.open(pdf)
    page = doc[0]
    for d in page.get_drawings():
        r = d["rect"]
        if r.width > 20:
            print("declared width: 6cm  inset x: 1cm   ->  drawn frame %.4f cm (content %.4f cm)"
                  % (r.width / CM, (r.width - 2 * 1 * CM) / CM))
    doc.close()


if __name__ == "__main__":
    main()
