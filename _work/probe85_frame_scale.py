r"""#85：把互压普查的两条假阳机制量成数字——「框」的尺度，与叠字的归属。

`_work/probe81_label_box_face.py` 的 `is_frame` 认**任何**描边矩形，于是 125×91pt 的区域底图也是「框」。
`overlap` 取 `min(重叠宽, 重叠高)`：框一大，任何一个贴边的标签都被读成**侵入到自身高度那么深**（轴 67 ③）。
另一条：`on-ink` 的像素确认只问「重叠窗里有没有墨」，而 Typst 的 span 盒比字形高（轴 62），
相邻两行的**行盒**相碰就有墨可数——76 张控制干净的画布里 32 张只带 ≤1.5pt 的对，正是这一档。

这一支不修尺，先把两件事量出来（人口＝第一个参数那份旗标名单，默认 `_work/label81_pairs.json`；
要量**上一代**的 152 张就传 `label84_pairs.json`——三档定价必须在同一份人口上比，跨人口的对数不是对照）：

1. **节点框与区域矩形的比值面**：每个被认下的矩形，量它自己的宽/高，与框内自有文字（中心落在框里的那些
   span）的最宽/最高者之比。两群分得开才谈「把框限定在与自身文字同数量级」；顺带把 item 类型查个全——
   若全库根本没有描边的 `re`，那「按 `re`/`qu` 分」这条更聪明的路就当场作废。
2. **叠字的归属**：`hits` 从行盒里造出的**同一批候选**，同时按四种价格读——行盒（普查原来说的）、
   窗里有墨（旧判据）、两段各自的墨盒（span 级）、一对字母的墨盒（字母级，就是 `decide` 现在走的）。
   后三种都调尺自己的函数，不在这里重写一遍墨盒的算法。

  python _work/probe85_frame_scale.py [limit] [pairs.json]

读数落 `_work/frame85_rows.json`。
"""
import json
import os
import sys
import concurrent.futures

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe81_label_box_face as g  # noqa: E402

SCALES = (1.25, 1.5, 2.0, 2.5, 3.0, 4.0, 6.0)


def key_of(rect):
    return (round(rect.x0, 1), round(rect.y0, 1), round(rect.x1, 1), round(rect.y1, 1))


def signatures(page):
    """item-type signature for every rectangle `is_frame` accepts on this page."""
    out = {}
    for d in page.get_drawings():
        if d.get("color") is None or not g.is_frame(d):
            continue
        key = key_of(d["rect"])
        sig = ",".join(sorted({i[0] for i in d["items"]})) + "/" + str(d.get("type", "?"))
        out.setdefault(key, sig)
    return out


def own_extent(rect, ink):
    """Widest/tallest span whose centre sits inside this frame: the text the frame was fitted to."""
    ws, hs = [], []
    for _t, band in ink:
        cx, cy = (band.x0 + band.x1) / 2, (band.y0 + band.y1) / 2
        if rect.x0 <= cx <= rect.x1 and rect.y0 <= cy <= rect.y1:
            ws.append(band.width)
            hs.append(band.height)
    return (max(ws), max(hs)) if ws else (0.0, 0.0)


def one(item):
    i, ((stem, k), (head, block)) = item
    got = g.render(block, "e%04d_%d" % (i, k), head)
    if not got:
        return None
    rects, ink, pdf = got
    doc = fitz.open(pdf)
    sig = signatures(doc[0])

    found, _both = g.hits(rects, ink)
    if found:
        caps = g.confirmed(pdf, [t[5] for t in found])
        found = [t for t, ok in zip(found, caps) if ok]

    # frame side: how does an invaded box differ in scale from a box nobody invades?
    invaded = {key_of(t[6]) for t in found}
    frames = []
    for r in rects:
        ow, oh = own_extent(r, ink)
        frames.append([key_of(r), round(r.width, 1), round(r.height, 1),
                       round(ow, 1), round(oh, 1),
                       sig.get(key_of(r), "?"), key_of(r) in invaded])

    # on-ink side: ONE candidate base -- what `hits` invents from the line boxes -- priced four ways,
    # all of them the gauge's own functions (window ink / span paint / letter paint), so this probe
    # cannot become a second gauge that disagrees with the census on its own numbers.
    _found, both = g.hits(rects, ink)
    paint = {}

    def tight(band):
        if id(band) not in paint:
            paint[id(band)] = g.tight_rect(doc, band)
        return paint[id(band)]

    gate = g.confirmed(pdf, [t[5] for t in both]) if both else []
    letter = g.confirmed_pairs(pdf, both) if both else []
    rows = []
    for (depth, _dx, _dy, t1, t2, _win, b1, b2), ok, cd in zip(both, gate, letter):
        i1, i2 = tight(b1), tight(b2)
        hit = g.overlap(i1, i2) if i1 and i2 else None
        rows.append([round(depth, 2), round(hit[1], 2) if hit else 0.0, round(cd, 2),
                     bool(ok), t1[:22], t2[:22]])
    doc.close()
    return {"stem": stem, "k": k, "frames": frames,
            "onink": rows, "foreign": [[round(t[0], 2), round(t[1], 2), round(t[2], 2), t[3],
                                       key_of(t[6])] for t in found]}


