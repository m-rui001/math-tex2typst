r"""How many sized tikzpictures now emit a node size, measured by rebuilding the canvas.

For every picture in the flattened sources whose TeX names a node font size, run the converter
and ask whether the canvas it returns carries a `size:` directive. This reads the fix directly,
without waiting on a full batch.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NAME = r"(small|footnotesize|scriptsize|tiny|large|Large|LARGE|huge|Huge|normalsize)"
SIZES = re.compile(r"font\s*=\s*\\?%s" % NAME
                   + r"|font\s*=\s*\\fontsize\{([\d.]+)\}"
                   + r"|\\fontsize\{([\d.]+)\}"
                   + r"|\\(%s)\b" % NAME)
TYP_SIZE = re.compile(r"size:\s*[\d.]+pt")


def main():
    sys.stdout.reconfigure(errors="replace")
    sized = refused = with_size = 0
    body_only = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(text):
            if not SIZES.search(p):
                continue
            sized += 1
            got = cetz.build(p)
            if got is None:
                refused += 1
                continue
            if TYP_SIZE.search(got):
                with_size += 1
            else:
                # a bare `\small` inside a node body is not an option we read
                body_only += 1
    print("sized pictures            %d" % sized)
    print("  converter refused       %d" % refused)
    print("  canvas carries a size   %d (%.0f%% of sized)"
          % (with_size, 100.0 * with_size / max(sized, 1)))
    print("  no size (body-only cmd) %d" % body_only)


if __name__ == "__main__":
    main()
