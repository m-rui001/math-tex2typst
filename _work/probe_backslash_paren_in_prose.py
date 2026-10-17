r"""Does a `\( ... \)` ever stand in the PROSE rather than inside a formula?

Inside `$ $` the pair prints as the parentheses the author meant (measured on the page: `H \( K \)`
gives `H(𝐾)`, `$\[ 4 \]$` gives `[4]`), so those 704 papers are not a defect.  In prose Typst prints
the same two tokens as a pair of brackets around italic text that the source never wrote, so the
reading here walks `$` to tell the two apart instead of matching a line.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

hits = []
for path in sorted(glob.glob(os.path.join(r"E:\math", "typst", "*", "main.typ"))):
    name = os.path.basename(os.path.dirname(path))
    text = open(path, encoding="utf-8").read()
    # a formula in Typst runs from one `$` to the next; outside one, `\(` is prose
    seen = 0
    parts = re.split(r"(\$[^$]*\$)", text)
    for i, chunk in enumerate(parts):
        if i % 2:
            seen += len(chunk)
            continue
        for m in re.finditer(r"\\[\(\)]", chunk):
            line = text.count("\n", 0, seen + m.start()) + 1
            shown = chunk[max(0, m.start() - 55):m.start() + 45].replace("\n", " ")
            hits.append((name[:46], line, shown))
        seen += len(chunk)
print("prose-level \\( \\) hits: %d in %d papers" % (len(hits), len({h[0] for h in hits})))
for name, line, shown in hits[:14]:
    print("  %-46s:%-5s %s" % (name, line, shown))
