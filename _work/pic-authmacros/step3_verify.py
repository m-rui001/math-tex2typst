r"""Step 3: is the expanded core the same drawing TeX makes of the picture as published?

A compiles the picture with the figure's own `\\newcommand`/`\\tikzset`/`\\colorlet` block in front of
it, exactly as the paper stands. B compiles the core the sandbox pipeline hands to CeTz: those
definitions folded *inside* the picture and every author macro replaced by its body. TeX has to accept
B and ink the identical page, or the expansion moved something.

C is the emitted canvas. TeX inks in bp with y downwards while CeTz keeps the author's frame in cm
with y upwards, so the two are aligned by their own shape bounding boxes and every canvas point is
then required to land on a point TeX inks (or on the centre of a closed curve TeX fills).
"""
import os
import re
import subprocess
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SB = os.path.join(ROOT, "_work", "pic-authmacros")
WORK = os.path.join(SB, "_verify")
sys.path.insert(0, SB)

FLAT = os.path.join(ROOT, "_work", "flat")
PAPERS = {
    "cylinder": ("Cylinder-amplitudes-and-logarithmic-bridge-length-windows-on-the-honeycomb-lattice-September-26-2026",
                 "FiniteSquare"),
    "gff": ("Gaussian-free-field-limits-of-weighted-integer-Lipschitz-heights-September-25-2026",
            "pinsgroup"),
    "peps": ("Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026",
             "geometryrow"),
}
DEF_RX = re.compile(r"\\(?:newcommand|renewcommand|providecommand|def|gdef|edef|"
                    r"tikzset|colorlet|definecolor|usetikzlibrary)(?![A-Za-z])")
CM_BP = 28.45274
PAIR = re.compile(r"\(\s*(-?[0-9.]+)\s*,\s*(-?[0-9.]+)\s*\)")


def definition_block(region):
    r"""The verbatim statements (defs, styles, colours, libraries) a region declares."""
    from t2t.texutil import find_group, skip_spaces
    out, i = [], 0
    while True:
        m = DEF_RX.search(region, i)
        if not m:
            break
        j = skip_spaces(region, m.end())
        while region[j:j + 1] == "{":
            try:
                j = find_group(region, j)
            except ValueError:
                break
        if region[j:j + 1] == "[":
            k = region.find("]", j)
            if k > 0:
                j = skip_spaces(region, k + 1)
                while region[j:j + 1] == "{":
                    try:
                        j = find_group(region, j)
                    except ValueError:
                        break
        out.append(region[m.start():j])
        i = j
    return "\n".join(out)


HEAD = ("\\documentclass{article}\n\\usepackage{amsmath,amssymb}\n\\usepackage{xcolor}\n"
        "\\usepackage{tikz}\n\\pagestyle{empty}\n\\pdfpagewidth=1100pt\\pdfpageheight=700pt\n"
        "\\begin{document}\n")


def doc(defs, pic):
    return HEAD + defs + "\n" + pic + "\n\\end{document}\n"


def compile_tex(path, text):
    open(path, "w", encoding="utf-8", newline="\n").write(text)
    base = os.path.basename(path)[:-4]
    proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", base + ".tex"],
                          cwd=os.path.dirname(path), capture_output=True, text=True)
    pdf = path[:-4] + ".pdf"
    if not os.path.exists(pdf):
        log = open(path[:-4] + ".log", encoding="utf-8", errors="replace").read()
        errs = re.findall(r"^!.*$", log, re.M) + re.findall(r"^l\.\d+ .*", log, re.M)
        return None, errs[:6] or [proc.stdout[-400:]]
    return pdf, []


def ink(pdf):
    r"""(path points, curve centres, word boxes) of one compiled picture, in cm, y upwards."""
    import pymupdf
    d = pymupdf.open(pdf)
    paths, centres, words = [], [], []
    for page in d:
        for item in page.get_drawings():
            for it in item["items"]:
                if it[0] == "l":
                    pts = [it[1], it[2]]
                elif it[0] == "c":
                    pts = list(it[1:])
                elif it[0] == "re":
                    r = it[1]
                    pts = [r.tl, r.br]
                elif it[0] == "qu":
                    pts = list(it[1].ul + it[1].ur + it[1].ll + it[1].lr)
                else:
                    continue
                paths += [(p.x / CM_BP, -p.y / CM_BP) for p in pts]
                if it[0] == "c" and len(pts) == 4:
                    x0 = min(p.x for p in pts) / CM_BP
                    x1 = max(p.x for p in pts) / CM_BP
                    y0 = min(p.y for p in pts) / CM_BP
                    y1 = max(p.y for p in pts) / CM_BP
                    centres.append(((x0 + x1) / 2.0, -(y0 + y1) / 2.0))
        for w in page.get_text("words"):
            words.append((w[0] / CM_BP, -w[3] / CM_BP, w[2] / CM_BP, -w[1] / CM_BP, w[4]))
    d.close()
    return paths, centres, words


