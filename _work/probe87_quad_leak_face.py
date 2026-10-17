"""How much visible junk does the `\\quad` / `\\,` placeholder leak print on the page?

The on-ink face kept naming spans like `(Q))` and `',iū)'`: a canvas maths label that should hold a
space holds the literal characters `( Q )`. This census counts, over the products' own canvases,
every canvas maths that carries one of those spellings, and separates the two conversion paths --
`tikzpicture` node labels go through `cetz`'s own maths table, `tikzcd` arrow labels through pandoc.

  python _work/probe87_quad_leak_face.py          # products
  python _work/probe87_quad_leak_face.py src      # flat sources, per path
"""
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CANVAS = re.compile(r"#cetz\.canvas\(")
MATH = re.compile(r"\$\$.*?\$\$|\$[^$\n]*\$", re.S)
SPELLINGS = [
    ("backslash-paren", r"\\\(\s"),
    ("Q placeholder", r"\( Q \)"),
    ("bare thin", r"(?<![A-Za-z\\])thin(?![A-Za-z])"),
    ("bare med", r"(?<![A-Za-z\\])med(?![A-Za-z])"),
    ("bare thick", r"(?<![A-Za-z\\])thick(?![A-Za-z])"),
]


def canvas_maths(text):
    out = []
    for m in CANVAS.finditer(text):
        depth, i, quoted = 0, m.end() - 1, False
        while i < len(text):
            ch = text[i]
            if ch == '"':
                quoted = not quoted
            elif not quoted:
                if ch == "(":
                    depth += 1
                elif ch == ")":
                    depth -= 1
                    if not depth:
                        break
            i += 1
        block = text[m.start():i + 1]
        for mm in MATH.finditer(block):
            out.append(mm.group(0))
    return out


def products():
    hits, canvases, papers = {}, 0, set()
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        maths = canvas_maths(io.open(path, encoding="utf-8", errors="replace").read())
        for name, rx in SPELLINGS:
            rx = re.compile(rx)
            got = [m for m in maths if rx.search(m)]
            if got:
                hits.setdefault(name, [0, set()])
                hits[name][0] += len(got)
                hits[name][1].add(stem)
        if any(re.compile(rx).search(m) for m in maths for _n, rx in SPELLINGS):
            canvases += 1
            papers.add(stem)
    print("canvases whose maths carries one of these spellings: %d in %d papers"
          % (canvases, len(papers)))
    for name, _rx in SPELLINGS:
        h = hits.get(name)
        print("  %-16s %5d maths spans / %3d papers" % (name, h[0] if h else 0,
                                                        len(h[1]) if h else 0))
    return hits


def sources():
    PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}|\\begin\{tikzcd\}.*?\\end\{tikzcd\}",
                     re.S)
    pics = {"tikzpicture": [], "tikzcd": []}
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        text = io.open(path, encoding="utf-8", errors="replace").read()
        for m in PIC.finditer(text):
            kind = "tikzcd" if "tikzcd" in m.group(0)[:20] else "tikzpicture"
            pics[kind].append(m.group(0))
    for kind, blocks in pics.items():
        for name, rx in (("quad", r"\\q?quad"), ("comma-space", r"\\,(?![A-Za-z])"),
                         ("backslash-paren", r"\\\(")):
            pat = re.compile(rx)
            got = [b for b in blocks if pat.search(b)]
            print("  %-12s %-15s %4d pictures" % (kind, name, len(got)))
    print("pictures: tikzpicture %d  tikzcd %d" % (len(pics["tikzpicture"]), len(pics["tikzcd"])))


if __name__ == "__main__":
    if "src" in sys.argv[1:]:
        sources()
    else:
        products()
