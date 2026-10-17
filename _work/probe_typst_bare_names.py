r"""Does Typst render a bare math name as a glyph, or as its own letters?

pandoc echoed 29 of the leaked names unchanged (``$approx$``, ``$deg$``), which is only a
correct spelling if Typst reads that name as a symbol.  One page per candidate, then fitz
reads the page back: letters come out as the word, a glyph comes out as something else.
"""
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "typstnames")
NAMES = """Im Psi Re approx asymp bullet chi cos cot csc deg dim div exp inf ker liminf max
min perp sec sharp sin sum sup supset tan tanh top""".split()


def main():
    sys.stdout.reconfigure(errors="replace")
    if not os.path.isdir(OUT):
        os.makedirs(OUT)
    body = "\n#pagebreak(weak: true)\n".join("$%s$" % n for n in NAMES)
    open(os.path.join(OUT, "n.typ"), "w", encoding="utf-8").write(body)
    r = subprocess.run(["typst", "compile", os.path.join(OUT, "n.typ"),
                        os.path.join(OUT, "n.pdf")], capture_output=True, cwd=OUT)
    if r.returncode:
        print("typst failed:", r.stderr.decode("utf-8", "replace")[:1200])
        return
    d = fitz.open(os.path.join(OUT, "n.pdf"))
    glyph, letters, missing = [], [], []
    for i, n in enumerate(NAMES):
        txt = d[i].get_text().strip() if i < d.page_count else ""
        if txt == n:
            letters.append(n)
        elif txt == "":
            missing.append(n)
        else:
            glyph.append((n, txt))
    print("%d names -> %d render a GLYPH (typst knows the name), %d print their letters, %d empty"
          % (len(NAMES), len(glyph), len(letters), len(missing)))
    print("glyph: " + " ".join("%s(%s)" % (n, t) for n, t in glyph))
    print("letters: " + " ".join(letters))
    print("empty: " + " ".join(missing))


if __name__ == "__main__":
    main()
