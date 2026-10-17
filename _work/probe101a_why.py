"""Why is the rotated `footnotesize` row unreadable?  Dump what the gauge sees on m101a_4.pdf.

Also checks the stale-pdf hazard: the case index is reused across runs, so a compile that fails leaves
the previous generation's pdf behind and a reading can be a lie.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import fitz  # noqa: E402
import probe101a_rot_variants as p  # noqa: E402

for i in (4, 5, 13, 14, 15):
    pdf = os.path.join(HERE, "m101a_%d.pdf" % i)
    if not os.path.exists(pdf):
        print(i, "NO PDF")
        continue
    aux = os.path.join(HERE, "m101a_%d.aux" % i)
    print("### case %d  mtime=%d size=%d aux=%s"
          % (i, os.path.getmtime(pdf), os.path.getsize(pdf), os.path.exists(aux)))
    doc = fitz.open(pdf)
    page = doc[0]
    fills = [(d.get("fill") is not None, round(r.width, 2), round(r.height, 2))
             for d in page.get_drawings() for r in [d["rect"]]]
    spans = [(s["text"], round(fitz.Rect(s["bbox"]).width, 2),
              round(fitz.Rect(s["bbox"]).height, 2))
             for b in page.get_text("dict")["blocks"] for l in b.get("lines", [])
             for s in l["spans"]]
    doc.close()
    print("   drawings:", fills)
    print("   spans:", spans)
    print("   fill-rung:", p.offsets(pdf), " ink-rung:", p.ink_offsets(pdf))
