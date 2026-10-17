r"""#90: the face the pen options have, and the pen that makes them visible.

Two numbers decide this round.  A cap or a join moves ink by a fraction OF THE PEN, so a `line
cap=round` written on the default 0.4pt rule moves the page by 0.2pt -- nothing -- while the same key
on a 12pt corridor moves it by half a pen of ink.  And the option is usually written ONCE, on the
picture's own head, where it colours every path in it, which is a different piece of the converter
than a statement's bracket.  So: (1) pgf's named widths, read out of pdflatex; (2) where in the flat
pictures `line cap=`/`line join=` is written and how heavy that picture's pen is; (3) the exposure the
other way round -- a heavy polyline whose sharpest corner is between the two engines' carry limits
(pgf 10, Typst 4, both measured in `_work/measure90_cap_join.py`), where pgf points the tip and Typst
bevels it without anyone writing a thing; (4) zero-length subpaths, which pgf turns into a dot under
`line cap=round` and Typst does not draw at all.

Corners and subpaths are read from LITERAL coordinates only; a path built from node names or macros is
not counted either way, and the counts below say which they are.
"""
import io
import math
import os
import re
import subprocess
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
VERB = re.compile(r"\\(draw|fill|filldraw|path|shade|shadedraw|stroke)\b[^;]*?;", re.S)
COORD = re.compile(r"\(\s*([-+0-9.]+)\s*,\s*([-+0-9.]+)\s*\)")
NAMED = ("ultra thin", "thin", "semithick", "thick", "very thick", "ultra thick")
WIDTH_NAME = {}
DEFAULT_PEN = 0.4  # pgf's own `\pgflinewidth` with nothing written

tmp = tempfile.mkdtemp(prefix="pen_")
src = ("\\documentclass[10pt]{article}\\usepackage{tikz}\\begin{document}\n"
       "\\typeout{BASE=\\the\\pgflinewidth}\n"
       "\\foreach\\k in {ultra thin,thin,semithick,thick,very thick,ultra thick}%\n"
       "{\\tikzset{\\k}\\typeout{NAME \\k=\\the\\pgflinewidth}}\n"
       "\\end{document}\n")
io.open(os.path.join(tmp, "w.tex"), "w", encoding="utf-8").write(src)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                "-output-directory", tmp, "w.tex"], cwd=tmp, capture_output=True, text=True)
log = io.open(os.path.join(tmp, "w.log"), encoding="utf-8", errors="replace").read()
print("=== pgf's pens, read out of pdflatex")
for line in re.findall(r"(?:BASE|NAME [a-z ]+)=[0-9.]+pt", log):
    print("   " + line)
    m = re.match(r"NAME ([a-z ]+)=([0-9.]+)pt", line)
    if m:
        WIDTH_NAME[m.group(1)] = float(m.group(2))
# `BASE` is `\pgflinewidth` OUTSIDE a picture, where pgf has not set a pen yet (0.0pt).  Inside one,
# the same silence is the `thin` rule, 0.4pt -- `_work/measure_path_mode.py` reads a bare `\draw` at
# 0.398pt on the page -- so the census prices a picture that writes no width at that number.
print("   named table=%s in-picture default=%spt" % (WIDTH_NAME, DEFAULT_PEN))


def pen_of(text):
    """The heaviest pen a picture spells, by measure or by name."""
    got = DEFAULT_PEN
    for m in re.finditer(r"line width\s*=\s*([0-9.]+)\s*(pt|bp|mm|cm|in)", text):
        got = max(got, float(m.group(1)) * {"pt": 1.0, "bp": 1.0, "mm": 2.8346,
                                            "cm": 28.346, "in": 72.27}[m.group(2)])
    for name in NAMED:
        val = WIDTH_NAME.get(name)
        if val and re.search(r"(?<![\w-])%s(?![\w-])" % name, text):
            got = max(got, val)
    return got


def written(opts):
    out = {}
    for key in ("line cap", "line join"):
        m = re.search(r"%s\s*=\s*([a-z]+)" % key, opts or "")
        if m:
            out[key] = m.group(1)
        elif re.search(r"%s(?![\s=]*[a-z])" % key, opts or ""):
            out[key] = "(bare)"
    return out


def vertices(stmt):
    """The literal coordinate sequence of one statement's path."""
    return [(float(a), float(b)) for a, b in COORD.findall(stmt)]


