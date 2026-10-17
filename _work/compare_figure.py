r"""Put one converted figure next to the same picture typeset by real TikZ.

For a chosen `tikzpicture` in a flattened source: build a standalone document from that
paper's own preamble plus the one picture, run pdflatex, and crop its page to the ink.  Then
find the page of the generated main.pdf that carries that figure -- the caption is the
needle, since the caption is the one string the two documents must share -- and crop it the
same way.  Two PNGs, same stem, `-tex` and `-typ`, for a reader to compare.

Usage:  python _work/compare_figure.py <paper-glob> <picture-index>
"""
import glob
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
CMP = os.path.join(ROOT, "_work", "cmp")
PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
CAP = re.compile(r"\\caption\s*\{((?:[^{}]|\{[^{}]*\})*)\}")
LIB = re.compile(r"\\usetikzlibrary\s*\{([^}]*)\}")


def _skip_ws(text, i):
    while i < len(text) and text[i] in " \t\n":
        i += 1
    return i


def _group_end(text, i):
    """Index just past the balanced group that starts at `text[i] == "{"`."""
    depth = 0
    while i < len(text):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if not depth:
                return i + 1
        i += 1
    return i


def definition(pre, start):
    r"""One macro definition, read to the end of its **balanced** body group, not to the next newline.

    Preambles in this corpus nest definitions across lines (`\providecommand{\A}[2]{ \providecommand{\B}...`),
    and slicing at the newline hands pdflatex a runaway argument -- 13 control pages died that way, and
    the log blamed `amsopn.sty`, which loads fine.
    """
    i = _skip_ws(pre, start)
    m = re.match(r"\\(?:renew|provide|new)command\*?|\\DeclareMathOperator\*?", pre[i:])
    if m:
        # these take the control sequence as their first argument; `\def` does not
        i = _skip_ws(pre, i + m.end())
        if pre[i:i + 1] == "{":
            i = _skip_ws(pre, _group_end(pre, i))
    if pre[i:i + 1] == "[":
        j = pre.find("]", i)
        if j < 0:
            return pre[start:pre.find("\n", i) if pre.find("\n", i) > 0 else len(pre)]
        i = _skip_ws(pre, j + 1)
    if pre[i:i + 1] != "{":  # `\def\foo{...}`: walk to the body group over the parameter text
        brace, nl = pre.find("{", i), pre.find("\n", i)
        if brace < 0 or (0 <= nl < brace):
            return pre[start:nl if nl >= 0 else len(pre)]
        i = brace
    return pre[start:_group_end(pre, i)]


def control(tex_path, idx, libs, size=None):
    """One picture as a standalone page. `size` is the paper's own body font in pt, because a
    collision measured at 10pt is not the collision the page carries (a glyph a point narrower
    clears a neighbour it touches at 11pt)."""
    src = open(tex_path, encoding="utf-8", errors="replace").read()
    pre = src[:src.index("\\begin{document}")] if "\\begin{document}" in src else ""
    pics = [m.group(0) for m in PIC.finditer(src)]
    pic = pics[idx]
    opts = "tikz,border=2pt" + (",%spt" % size if size else "")
    head = ["\\documentclass[%s]{standalone}" % opts]
    if "\\begin{CD}" in pic:
        # `CD` is amscd's environment, not tikz-cd's: without the package the arrow tokens
        # (`@`, `>>`, `VV`) fall through to text mode and the "diagram" is a line of source,
        # which the collision gauge reads as a clean page.
        head.append("\\usepackage{amscd}")
    elif "\\begin{tikzpicture}" not in pic:
        head.append("\\usepackage{tikz-cd}")
    libs = [x.strip() for spec in LIB.findall(pre) for x in spec.split(",") if x.strip()]
    for lib in set(libs):
        head.append("\\usetikzlibrary{%s}" % lib)
    for pkg in re.findall(r"\\usepackage(?:\[[^\]]*\])?\{([^}]*)\}", pre):
        for p in pkg.split(","):
            p = p.strip()
            if p and p not in ("tikz", "xcolor", "graphicx", "amsmath", "amssymb",
                               "bm", "cancel", "mathrsfs", "bbm", "dsfont"):
                continue
            head.append("\\usepackage{%s}" % p)
    # author macros the picture leans on: keep every \newcommand / \def from the preamble, whole
    taken = 0
    for m in re.finditer(r"\\(?:newcommand|renewcommand|providecommand|def|DeclareMathOperator)\b", pre):
        if m.start() < taken:
            continue  # already inside a definition that was copied in full
        text = definition(pre, m.start())
        taken = m.start() + len(text)
        if text.strip():
            head.append(text)
    doc = "\n".join(head) + "\n\\begin{document}\n" + pic + "\n\\end{document}\n"
    name = os.path.basename(tex_path)[:-4]
    stem = "%s-%d" % (re.sub(r"[^A-Za-z0-9]", "_", name)[:40], idx)
    open(os.path.join(CMP, stem + ".tex"), "w", encoding="utf-8").write(doc)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                        CMP, os.path.join(CMP, stem + ".tex")], capture_output=True, cwd=CMP)
    pdf = os.path.join(CMP, stem + ".pdf")
    if not os.path.exists(pdf):
        print("pdflatex produced nothing:", r.stdout.decode("utf-8", "replace")[-800:])
        return None, None
    return pdf, pic


