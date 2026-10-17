"""The figure side of the corpus in one reading: drawn, refused, quoted, still missing.

batch-report.json carries the counters, the generated Typst carries what the reader sees, and the
two disagree by design: a canvas can be emitted and then dropped by the emitter, and a picture
pandoc never showed us counts as neither converted nor refused.
"""
import io
import json
import pathlib
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
EMPTY = re.compile(r"#figure\(\s*\[\],", re.S)
# the emitted string doubles every backslash, so a quoted picture reads '"\\begin{tikzpicture}'
RAW_PIC = re.compile(r'#raw\(block: true, lang: "latex", "\\\\begin\{(?:tikzpicture|tikzcd)')


def main():
    report = json.loads((ROOT / "typst" / "batch-report.json").read_text(encoding="utf-8"))
    rows = report if isinstance(report, list) else report.get("papers", report)
    keys = ("cetz_converted", "cetz_refused", "cetz_split", "figure_content_unhandled")
    tot = Counter()
    papers = Counter()
    refused = []
    for r in rows:
        st = r.get("stats") or {}
        for k in keys:
            tot[k] += st.get(k, 0)
            if st.get(k):
                papers[k] += 1
        if st.get("cetz_refused"):
            refused.append((r["paper"], st["cetz_refused"]))
    print("rows: %d" % len(rows))
    for k in keys:
        print("  %-24s %5d over %3d papers" % (k, tot[k], papers[k]))
    empties = files = 0
    quoted_pics = 0
    for path in sorted((ROOT / "typst").glob("*/*.typ")):
        text = path.read_text(encoding="utf-8", errors="replace")
        n = len(EMPTY.findall(text))
        empties += n
        files += 1 if n else 0
        quoted_pics += len(RAW_PIC.findall(text))
    print("  %-24s %5d over %3d papers" % ("empty figures", empties, files))
    print("  %-24s %5d  (refused pictures shown as source)" % ("quoted pictures", quoted_pics))
    print("\nmost refused in one paper:")
    for name, n in sorted(refused, reverse=True)[:10]:
        print("  %2d  %s" % (n, name[:64]))


main()
