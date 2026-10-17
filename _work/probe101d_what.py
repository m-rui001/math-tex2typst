"""What is actually on the page for a turned node?  Dump the spans, their coords and the drawings.

#101d read the ink box of `#page_rotate(-90deg)[uncapped band]` as 11.40 x 34.50 while the same words
unturned measure 62.11 x 11.40 -- the turned box came out shorter than the line it holds.  Either the
gauge is reading the wrong thing, or Typst wrapped/clipped the words.  Print the text items with their
origins and every drawing rect so the row itself says which.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import fitz  # noqa: E402

TMP = os.path.join(HERE, "_m81render")
for name in sys.argv[1:] or ["m101d_0", "m101d_13", "m101d_14"]:
    pdf = os.path.join(TMP, name + ".pdf")
    if not os.path.exists(pdf):
        print(name, "NO PDF")
        continue
    doc = fitz.open(pdf)
    page = doc[0]
    print("### %s  page %.1f x %.1f  size=%d" % (name, page.rect.width, page.rect.height,
                                                 os.path.getsize(pdf)))
    for b in page.get_text("dict")["blocks"]:
        for l in b.get("lines", []):
            for s in l["spans"]:
                if s["text"].strip():
                    r = fitz.Rect(s["bbox"])
                    print("   span %-22r w %6.2f h %6.2f  origin (%.2f, %.2f)  dir (%.2f, %.2f)"
                          % (s["text"], r.width, r.height, s["origin"][0], s["origin"][1],
                             l["dir"][0], l["dir"][1]))
    for d in page.get_drawings():
        r = d["rect"]
        print("   draw fill=%s stroke=%s  w %.2f h %.2f  at (%.2f, %.2f)"
              % (d.get("fill") is not None, d.get("stroke") is not None,
                 r.width, r.height, r.x0, r.y0))
    doc.close()
