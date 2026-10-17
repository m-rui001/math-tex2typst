r"""List products whose canvases carry a frameless measure box, and pick pages to eyeball.

#53 gives a frameless `text width` node a `#box(width:)` with no `stroke:`; the page has to show
wrapped prose and no invented rule. Print the papers and one content line each so a page can be
chosen for a screenshot.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROW = re.compile(r"#box\(width: [^,]+, inset: [^,]+, \[#")
hits = []
for path in sorted(glob.glob(os.path.join("typst", "*", "main.typ"))):
    with open(path, encoding="utf-8", errors="replace") as fh:
        for i, line in enumerate(fh):
            if ROW.search(line):
                hits.append((path, i + 1, line.strip()[:150]))
                break

print("products with a frameless measure box: %d" % len(hits))
for path, i, line in hits[:12]:
    print("%s:%d %s" % (path, i, line))