def crop(pdf, page_no, out, margin=6.0):
    """Crop the page to the figure's own ink.

    The ink is the union of what was drawn, and a text span joins it only when its centre falls
    within a fifth of that box's own span -- on a product page the body paragraphs would otherwise
    widen every crop to the whole page, and the point of the pair is to see where the corners and
    curves landed.
    """
    d = fitz.open(pdf)
    p = d[page_no]
    box = fitz.Rect()
    for dr in p.get_drawings():
        box |= dr["rect"]
    if box.is_empty:
        for blk in p.get_text("dict")["blocks"]:
            for ln in blk.get("lines", []):
                for sp in ln.get("spans", []):
                    if sp["text"].strip():
                        box |= fitz.Rect(sp["bbox"])
    else:
        reach = fitz.Rect(box.x0 - 0.15 * box.width, box.y0 - 0.15 * box.height,
                          box.x1 + 0.15 * box.width, box.y1 + 0.15 * box.height)
        for blk in p.get_text("dict")["blocks"]:
            for ln in blk.get("lines", []):
                for sp in ln.get("spans", []):
                    if not sp["text"].strip():
                        continue
                    r = fitz.Rect(sp["bbox"])
                    if reach.contains(fitz.Point((r.x0 + r.x1) / 2, (r.y0 + r.y1) / 2)):
                        box |= r
    if box.is_empty:
        return None
    box = fitz.Rect(box.x0 - margin, box.y0 - margin, box.x1 + margin, box.y1 + margin)
    box &= p.rect
    p.get_pixmap(matrix=fitz.Matrix(3, 3), clip=box).save(out)
    return box


def main():
    sys.stdout.reconfigure(errors="replace")
    if not os.path.isdir(CMP):
        os.makedirs(CMP)
    pat, idx = sys.argv[1], int(sys.argv[2])
    hits = glob.glob(os.path.join(FLAT, pat + ".tex"))
    if not hits:
        print("no source matches", pat)
        return
    tex_path = hits[0]
    name = os.path.basename(tex_path)[:-4]
    pdf, pic = control(tex_path, idx, None)
    if not pdf:
        return
    out = os.path.join(CMP, "%s-%d-tex.png" % (name[:40], idx))
    print("tex  ink:", crop(pdf, 0, out), "->", os.path.basename(out))
    cap = CAP.search(pic)
    if not cap:
        # a picture's caption is written after it, inside the enclosing figure: without that the
        # page choice falls back to "most drawings", which often lands on a table page
        whole = open(tex_path, encoding="utf-8", errors="replace").read()
        at = whole.find(pic)
        cap = CAP.search(whole[at + len(pic):at + len(pic) + 900])
    needle = None
    if cap:
        needle = " ".join(re.sub(r"\\[a-zA-Z]+|[{}$&]", " ", cap.group(1)).split())[:24]
    tdir = glob.glob(os.path.join(ROOT, "typst", name))
    if not tdir:
        print("no typst dir")
        return
    tp = os.path.join(tdir[0], "main.pdf")
    d = fitz.open(tp)
    page = None
    if needle:
        for i, p in enumerate(d):
            if p.search_for(needle.split()[0], quads=False) and needle[:12] in " ".join(
                    p.get_text().split()):
                page = i
                break
    if page is None:
        # fall back to the page with the most drawing operations
        page = max(range(d.page_count), key=lambda i: len(d[i].get_drawings()))
    out2 = os.path.join(CMP, "%s-%d-typ.png" % (name[:40], idx))
    print("caption needle %r ; typst page %d of %d" % (needle, page + 1, d.page_count))
    print("typ ink:", crop(tp, page, out2), "->", os.path.basename(out2))


if __name__ == "__main__":
    main()
