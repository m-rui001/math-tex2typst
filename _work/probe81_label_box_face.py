r"""§7「标签与盒子的字宽互压」普查：一张画布上，别的节点的墨有没有压进这个盒子里？

CeTz 摆节点只按作者写下的尺寸与按字数估的墨（#73/#74），**盒与盒、标签与盒之间的互不重叠从来没人量过**。
这一支先把面量出来，判据在渲染页上：把每张画布**单独**用 typst 排成一页（一张画布一页＝归属没有歧义，
也不会有表格网格混进来——`word_overlap_report` 那族把表格缺陷记成图缺陷的教训），再读

人口取**产物里的 `#cetz.canvas(` 块**，不是拿 `cetz.build` 重建：重建没有批的引用表，`\ref{lem:clean}`
会被印成一串「Lemma~lem:clean」的墨，页上根本没有那东西（#49 那条「量具的输入必须是发射器看到的串」）。
每页前面带上**本篇自己的 prelude**——字号与 leading 由它定，用 Typst 默认值会把每个词估宽。

* **foreign ink**：某段墨（span）的矩形与某个画出来的矩形相交，而它的**中心在框外**——这不是「自己的字走出
  自己的框」（那条尺是 `_work/probe_frame_ink_overflow.py`，框内正文居中对齐，中心本就落在框里），
  是**别人的墨压进这个框**；
* **ink on ink**：两段墨的矩形相交而中心不同——两条标签互相叠字。

读 span 不读 word：fitz 把同行相邻的两个文本对象拼成一个 word（控制图里 `BOXED` + `INVADES` 被读成
`BOXEDINVADES`），而**拼接正是压字的表现**——用 word 当人口，越严重越看不见。

穿透深度取 `min(重叠宽, 重叠高)`，门槛 `DEPTH_PT = 1.0`（与轴 62 同律：严重度取垂直进入的深度，不取弦长）。
**叠字一族的深度不取行盒，取双方各自的墨在同一个字母上相交**（`tight_rect`／`char_boxes`／`confirmed_pairs`，
#85 量出来的）：行盒相交是排版的必然，字母级的墨相交才是页上看得见的事——旧判据在 152 张旗标画布上给 269 对，
其中 66 对有一方在重叠窗里根本没涂墨，而 58 对在 ≤1.5pt 那一档（97→39）、8 对在 1.5–3pt（96→88）、
>3pt 一对不少（76→76）；整行的墨盒仍会把「一行的下伸部 × 下一行的上伸部」读成 1.7pt 的相碰，故再降到字母。
**「框要与自身文字同数量级」这一支已测否**（`_work/probe85_frame_scale.py`：被侵框的宽/自有文字宽 p50 6.47、
干净框 4.08，两群分不开；认下的 83 个框里 77 个是 `qu`、只有 6 个描边 `re`，按 item 类型分同样否），
所以 `foreign` 一支仍按整框面积量，归因交给控制侧（轴 67）。

用法：
  python _work/probe81_label_box_face.py face            # 只数人口，不跑 typst
  python _work/probe81_label_box_face.py render [N]      # 渲染有框的画布，N 限张数（默认全部）
"""
import glob
import io
import os
import subprocess
import sys
import unicodedata

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_m81render")
HEAD = '#import "@preview/cetz:0.5.0"\n'
PAGE = '#set page(width: 30cm, height: 22cm, margin: 0cm)\n'
# a node's own rectangle: keep the same candidate window as probe_frame_ink_overflow
MIN_W, MAX_W, MAX_H = 8.0, 220.0, 140.0
DEPTH_PT = 1.0


def canvas_blocks(text):
    """Every `#cetz.canvas(...)` block in a product, with its own bracket-matched end.

    The population has to be what the page shows: `cetz.build` without the batch's reference table
    turns a `\\ref` into literal ink (`Lemma~lem:clean`) that never reaches the page.
    """
    out, i = [], 0
    while True:
        j = text.find("#cetz.canvas(", i)
        if j < 0:
            return out
        depth, k, quoted = 0, j + len("#cetz.canvas"), False
        while k < len(text):
            char = text[k]
            if char == '"':
                quoted = not quoted
            elif not quoted:
                if char == "(":
                    depth += 1
                elif char == ")":
                    depth -= 1
                    if not depth:
                        break
            k += 1
        out.append(text[j:k + 1])
        i = k + 1


