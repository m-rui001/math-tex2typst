r"""Do the three figures' body definitions hit the expansion traps?

Every trap the corpus has taught this pipeline about user macros, checked against the definitions the
patch now folds in, because a body-scoped macro is exactly where they hide: a `%` comment eats the rest
of the line once the body is spliced into a one-line statement, a `[default]` first argument is read
only by a parser that knows the bracket, `##` in a body means one literal `#`, a brace that does not
balance means the rest of the picture is swallowed, and `\\node` next to an argument must not grow a
space that fuses into a different control word.
"""
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
sys.path.insert(0, os.path.join(ROOT, "_work", "pic-authmacros"))
from t2t import convert, prep  # noqa: E402

PAPERS = {
    "cylinder": ("Cylinder-amplitudes-and-logarithmic-bridge-length-windows-on-the-honeycomb-lattice-September-26-2026",
                 "FiniteSquare"),
    "gff": ("Gaussian-free-field-limits-of-weighted-integer-Lipschitz-heights-September-25-2026",
            "pinsgroup"),
    "peps": ("Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026",
             "geometryrow"),
}
NAME_RX = re.compile(r"\\newcommand\{?\\([A-Za-z]+)")

for tag, (name, marker) in PAPERS.items():
    src = open(os.path.join(ROOT, "_work", "flat", name + ".tex"), encoding="utf-8").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.unwrap_boxes(body)
    scopes = convert.picture_scopes(body, p.macros)
    spans = list(convert.TIKZ_SPAN.finditer(body))
    for i, m in enumerate(spans):
        if marker not in m.group(0):
            continue
        table, decls = scopes[i]
        print("== %s pic#%d, scope has %d names, %d decl lines" % (
            tag, i, len(table), decls.count("\n") + 1 if decls else 0))
        region = body[:m.start()]
        for nm in NAME_RX.findall(region):
            mac = table.get("\\" + nm)
            if mac is None:
                print("   %%-18s NOT in the table" % nm)
                continue
            pct = len(re.findall(r"(?<!\\)%", mac.body))
            hashes = len(re.findall(r"##", mac.body))
            opens = len(re.findall(r"(?<!\\)\{", mac.body))
            closes = len(re.findall(r"(?<!\\)\}", mac.body))
            glued = len(re.findall(r"\\[A-Za-z]+#[0-9]", mac.body))
            print("   %-18s nargs=%d opt=%r  %%=%d ##=%d braces=%d/%d #1-after-word=%d" % (
                nm, mac.nargs, mac.opt, pct, hashes, opens, closes, glued))
        # does an expansion ever weld a control word onto what follows it?
        core = prep.expand_macros(convert.with_declarations(m.group(0), decls) if decls
                                  else m.group(0), table)
        fused = re.findall(r"\\(?:finite|pins|geometry)[A-Za-z]*[A-Za-z]", core)
        print("   fused names after expansion:", set(fused) or "none")
        for bad in ("##", "\\\\#"):
            if bad in core:
                print("   literal %s left in the core:", bad)
