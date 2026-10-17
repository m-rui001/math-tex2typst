r"""#93's residue: the 12 canvas slashes left on the products are TeX's ITALIC CORRECTION, `\\/`.

The round's law is about a slash the author means as DIVISION.  `\\/` is a different sign: it asks
for a hair of slant correction and draws NOTHING in TeX, and it is the one slash shape the emitter's
new pass does not own -- the products still carry it.  This counts its face so the next round starts
with a number instead of a guess, and asks the one question that decides whether the new pass can
ever corrupt it: does `\\/` reach `_math_body` anywhere in the corpus?

Read-only: the flat sources, the emission dump `_work/m93_slash_sites2.tsv`, and the shipped
canvases.  No typst, no compile.

  python _work/probe93_italic_face.py
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import TY, canvases  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402


def main():
    flat = os.path.join(ROOT, "_work", "flat")
    src_papers = src_sites = 0
    for name in sorted(os.listdir(flat)):
        if not name.endswith(".tex"):
            continue
        text = open(os.path.join(flat, name), encoding="utf-8", errors="replace").read()
        n = len(re.findall(r"(?<=\\)/", text))
        if n:
            src_papers += 1
            src_sites += n

    dump = os.path.join(ROOT, "_work", "m93_slash_sites2.tsv")
    emitted = []
    for line in open(dump, encoding="utf-8"):
        parts = line.rstrip("\n").split("\t")
        if len(parts) >= 5 and re.search(r"(?<=\\)/", parts[4]):
            emitted.append((parts[0][:40], parts[4][:70]))

    papers = shipped = strings = 0
    for d in sorted(os.listdir(TY)):
        path = os.path.join(TY, d, "main.typ")
        if not os.path.exists(path):
            continue
        text = open(path, encoding="utf-8", errors="replace").read()
        hit = 0
        for c in canvases(text):
            for s in re.findall(r"\$[^$]*\$", c):
                n = len(re.findall(r"(?<=\\)/", s))
                if n:
                    strings += 1
                    shipped += n
                    hit += n
        if hit:
            papers += 1

    print("\\/ in flat sources      : %d sites over %d papers" % (src_sites, src_papers))
    print("\\/ in emission dump     : %d records %s" % (len(emitted), emitted[:3]))
    print("\\/ in shipped canvases  : %d slashes in %d maths strings over %d papers"
          % (shipped, strings, papers))
    # can the new pass corrupt it?  feed the shape to the emitter and read what comes back
    for tex in (r"X \/ G", r"A\/B", r"1/2"):
        body = cetz._math_body(tex)
        print("   _math_body(%r) -> %r   safe=%s" % (tex, body, cetz.math_safe(body)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