def header_of(text):
    """The product's own prelude lines, so the canvas is laid out at the paper's font size and leading.

    Rendering with Typst's defaults would price the ink at the wrong size -- most papers set
    `text(size:)` in their preamble, and a census of collisions that inflates every word over-reports.
    """
    keep = ("#import", "#let", "#set", "#show", "//")
    lines = []
    for line in text.splitlines():
        if not line.strip():
            continue
        if line.startswith(keep):
            lines.append(line)
        else:
            break
    return "\n".join(lines) + "\n"


def canvases():
    """Every canvas on the pages themselves, keyed by (paper stem, picture index)."""
    out = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        text = open(path, encoding="utf-8", errors="replace").read()
        head = header_of(text) + PAGE
        for k, block in enumerate(canvas_blocks(text)):
            out[(stem, k)] = (head, block)
    return out


def is_frame(d):
    r"""Does this stroked path trace one rectangle?

    Typst emits a node frame as a single `re` (the box frame) or `qu` (a drawn rectangle), and CeTz's
    own `\draw` rectangles come out as four axis-aligned segments. A curve or a polygon has a bounding
    box too, and counting that as a "box" makes every label that brushes the *box around* an arc read
    as an invasion (the crops of the first pass were full of them).
    """
    items = d["items"]
    if len(items) == 1 and items[0][0] in ("re", "qu"):
        return True
    if len(items) != 4 or any(i[0] != "l" for i in items):
        return False
    vert = [i for i in items if abs(i[1].x - i[2].x) < 0.05]
    hor = [i for i in items if abs(i[1].y - i[2].y) < 0.05]
    if len(vert) != 2 or len(hor) != 2:
        return False
    xs = {round(i[1].x, 1) for i in vert}
    ys = {round(i[1].y, 1) for i in hor}
    r = d["rect"]
    return (len(xs) == 2 and len(ys) == 2
            and abs(min(xs) - r.x0) < 0.05 and abs(max(xs) - r.x1) < 0.05
            and abs(min(ys) - r.y0) < 0.05 and abs(max(ys) - r.y1) < 0.05)


def boxes_and_ink(page):
    r"""(node frames, ink spans) on one page of one canvas.

    A frame has to be **stroked**: the census that counted every filled rectangle made a shaded grid
    cell and a `fill=white` label background into "boxes", and ink crossing those is no defect at all.

    And it has to **hold text** -- the fifth false-positive class, found by reading the worst residual
    canvas (`Finite-cylinder-…`, whose "collision" was the author's own prose sitting on a grid of
    `\draw … rectangle` cells). A node frame in this pipeline always carries its node's text, so a bare
    rectangle has no label to be invaded and nothing to price. Face and readings: §7 那一行.
    """
    ink = []
    for block in page.get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            for span in line.get("spans", []):
                text = unicodedata.normalize("NFKD", span["text"]).replace(" ", "")
                if text:
                    ink.append((text, fitz.Rect(span["bbox"])))
    rects, seen = [], set()
    for d in page.get_drawings():
        if d.get("color") is None or not is_frame(d):
            continue
        r = d["rect"]
        key = (round(r.x0, 1), round(r.y0, 1), round(r.x1, 1), round(r.y1, 1))
        if key in seen:
            continue
        seen.add(key)
        if not (MIN_W <= r.width <= MAX_W and 2 < r.height <= MAX_H):
            continue
        core = fitz.Rect(r.x0 + 1.0, r.y0 + 1.0, r.x1 - 1.0, r.y1 - 1.0)
        if any(core.x0 <= (s.x0 + s.x1) / 2 <= core.x1 and core.y0 <= (s.y0 + s.y1) / 2 <= core.y1
               for _t, s in ink):
            rects.append(r)
    return rects, ink


def overlap(a, b):
    """The intersection rectangle of two boxes, or None when they do not cross the depth floor."""
    ox, oy = min(a.x1, b.x1) - max(a.x0, b.x0), min(a.y1, b.y1) - max(a.y0, b.y0)
    if ox > DEPTH_PT and oy > DEPTH_PT:
        return fitz.Rect(max(a.x0, b.x0), max(a.y0, b.y0), min(a.x1, b.x1), min(a.y1, b.y1)), \
            min(ox, oy)
    return None


def inner(band, rect, inset=1.0):
    """Where the ink lies strictly inside the frame, past the pen.

    A stroked box is ink too: pixel-counting the raw overlap window confirms every pair with the
    frame's own border line. The box's geometric rect carries no stroke width, so the pen sits
    within about half a point of it -- one point in is already clear of it.
    """
    r = fitz.Rect(rect.x0 + inset, rect.y0 + inset, rect.x1 - inset, rect.y1 - inset)
    got = fitz.Rect(max(band.x0, r.x0), max(band.y0, r.y0), min(band.x1, r.x1), min(band.y1, r.y1))
    return got if got.width > 0 and got.height > 0 else None


