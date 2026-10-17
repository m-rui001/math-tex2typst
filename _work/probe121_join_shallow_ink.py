r"""#90: why does the shallow corner read no ink on the Typst side?

`_work/measure90_cap_join.py` reads the miter tip of a 150-degree corner at +6.22pt below the vertex
on a pdflatex page and at MINUS 4.10pt on the Typst one -- so on the Typst page nothing inks in the
direction the join grows.  Two candidates: the canvas' own box cutting the ink, and the probe writing
both engines to one filename (`join_d150.pdf`) so a reading could be taken off a stale page.  Here the
files are named per engine and the ink near the vertex is printed as characters, both engines, at 150
and at 120 degrees.
"""
import io
import math
import os
import subprocess

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m90")
os.makedirs(TMP, exist_ok=True)
DPI = 300
PEN = 12.0


def pgf(name, stmt, opts=""):
    src = ("\\documentclass[10pt]{article}\n"
           "\\usepackage[paperwidth=12cm,paperheight=12cm,margin=0cm]{geometry}\n"
           "\\usepackage{tikz}\n\\begin{document}\n\\pagestyle{empty}\n"
           "\\vbox to 12cm{\\vss\\hbox to 12cm{\\hss\\begin{tikzpicture}[x=1cm,y=1cm]"
           + stmt + "\\end{tikzpicture}\\hss}\\vss}\n\\end{document}\n")
    io.open(os.path.join(TMP, name + ".tex"), "w", encoding="utf-8").write(src)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "-output-directory", TMP, name + ".tex"], cwd=TMP,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if not os.path.exists(os.path.join(TMP, name + ".pdf")):
        print("PGF FAIL", (r.stdout or "")[-400:])
    return os.path.join(TMP, name + ".pdf")


def typst(name, body, padding=None):
    src = ['#import "@preview/cetz:0.5.0"',
           '#set page(width: 12cm, height: 12cm, margin: 0cm)',
           '#cetz.canvas(%s{\n  import cetz.draw: *\n%s\n})'
           % (("padding: %s, " % padding) if padding else "", body)]
    io.open(os.path.join(TMP, name + ".typ"), "w", encoding="utf-8").write("\n".join(src) + "\n")
    if os.path.exists(os.path.join(TMP, name + ".pdf")):
        os.remove(os.path.join(TMP, name + ".pdf"))
    r = subprocess.run(["typst", "compile", "--root", ROOT, name + ".typ"], cwd=TMP,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode or not os.path.exists(os.path.join(TMP, name + ".pdf")):
        print("TYPST FAIL", r.stdout[-400:], r.stderr[-400:])
    return os.path.join(TMP, name + ".pdf")


def corner_stmt(ang):
    b = 2 * math.cos(math.radians((180 - ang) / 2.0))
    h = 2 * math.sin(math.radians((180 - ang) / 2.0))
    return ("\\draw[line width=12pt] (-%.4f, %.4f) -- (0,0) -- (%.4f, %.4f);" % (b, h, b, h),
            "  line((%.4f, %.4f), (0, 0), (%.4f, %.4f), stroke: (thickness: %gpt))"
            % (-b, h, b, h, PEN))


def report(tag, pdf, ang):
    page = fitz.open(pdf)[0]
    ds = [d for d in page.get_drawings() if d["items"]]
    print("\n%s: drawings=%d" % (tag, len(ds)))
    for d in ds:
        print("   width=%s cap=%s join=%s items=%s" % (d.get("width"), d.get("lineCap"),
                                                       d.get("lineJoin"),
                                                       [(it[0], tuple(round(c, 2) for c in
                                                                      (it[1].x, it[1].y,
                                                                       it[2].x, it[2].y)))
                                                        for it in d["items"] if it[0] == "l"]))
    pm = page.get_pixmap(dpi=DPI, clip=fitz.Rect(0, 0, page.rect.width, page.rect.height),
                         colorspace=fitz.csGRAY, alpha=False)
    w, h, n = pm.width, pm.height, pm.n
    s = pm.samples
    rows = [r for r in range(h) if min(s[r * w * n:(r + 1) * w * n]) < 128]
    cols = [c for c in range(w) if min(s[r * w * n + c * n] for r in rows) < 128] if rows else []
    if rows:
        print("   page ink box = (%.2f, %.2f) to (%.2f, %.2f) pt, page is %.0f x %.0f pt"
              % (cols[0] * 72.0 / DPI, rows[0] * 72.0 / DPI,
                 (cols[-1] + 1) * 72.0 / DPI, (rows[-1] + 1) * 72.0 / DPI,
                 page.rect.width, page.rect.height))
    else:
        print("   page holds no ink")
    # ASCII of a 60pt square around the vertex: fitz x right, y down
    st = max(ds, key=lambda d: abs(d.get("width") or 0)) if ds else None
    if st is None:
        return
    segs = [((it[1].x, it[1].y), (it[2].x, it[2].y)) for it in st["items"] if it[0] == "l"]
    v = segs[0][1]
    clip = fitz.Rect(v[0] - 30, v[1] - 30, v[0] + 30, v[1] + 30)
    pm = page.get_pixmap(dpi=72, clip=clip, colorspace=fitz.csGRAY, alpha=False)
    print("   ink within 30pt of the vertex (%.2f, %.2f), one cell = 1pt, '#' dark:" % (v[0], v[1]))
    for r in range(pm.height):
        print("     " + "".join("#" if pm.samples[r * pm.n * pm.width + c * pm.n] < 128 else "."
                                for c in range(pm.width)))


for ang in (150, 120):
    stmt, body = corner_stmt(ang)
    report("PGF  %d" % ang, pgf("diag_pgf_%d" % ang, stmt), ang)
    report("TYPST %d (padded)" % ang, typst("diag_typst_%d" % ang, body, padding="3cm"), ang)
    report("TYPST %d (no padding)" % ang, typst("diag_typst_nopad_%d" % ang, body), ang)
