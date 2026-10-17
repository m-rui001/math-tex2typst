r"""Oracle: which Typst spelling of a citation survives *inside* `$ ... $` with an external bib?

Each candidate is compiled on its own page and read back from the PDF, so the answer is the glyph
the page shows, not what the docs promise.
"""
import io
import os
import pathlib
import shutil
import subprocess
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
WORK = ROOT / "_work" / "cite_math_oracle"
WORK.mkdir(exist_ok=True)
shutil.copy(ROOT / "typst/Uniform-indices-for-semi-log-canonical-log-Calabi-Yau-pairs-October-5-2026/refs.bib",
            WORK / "refs.bib")

CANDIDATES = {
    "parenthetical": r'$ a = b #h(1em) #cite(<Birkar2023>, form: "parenthetical") $',
    "prose": r'$ a = b #h(1em) #cite(<Birkar2023>, form: "prose") $',
    "auto": r'$ a = b #h(1em) #cite(<Birkar2023>) $',
    "with-note": r'$ a = b #h(1em) #cite(<Birkar2023>, form: "parenthetical") #text("[, Corollary 1.4]") $',
    "text-call": r'$ a = b #h(1em) #text[#cite(<Birkar2023>), thinspace Corollary thinspace 1.4] $',
    "supplement": r'$ a = b #h(1em) #cite(<Birkar2023>, form: "parenthetical", supplement: [Corollary 1.4]) $',
}
for name, body in CANDIDATES.items():
    typ = WORK / ("%s.typ" % name)
    typ.write_text('#set page(width: 300pt, height: 90pt)\n'
                   '#import "@preview/cetz:0.5.0"\n' + body +
                   '\n#bibliography("refs.bib", style: "ieee")\n', encoding="utf-8")
    proc = subprocess.run(["typst", "compile", str(typ), str(WORK / ("%s.pdf" % name))],
                          capture_output=True)
    if proc.returncode != 0:
        err = (proc.stderr or b"").decode("utf-8", "replace").strip().splitlines()
        print("%-14s FAILED: %s" % (name, " | ".join(err[:3])[:180]))
        continue
    doc = fitz.open(str(WORK / ("%s.pdf" % name)))
    text = " ".join(p.get_text() for p in doc).strip().replace("\n", " ")
    doc.close()
    print("%-14s OK: %r" % (name, text[:120]))
