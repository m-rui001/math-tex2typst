"""Census: papers whose emitted main.typ wraps a table in #figure, by row count.

A non-breakable figure that is taller than one page overflows the page bottom instead of
splitting, so row count is the risk signal.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

buckets = {"1-12": 0, "13-25": 0, "26-40": 0, "41+": 0}
big = []
total_tables = 0
papers_with_table = 0
for main in sorted((ROOT / "typst").glob("*/main.typ")):
    txt = main.read_text(encoding="utf-8", errors="replace")
    hits = 0
    for m in re.finditer(r"#figure\(\s*\n\s*table\(", txt):
        seg = txt[m.start() : m.start() + 400000]
        cap = seg.find("caption:")
        blk = seg[: cap if cap > 0 else 200000]
        n = blk.count("table.cell(")
        ncol = 1
        mm = re.search(r"columns: (\d+)", blk)
        if mm:
            ncol = max(1, int(mm.group(1)))
        rows = n // ncol
        total_tables += 1
        hits += 1
        if rows <= 12:
            buckets["1-12"] += 1
        elif rows <= 25:
            buckets["13-25"] += 1
        elif rows <= 40:
            buckets["26-40"] += 1
        else:
            buckets["41+"] += 1
            big.append((rows, main.parent.name))
    if hits:
        papers_with_table += 1

print("table figures:", total_tables, " papers with one:", papers_with_table)
for k, v in buckets.items():
    print("  %-6s %d" % (k, v))
big.sort(reverse=True)
print("largest:")
for rows, name in big[:20]:
    print("  %4d rows  %s" % (rows, name[:70]))
print("papers with >=26 rows:", len({n for _, n in big}) + buckets["26-40"])
