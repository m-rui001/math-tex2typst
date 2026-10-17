r"""Does the vertical ink law give back the node boxes pdflatex measured?

`_work/measure_node_vertical_ink.py` set 24 labels -- prose, maths, scripts, fractions, roots,
delimiters -- inside an undimensioned `\node` at article's 10, 11 and 12pt and read the box off
pdflatex; `_work/measure_node_vertical_ink_small.py` did the same at a `font=\small` label, which is
the case the class-size runs cannot see because the node's own font and the document's differ. This
feeds the same labels to `cetz._text_height` and prints the two totals side by side: the law is worth
writing into the converter only if it answers what the engine answered, and the rows it cannot reach
are the residuals the ledger has to carry. Reading, not re-measuring: the measured files are the
record.

The class of the measured document is the engine's body size -- pgf freezes its default `inner sep`
there and so does cetz -- so a `[12pt]` section is replayed with NODE_BODY_SIZE_PT at 12 and a bare
node, and the \small section with the body at 10 and `font=\small` on the node.
"""
import io
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# (file, the section header, the node options that spell that section's font)
MEASURED = [(os.path.join(ROOT, "_work", "node_vertical_ink.txt"),
             re.compile(r"^=== documentclass\[(\d+)pt\] ===$"), None),
            (os.path.join(ROOT, "_work", "node_vertical_ink_small.txt"),
             re.compile(r"^=== font=\\small"), {"font": "\\small"})]
ROW = re.compile(r"^(.*?)\s+([\d.]+)\s+([\d.]+)\s+([\d.]+)\s+([\d.]+)\s+\|")


def rows_for(path, section, opts):
    out = []
    matched = None
    for line in io.open(path, encoding="utf-8"):
        m = section.match(line.strip())
        if m:
            matched = float(m.group(1)) if m.groups() else 10.0
            continue
        m = ROW.match(line)
        if m is not None and matched is not None:
            out.append((matched, opts, m.group(1), float(m.group(4))))
    return out


def main():
    rows = []
    for path, section, opts in MEASURED:
        rows += rows_for(path, section, opts)

    body = cetz.NODE_BODY_SIZE_PT
    print("%-6s %-22s %9s %9s %8s" % ("size", "label", "pdflatex", "cetz", "diff pt"))
    worst_under = worst_over = (0.0, "")
    for size, opts, label, total in rows:
        cetz.NODE_BODY_SIZE_PT = size
        got = cetz._text_height(dict(opts or {}), None, label)
        if got is None:
            print("%-6s %-22s %9.4f %9s" % (size, label, total, "None"))
            continue
        ours = got / cetz.UNITS["pt"]
        diff = ours - total
        print("%-6s %-22s %9.4f %9.4f %+8.4f" % (size, label, total, ours, diff))
        if diff < worst_under[0]:
            worst_under = (diff, label)
        if diff > worst_over[0]:
            worst_over = (diff, label)
    cetz.NODE_BODY_SIZE_PT = body
    print("\nrows: %d" % len(rows))
    print("largest under-price: %+.4f pt (%s)" % worst_under)
    print("largest over-price:  %+.4f pt (%s)" % worst_over)


if __name__ == "__main__":
    main()
