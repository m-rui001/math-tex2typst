r"""Census of the placement defect the Turn-Based figure shows.

`below=6mm of up` has to start from the *south edge* of `up`, but a node sized by its own text
(`text width`, no `minimum height`) has a height the converter never measures, so the relative
placement starts from the node's centre instead and the neighbour lands on top of it.

Counts, over the flat corpus: pictures carrying a grown node, and among those the placements that
point at one. Prints the line counts of the grown text, since the fix needs the height as
lines x baselineskip.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NODE = re.compile(r"\\node\s*(\[[^\]]*\])?\s*(?:\(([^()]*)\))?\s*(?:at\s*\(([^()]*)\))?\s*")
OF = re.compile(r"\\node\s*(\[[^\]]*\])")


def opts_of(text):
    """(name, options, body) triples for each `\\node[...] (n) at (...) {...};`."""
    out = []
    for m in NODE.finditer(text):
        o = m.group(1) or ""
        name = m.group(2)
        # the body runs to the matching brace; the text's own braces nest
        i = text.find("{", m.end())
        if i < 0:
            continue
        depth, j = 0, i
        while j < len(text):
            if text[j] == "{":
                depth += 1
            elif text[j] == "}":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        out.append((name, o, text[i + 1:j]))
    return out


def grown(o):
    """A node TikZ sizes from its own text: a width the author fixed, no height."""
    return ("text width" in o or "align" in o) and "minimum height" not in o \
        and "minimum size" not in o and "text height" not in o


pic_grown = pic_points = 0
papers_grown = papers_points = 0
line_hist = {}
for fn in sorted(os.listdir(os.path.join(ROOT, "_work", "flat"))):
    if not fn.endswith(".tex"):
        continue
    text = open(os.path.join(ROOT, "_work", "flat", fn), encoding="utf-8",
                errors="replace").read()
    hit_g = hit_p = False
    for pic in PIC.findall(text):
        nodes = opts_of(pic)
        grown_names = set()
        for name, o, body in nodes:
            if grown(o):
                hit_g = True
                lines = body.count("\\\\") + 1
                line_hist[lines] = line_hist.get(lines, 0) + 1
                if name:
                    grown_names.add(name)
        for name, o, body in nodes:
            for m in re.finditer(r"(above|below|left|right|above right|below left|"
                                 r"above left|below right)\s*=\s*[^]]*?\bof\s*\{?([A-Za-z0-9_:./-]+)", o):
                if m.group(2) in grown_names:
                    hit_p = True
    if hit_g:
        papers_grown += 1
    if hit_p:
        papers_points += 1
        print("  points-at-grown: %s" % fn[:-4][:60])

print("papers with a text-sized node: %d" % papers_grown)
print("papers that place something relative to one: %d" % papers_points)
print("line counts of grown node text:", sorted(line_hist.items())[:12])
