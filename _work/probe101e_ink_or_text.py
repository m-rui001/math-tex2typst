"""Is a turned label really cut on the page, or is fitz's text extraction lying about rotated glyphs?

#101e read `#rotate(-90deg)[uncapped band]` as the single span `'uncappe'` at 11.40 x 34.50 while the
180deg row came back whole.  Two ways to tell a cut page from a misread one, both on the same PDF:
count the CHARACTERS the page carries (rawdict), and measure the INK in pixels at 600 dpi.  If the
glyphs are all there and the ink runs the full 62pt, the extraction is the liar; if the ink stops at
34.5pt, Typst cut the words and every rotated node in the corpus loses its tail.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import fitz  # noqa: E402

TMP = os.path.join(HERE, "_m81render")
for name in sys.argv[1:] or ["m101e_0", "m101e_1", "m101e_2", "m101e_8", "m101d_0", "m101d_13"]:
    pdf = os.path.join(TMP, name + ".pdf")
    if not os.path.exists(pdf):
        print(name, "NO PDF")
        continue
    doc = fitz.open(pdf)
    page = doc[0]
    chars = []
    for b in page.get_text("rawdict")["blocks"]:
        for l in b.get("lines", []):
            for s in l["spans"]:
                chars.append("".join(c["c"] for c in s["chars"]))
                bb = fitz.Rect(s["bbox"])
    pix = page.get_pixmap(dpi=300, clip=fitz.Rect(0, 0, 140, 140), colorspace=fitz.csGRAY)
    w, h = pix.width, pix.height
    samples = pix.samples
    xs, ys = [], []
    for y in range(h):
        row = y * w
        for x in range(w):
            if samples[row + x] < 200:
                xs.append(x)
                ys.append(y)
    doc.close()
    scale = 72.0 / 300.0
    ink = "none"
    if xs:
        ink = "%.2f x %.2f pt at (%.2f, %.2f)" % (
            (max(xs) - min(xs)) * scale, (max(ys) - min(ys)) * scale,
            min(xs) * scale, min(ys) * scale)
    print("%-10s chars=%-24r ink pixels bbox %s" % (name, "".join(chars), ink))