def tight_rect(doc, band):
    """The rectangle one span's own paint covers at 300 dpi, or None where it paints nothing.

    A Typst span box is a layout box (轴 62: an 11pt line is 0.388cm tall, its ink ~0.28cm), so two
    consecutive lines' boxes cross without any glyph touching. The painted box is the only thing that
    can say the ink is really there.
    """
    pix = doc[0].get_pixmap(clip=band, dpi=300, colorspace=fitz.csGRAY)
    w, h, stride, samples = pix.width, pix.height, pix.stride, pix.samples
    top = bottom = None
    for y in range(h):
        if min(samples[y * stride:y * stride + w]) < 128:
            if top is None:
                top = y
            bottom = y
    if top is None:
        return None
    left = right = None
    for x in range(w):
        if min(samples[y * stride + x] for y in range(top, bottom + 1)) < 128:
            if left is None:
                left = x
            right = x
    scale = 300.0 / 72.0
    return fitz.Rect(band.x0 + left / scale, band.y0 + top / scale,
                     band.x0 + (right + 1) / scale, band.y0 + (bottom + 1) / scale)


def char_boxes(doc, band):
    """Layout boxes of the characters that make up one span.

    A span's paint box is still a line-level object: the descender of a `g` at one end of a long line
    and the ascender of an `h` at the other end of the next line cross by 1.7pt with nothing touching
    on the page (`A-Charged-Reduction-…`, read at 300 dpi). Only a character is small enough to say
    whose ink is in the crossing.
    """
    out = []
    for block in doc[0].get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            for span in line.get("spans", []):
                r = fitz.Rect(span["bbox"])
                if (abs(r.x0 - band.x0) > 0.1 or abs(r.y0 - band.y0) > 0.1
                        or abs(r.x1 - band.x1) > 0.1 or abs(r.y1 - band.y1) > 0.1):
                    continue
                for ch in span["chars"]:
                    if ch["c"].strip():
                        out.append(fitz.Rect(ch["bbox"]))
    return out


def confirmed_pairs(pdf, pairs):
    """Per on-ink pair, the depth two *characters* -- one from each span -- really cross; 0 where none do.

    The candidates come off the line boxes, which is right for finding them and wrong for pricing them.
    `#85` measured the old "is there any ink in the window" rule against this one on 152 flagged canvases:
    66 of its 269 pairs have one side painting nothing in the crossing (58 of them in the <=1.5pt class
    the line-box overlap invented, 97 -> 39; 8 in 1.5-3pt, 96 -> 88; none above 3pt, 76 -> 76). Span
    paint boxes still invent the shallow tail, so the price is taken at the character: the span boxes
    first, and characters only where those cross.
    """
    doc = fitz.open(pdf)
    paint, chars = {}, {}
    out = []

    def paint_of(rect):
        key = (round(rect.x0, 2), round(rect.y0, 2), round(rect.x1, 2), round(rect.y1, 2))
        if key not in paint:
            paint[key] = tight_rect(doc, rect)
        return paint[key]

    def chars_of(band):
        if id(band) not in chars:
            chars[id(band)] = char_boxes(doc, band)
        return chars[id(band)]

    for t in pairs:
        ia, ib = paint_of(t[6]), paint_of(t[7])
        got = overlap(ia, ib) if ia and ib else None
        best = 0.0
        if got:
            window = got[0]
            ca = [x for x in (paint_of(r) for r in chars_of(t[6]) if r.intersects(window)) if x]
            cb = [x for x in (paint_of(r) for r in chars_of(t[7]) if r.intersects(window)) if x]
            for x in ca:
                for y in cb:
                    hit = overlap(x, y)
                    if hit and hit[1] > best:
                        best = hit[1]
        out.append(round(best, 2))
    doc.close()
    return out


def decide(pdf, rects, ink):
    """(foreign pairs, on-ink pairs) on one rendered page, both decided on pixels, not on layout boxes.

    Every caller -- the census, the control side, the attribution run -- reads a canvas through here,
    so the two families cannot drift apart into two different gauges.
    """
    found, both = hits(rects, ink)
    if found:
        caps = confirmed(pdf, [t[5] for t in found])
        found = [t for t, ok in zip(found, caps) if ok]
    if both:
        depths = confirmed_pairs(pdf, both)
        both = [(d,) + t[1:] for t, d in zip(both, depths) if d]
    return found, both


