r"""Product scan for `rounded corners`.

Reads the products, not the sources. The key can reach the page on two emitted shapes -- a rectangle
path (`rect(.., .., radius:)`) and a node's frame (`#box(inset: .., radius: ..)`) -- so both count as
the rounding having landed. A paper whose pictures ask for the key and whose product carries neither is
the residual list; those cases are then read statement by statement (`_work/probe_rounded_missing.py`),
because a polyline's corners are a different story from a rectangle's.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

PATH = re.compile(r"rect\([^\n]*?radius:")
FRAME = re.compile(r"#box\([^\n]*?radius:")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def main():
    asks, rects, boxes, silent = 0, 0, 0, []
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        src = open(path, encoding="utf-8", errors="replace").read()
        here = len(PATH.findall(src))
        frame = len(FRAME.findall(src))
        rects += here
        boxes += frame
        tex = os.path.join(ROOT, "_work", "flat", stem + ".tex")
        if not os.path.exists(tex):
            continue
        pics = PIC.findall(open(tex, encoding="utf-8", errors="replace").read())
        if not pics or "rounded corners" not in "".join(pics):
            continue
        asks += 1
        if not (here or frame):
            silent.append(stem)
    print("rounded in products: rect paths %d, node frames %d" % (rects, boxes))
    print("papers whose pictures ask for rounded corners: %d  of them with nothing rounded: %d"
          % (asks, len(silent)))
    for stem in silent:
        print("  " + stem[:60])


if __name__ == "__main__":
    main()