def main(limit=None, pairs="label81_pairs.json"):
    canv = g.canvases()
    flagged = {(r[0], r[1]) for r in json.load(open(os.path.join(HERE, pairs), encoding="utf-8"))}
    items = sorted((key, value) for key, value in canv.items() if key in flagged)
    if limit:
        items = items[:limit]
    print("flagged canvases: %d of %d" % (len(items), len(canv)), flush=True)
    rows = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
        for r in pool.map(one, enumerate(items)):
            if r:
                rows.append(r)
    with open(os.path.join(HERE, "frame85_rows.json"), "w", encoding="utf-8") as fh:
        json.dump(rows, fh, ensure_ascii=False)

    frames = [f for r in rows for f in r["frames"]]
    print("frames accepted by is_frame: %d in %d canvases" % (len(frames), len(rows)))
    print("  signatures: %s" % json.dumps(
        {sig: sum(1 for f in frames if f[5] == sig)
         for sig in sorted({f[5] for f in frames})}))
    print("  ratio width/own-text-width, by invaded vs clean frame:")
    for label, sel in (("invaded", True), ("clean     ", False)):
        vals = sorted(f[1] / f[3] for f in frames if f[6] is sel and f[3] > 0)
        if not vals:
            print("    %s: none" % label)
            continue
        n = len(vals)
        print("    %s n=%-4d  p10 %.2f  p50 %.2f  p90 %.2f  max %.2f"
              % (label, n, vals[n // 10], vals[n // 2], vals[min(n - 1, 9 * n // 10)], vals[-1]))
    print("  foreign pairs by the invaded box's ratio:")
    ratio = {f[0]: (f[1] / f[3] if f[3] else 0.0) for f in frames}
    allp = [t for r in rows for t in r["foreign"]]
    for lo, hi in ((0, 1.5), (1.5, 2.5), (2.5, 4), (4, 8), (8, 1e9)):
        n = sum(1 for t in allp if lo <= ratio.get(tuple(t[4]), 0) < hi)
        deep = sum(1 for t in allp if lo <= ratio.get(tuple(t[4]), 0) < hi and t[0] > 1.5)
        print("    ratio %s%-5s pairs=%-3d (depth >1.5pt: %d)"
              % (("[%g,%g)" % (lo, hi)).ljust(9), "", n, deep))
    print("  frames a ratio rule would keep as node frames:")
    for s in SCALES:
        keep = [f for f in frames if f[3] > 0 and f[1] <= s * f[3] and f[2] <= s * (f[4] or 1)]
        lost = [t for r in rows for t in r["foreign"] if tuple(t[4]) not in {f[0] for f in keep}]
        print("    <= %.2f x own text: frames %-5d (of %d)  foreign pairs dropped %-4d"
              % (s, len(keep), len(frames), len(lost)))

    old = [r for row in rows for r in row["onink"]]
    print("on-ink candidates (line boxes): %d in %d canvases"
          % (len(old), sum(1 for r in rows if r["onink"])))
    for lo, hi in ((0, 1.5), (1.5, 3.0), (3.0, 1e9)):
        sub = [r for r in old if lo <= r[0] < hi]
        print("   depth [%g,%s): line-box %-4d  window-ink(旧判据) %-4d  span-paint %-4d  letter-paint %-4d"
              % (lo, "inf" if hi > 1e8 else "%g" % hi, len(sub),
                 sum(1 for r in sub if r[3]),
                 sum(1 for r in sub if r[1] > 0), sum(1 for r in sub if r[2] > 0)))
    for label, gate, price in (("window-ink(旧判据)", lambda r: r[3], 0),
                               ("span-paint        ", lambda r: r[1] > 0, 1),
                               ("letter-paint      ", lambda r: r[2] > 0, 2)):
        kept = [r for r in old if gate(r)]
        print("   %s keeps %d pairs in %d canvases; deepest priced %s"
              % (label, len(kept),
                 sum(1 for row in rows if any(gate(r) for r in row["onink"])),
                 json.dumps(sorted((r[price] for r in kept), reverse=True)[:6])))


if __name__ == "__main__":
    main(int(sys.argv[1]) if len(sys.argv) > 1 else None,
         sys.argv[2] if len(sys.argv) > 2 else "label81_pairs.json")
