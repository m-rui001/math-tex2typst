r"""Count canvases whose drawing has no extent at all: every coordinate in the block is (0, 0).

A node placed by `above right=of lower` whose anchor never resolved lands on the origin, and when
every node of a picture shares that fate the canvas is a stack of boxes on one point with
zero-length arrows -- it compiles, it is counted as converted, and the page shows nothing.  The read
is the product (`typst/*/main.typ`), not the source, because a static `cetz.build` pass over the
flat papers disagrees with the emitters on what reaches CeTz at all.
"""
import glob
import io
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

COORD = re.compile(r"\((-?[\d.e]+)?\s*,\s*(-?[\d.e]+)?\)")
papers = degenerate = 0
hits = []
for path in sorted(glob.glob(r"E:\math\typst\*\main.typ")):
    papers += 1
    text = open(path, encoding="utf-8").read()
    for block in re.findall(r"#cetz\.canvas\(\{(.*?)\n\}\)", text, re.S):
        coords = COORD.findall(block)
        if not coords:
            continue
        if all(x in ("0", "0.0", "") and y in ("0", "0.0", "") for x, y in coords):
            # a lone origin coordinate is normal (one node); a picture that only has those is not
            if len(coords) >= 3:
                degenerate += 1
                hits.append((path.split("\\")[-2][:60], len(coords),
                             re.search(r"content\(\([^)]*\)[^,]*", block).group(0)[:70]))
print("papers=%d canvases_total=%s degenerate=%d" % (papers, "", degenerate))
for name, n, sample in hits[:20]:
    print("  %-62s coords=%d  %s" % (name, n, sample))
