r"""Per-canvas audit: does a picture that asks for a small node font actually get one?

Two counts are joined per paper.  On the TeX side a tikzpicture names a node font size
(`font=\small`, a style that does, or a bare `\small`).  On the Typst side the picture becomes a
`canvas({ ... })` block, and the only way its words can come out smaller than the 11 pt body is a
size directive inside that same block.  Searching the whole page would let a body `set text` pass a
canvas off as styled, so each canvas block is isolated by brace matching before it is looked at.

Precedence rule used below: a canvas is a failure when its source picture asked for a size and the
block itself carries none.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SIZES = re.compile(r"font\s*=\s*\\?(small|footnotesize|scriptsize|tiny|large|Large|LARGE|huge|Huge|normalsize)"
                   r"|font\s*=\s*\\fontsize\{([\d.]+)\}"
                   r"|\\fontsize\{([\d.]+)\}"
                   r"|\\(small|footnotesize|scriptsize|tiny|large)\b")
CANVAS = re.compile(r"canvas\(")
TYP_SIZE = re.compile(r"size:\s*[\d.]+pt|text\(\s*[\d.]+pt|fontsize")
CONTENT = re.compile(r"^\s*content\(")


def canvas_blocks(text):
    """Each `canvas({ ... })` body, found by matching braces from the opening one."""
    out = []
    for m in CANVAS.finditer(text):
        i = text.find("{", m.end() - 1)
        if i < 0:
            continue
        depth = 0
        for j in range(i, len(text)):
            if text[j] == "{":
                depth += 1
            elif text[j] == "}":
                depth -= 1
                if depth == 0:
                    out.append(text[i + 1:j])
                    break
    return out


def main():
    sys.stdout.reconfigure(errors="replace")
    pics_total = pics_sized = 0
    canvases = 0
    canvases_styled = 0
    papers = papers_with_pics = 0
    bad = []
    sizes = Counter()
    lines_total = lines_quoted = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        name = os.path.basename(src)[:-4]
        typ = os.path.join(ROOT, "typst", name, "main.typ")
        if not os.path.exists(typ):
            continue
        papers += 1
        body = open(src, encoding="utf-8", errors="replace").read()
        pics = PIC.findall(body)
        if not pics:
            continue
        papers_with_pics += 1
        asked = 0
        for p in pics:
            pics_total += 1
            m = SIZES.search(p)
            if m:
                asked += 1
                pics_sized += 1
                sizes[m.group(1) or m.group(2) or m.group(3) or m.group(4) or "?"] += 1
        text = open(typ, encoding="utf-8", errors="replace").read()
        blocks = canvas_blocks(text)
        if not blocks:
            continue
        for b in blocks:
            canvases += 1
            lines = [l for l in b.splitlines() if CONTENT.match(l)]
            lines_total += len(lines)
            lines_quoted += len([l for l in lines if '"' in l])
            if TYP_SIZE.search(b):
                canvases_styled += 1
        if asked and not any(TYP_SIZE.search(b) for b in blocks):
            bad.append((name, asked, len(blocks)))
    print("papers scanned %d, with tikzpictures %d" % (papers, papers_with_pics))
    print("pictures %d, of which a node font size is named %d (%.0f%%)"
          % (pics_total, pics_sized, 100.0 * pics_sized / max(pics_total, 1)))
    print("canvas blocks %d, carrying a size directive %d (%.0f%%)"
          % (canvases, canvases_styled, 100.0 * canvases_styled / max(canvases, 1)))
    print("canvas lines %d, quoted-text lines %d" % (lines_total, lines_quoted))
    print("sizes named:", sizes.most_common(12))
    print("papers that ask for a node size and emit none: %d" % len(bad))
    for name, asked, nb in bad[:15]:
        print("  %s  pictures-asking=%d canvases=%d" % (name[:70], asked, nb))


if __name__ == "__main__":
    main()
