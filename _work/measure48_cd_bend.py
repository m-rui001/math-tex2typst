r"""#30 的余账：tikz-cd 的弯箭摆在哪一侧、它的标签离线多远，长标签推不推开下一列。

上一轮把「标签让开自己那条线」修成按标签盒子算（轴 61），留下 29 个被**邻箭**划过的标签分两支。
两支都要先问真 tikz-cd，而且**两边各在自己的坐标系里量**——画布的 y 原点、栏距和 PDF 页面上的
那一格本来就不对齐，跨基座比读数只会比出一个常数偏移。

① bend 那一支（16 个）。`build_cd` 把弯箭画成两段折线，顶点写死在**弦中点 + 法向 0.9cm**。
真 pgf 的 `to[bend left=θ]` 轴 38 量过（臂 0.39·弦、切线 ±θ），这里要答的是 **tikz-cd 的 `bend`
是不是同一个 `to`**、弧在行的哪一侧、我们画在了哪一侧。

② 标签离线多远。`CD_LABEL_GAP = 0.275` 这条常数配上标签盒子的一半，等于把标签中心摆在离线
0.45cm 的地方。同一把尺下 pgf 直箭的标签中心读到的是**另一个数**，两支并排量一次。

③ 普通那一支（13 个）。`cd_columns`（4490）排栏只看单元内容，从不给标签留宽。真 tikz-cd 里一个
长标签会把下一列推开、还是本来就和邻箭重叠，决定这 13 处是**我们的漏**还是**原作者的排版**
（若是后者，这条按 #45/#78 撤案，不改代码）。

`perp` 的符号约定：**正号在这条线的右手边**（一支向右的箭，上方的标签读负号）。
"""
import math
import os
import re
import subprocess
import sys

import fitz

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_m48")
CM = 0.0352778  # a PDF point in cm

DOC = ("\\documentclass[border=6pt]{standalone}\n"
       "\\usepackage{tikz-cd}\n"
       "\\begin{document}\n"
       "\\begin{tikzcd}%s"
       "\\end{tikzcd}\n"
       "\\end{document}\n")

# ①：同一对单元、同一个 2cm 栏距，只换弯法
BEND = [
    ("bend15", '[column sep=2cm]A \\arrow[rr,bend left=15,"f"] & & B', 15, "f"),
    ("bend22", '[column sep=2cm]A \\arrow[rr,bend left=22,"f"] & & B', 22, "f"),
    ("bend45", '[column sep=2cm]A \\arrow[rr,bend left=45,"f"] & & B', 45, "f"),
    ("bare", '[column sep=2cm]A \\arrow[rr,bend left,"f"] & & B', 30, "f"),
    ("right22", '[column sep=2cm]A \\arrow[rr,bend right=22,"f"] & & B', -22, "f"),
    ("down-left", '[column sep=2cm,row sep=1.5cm]A \\arrow[dr,bend left=30,"f"] \\\\ & B', 30, "f"),
]
# ②：直箭、换边、竖箭、长标签、高标签，各让开自己的线多远
GAP = [
    ("h-f", '[column sep=2cm]A \\arrow[r,"f"] & B'),
    ("h-frac", '[column sep=2cm]A \\arrow[r,"\\frac{a}{b}"] & B'),
    ("h-long", '[column sep=2cm]A \\arrow[r,"abcdefghij"] & B'),
    ("h-swap", "[column sep=2cm]A \\arrow[r,\"f\"'] & B"),
    ("v-f", '[row sep=1.5cm]A \\arrow[d,"f"] \\\\ B'),
]
# ③：只换标签的长度，看下一列动不动
WIDTH = [
    ("nolabel", "[column sep=large]A \\arrow[r] & B"),
    ("short", '[column sep=large]A \\arrow[r,"f"] & B'),
    ("long", '[column sep=large]A \\arrow[r,"abcdefghij"] & B'),
    ("descr", '[column sep=large]A \\arrow[r,"abcdefghij",description] & B'),
]
SEG = re.compile(r"line\(\((-?[\d.]+), (-?[\d.]+)\), \((-?[\d.]+), (-?[\d.]+)\)")
BEZ = re.compile(r"bezier\(\((-?[\d.]+), (-?[\d.]+)\), \((-?[\d.]+), (-?[\d.]+)\), "
                 r"\((-?[\d.]+), (-?[\d.]+)\), \((-?[\d.]+), (-?[\d.]+)\)")
CONTENT = re.compile(r"content\(\((-?[\d.]+), (-?[\d.]+)\), \[(.*?)\]\)", re.S)


