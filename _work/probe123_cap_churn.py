r"""#90 change surface, same ruler on both versions of the same source pictures.

The emitter now says `cap:`/`join:` and carries pgf's miter limit on every rule, which touches the
`stroke:` dictionary of every drawn statement in the corpus -- so the number worth having is not how
many lines differ but WHICH PICTURES differ for a reason the page can show.  Old and new run over the
same flat pictures: `stroke_args` is stubbed back to its pre-round shape (paint, thickness, dash and
nothing else) -- with that stub the head's pen keys are simply never read, so the whole round is out
-- and the two canvases are compared line by line.

A canvas that differs only by `miter-limit: 10` is a corner between the two engines' carry limits
(Typst bevels above ratio 4, pgf above 10, `_work/measure90_cap_join.py`) and moves ink only where a
pen is heavy enough to show it; a canvas that gains a `cap:` or a `join:` is an author's key arriving.
Both are counted apart, and the sharpest literal corner of each miter-only picture is read out to say
whether the limit can bite there at all.
"""
import io
import math
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
COORD = re.compile(r"\(\s*([-+0-9.]+)\s*,\s*([-+0-9.]+)\s*\)")

from t2t import cetz


def old_stroke_args(o, pal=None):
    """The pre-round builder: paint, pgf's weight, dash -- no ends, no corners, no limit."""
    paint = cetz.color_option(o, pal)
    thickness = None
    width = o.get("line width")
    if isinstance(width, str):
        m = re.fullmatch(r"([\d.]+)\s*(pt|mm|cm)", width)
        if m:
            thickness = "%spt" % (float(m.group(1))
                                  * {"pt": 1, "mm": 2.8346, "cm": 28.346}[m.group(2)])
    dash = "dashed" if o.get("dashed") is True else (
        "dotted" if o.get("dotted") is True else None)
    parts = []
    if paint:
        parts.append("paint: " + paint)
    parts.append("thickness: " + (thickness or cetz.DEFAULT_RULE_PT))
    if dash:
        parts.append('dash: "%s"' % dash)
    return ["stroke: (%s)" % ", ".join(parts)]


def pen_pt(pic):
    """The heaviest pen a picture spells, in page pt (0.4pt where it says nothing)."""
    got = 0.4
    for m in re.finditer(r"line width\s*=\s*([0-9.]+)\s*(pt|bp|mm|cm|in)", pic):
        got = max(got, float(m.group(1)) * {"pt": 1.0, "bp": 1.0, "mm": 2.8346,
                                            "cm": 28.346, "in": 72.27}[m.group(2)])
    for name, val in (("ultra thin", 0.1), ("thin", 0.4), ("semithick", 0.6), ("thick", 0.8),
                      ("very thick", 1.2), ("ultra thick", 1.6)):
        if re.search(r"\[" + re.escape(name) + r"\]|,\s*" + re.escape(name) + r"\b", pic):
            got = max(got, val)
    return got


def corners(pic):
    """The sharpest angle between two neighbouring literal legs of any polyline in the picture.

    Literal coordinates only: a path drawn between node names has no coordinate to measure here, and
    guessing one would price a corner that is not there.
    """
    worst = None
    for stmt in re.findall(r"\\(?:draw|fill|filldraw|path|stroke)\b([^;]*);", pic, re.S):
        pts = [(float(x), float(y)) for x, y in COORD.findall(stmt)]
        for a, v, b in zip(pts, pts[1:], pts[2:]):
            u1 = math.hypot(a[0] - v[0], a[1] - v[1])
            u2 = math.hypot(b[0] - v[0], b[1] - v[1])
            if not u1 or not u2:
                continue
            cos = ((a[0] - v[0]) * (b[0] - v[0]) + (a[1] - v[1]) * (b[1] - v[1])) / (u1 * u2)
            ang = math.degrees(math.acos(max(-1.0, min(1.0, cos))))
            if worst is None or ang < worst:
                worst = ang
    return worst


stats = {"pics": 0, "same": 0, "limit": 0, "key": 0, "both": 0,
         "limit_visible": 0, "key_visible": 0, "papers_limit": set(), "papers_key": set(),
         "papers_dropped": set()}
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    paper = fn[:-4]
    for pic in PIC.findall(text):
        got_new = cetz.build(pic)
        if got_new is None:
            stats["papers_dropped"].add(paper)
            continue
        stats["pics"] += 1
        real = cetz.stroke_args
        cetz.stroke_args = old_stroke_args
        try:
            got_old = cetz.build(pic)
        finally:
            cetz.stroke_args = real
        if got_old == got_new:
            stats["same"] += 1
            continue
        has_key = 'cap: "' in got_new or 'join: "' in got_new
        only_limit = not has_key
        heavy = pen_pt(pic) >= 4.0
        if only_limit:
            stats["limit"] += 1
            stats["papers_limit"].add(paper)
            if heavy:
                stats["limit_visible"] += 1
        else:
            stats["both" if "miter-limit" in got_new else "key"] += 1
            stats["papers_key"].add(paper)
            if heavy:
                stats["key_visible"] += 1

print("pictures emitted=%d  unchanged=%d  changed=%d" %
      (stats["pics"], stats["same"], stats["pics"] - stats["same"]))
print("changed only by miter-limit=%d over %d papers (pen >=4pt: %d)" %
      (stats["limit"], len(stats["papers_limit"]), stats["limit_visible"]))
print("changed by a written cap/join=%d (+ limit too=%d) over %d papers (pen >=4pt: %d)" %
      (stats["key"], stats["both"], len(stats["papers_key"]), stats["key_visible"]))
print("pictures the converter still refuses=%d papers" % len(stats["papers_dropped"]))

# of the miter-only pictures, how many hold a corner the two engines actually disagree on?  The
# disagreement is a BAND, not a tail: below 11.5deg the ratio passes even pgf's limit and BOTH bevel,
# above 29.0deg both point, and only between them does Typst cut a tip pgf keeps.
bite = []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        got_new = cetz.build(pic)
        if got_new is None or 'cap: "' in got_new or 'join: "' in got_new:
            continue
        worst = corners(pic)
        if worst is not None and worst < 32.0:
            bite.append((fn[:-4], round(worst, 1), round(pen_pt(pic), 2),
                         "BAND" if 11.5 <= worst < 29.0 else
                         ("both-bevel" if worst < 11.5 else "both-point")))
print("miter-only canvases with a literal corner under 32deg=%d, in the disagreement band "
      "[11.5,29)=%d, beveled by both=%d" % (len(bite), len([b for b in bite if b[3] == "BAND"]),
                                            len([b for b in bite if b[3] == "both-bevel"])))
for b in sorted(bite, key=lambda x: x[1])[:14]:
    print("   %-58s corner=%sdeg pen=%spt %s" % b[:4])
