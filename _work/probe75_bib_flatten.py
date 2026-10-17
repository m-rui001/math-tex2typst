r"""Face of the bib flattening, measured on the products as they stand.

Reading each refs.bib back through flatten_bib_fields is both the churn gauge
(which papers change at all) and the acceptance test (does the converted text still
carry a dollar, a control word, a caret). Samples print before/after pairs so the
spelling is judged by reading, not by a token count.
"""
import io
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
from t2t import convert  # noqa: E402

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace",
                              newline="")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")
LEFT = re.compile(r"\$|\\[A-Za-z]{2,}|[\^_]|\{\}")

changed = []
samples = []
before_tokens = 0
after_tokens = 0
residual = []
for name in sorted(os.listdir(TYPST)):
    bib = os.path.join(TYPST, name, "refs.bib")
    if not os.path.isdir(os.path.join(TYPST, name)) or not os.path.exists(bib):
        continue
    text = open(bib, encoding="utf-8", errors="replace").read()
    out = convert.flatten_bib_fields(text)
    before_tokens += len(LEFT.findall(text))
    after_tokens += len(LEFT.findall(out))
    for field in re.findall(r"(?im)^\s*(?:title|note|howpublished|booktitle|journal)\s*=\s*\{([^{}]*)\}", out):
        if LEFT.search(field):
            residual.append((name[:38], field[:90]))
    if out != text:
        changed.append(name)
        for line_before, line_after in zip(text.splitlines(), out.splitlines()):
            if line_before != line_after and len(samples) < 10:
                samples.append((name[:38], line_before.strip()[:100], line_after.strip()[:100]))

print("bib files flattened: %d papers changed" % len(changed))
print("markup tokens in bib text: %d before -> %d after" % (before_tokens, after_tokens))
print("fields still carrying markup: %d" % len(residual))
for name, field in residual[:10]:
    print("  %s | %s" % (name, field))
for name, before, after in samples:
    print("\n  %s\n    - %s\n    + %s" % (name, before, after))
open(os.path.join(ROOT, "_work", "regen_needed.txt"), "w", encoding="utf-8").write(
    "\n".join(changed) + "\n")
print("\nwrote %d names to _work/regen_needed.txt" % len(changed))
