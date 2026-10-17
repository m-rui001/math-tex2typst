r"""Which spelling gets a node's font size onto the page.

The generated figures are `#cetz.canvas({ import cetz.draw: *  …content lines… })`, and CeTz asserts
that the canvas body is an array of drawing operations.  A bare `set text(size: 9pt)` statement inside
that block makes Typst hand CeTz content instead, and the picture fails to compile -- measured, see
the `canvas-set` line of the first run of this probe.  So the size has to ride on the node's own text,
as `#text(size: 9pt)[…]`, the same shape the converter already uses for a node's ink colour.

Precedence rule: only a compiled page counts; sizes are read back with fitz, not assumed.
"""
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
HERE = os.path.join(ROOT, "_work", "sizecheck")


def main():
    sys.stdout.reconfigure(errors="replace")
    typ = os.path.join(HERE, "canvas_size.typ")
    pdf = os.path.join(HERE, "canvas_size.pdf")
    r = subprocess.run(["typst", "compile", typ, pdf], capture_output=True)
    if r.returncode:
        err = (r.stderr or b"").decode("utf-8", "replace")
        print("COMPILE FAILED:", re.sub(r"[^\x20-\x7e\n]", "?", err)[:1500])
        return
    doc = fitz.open(pdf)
    for page in doc:
        for b in page.get_text("dict")["blocks"]:
            for l in b.get("lines", []):
                for sp in l["spans"]:
                    t = sp["text"].strip()
                    if t:
                        print("  y=%-6.1f size %-6.2f %-24s %s"
                              % (sp["bbox"][1], sp["size"], sp["font"][:24], t[:46]))
    doc.close()


if __name__ == "__main__":
    main()