def on_page(name, body):
    """(cubic segments, straight segments, text boxes) of a tikzcd body, cm with y upward."""
    os.makedirs(TMP, exist_ok=True)
    open(os.path.join(TMP, name + ".tex"), "w", encoding="utf-8").write(DOC % body)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                   cwd=TMP, capture_output=True)
    doc = fitz.open(os.path.join(TMP, name + ".pdf"))
    page = doc[0]
    h = page.rect.height

    def up(p):
        return (p.x * CM, (h - p.y) * CM)

    cubics, straights = [], []
    for d in page.get_drawings():
        for item in d["items"]:
            if item[0] == "c":
                cubics.append([up(p) for p in item[1:]])
            elif item[0] == "l":
                straights.append((up(item[1]), up(item[2])))
    spans = []
    for b in page.get_text("dict")["blocks"]:
        for l in b.get("lines", []):
            for s in l["spans"]:
                if s["text"].strip():
                    r = fitz.Rect(s["bbox"])
                    spans.append((s["text"].strip(), (r.x0 * CM, (h - r.y1) * CM,
                                                     r.x1 * CM, (h - r.y0) * CM)))
    doc.close()
    return cubics, straights, spans


def perp(p, a, b):
    """Signed RIGHT-HAND distance of `p` from the line a->b, and its position along the line."""
    vx, vy = b[0] - a[0], b[1] - a[1]
    n = (vx * vx + vy * vy) ** 0.5
    if not n:
        return 0.0, 0.0
    ux, uy = vx / n, vy / n
    return ((p[0] - a[0]) * uy - (p[1] - a[1]) * ux,
            ((p[0] - a[0]) * ux + (p[1] - a[1]) * uy) / n)


def cubic_at(seg, t):
    """A point of a cubic `seg` = (start, control1, control2, end) at parameter `t`, with tangent."""
    p0, c1, c2, p1 = seg
    q = [(p0[i] + t * (c1[i] - p0[i]), c1[i] + t * (c2[i] - c1[i]),
          c2[i] + t * (p1[i] - c2[i])) for i in range(2)]
    r = [q[i][0] + t * (q[i][1] - q[i][0]) for i in range(2)]
    s = [q[i][1] + t * (q[i][2] - q[i][1]) for i in range(2)]
    p = tuple(r[i] + t * (s[i] - r[i]) for i in range(2))
    d = (s[0] - r[0], s[1] - r[1])
    n = math.hypot(*d)
    return p, (d[0] / n, d[1] / n) if n else d


def canvas_of(body):
    """`build_cd`'s own picture of the same diagram, in its own cm basis."""
    core = cetz.strip_envelope("\\begin{tikzcd}" + body + "\\end{tikzcd}")
    canvas = cetz.build_cd(core)
    if not canvas:
        return None
    segs = [((float(m.group(1)), float(m.group(2))), (float(m.group(3)), float(m.group(4))))
            for m in SEG.finditer(canvas)]
    # the canvas spells `bezier(start, end, support1, support2)`; a cubic wants them in path order
    beziers = [[(float(m.group(i)), float(m.group(i + 1))) for i in (1, 3, 5, 7)]
               for m in BEZ.finditer(canvas)]
    cells = [((float(m.group(1)), float(m.group(2))), m.group(3))
             for m in CONTENT.finditer(canvas)]
    return segs, beziers, cells


def label_ink(spans, needle):
    """The page box of the label we are tracking: centre, ink height and width."""
    for txt, box in spans:
        if txt.strip() == needle:
            return ((box[0] + box[2]) / 2, (box[1] + box[3]) / 2), box[3] - box[1], box[2] - box[0]
    return None


def report_bend(name, body, deg, needle):
    cubics, straights, spans = on_page(name, body)
    if not cubics:
        print("   %-10s pgf wrote no cubic (%d lines, %d cubics) -- tikz-cd's bend is not `to`"
              % (name, len(straights), len(cubics)))
        return
    seg = max(cubics, key=lambda s: math.hypot(s[3][0] - s[0][0], s[3][1] - s[0][1]))
    a, b = seg[0], seg[3]
    chord = math.hypot(b[0] - a[0], b[1] - a[1])
    apex, tang = cubic_at(seg, 0.5)
    d, t = perp(apex, a, b)
    arm = math.hypot(seg[1][0] - a[0], seg[1][1] - a[1])
    print("   %-10s page: chord %.3fcm  apex %+.3f along %.4f  arm %.4f*chord  "
          "0.2925*chord*sin%+d = %+.3f"
          % (name, chord, d, t, arm / chord, deg, -0.2925 * chord * math.sin(math.radians(deg))))
    ink = label_ink(spans, needle)
    if ink:
        (cx, cy), hh, hw = ink
        # measured off the curve's own tangent at the apex, right-hand positive, like every other number
        ld = perp((cx, cy), apex, (apex[0] + tang[0], apex[1] + tang[1]))[0]
        _, lt = perp((cx, cy), a, b)
        print("              label ink %.3fx%.3f centre %+.3f from the curve, at %.4f of the chord"
              % (hw, hh, ld, lt))
    got = canvas_of(body)
    if not got:
        print("          ours: build_cd refused")
        return
    segs, beziers, cells = got
    if beziers:
        bz = beziers[0][0], beziers[0][2], beziers[0][3], beziers[0][1]
        d2, t2 = perp(cubic_at(bz, 0.5)[0], bz[0], bz[3])
        print("          ours: bezier apex %+.3f from its own chord, along %.4f" % (d2, t2))
        return
    # a polyline bend: the two segments that share a vertex are the two arms
    arms = [((p, q), (u, v)) for i, (p, q) in enumerate(segs)
            for j, (u, v) in enumerate(segs)
            if i != j and abs(q[0] - u[0]) < 1e-4 and abs(q[1] - u[1]) < 1e-4]
    if not arms:
        print("          ours: %d segments, no shared vertex (not drawn as a bend)" % len(segs))
        return
    (p0, apex), (apex2, p1) = arms[0]
    d2, t2 = perp(apex, p0, p1)
    print("          ours: polyline apex %+.3f from its own chord (chord %.3fcm), along %.4f"
          % (d2, math.hypot(p1[0] - p0[0], p1[1] - p0[1]), t2))
    for (x, y), content in cells:
        if content.strip().strip("$").strip() == needle:
            d3, t3 = perp((x, y), p0, p1)
            length = math.hypot(p1[0] - p0[0], p1[1] - p0[1])
            nx, ny = (p1[1] - p0[1]) / length, -(p1[0] - p0[0]) / length
            print("          ours: label %r %+.3f from the chord, along %.4f "
                  "(law off %.3f, apex-to-label %+.3f)"
                  % (content[:16], d3, t3, cetz.cd_label_off(content, nx, ny), d3 - d2))