def sharpest(pts):
    """The smallest angle between two neighbouring legs at any interior vertex."""
    worst = 180.0
    for a, b, c in zip(pts, pts[1:], pts[2:]):
        u, v = (b[0] - a[0], b[1] - a[1]), (c[0] - b[0], c[1] - b[1])
        nu, nv = math.hypot(*u), math.hypot(*v)
        if nu < 1e-9 or nv < 1e-9:
            continue
        worst = min(worst, math.degrees(math.acos(
            max(-1.0, min(1.0, (u[0] * v[0] + u[1] * v[1]) / (nu * nv))))))
    return worst


sites = {"head": {}, "scope": {}, "statement": {}, "style": {}}
pics, papers, zero_len = [], {}, []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.finditer(text):
        s = pic.group(0)
        head = re.match(r"\\begin\{tikzpicture\}\s*\[([^\]]*)\]", s)
        body = s[head.end():] if head else s[len("\\begin{tikzpicture}"):]
        found = {}
        groups = [("head", [head.group(1)] if head else []),
                  ("scope", re.findall(r"\\begin\{scope\}\s*\[([^\]]*)\]", body)),
                  ("style", re.findall(r"\.style\s*=\s*\{([^{}]*)\}", body))]
        for site, chunks in groups:
            for chunk in chunks:
                for key, val in written(chunk).items():
                    found.setdefault(key, site)
                    sites[site][val] = sites[site].get(val, 0) + 1
        for stmt in VERB.finditer(body):
            o = re.match(r"\\[a-z]+\s*\[([^\]]*)\]", stmt.group(0))
            if o:
                for key, val in written(o.group(1)).items():
                    found.setdefault(key, "statement")
                    sites["statement"][val] = sites["statement"].get(val, 0) + 1
            pts = vertices(stmt.group(0))
            for a, b in zip(pts, pts[1:]):
                if a == b:
                    zero_len.append((fn, a, "line cap" in s, round(pen_of(s), 2)))
        if found:
            pics.append((fn, found, pen_of(s)))
            papers.setdefault(fn, set()).update(found)

print("\n=== where the option is written, by value")
for site, vals in sites.items():
    print("   %-10s %s" % (site, ", ".join("%s x%d" % kv for kv in sorted(vals.items()))))
print("\n=== pictures that write a pen shape: %d over %d papers" % (len(pics), len(papers)))
for lo, hi, tag in ((0, 0.5, "pen <= 0.5pt"), (0.5, 1.5, "pen <= 1.5pt"),
                    (1.5, 4.0, "pen <= 4pt"), (4.0, 1e9, "pen > 4pt")):
    hit = [p for p in pics if lo < p[2] <= hi]
    print("   %-14s pictures=%3d papers=%3d  %s"
          % (tag, len(hit), len(set(p[0] for p in hit)),
             ", ".join(sorted(set(p[0][:26] for p in hit))[:3])))

print("\n=== a heavy pen with NO `line join` written: where the two carry limits disagree")
exposed, heavy = [], []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.finditer(text):
        s = pic.group(0)
        if "line join" in s:
            continue
        pen = pen_of(s)
        if pen <= 1.0:
            continue
        worst = min([sharpest(vertices(m.group(0))) for m in VERB.finditer(s)] or [180.0])
        heavy.append((fn, pen, worst))
        # Typst bevels below 29.0 degrees, pgf below 11.5 -- between the two, only pgf points
        if 11.5 <= worst < 29.0:
            exposed.append((fn, pen, round(worst, 1)))
print("   heavy-pen pictures with no `line join`: %d over %d papers"
      % (len(heavy), len(set(f for f, _, _ in heavy))))
print("   of those, a corner between the two limits: %d over %d papers: %s"
      % (len(exposed), len(set(f for f, _, _ in exposed)), exposed[:10]))
print("   sharpest corners seen: %s"
      % sorted(heavy, key=lambda e: e[2])[:6])

dots = sorted(set(zero_len))
print("\n=== zero-length subpaths spelled with literal coordinates: %d over %d papers"
      % (len(dots), len(set(d[0] for d in dots))))
print("   in a picture that writes `line cap` at all: %s"
      % [d for d in dots if d[2]])
print("\n=== the pictures that write a pen shape")
for fn, found, pen in pics:
    print("   %-52s pen=%6.2fpt  %s" % (fn[:52], pen, found))
