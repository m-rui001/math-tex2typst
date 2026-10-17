r"""Is \Pic in the paper's own macro table, and what would expanding it print?

Reads one flat paper's preamble with the pipeline's own parser, then asks pandoc to render both
the unexpanded command and the expanded text, so the page can be compared against pdflatex rather
than against a guess.
"""
import os
import subprocess
import sys

ROOT = r"E:/math"
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import macros, prep  # noqa: E402

name = sys.argv[1] if len(sys.argv) > 1 else (
    "Abundance-in-numerical-dimension-one-for-terminal-threefolds-in-positive-characteristic"
    "-September-24-2026")
src = open(os.path.join(ROOT, "_work/flat", name + ".tex"), encoding="utf-8",
           errors="replace").read()
pre_text, body = prep.split_document(src)
table, skipped = macros.parse_definitions(pre_text)
print("preamble keys with 'pic' or 'Spec': %s"
      % sorted(k for k in table if "pic" in k.lower() or "spec" in k.lower()))
for k in sorted(table):
    if k.lower() in ("pic", "spec"):
        print("  %s -> %r" % (k, table[k]))
print("skipped: %s" % (list(skipped)[:8] if not isinstance(skipped, int) else skipped,))
print("DeclareMathOperator lines in preamble:")
for line in pre_text.splitlines():
    if "DeclareMathOperator" in line:
        print("   %s" % line.strip()[:100])

exp = macros.expand(src if False else "$\\Pic(|D|,\\cR)$", table) if hasattr(macros, "expand") else None
print("expand() available: %s -> %r" % (hasattr(macros, "expand"), exp))


def pandoc(latex):
    p = subprocess.run(["pandoc", "-f", "latex", "-t", "typst"],
                       input=latex.encode(), capture_output=True)
    return p.stdout.decode("utf-8", "replace").strip()


for probe in (r"$\Pic(|D|)$", r"$\operatorname{Pic}(|D|)$", r"$\mathrm{Pic}(|D|)$", r"$Pic(|D|)$"):
    print("%-28s -> %s" % (probe, pandoc(probe)))