def report_gap(name, body):
    """Every ink the page puts beside this arrow, and where our law puts the same label."""
    cubics, straights, spans = on_page(name, body)
    cand = [s for s in straights
            if math.hypot(s[1][0] - s[0][0], s[1][1] - s[0][1]) > 0.8]
    if not cand:
        print("   %-9s no shaft longer than 0.8cm" % name)
        return
    shaft = max(cand, key=lambda s: math.hypot(s[1][0] - s[0][0], s[1][1] - s[0][1]))
    for txt, box in spans:
        if txt.strip() in ("A", "B"):
            continue
        d, t = perp(((box[0] + box[2]) / 2, (box[1] + box[3]) / 2), shaft[0], shaft[1])
        print("   %-9s page: %-12r ink %.3fx%.3f centre %+.3f from the shaft (near edge %+.3f), "
              "along %.4f" % (name, txt, box[2] - box[0], box[3] - box[1], d,
                              abs(d) - (box[3] - box[1]) / 2, t))
    got = canvas_of(body)
    if not got:
        print("           ours: build_cd refused")
        return
    segs, beziers, cells = got
    ours_shaft = None
    for p, q in segs:
        if math.hypot(q[0] - p[0], q[1] - p[1]) > 0.8:
            ours_shaft = (p, q)
            break
    for (x, y), content in cells:
        bare = content.strip().strip("$").strip()
        if bare in ("A", "B"):
            continue
        if not ours_shaft:
            print("           ours: label %r, no shaft to measure from" % content[:16])
            continue
        d2, t2 = perp((x, y), ours_shaft[0], ours_shaft[1])
        print("           ours: label %r centre %+.3f from the shaft, along %.4f (law %.3f + "
              "half-box)" % (content[:16], d2, t2, cetz.CD_LABEL_GAP))


def width_round(name, body, first):
    cubics, straights, spans = on_page(name, body)
    xs = {t.strip(): (box[0] + box[2]) / 2 for t, box in spans if t.strip() in ("A", "B")}
    gap = xs.get("B", 0) - xs.get("A", 0)
    print("   %-9s page: cell centres A %.3f B %.3f gap %.3fcm  delta %+.3f vs nolabel"
          % (name, xs.get("A", 0), xs.get("B", 0), gap, gap - (first or gap)))
    for t, box in spans:
        if t.strip() not in ("A", "B"):
            print("      ink %-14r x %.3f..%.3f" % (t[:14], box[0], box[2]))
    got = canvas_of(body)
    if got:
        segs, beziers, cells = got
        bare = lambda c: c.strip().strip("$").strip()
        print("      ours: cell x %s label %s"
              % (["%.3f" % x for (x, y), c in cells if bare(c) in ("A", "B")],
                 ["%r@%.3f" % (c[:12], x) for (x, y), c in cells if bare(c) not in ("A", "B")]))
    return first or gap


def main():
    print("== ① is tikz-cd's `bend left=deg` pgf's `to`, and which side does each of us bend to?")
    for name, body, deg, needle in BEND:
        report_bend(name, body, deg, needle)
    print("== ② how far does a label hang off its own arrow -- page vs our law")
    for name, body in GAP:
        report_gap(name, body)
    print("== ③ does a long arrow label push the next column?")
    gap = None
    for name, body in WIDTH:
        gap = width_round(name, body, gap)


if __name__ == "__main__":
    main()