def hits(rects, ink):
    """(foreign-ink pairs, ink-on-ink pairs) as (depth, |Δcx|, |Δcy|, texts..., window, probe[, box/bands]).

    Index 4 is the overlap window, index 5 the ink-only window to confirm on pixels; a foreign-ink
    pair carries the invaded box as index 6, an ink-on-ink pair carries the two spans' own boxes there
    so `confirmed_pairs` can price the crossing on their paint rather than on their layout boxes.

    The two centre distances are recorded because a Typst span box is taller than its ink (轴 62:
    an 11pt line box is 0.388cm while the glyphs are ~0.28cm), so consecutive lines' boxes can brush
    each other without any glyph touching. The depth alone cannot tell those two apart.
    """
    found, both = [], []
    for r in rects:
        rx, ry = (r.x0 + r.x1) / 2, (r.y0 + r.y1) / 2
        for text, band in ink:
            cx, cy = (band.x0 + band.x1) / 2, (band.y0 + band.y1) / 2
            if r.x0 <= cx <= r.x1 and r.y0 <= cy <= r.y1:
                continue  # its own content: that is the overflow gauge's business
            got = overlap(band, r)
            if got:
                found.append((got[1], abs(cx - rx), abs(cy - ry), text, got[0], inner(band, r), r))
    for i in range(len(ink)):
        for j in range(i + 1, len(ink)):
            t1, b1 = ink[i]
            t2, b2 = ink[j]
            dx = abs((b1.x0 + b1.x1) / 2 - (b2.x0 + b2.x1) / 2)
            dy = abs((b1.y0 + b1.y1) / 2 - (b2.y0 + b2.y1) / 2)
            got = overlap(b1, b2)
            if got and (dx > 1.0 or dy > 1.0):
                both.append((got[1], dx, dy, t1, t2, got[0], b1, b2))
    return sorted(found, key=lambda t: -t[0]), sorted(both, key=lambda t: -t[0])


def confirmed(pdf, probes, floor=3):
    """Which candidate windows really hold ink at 300 dpi.

    Geometry alone cannot separate 叠字 from two line boxes brushing: only the pixels can say whether
    any glyph is inside the crossing (轴 62 的同一条律——Typst 把文字发成文字，墨只能像素量).
    """
    doc = fitz.open(pdf)
    out = []
    for window in probes:
        if window is None:
            out.append(0)
            continue
        pix = doc[0].get_pixmap(clip=window, dpi=300, colorspace=fitz.csGRAY)
        dark = sum(1 for byte in pix.samples if byte < 128)
        out.append(dark if dark >= floor else 0)
    doc.close()
    return out


