"""Does the metadata anchor move anything on the page? Compare against a document with no anchor."""
import subprocess
import sys
import tempfile
from pathlib import Path

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

HEAD = '#set page(width: 300pt, height: auto, margin: 10pt)\n'
CASES = [
    ("no anchor at all", "== Heading <h>\n\nBody text after. #link(<h>)[the heading].\n"),
    ("metadata anchor", '== Heading <h>\n\n#metadata(none)\n#label("a")\n\n'
                        "Body text after. #link(<h>)[the heading].\n"),
    ("metadata anchor, linked", '== Heading <h>\n\n#metadata(none)\n#label("a")\n\n'
                                "Body text after. #link(<a>)[a] and #link(<h>)[h].\n"),
    ("anchor after a paragraph", "Para one.\n\n#metadata(none)\n#label(\"a\")\n\nBody text after.\n"),
    ("same, no anchor", "Para one.\n\nBody text after.\n"),
]

with tempfile.TemporaryDirectory() as d:
    for name, body in CASES:
        src, pdf = Path(d, "t.typ"), Path(d, "t.pdf")
        src.write_text(HEAD + body, encoding="utf-8")
        proc = subprocess.run(["typst", "compile", str(src), str(pdf)],
                              capture_output=True, encoding="utf-8", errors="replace")
        doc = fitz.open(str(pdf))
        try:
            words = doc[0].get_text("words")
            ys = sorted({round(w[1], 2) for w in words})
            text = doc[0].get_text().replace("\n", " ")[:60]
        finally:
            doc.close()
        print("%-26s rc=%d warns=%d  line_ys=%s" % (
            name, proc.returncode,
            len([l for l in (proc.stderr or "").splitlines() if l.startswith(("warning", "error"))]),
            ys))
        print("      text: %r" % text)
