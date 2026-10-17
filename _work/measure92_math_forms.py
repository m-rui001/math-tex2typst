r"""What does the page show for each candidate emission of the 29 refused in-figure formulas?

`math_safe` refuses a string because Typst's lexer would trip on it -- that is the claim, and
#47's lesson is that the claim has to be handed to Typst case by case
(`_work/measure_refused_formulas.py` did exactly this for the old allow-list and all 80 forms
SET).  So before touching the guard, ask the authority one candidate per page and read back the
CHARACTERS, not the return code: a legal-but-wrong output is precisely what a compile gate is
blind to.

Each case is one document, one page, `typst compile`; the text layer is pulled out with fitz and
NFKD-folded so a math letter (`U+1D45B`) reads as the letter it stands for.

  python _work/measure92_math_forms.py
"""
import os
import re
import shutil
import subprocess
import sys
import tempfile
import unicodedata

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PRE = "#set page(width: 30cm, height: 6cm, margin: 0.5cm)\n"

CASES = [
    # -- a literal hash: `\#` in TeX is the `#` glyph
    ("hash-bare", "$A#B$"),
    ("hash-string", '$A"#"B$'),
    ("hash-sym", "$A#sym.hash B$"),
    ("hash-esc", r"$A\#B$"),
    # -- a letter fused to a digit, at top level and inside a script group
    ("fused-top", r"$n2^nc$"),
    ("fused-space", r"$n 2^n c$"),
    ("fused-group", r"$W_(s0)$"),
    ("fused-group-space", r"$W_(s 0)$"),
    ("fused-group-string", r'$W_(s"0")$'),
    ("fused-l1", r"$l1$"),
    ("fused-rA2", r"$r_A2^(-j)$"),
    ("fused-1n0", r"$1^n0x$"),
    ("fused-underscore-digits", r"$x_(ab12)$"),
    # -- `*/` looks like the end of a Typst block comment
    ("star-slash", r"$L_*/3$"),
    ("star-slash-space", r"$L_* / 3$"),
    ("star-slash-paren", r"$L_(*) / 3$"),
    ("star-slash-ast", r"$L_(ast) / 3$"),
    ("slash-slash", r"$E//2$"),
    ("slash-slash-space", r"$E / /2$"),
    # -- a leading slash has no atom to divide from
    ("slash-head", r"$\log_N(Na/b) \in [0,1] /b$"),
    ("slash-tail", r"$a/b$"),
]


def fold(text):
    out = unicodedata.normalize("NFKD", text)
    return "".join(c for c in out
                   if unicodedata.combining(c) == 0 and not (0xFE00 <= ord(c) <= 0xFE0F))


tmp = tempfile.mkdtemp(prefix="m92_")
try:
    for name, body in CASES:
        typ = os.path.join(tmp, name + ".typ")
        pdf = os.path.join(tmp, name + ".pdf")
        with open(typ, "w", encoding="utf-8") as fh:
            fh.write(PRE + body + "\n")
        r = subprocess.run(["typst", "compile", "--diagnostic-format", "short", typ, pdf],
                           capture_output=True, text=True, encoding="utf-8", errors="replace")
        if not os.path.exists(pdf):
            print("%-22s FAILED  %s" % (name, (r.stderr or "").strip().splitlines()[:1]))
            continue
        doc = fitz.open(pdf)
        text = fold(doc[0].get_text())
        doc.close()
        flat = re.sub(r"\s+", " ", text).strip()
        print("%-22s ok        %s" % (name, flat))
finally:
    shutil.rmtree(tmp, ignore_errors=True)
