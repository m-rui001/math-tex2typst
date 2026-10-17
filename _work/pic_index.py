# -*- coding: utf-8 -*-
"""Which picture index in a paper carries the key under review."""
import glob
import re
import sys

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
KEYS = ("bend", "rounded corners")


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    for name in sys.argv[1:]:
        hits = glob.glob("_work/flat/%s*.tex" % name)
        if not hits:
            print("MISSING %s" % name[:40])
            continue
        src = open(hits[0], encoding="utf-8", errors="replace").read()
        print("== %s" % hits[0][11:-4][:70])
        for i, pic in enumerate(PIC.findall(src)):
            marks = [k for k in KEYS if k in pic]
            if marks:
                print("   pic %d %-16s %s" % (i, ",".join(marks),
                                              " ".join(pic.split())[:90]))


if __name__ == "__main__":
    main()
