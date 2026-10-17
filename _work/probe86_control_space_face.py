r"""`\ `（TeX 的控制空格）在画布的数学里把一行拆成了几行？语料面有多大？

#86 的第一张（`A-boundary-only…` #1）里作者写的是一行 `$n=-s,\ v=s$`，pdflatex 的控制页印成
一行 `n = −s, v = s`，我们的页上却是两行（`n=−s,`／`v=s`）——所以「多行节点自己互叠」在这一张
不成立，真机制是 Typst 的数学把 `\ ` 读成了换行。动发射器前先量两件事：

1. **面**：产物画布的 `$…$` 里有多少 `\ `（顺带 `~` 与 `\\`），分布在多少篇／多少张画布；
2. **拼写对照**：同一句按三种写法各编一遍，读页上的行盒，看哪种写法既不断行又留得住词距；
   词距的真值从控制页那一行自己的字母盒来（`,` 的右缘到 `v` 的左缘）。

  python _work/probe86_control_space_face.py        # 面 + 控制页词距
  python _work/probe86_control_space_face.py test   # 拼写对照
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, WORK)
import fitz  # noqa: E402
import probe81_label_box_face as g  # noqa: E402

MATH = re.compile(r"\$[^$]*\$")
SPELLINGS = [
    ("tex-cs", r"$n=-s,\ v=s$"),
    ("plain", r"$n=-s, v=s$"),
    ("h-em", r"$n=-s,#h(0.25em)v=s$"),
    ("comma-thin", r"$n=-s,\,v=s$"),
    ("semicolon", r"$n=-s,\;v=s$"),
    ("tilde", r"$n=-s,~v=s$"),
    ("dbl-bs", r"$n=-s,\\v=s$"),
]


def maths():
    """[(stem, canvas-index, math-span)] over every `$…$` inside every shipped canvas.

    A diagram from `build_cd` emits `content(pt, [$tex$])` with no `#text(size: 9pt)` wrapper and
    its maths goes through `mathconv`; a node label carries the wrapper and its maths goes through
    `cetz._math_body`. The two converters are different code, so a token's face has to name which
    one it sits in.
    """
    out = []
    for (stem, k), (head, block) in g.canvases().items():
        cd = "#text(size:" not in block
        for m in MATH.findall(block):
            out.append((stem, k, m, cd))
    return out


def face():
    spans = maths()
    for tag, pat in ((r"\ ", re.compile(r"\\ ")), ("~", re.compile(r"~")),
                     (r"\\", re.compile(r"\\\\")), (r"\,", re.compile(r"\\,")),
                     (r"\;", re.compile(r"\\;")), (r"\!", re.compile(r"\\!"))):
        hit = [(s, k, m, cd) for s, k, m, cd in spans if pat.search(m)]
        by = {}
        for s, k, _m, cd in hit:
            by.setdefault("cd" if cd else "node", set()).add((s, k))
        print("%-4s in-canvas maths: %4d occurrences / %4d canvases / %3d papers   %s"
              % (tag, sum(len(pat.findall(m)) for s, k, m, _ in hit),
                 len({(s, k) for s, k, _m, _ in hit}), len({s for s, _k, _m, _ in hit}),
                 "  ".join("%s: %d canvases/%d papers"
                           % (key, len(v), len({s for s, _ in v}))
                           for key, v in sorted(by.items()))))
        for s, k, m, _cd in hit[:1]:
            print("      %-40s#%-2d %r" % (s[:40], k, m[:78]))


def control_gap():
    """The word space TeX actually leaves after the comma in `n = −s, v = s`."""
    pdf = os.path.join(WORK, "cmp",
                       "A_boundary_only_obstruction_to_four_dime-1.pdf")
    if not os.path.exists(pdf):
        print("no control page at %s" % pdf)
        return
    rows, gap = page_rows(pdf)
    for y0, y1, text in rows:
        if "," in text:
            print("  control row %r  y %.2f..%.2f   comma gap %s"
                  % (text[:32], y0, y1, ("%.3f pt" % gap) if gap is not None else "n/a"))


def page_rows(pdf):
    """[(y0, y1, text)] plus the letter-level gap TeX/Typst leaves after an in-row comma."""
    doc = fitz.open(pdf)
    rows = []
    for block in doc[0].get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            b = fitz.Rect(line["bbox"])
            rows.append((b.y0, b.y1, "".join(s["text"] for s in line["spans"])))
    gap = None
    for block in doc[0].get_text("rawdict")["blocks"]:
        for ln in block.get("lines", []):
            chars = [(c["c"], fitz.Rect(c["bbox"])) for sp in ln["spans"] for c in sp["chars"]]
            for i, (c, r) in enumerate(chars[:-1]):
                if c not in (",", ";"):
                    continue
                nxt = [(ch, bx) for ch, bx in chars[i + 1:] if ch.strip()]
                if nxt:
                    gap = nxt[0][1].x0 - r.x1
            if gap is not None:
                break
        if gap is not None:
            break
    doc.close()
    return sorted(rows), gap


def test():
    for name, src in SPELLINGS:
        canvas = ('#cetz.canvas({\n  import cetz.draw: *\n'
                  '  content((0, 0), [#text(size: 9pt)[%s]], anchor: "west")\n})\n' % src)
        got = g.render(canvas, "86s_" + name)
        if not got:
            print("  %-11s typst refused" % name)
            continue
        rows, gap = page_rows(got[2])
        print("  %-11s rows %d  gap %s  %s"
              % (name, len(rows), ("%.3f pt" % gap) if gap is not None else "n/a",
                 [(round(y0, 1), round(y1, 1), t[:26]) for y0, y1, t in rows[:3]]))


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "test":
        test()
    else:
        face()
        control_gap()
