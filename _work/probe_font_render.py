r"""Compile a sample of sized pictures' canvases to prove the new `#text(size:)` renders.

Each built canvas is dropped into the same minimal page the real pipeline wraps a picture in and
handed to typst. A picture whose canvas fails to compile is printed with its error.
"""
import glob
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
OUT = os.path.join(ROOT, "_work", "fontrender")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NAME = r"(small|footnotesize|scriptsize|tiny|large|Large|LARGE|huge|Huge|normalsize)"
SIZES = re.compile(r"font\s*=\s*\\?%s" % NAME
                   + r"|font\s*=\s*\\fontsize\{([\d.]+)\}"
                   + r"|\\fontsize\{([\d.]+)\}"
                   + r"|\\(%s)\b" % NAME)
TYP_SIZE = re.compile(r"size:\s*[\d.]+pt")
HEAD = """#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

%s
"""


def main():
    sys.stdout.reconfigure(errors="replace")
    os.makedirs(OUT, exist_ok=True)
    picked = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for i, p in enumerate(PIC.findall(text)):
            if not SIZES.search(p):
                continue
            got = cetz.build(p)
            if got is None or not TYP_SIZE.search(got):
                continue
            picked += 1
            name = "%s_%d" % (os.path.basename(src)[:-4][:40], i)
            typ = os.path.join(OUT, name + ".typ")
            with open(typ, "w", encoding="utf-8") as fh:
                fh.write(HEAD % got)
            r = subprocess.run(["typst", "compile", typ], capture_output=True)
            if r.returncode:
                err = (r.stderr or b"").decode("utf-8", "replace")
                print("FAIL %s" % name)
                print(re.sub(r"[^\x20-\x7e\n]", "?", err)[:900])
            if picked >= 25:
                print("compiled %d canvases, done" % picked)
                return
    print("compiled %d canvases" % picked)


if __name__ == "__main__":
    main()
