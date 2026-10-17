r"""The pictures whose node font size is a bare size command inside a node body."""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
BARE = re.compile(r"\\(tiny|scriptsize|footnotesize|small|large)\b")


def main():
    sys.stdout.reconfigure(errors="replace")
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(text):
            # a bare size not preceded by 'font='
            for m in BARE.finditer(p):
                if p[max(0, m.start() - 6):m.start()].rstrip().endswith("font="):
                    continue
                print("=== %s" % os.path.basename(src)[:-4][:60])
                print(p[m.start() - 40:m.start() + 60].replace("\n", " "))
                break


if __name__ == "__main__":
    main()
