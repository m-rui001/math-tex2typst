"""Flatten only inlines a line-initial \\input. Find what the flat files still carry.

A literal \\input{x} left in _work/flat/<paper>.tex is a file TeX would have read and we
did not. Run: python _work/probe_midline_input.py
"""
import pathlib
import re

FLAT = pathlib.Path(__file__).resolve().parents[1] / "_work" / "flat"
CMD_RX = re.compile(r"\\(?:input|include|subfile)\s*\{([^{}]*)\}")

hits = {}
for tex in sorted(FLAT.glob("*.tex")):
    for m in CMD_RX.finditer(tex.read_text(encoding="utf-8", errors="replace")):
        hits.setdefault(m.group(1).strip(), []).append(tex.stem)

print("distinct unresolved targets: %d ; files: %d" % (len(hits), len({f for v in hits.values() for f in v})))
bib = {k: v for k, v in hits.items()
       if re.search(r"(?:refer|bib|ref$)", k, re.I)}
print("looks like a bibliography:", len(bib), "targets,",
      len({f for v in bib.values() for f in v}), "papers")
for k, v in sorted(bib.items(), key=lambda x: -len(x[1]))[:15]:
    print("  %-28s %d papers  e.g. %s" % (k, len(v), v[0][:48]))
print("other targets:")
for k, v in sorted(hits.items(), key=lambda x: -len(x[1]))[:15]:
    if k not in bib:
        print("  %-28s %d papers" % (k, len(v)))
