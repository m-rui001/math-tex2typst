r"""Does `\Vdash` reach the page as the glyph the author wrote?

`cetz.MATH_SYMBOLS` maps `\Vdash` to `tack.r.double`, which `_work/measure_symbol_glyphs.py` reads as
U+22A8 -- but LaTeX's `\Vdash` is the DOUBLE-barred tack (U+22AB) and `\vDash` the single-barred one
(U+22A8). If pdflatex and Typst disagree on the codepoint, one paper's forcing relation is printed with
the wrong number of bars, and the fix is a different Typst name, not a rename.

Both authorities are asked, one glyph per page/line, and fitz reads the codepoints back.
"""
import pathlib
import subprocess
import sys

import fitz

D = pathlib.Path(__file__).resolve().parent / "vdash"
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

TEX = [r"\Vdash", r"\vDash", r"\Vdash*", r"\models"]
TYP = ["tack.rr", "tack.r.double", "tack.r.double.bar", "tack.r.bar", "tack.rrr"]


def rows(pdf):
    if not pdf.exists():
        return []
    doc = fitz.open(str(pdf))
    out = [ln.strip() for p in doc for ln in p.get_text().splitlines() if ln.strip()]
    doc.close()
    return out


def cp(s):
    return " ".join("U+%04X" % ord(c) for c in s) or "-"


def main():
    D.mkdir(parents=True, exist_ok=True)
    tex = D / "v.tex"
    tex.write_text("\\documentclass{article}\n\\usepackage{amssymb}\n"
                   "\\usepackage[paperwidth=3in,paperheight=3in,margin=6pt]{geometry}\n"
                   "\\begin{document}\n"
                   + "".join("\\[%s\\]\\par\n" % c for c in TEX)
                   + "\\end{document}\n", encoding="utf-8")
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "-output-directory", str(D), str(tex)],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    print("pdflatex rc=%d" % r.returncode)
    for cmd, row in zip(TEX, rows(D / "v.pdf")):
        print("  %-12s %-4s %s" % (cmd, row, cp(row)))
    if not (D / "v.pdf").exists():
        print((r.stdout or "")[-500:])
    for name in TYP:
        t = D / ("t%s.typ" % name)
        t.write_text("#set page(width: 100pt, height: auto, margin: 6pt)\n$%s$\n" % name,
                     encoding="utf-8")
        rr = subprocess.run(["typst", "compile", str(t), str(D / ("t%s.pdf" % name))],
                            capture_output=True, text=True, encoding="utf-8", errors="replace")
        got = rows(D / ("t%s.pdf" % name))
        note = next((ln for ln in (rr.stderr or "").splitlines()
                     if ln.startswith(("error", "warning"))), "")
        print("  typst %-20s %-4s %-14s %s"
              % (name, got[0] if got else "-", cp(got[0]) if got else "-", note))


if __name__ == "__main__":
    main()
