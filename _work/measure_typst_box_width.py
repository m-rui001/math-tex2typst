r"""Does Typst's `box` take a `width:` the way TeX's frame does, and where does it put the text?

The converter draws a `text width=` node's frame with Typst's `box`, so the two questions the fix
turns on are measured here rather than read off documentation: is `width:` the size of the whole
box (inset inside it) or of the content (inset added outside), and does `box` accept an `align:`
at all -- an earlier measurement of this project concluded it does not and centred with
`#align(center)` instead.

Each case compiles as its own page; fitz reads the stroked rectangle's width and the gap from its
left edge to the first glyph. A case Typst refuses prints `refused` with the error's first line.
"""
import os
import re
import subprocess
import sys
import tempfile

import fitz

sys.stdout.reconfigure(errors="replace")

CM = 28.3465
STROKE = 'stroke: (thickness: 0.4pt), '
CASES = [
    ("w4cm-inset-default", '#box(' + STROKE + 'width: 4cm, [ab])'),
    ("w4cm-inset0", '#box(' + STROKE + 'width: 4cm, inset: 0pt, [ab])'),
    ("w4cm-inset8", '#box(' + STROKE + 'width: 4cm, inset: 8pt, [ab])'),
    ("w4cm-align-left", '#box(' + STROKE + 'width: 4cm, align: left, [ab])'),
    ("w4cm-align-center", '#box(' + STROKE + 'width: 4cm, align: center, [ab])'),
    ("w4cm-setalign", '#align(left)[#box(' + STROKE + 'width: 4cm, [ab])]'),
    ("wrap-long", '#box(' + STROKE + 'width: 2cm, [aaaaaaaaaa bbbbbbbbbb cccccccccc dddddddddd])'),
    ("bare", '#box(' + STROKE + '[ab])'),
]


def measure(page):
    rects = [p["rect"] for p in page.get_drawings()
             if p["rect"].width > 10 and p["rect"].height > 5]
    if not rects:
        return None
    rect = max(rects, key=lambda r: r.width * r.height)
    words = [w for w in page.get_text("words")
             if w[0] >= rect.x0 - 1 and w[2] <= rect.x1 + 1]
    if not words:
        return (rect.width, None, None)
    return (rect.width, min(w[0] for w in words) - rect.x0,
            rect.x1 - max(w[2] for w in words))


def main():
    with tempfile.TemporaryDirectory() as tmp:
        pages = []
        for name, body in CASES:
            src = os.path.join(tmp, name + ".typ")
            out = os.path.join(tmp, name + ".pdf")
            open(src, "w", encoding="utf-8").write(
                "#set page(width: 20cm, height: 6cm, margin: 1cm)\n"
                "#set text(size: 10pt)\n" + body + "\n")
            r = subprocess.run(["typst", "compile", src, out], capture_output=True)
            if r.returncode:
                err = (r.stderr or b"").decode("utf-8", "replace")
                first = next((l for l in err.splitlines() if "error" in l), "(no output)")
                print("%-20s REFUSED: %s" % (name, first[:100]))
                continue
            pages.append((name, out))
        print("%-20s %9s %9s %9s %9s" % ("case", "box/cm", "Lgap/cm", "Rgap/cm", "text/cm"))
        for name, out in pages:
            doc = fitz.open(out)
            got = measure(doc[0])
            doc.close()
            if got is None:
                print("%-20s  (no frame)" % name)
                continue
            w, lg, rg = got
            fmt = lambda v: "%9.3f" % (v / CM) if v is not None else "      n/a"
            text = "      n/a" if lg is None else "%9.3f" % ((w - lg - rg) / CM)
            print("%-20s %9.3f %9s %9s %9s" % (name, w / CM, fmt(lg), fmt(rg), text))


if __name__ == "__main__":
    main()
