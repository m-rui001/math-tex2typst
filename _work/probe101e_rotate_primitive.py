r"""#101 leg C: does Typst's own `rotate` cut the words, or is it CeTz's `content` that does it?

#101d rendered our emission for `\node[rotate=90] at (0,0) {uncapped band}` and the page held ONE
span, the text `'uncappe'`, 34.50pt long -- the same words unturned are 62.11pt (#101d's
`anchor=south` row).  So a turned node loses the tail of its label on the page, for every angle in
the corpus's set (90, 45, 34, -63) and for both signs.

This probe separates the two candidates by leaving cetz out of the page entirely: a body laid out by
plain Typst `#rotate`, at three lengths of text, with and without a `#box(width:)` that tells the
content how wide it may be, and with Typst's own `anchor:`.  Whatever survives here is what the
emitter has to emit.

  python _work/probe101e_rotate_primitive.py    # -> _work/label101e_rotate_primitive.txt
"""
import io
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(HERE, "label101e_rotate_primitive.txt")
sys.path.insert(0, HERE)

import probe81_label_box_face as g  # noqa: E402  (the same renderer: its render)

HEAD = ('#set page(width: 30cm, height: 22cm, margin: (top: 8cm, left: 8cm))\n'
        '#set text(size: 10pt)\n')
SHORT = "band"
MID = "uncapped band"
LONG = "uncapped band for the height process"

CASES = [
    ("bare short", "#place(top+left)[#rotate(-90deg)[%s]]" % SHORT),
    ("bare mid", "#place(top+left)[#rotate(-90deg)[%s]]" % MID),
    ("bare long", "#place(top+left)[#rotate(-90deg)[%s]]" % LONG),
    ("mid in box w=70pt", "#place(top+left)[#rotate(-90deg)[#box(width: 70pt)[%s]]]" % MID),
    ("long in box w=200pt",
     "#place(top+left)[#rotate(-90deg)[#box(width: 200pt)[%s]]]" % LONG),
    ("mid in box w=62.11pt h=11.4pt",
     "#place(top+left)[#rotate(-90deg)[#box(width: 62.11pt, height: 11.4pt)[%s]]]" % MID),
    ("mid rotate anchor east",
     '#place(top+left)[#rotate(-90deg, anchor: "east")[%s]]' % MID),
    ("mid rotate origin east",
     '#place(top+left)[#rotate(-90deg, origin: "east")[%s]]' % MID),
    ("mid +45", "#place(top+left)[#rotate(45deg)[%s]]" % MID),
    ("mid 180", "#place(top+left)[#rotate(180deg)[%s]]" % MID),
    ("mid in stack ttb",
     '#place(top+left)[#rotate(-90deg)[#stack(dir: ttb, "%s")]]' % MID),
    ("mid in box w=70pt h=11.4pt",
     "#place(top+left)[#rotate(-90deg)[#box(width: 70pt, height: 11.4pt)[%s]]]" % MID),
]


def main():
    lines = ["#101e: what Typst's own rotate keeps of a turned label -- pt", ""]
    for i, (name, body) in enumerate(CASES):
        got = g.render(body, "m101e_%d" % i, head=HEAD)
        if got is None:
            lines.append("%-34s NO PDF  %s" % (name, body))
            continue
        _, _, pdf = got
        import fitz
        doc = fitz.open(pdf)
        page = doc[0]
        spans = [(s["text"], fitz.Rect(s["bbox"]))
                 for b in page.get_text("dict")["blocks"] for l in b.get("lines", [])
                 for s in l["spans"] if s["text"].strip()]
        doc.close()
        if not spans:
            lines.append("%-34s NO INK" % name)
            continue
        union = spans[0][1]
        for _, r in spans[1:]:
            union |= r
        lines.append("%-34s %d span(s)  box %6.2f x %6.2f  text=%r"
                     % (name, len(spans), union.width, union.height,
                        "|".join(t for t, _ in spans)))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
