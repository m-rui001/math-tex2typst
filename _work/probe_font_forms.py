r"""Which pictures ask for a node font, in which spelling.

`font=\small` is the dominant spelling, but it arrives three ways: on the node itself, on a named
style that `every node/.style` invokes, and on the `tikzpicture` option list where TikZ applies it to
every node in the picture.  Each needs a different place in the converter to reach the canvas, so the
forms are counted separately before any of them is implemented.
"""
import collections
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
HEAD = re.compile(r"\\begin\{tikzpicture\}\s*(\[[^\]]*\])?")
FONT = re.compile(r"font\s*=\s*([^,;{}\]]+)")


def main():
    sys.stdout.reconfigure(errors="replace")
    pics = with_font = head_font = every_font = 0
    forms = collections.Counter()
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        body = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(body):
            pics += 1
            hits = [h.group(1).strip() for h in FONT.finditer(p)]
            if hits:
                with_font += 1
                for h in hits:
                    forms[re.sub(r"[^A-Za-z0-9{}\\]", "", h)[:24]] += 1
            head = HEAD.match(p)
            if head and head.group(1) and "font" in head.group(1):
                head_font += 1
            if re.search(r"every node/\.style\s*=\s*\{[^{}]*font", p):
                every_font += 1
    print("pictures %d ; any font= %d (%.0f%%) ; on the tikzpicture head %d ; in every node/.style %d"
          % (pics, with_font, 100.0 * with_font / pics, head_font, every_font))
    for name, n in forms.most_common(18):
        print("  %-26s %d" % (name, n))


if __name__ == "__main__":
    main()
