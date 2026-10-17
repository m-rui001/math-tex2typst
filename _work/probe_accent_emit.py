r"""Do TeX's accents in a node body come out as the letter Unicode composes for them?

`_accents` runs before the markup pass deletes command names, so the pair has to be read there or
the accent's punctuation is what reaches the page. This prints what a node body turns into, and for
the two spellings the corpus actually writes (`\"a`, `\'{e}`) plus the letter-form ones (`\v c`,
`\c{c}`, `\H{o}`, `\u{a}`, `\={o}`) checks that the command-name guard keeps `\draw` and `\color`
out of the accent census.
"""
import io
import pathlib
import subprocess
import sys

import fitz

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

BODIES = [
    r'Hyperk\"ahler triple',
    r"caf\'{e} lattic\`{e}",
    r'\v{c}esk\'a \u{a}ppel \={o}ver \H{o}rsch \c{c}ek',
    r'\node (a) at (0,0) {draw a circle}; \color{red}',
    r'$\alpha\beta$',
    r'a "quoted" and \& escaped',
]
for body in BODIES:
    print("%-52r -> %r" % (body, cetz.node_text(body)))

PIC = (r"\begin{tikzpicture}\node[draw] at (0,0) {Hyperk\"ahler caf\'{e} \v{c}esk\'a};"
       r"\end{tikzpicture}")
canvas = cetz.build(PIC)
print("\ncanvas:", canvas.splitlines()[2].strip() if canvas else "(refused)")

if canvas:
    import tempfile
    with tempfile.TemporaryDirectory() as tmp:
        src = pathlib.Path(tmp) / "a.typ"
        src.write_text(cetz.HEADER + "#set page(width: 12cm, height: 4cm)\n"
                       + canvas, encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(src), str(pathlib.Path(tmp) / "a.pdf")],
                           capture_output=True)
        if r.returncode:
            print("typst refused:", r.stderr.decode("utf-8", "replace")[:200])
        else:
            doc = fitz.open(str(pathlib.Path(tmp) / "a.pdf"))
            page = doc[0].get_text()
            doc.close()
            print("page text: %r" % page.strip())
            print("carries the composed letters: %s"
                  % all(w in page for w in ("ä", "é", "č")))
            print("carries a stray accent mark: %s" % any(c in page for c in "\"'`"))