def canvas_pieces(canvas):
    r"""Canvas shape points, circle centres and content anchors, straight from the emitted CeTz."""
    shapes, circles, contents = [], [], []
    for line in canvas.splitlines():
        s = line.strip()
        kind = s.split("(")[0]
        pts = PAIR.findall(s)
        if kind.startswith("content"):
            if pts:
                contents.append(tuple(float(v) for v in pts[0]))
            continue
        if not pts:
            continue
        if kind.startswith("circle"):
            circles.append(tuple(float(v) for v in pts[0]))
        shapes += [tuple(float(v) for v in p) for p in pts]
    return shapes, circles, contents


def align(points, tex):
    r"""Shift canvas points onto TeX's frame using the two shapes' bounding-box corners."""
    if not points or not tex:
        return points
    cx = min(p[0] for p in points)
    cy = min(p[1] for p in points)
    tx = min(p[0] for p in tex)
    ty = min(p[1] for p in tex)
    return [(round(p[0] - cx + tx, 4), round(p[1] - cy + ty, 4)) for p in points]


def nearest(q, pool, tol):
    return any(abs(q[0] - p[0]) <= tol and abs(q[1] - p[1]) <= tol for p in pool)


def main():
    from t2t import cetz, convert, prep
    os.makedirs(WORK, exist_ok=True)
    for tag, (name, marker) in PAPERS.items():
        src = open(os.path.join(FLAT, name + ".tex"), encoding="utf-8").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        libs = sorted(set(re.findall(r"\\usetikzlibrary\{([^}]*)\}", src)))
        colors = sorted(set(re.findall(r"\\definecolor\{[^{}]*\}\{[^{}]*\}\{[^{}]*\}", src)))
        body = prep.unwrap_boxes(body)
        scopes = convert.picture_scopes(body, p.macros)
        matches = list(convert.TIKZ_SPAN.finditer(body))
        for i, m in enumerate(matches):
            pic = m.group(0)
            if marker not in pic:
                continue
            table, decls = scopes[i]
            defs = "".join("\\usetikzlibrary{%s}\n" % s for s in libs) + \
                "\n".join(colors) + "\n" + definition_block(body[:m.start()][-8000:])
            text = convert.with_declarations(pic, decls) if decls else pic
            core = prep.expand_macros(text, table)
            open(os.path.join(WORK, tag + "_core.tex"), "w", encoding="utf-8").write(core)
            pa, ea = compile_tex(os.path.join(WORK, tag + "_A.tex"), doc(defs, pic))
            pb, eb = compile_tex(os.path.join(WORK, tag + "_B.tex"), doc(defs, core))
            canvas = cetz.build(core, p.colors, convert.line_cm(p))
            if canvas:
                open(os.path.join(WORK, tag + "_canvas.typ"), "w",
                     encoding="utf-8").write(canvas)
            print("== %s pic#%d: A %s | B %s | canvas %s" % (
                tag, i, "ok" if pa else "FAIL", "ok" if pb else "FAIL",
                "None" if canvas is None else "%d lines" % len(canvas.splitlines())))
            for e in (ea or [])[:3]:
                print("   A:", e)
            for e in (eb or [])[:3]:
                print("   B:", e)
            if not (pa and pb):
                continue
            ta, ca, wa = ink(pa)
            tb, cb, wb = ink(pb)
            print("   A vs B: %d/%d ink points, %d/%d curves, words equal %s" % (
                len(ta), len(tb), len(ca), len(cb),
                sorted(w[4] for w in wa) == sorted(w[4] for w in wb)))
            if canvas is None:
                continue
            shapes, circles, contents = canvas_pieces(canvas)
            sc = align(shapes, ta)
            cc = align(circles, ta)
            tol = 0.02
            miss = [q for q in sc if not nearest(q, ta, tol)]
            cmiss = [q for q in cc if not nearest(q, ta + ca, tol)]
            print("   canvas shape points %d, unmatched against TeX ink: %d" % (len(sc), len(miss)))
            print("   canvas circle centres %d, unmatched: %d" % (len(cc), len(cmiss)))
            for q in miss[:6]:
                print("      unplaced:", q)
            for q in cmiss[:6]:
                print("      unfilled circle:", q)
            words = [w for w in wa]
            bad_text = []
            for q in align(contents, ta):
                if not any(q[0] >= w[0] - 0.45 and q[0] <= w[2] + 0.45 and
                           q[1] >= w[1] - 0.35 and q[1] <= w[3] + 0.35 for w in words):
                    bad_text.append(q)
            print("   canvas content anchors %d, with no TeX word within a node box: %d" % (
                len(contents), len(bad_text)))
            for q in bad_text[:6]:
                print("      anchor without ink:", q)


main()