def render(canvas, name, head=HEAD + PAGE):
    os.makedirs(TMP, exist_ok=True)
    tex = os.path.join(TMP, name + ".typ")
    open(tex, "w", encoding="utf-8").write(head + canvas + "\n")
    pdf = os.path.join(TMP, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    r = subprocess.run(["typst", "compile", "--root", ROOT, name + ".typ"],
                       cwd=TMP, capture_output=True)
    if r.returncode or not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    got = boxes_and_ink(doc[0])
    doc.close()
    return got[0], got[1], pdf


def mode_face():
    canv = canvases()
    print("canvases on the pages: %d in %d papers" % (len(canv), len({k[0] for k in canv})))
    print("  carrying a #box( frame: %d   with >=2 content() bodies: %d"
          % (sum(1 for v in canv.values() if "#box(" in v[1]),
             sum(1 for v in canv.values() if v[1].count("content(") >= 2)))
    return canv


def mode_render(limit=None):
    import concurrent.futures
    canv = mode_face()
    items = sorted(canv.items())
    if limit:
        items = items[:limit]
    print("rendering %d canvases (one per page)" % len(items), flush=True)

    def one(item):
        i, ((stem, k), (head, canvas)) = item
        got = render(canvas, "p%04d_%d" % (i, k), head)
        if not got:
            return (stem, k), None, None, None
        rects, ink, pdf = got
        found, both = decide(pdf, rects, ink)
        return (stem, k), (len(rects), len(ink)), found, both

    stats = {"ink": 0, "both": 0, "papers": set(), "canvases": 0}
    ink_low, ink_high = 0, 0
    both_low, both_high = 0, 0
    shallow, mid, deep = 0, 0, 0
    records = []
    worst = []
    bad = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as pool:
        for key, sizes, found, both in pool.map(one, enumerate(items)):
            if sizes is None:
                bad += 1
                continue
            if not (found or both):
                continue
            stats["ink"] += len(found)
            stats["both"] += len(both)
            ink_low += sum(1 for t in found if t[2] <= 6.0)
            ink_high += sum(1 for t in found if t[2] > 6.0)
            both_low += sum(1 for t in both if t[2] <= 6.0)
            both_high += sum(1 for t in both if t[2] > 6.0)
            shallow += sum(1 for t in both if t[0] <= 1.5)
            mid += sum(1 for t in both if 1.5 < t[0] <= 3.0)
            deep += sum(1 for t in both if t[0] > 3.0)
            stats["papers"].add(key[0])
            stats["canvases"] += 1
            records.append((key[0], key[1], sizes, found, both))
            worst.append(((found[0] if found else both[0]), key, sizes, len(found), len(both)))
    with open(os.path.join(HERE, "label85_face.txt"), "w", encoding="utf-8") as hist:
        hist.write("canvases %d   foreign %d   on-ink %d   depth <=1.5 %d   1.5-3 %d   >3 %d\n"
                   % (stats["canvases"], stats["ink"], stats["both"], shallow, mid, deep))
    with open(os.path.join(HERE, "label81_pairs.json"), "w", encoding="utf-8") as fh:
        import json
        json.dump([[stem, k, sizes,
                    [[round(t[0], 2), round(t[1], 2), round(t[2], 2), t[3],
                      [round(v, 2) for v in t[4]], [round(v, 2) for v in t[6]]]
                     for t in found],
                    [[round(t[0], 2), round(t[1], 2), round(t[2], 2), t[3], t[4],
                      [round(v, 2) for v in t[5]]] for t in both]]
                   for stem, k, sizes, found, both in records], fh, ensure_ascii=False)
    with open(os.path.join(HERE, "regen81.txt"), "w", encoding="utf-8") as names:
        for stem in sorted(stats["papers"]):
            names.write(stem + "\n")
    worst.sort(key=lambda t: -t[0][0])
    print("canvases rendered: %d   typst refused: %d" % (len(items), bad))
    print("canvases with a collision: %d in %d papers"
          % (stats["canvases"], len(stats["papers"])))
    print("foreign-ink pairs: %d   ink-on-ink pairs: %d" % (stats["ink"], stats["both"]))
    print("  foreign vertical centre distance <=6pt: %d   >6pt: %d" % (ink_low, ink_high))
    print("  ink-on-ink  vertical centre distance <=6pt: %d   >6pt: %d" % (both_low, both_high))
    for t, key, sizes, ni, nw in worst[:12]:
        box = t[6] if ni else t[5]
        print("  worst %.1fpt  %r into a %.0fx%.0fpt box  %s#%d (boxes=%d ink=%d, %d foreign / %d on-ink)"
              % (t[0], t[3][:26], box.width, box.height,
                 key[0][:44], key[1], sizes[0], sizes[1], ni, nw))
    print("pairs in _work/label81_pairs.json, papers in _work/regen81.txt")


def mode_control():
    """Known positives: one node's label parked on another node's drawn box, and two labels on one spot.

    A census gauge that has never said `yes` to something is not evidence when it says `no`.
    """
    # hand-written canvas spelling is not a control -- take the string the emitter itself answers
    pic = (r"\begin{tikzpicture}"
           r"\node[draw, minimum width=2cm, minimum height=0.8cm] (a) at (0,0) {BOXED};"
           r"\node at (1.15, 0.30) {INVADES};"
           r"\node (b) at (0, 2) {FIRSTWORD};"
           r"\node (c) at (0.9, 2.1) {SECONDWORD};"
           r"\end{tikzpicture}")
    canvas = cetz.build(cetz.strip_envelope(pic))
    if not canvas:
        print("control picture refused by cetz.build -- fix the picture, not the canvas")
        return
    got = render(canvas, "control")
    if not got:
        print("CONTROL FAILED: typst refused the control canvas")
        return
    rects, ink, pdf = got
    found, both = decide(pdf, rects, ink)
    print("control: boxes=%d ink=%d  foreign-ink=%d %s  ink-on-ink=%d %s"
          % (len(rects), len(ink), len(found),
             [(round(t[0], 1), t[3]) for t in found[:2]],
             len(both), [(round(t[0], 1), t[3], t[4]) for t in both[:2]]))
    if not found or not both:
        print("CONTROL FAILED: the gauge misses one of the two collision kinds")


def mode_shot(count=6, skip=0, kind="ink"):
    """Write a 300 dpi crop around the flagged crossing of the N canvases the census ranked highest.

    A census this large is only closed by looking at the page: the pairs say how deep ink entered a
    frame, the crop says whether that is a defect or the gauge's own line box. `skip` walks down the
    ranking -- the top of the list is the worst geometry, the middle is what the face is made of.
    `kind` picks the family: `ink` = a label crossing a node frame, `on` = two labels on each other.
    """
    import json
    records = json.load(open(os.path.join(HERE, "label81_pairs.json"), encoding="utf-8"))
    which = 3 if kind == "ink" else 4
    ranked = sorted(records, key=lambda r: -max([t[0] for t in r[which]] or [0]))[skip:skip + count]
    canv = canvases()
    for stem, k, _sizes, found, both in ranked:
        pairs = found if kind == "ink" else both
        if not pairs:
            continue
        pair = canv.get((stem, k))
        if pair is None:
            continue
        head, block = pair
        name = "shot%s%d_%s" % (kind[0], k, "".join(c for c in stem if c.isalnum())[:18])
        if not render(block, name, head):
            print("shot refused: %s#%d" % (stem[:40], k))
            continue
        depth, _dx, _dy = pairs[0][0], pairs[0][1], pairs[0][2]
        text = pairs[0][3] if kind == "ink" else "%s|%s" % (pairs[0][3], pairs[0][4])
        win = pairs[0][5] if kind == "on" else pairs[0][4]
        pad = 25.0
        doc = fitz.open(os.path.join(TMP, name + ".pdf"))
        pix = doc[0].get_pixmap(clip=fitz.Rect(win[0] - pad, win[1] - pad,
                                               win[2] + pad, win[3] + pad), dpi=300)
        out = os.path.join(HERE, name + ".png")
        pix.save(out)
        doc.close()
        print("worst %.1fpt  %r  window %.0fx%.0fpt  ->  _work/%s.png"
              % (depth, text[:34], win[2] - win[0], win[3] - win[1], name))


BANG = "#h(-1em)"
# LaTeX's `\!` is -3mu, and one mu is 1/18 em in math -- a kern, not a collision.
BANG_TRUE = "#h(-0.16667em)"


def mode_attrib():
    """How much of the ink-on-ink face is pandoc's `\\!` -> `#h(-1em)`?

    Re-render the flagged canvases with the backspace replaced by its true value and recount. This is
    the attribution step: the census gives the face, the substitution gives the share one mapping owns.
    """
    import json
    import concurrent.futures
    records = json.load(open(os.path.join(HERE, "label81_pairs.json"), encoding="utf-8"))
    canv = canvases()
    items = [(stem, k) for stem, k, _s, _f, both in records if both]
    print("canvases with ink-on-ink pairs: %d in %d papers   pairs: %d"
          % (len(items), len({s for s, _ in items}), sum(len(r[4]) for r in records)))

    def one(item):
        i, (stem, k) = item
        head, block = canv[(stem, k)]
        has = BANG in block
        got = render(block.replace(BANG, BANG_TRUE), "a%04d_%d" % (i, k), head)
        if not got:
            return None
        rects, ink, pdf = got
        found, both = decide(pdf, rects, ink)
        return stem, k, has, len(found), len(both)

    canvases_before = len(items)
    with_bang = 0
    pairs_after = 0
    canvases_after = 0
    papers = set()
    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as pool:
        for r in pool.map(one, enumerate(items)):
            if r is None:
                continue
            stem, k, has, nf, nb = r
            if has:
                with_bang += 1
            pairs_after += nb
            if nb:
                canvases_after += 1
                papers.add(stem)
    print("of those, carrying a #h(-1em): %d" % with_bang)
    print("after the replacement: canvases with a pair %d -> %d in %d papers   pairs: %d"
          % (canvases_before, canvases_after, len(papers), pairs_after))


if __name__ == "__main__":
    mode = (sys.argv[1:] or ["face"])[0]
    if mode == "face":
        mode_face()
    elif mode == "control":
        mode_control()
    elif mode == "attrib":
        mode_attrib()
    elif mode == "shot":
        mode_shot(int(sys.argv[2]) if len(sys.argv) > 2 else 6,
                  int(sys.argv[3]) if len(sys.argv) > 3 else 0,
                  sys.argv[4] if len(sys.argv) > 4 else "ink")
    else:
        mode_render(int(sys.argv[2]) if len(sys.argv) > 2 else None)
