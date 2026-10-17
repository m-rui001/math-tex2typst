r"""Does an emitted node tilt actually turn the text, or print the call as words?

emit_node writes `content((x, y), [rotate(-90deg)[t]])` for a `\node[rotate=90]`. Inside a CeTz
canvas the body of `content` is *content* mode, where a function call needs a leading `#` --
`_work/probe_node_box.py` proved that for `box`. So a bare `rotate(...)` may be literal text.
Compiles three spellings and reads them back: the words on the page, and the aspect of the glyph
box (a turned 12-letter label is tall and narrow, an unturned one is wide).
"""
import subprocess
import sys

import pymupdf

FORMS = {
    "as shipped": r'content((0, 0), [rotate(-90deg)[VerticalLabel]])',
    "hash call": r'content((0, 0), [#rotate(-90deg, [VerticalLabel])])',
    "plain text": r'content((0, 0), [VerticalLabel])',
}

which = sys.argv[1] if len(sys.argv) > 1 else None
for name, line in FORMS.items():
    if which and which not in name:
        continue
    src = '#import "@preview/cetz:0.5.0"\n#cetz.canvas({\n  import cetz.draw: *\n  %s\n})\n' % line
    open("_work/probe_rotate.typ", "w", encoding="utf-8").write(src)
    r = subprocess.run(["typst", "compile", "--format", "pdf", "_work/probe_rotate.typ",
                        "_work/probe_rotate.pdf"],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode:
        print("%-12s COMPILE FAILED: %s" % (name, (r.stderr or "")[:200].replace("\n", " ")))
        continue
    doc = pymupdf.open("_work/probe_rotate.pdf")
    words = doc[0].get_text()
    literal = "rotate" in words
    spans = [b for b in doc[0].get_text("blocks") if "VerticalLabel" in b[4] or "rotate" in b[4]]
    geo = ""
    if spans:
        b = spans[0]
        geo = "bbox %.4g x %.4g" % (b[2] - b[0], b[3] - b[1])
    print("%-12s prints call as words: %-5s  %s  text=%r" % (name, literal, geo, words.strip()[:60]))
