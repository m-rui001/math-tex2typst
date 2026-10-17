r"""Which idiom binds a LaTeX \hypertarget name without stealing the label of what precedes it?

Today `b_div` emits a bare `#label("name")` block. Typst attaches a label to the PRECEDING content,
so when that content is a heading which already carries `<its-own>`, Typst warns "content labelled
multiple times" and keeps only the last one -- the heading silently loses its name
(The-low-temperature-Sherrington-Kirkpatrick, main.typ:1877). Measured here: warnings, whether the
name still resolves as a link target, and whether the idiom moves the paragraph below it.
"""
import subprocess
import sys
import tempfile
from pathlib import Path

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

VARIANTS = [
    ("bare label (current)", '#label("a")'),
    ("metadata + label", '#metadata(none)\n#label("a")'),
    ("metadata with label shorthand", '#metadata(none) <a>'),
    ("empty box + label", '#box[]\n#label("a")'),
    ("no anchor (control)", ''),
]

HEAD = '#set page(width: 300pt, height: auto, margin: 10pt)\n'


def run(d, body):
    src = Path(d, "t.typ")
    src.write_text(HEAD + body, encoding="utf-8")
    pdf = Path(d, "t.pdf")
    proc = subprocess.run(["typst", "compile", str(src), str(pdf)],
                          capture_output=True, encoding="utf-8", errors="replace")
    doc = fitz.open(str(pdf)) if pdf.exists() else None
    y, pages = None, None
    if doc is not None:
        try:
            words = doc[0].get_text("words")
            y = next((w[1] for w in words if w[4] == "Body"), None)
            pages = doc.page_count
        finally:
            doc.close()
    msgs = sorted({l.split(":")[0] + " " + l.split("warning:")[-1].split("error:")[-1].strip()[:60]
                   for l in (proc.stderr or "").splitlines()
                   if l.startswith("warning:") or l.startswith("error:")})
    if proc.returncode:
        msgs.append("STDERR " + (proc.stderr or "")[:300].replace("\n", " | "))
    return proc.returncode, pages, y, msgs


with tempfile.TemporaryDirectory() as d:
    for name, anchor in VARIANTS:
        body = ("== Heading <h>\n\n"
                + (anchor + "\n\n" if anchor else "")
                + "Body text after. #link(<a>)[jump to a] and #link(<h>)[the heading].\n")
        rc, pages, y, msgs = run(d, body)
        print("%-32s rc=%s pages=%s body_y=%s" % (name, rc, pages, y))
        for m in msgs:
            print("      ", m)
