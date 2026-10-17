r"""What Typst's `inset:` costs on a box that hugs its own text -- the frame `#box(` draws for a node
whose measure the author did NOT write down.

The converter hard-codes `inset: 0.3333em` there (cetz.py:1940) while `node_inner_sep` and
`node_frame_width` already read a node's own `inner sep`, so a node written `inner sep=5pt` gets a frame
TeX sized by 5pt and Typst padded by 0.3333em. Whether that is a real gap needs two numbers: does a
hugging `box` grow by exactly `inset` on each side, and does the em spelling follow the node's own
`#text(size:)` the way pgf's `0.3333em` follows `\footnotesize`?

fitz reads the stroked rectangle and the first/last glyph, so `Lgap` is `inset` plus half the rule
(0.4pt here). The last two cases are the same body at 9pt to show what the em is worth.
"""
import os
import subprocess
import sys
import tempfile

import fitz

sys.stdout.reconfigure(errors="replace")

STROKE = "stroke: (thickness: 0.4pt), "
CASES = [
    ("hug-inset0", '#box(' + STROKE + 'inset: 0pt, [ab])', 10.0),
    ("hug-inset2pt", '#box(' + STROKE + 'inset: 2pt, [ab])', 10.0),
    ("hug-inset5pt", '#box(' + STROKE + 'inset: 5pt, [ab])', 10.0),
    ("hug-default-em", '#box(' + STROKE + '[ab])', 10.0),
    ("hug-em-at9pt", '#box(' + STROKE + '[#text(size: 9pt)[ab]])', 9.0),
    ("hug-em-explicit", '#box(' + STROKE + 'inset: 0.3333em, [#text(size: 9pt)[ab]])', 9.0),
]


def measure(page):
    rects = [p["rect"] for p in page.get_drawings()
             if p["rect"].width > 4 and p["rect"].height > 3]
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
        outs = []
        for name, body, size in CASES:
            src = os.path.join(tmp, name + ".typ")
            out = os.path.join(tmp, name + ".pdf")
            open(src, "w", encoding="utf-8").write(
                "#set page(width: 20cm, height: 6cm, margin: 1cm)\n"
                "#set text(size: %gpt)\n" % size + body + "\n")
            r = subprocess.run(["typst", "compile", src, out], capture_output=True)
            if r.returncode:
                err = (r.stderr or b"").decode("utf-8", "replace")
                first = next((l for l in err.splitlines() if "error" in l), "(no output)")
                print("%-18s REFUSED: %s" % (name, first[:110]))
                continue
            outs.append((name, out))
        print("%-18s %9s %9s %9s %9s" % ("case", "box/pt", "Lgap/pt", "Rgap/pt", "text/pt"))
        for name, out in outs:
            doc = fitz.open(out)
            got = measure(doc[0])
            doc.close()
            if got is None:
                print("%-18s  (no frame)" % name)
                continue
            w, lg, rg = got
            fmt = lambda v: "%9.3f" % v if v is not None else "      n/a"
            text = "      n/a" if lg is None else "%9.3f" % (w - lg - rg)
            print("%-18s %9.3f %9s %9s %9s" % (name, w, fmt(lg), fmt(rg), text))


if __name__ == "__main__":
    main()
