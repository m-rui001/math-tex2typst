r"""Render one page per paper whose picture only just converted, for the eye to check.

For each paper: take the caption of a figure that draws a tikzpicture out of _work/flat, use its first
plain words as a needle, and render the PDF page that carries the caption from the snapshot in
_work/shot. A caption that lands on a page is the figure's own page; the drawing sits above it.
"""
import io
import os
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
SHOT = os.path.join(ROOT, "_work", "shot")
FIGURE = re.compile(r"\\begin\{figure\*?\}(?:\[[^\]]*\])?\s*(.*?)\\end\{figure\*?\}", re.S)
CAPTION = re.compile(r"\\caption\{")
STOP = {"label", "cite", "ref", "includegraphics", "texcolor"}


def clean(text):
    """A caption's words with TeX stripped out, so a PDF text search can hit them."""
    text = re.sub(r"\\\[.*?\\\]", " ", text, flags=re.S)
    text = re.sub(r"\$[^$]*\$", " ", text)
    words = []
    for word in re.findall(r"[A-Za-z]{3,}", text):
        if word.lower() in STOP:
            continue
        words.append(word)
    return " ".join(words[:6])


def figure_caption(stem):
    path = os.path.join(FLAT, stem + ".tex")
    if not os.path.isfile(path):
        for other in os.listdir(FLAT):
            if other.startswith(stem[:40]) and other.endswith(".tex"):
                path = os.path.join(FLAT, other)
                break
    src = open(path, encoding="utf-8", errors="replace").read()
    for match in FIGURE.finditer(src):
        body = match.group(1)
        if "tikzpicture" not in body:
            continue
        cap = CAPTION.search(body)
        if cap is None:
            continue
        depth, i = 1, cap.end()
        while i < len(body) and depth:
            if body[i] == "{":
                depth += 1
            elif body[i] == "}":
                depth -= 1
            i += 1
        needle = clean(body[cap.end():i])
        if len(needle.split()) >= 4:
            return needle
    return ""


for stem in sys.argv[1:]:
    pdf = None
    for name in os.listdir(SHOT):
        if name.startswith(stem[:40]):
            pdf = os.path.join(SHOT, name)
            break
    needle = figure_caption(stem)
    if pdf is None or not needle:
        print("%-44s NO SNAPSHOT OR NO NEEDLE (%r)" % (stem[:44], needle[:40]))
        continue
    doc = fitz.open(pdf)
    page_no = None
    for n, page in enumerate(doc):
        if page.search_for(needle[:40]):
            page_no = n
            break
    if page_no is None:
        print("%-44s caption not found on any page: %r" % (stem[:44], needle[:60]))
        continue
    page = doc[page_no]
    pix = page.get_pixmap(matrix=fitz.Matrix(2, 2))
    out = os.path.join(SHOT, "%s-p%d.png" % (stem[:36], page_no + 1))
    pix.save(out)
    print("wrote %s (caption on page %d of %d): %s"
          % (os.path.basename(out), page_no + 1, doc.page_count, needle[:60]))
