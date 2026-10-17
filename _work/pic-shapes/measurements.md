# Measurements — pic-shapes family

Every TikZ/TeX fact below was read out of a pdflatex render of a control case (TeXLive 2025),
never guessed. The drivers live in this directory; the `.tex`/`.log`/`.pdf` they generate are the
evidence. No `typst` and no `tools/batch_typst.py` were run — the compile gate is the orchestrator's.

Three pictures are owned. Two convert (the self-loop, the multi-line `text width` legend); one is a
proved-legitimate refusal (the turned ellipse).

---

## 1. Self-loop off a circle node (`to[out=135,in=45,looseness=5]`) — Translative-covering #1

**Driver:** `measure_loop.py` (dumps pgf's own `\pgfpathmoveto`/`\pgfpathcurveto` scaled points) and
`measure_outer_sep.py` (reads the leave/return radius directly off the render).

pgf builds a loop whose two ends name the same **node** by taking its endpoints off the node's
border, not its centre. The relevant control (`measure_loop.py` `node_l5`, a `slot` circle
`minimum size=8mm` on pgf's default rule) reported:

    start=(-0.2878, 0.2878)  c1=(-1.0815, 1.0815)  c2=(1.0815, 1.0815)  end=(0.2878, 0.2878)

A same-**coordinate** loop (`coord_l5`, `(0,0) to ... (0,0)`) is degenerate — every control is
`(0,0)` — which is why the ring must be read from the *node*, so the case is guarded by `a == b`
in `_ring_at`.

### The border radius (the ring)

`measure_outer_sep.py` reads the leave/return radius for a family of nodes; every one agrees on
`ring = declared half-size + outer sep`, with `outer sep` answering half the node's own rule width:

| node                                  | radius R   | half-size | contributed sep |
|---------------------------------------|------------|-----------|-----------------|
| `minimum size=8mm`, default rule      | 0.4070 cm  | 0.4000    | 0.0070 = 0.4pt/2 |
| `minimum size=8mm`, `line width=2pt`  | 0.4351 cm  | 0.4000    | 0.0351 = 2pt/2   |
| `minimum size=8mm`, `outer sep=0pt`   | 0.4000 cm  | 0.4000    | 0.0000           |
| `minimum size=8mm`, `outer sep=1mm`   | 0.5000 cm  | 0.4000    | 0.1000           |
| `minimum size=20mm`, default rule     | 1.0070 cm  | 1.0000    | 0.0070           |

So `_outer_sep(o, xf)` returns `_length(outer sep)` when the author wrote one, else half the
node's `line width`, else half pgf's own 0.4pt rule (`PGF_LINE_WIDTH/2`); `_anchor_ring` returns
`half-size + outer sep` **only** for a declared `circle`, and `None` for a rectangle (`box_l5` leaves
at `(-0.4067, 0.4070)` — not a circle) or for a circle sized by its text, whose true radius
`measure_outer_sep.py` shows can outgrow the declared box (`wide text here` grew an 8mm circle to
1.2423 cm — the glyphs are unmeasurable, so that loop stays refused rather than drawn on a guess).

### From the ring to the emitted bezier

Endpoints: the ring's points at the tangent directions —
`(cx + R*cos135, cy + R*sin135)` = `(-0.2878, 0.2878)` and `(cx + R*cos45, …)` = `(0.2878, 0.2878)`
for the 8mm circle. The chord between them is `0.5756`; the control offset is `0.39 * chord * looseness`
= `0.39 * 0.5756 * 5` = `1.1224`, laid along each endpoint's own direction →
`c1 = (-0.2878 - 0.794, 0.2878 + 0.794) = (-1.0815, 1.0815)`, `c2 = (1.0815, 1.0815)`.
`off/chord = 1.1224/0.5756 = 1.9498`, the same ratio every `measure_outer_sep.py` row prints, so the
`0.39*L` rule holds on the border anchors exactly as it does on centres.

The Translative node carries `line width=.6pt`, so its ring is `0.4000 + 0.6pt/2 = 0.4106`, endpoints
`±0.4106/√2 = ±0.2903`. The sandbox emits
`bezier((11.21, 0.2903), (11.79, 0.2903), (10.41, 1.091), (12.59, 1.091))` about the node at (11.5, 0) —
i.e. offsets `(-0.29, 0.2903)` and `(0.29, 0.2903)`, matching the generalised formula.

### Tangent directions for a missing key

**Driver:** `measure_fallback_anchor.py`. `out only` (no `in`) → the end sits at 135 deg; `in only`
(no `out`) → the start sits at 45 deg. A missing key answers with its **own** measured direction,
not the other key's angle and not a straight arrival. Hence `TANGENT_FALLBACK = (45, 135)` and
`_tangent_dirs((None,135)) == (45,135)`, `_tangent_dirs((135,None)) == (135,135)`.

---

## 2. Multi-line `text width` legend — Thompsons-group #0

The legend wrote its maths in the plain-TeX `\( ... \)` spelling, e.g.
`\([\alpha-\eta,\alpha+\eta]\)`. `node_text` only recognised `$...$`, so the delimiters survived the
prose pass (which deletes command names) and reached the page as `\[-,+\]` — literal backslashes that
typst will not compile, which is why the picture was refused in production even though it *built*.
`NODE_MATH` routes both `$...$` and `\( … \)` through `_math_body`. Its `(?<!\\)` lookbehind keeps
TeX's line break `\\(i)` from reading its second backslash as the start of an opening delimiter.

Measured behaviour (asserted in `tests.py`):

    node_text(r"\(D(D-1)\) terms")            -> "$D(D-1)$ terms"
    node_text(r"\([\alpha-\eta,\alpha+\eta]\)") -> "$[ alpha - eta , alpha + eta ]$"   (no literal "\(")

The `text width=5.2cm` / `align=left` node is undrawn (no `draw`), so `box_visible` is false and no
frame is emitted; the author's own `\\` become `#linebreak()`, and each line is short enough that
the declared 5.2 cm imposes no soft wrap — so anchoring the content at `anchor=west` is faithful.

---

## 3. Turned ellipse — Elliptic-capacity #0 — **legitimate refusal, proved**

**Driver:** `measure_ellipse_page.py`. The ellipse `\draw (0,0) ellipse (1.00 and .37)` sits inside
`\begin{scope}[shift={(.12,.20)},rotate=25]`. Reading the four pgf arc junctions off the compiled PDF
(centimetre scale, PT = points per mm):

| case                | centre (cm) | semi-axes (cm) | long axis |
|---------------------|-------------|----------------|-----------|
| unturned control    | —           | 1.00 , 0.37    | 0.00 deg  |
| `rotate=25` scope   | —           | 1.00 , 0.37    | **25.00 deg** |
| third ellipse `.50/.185`, `rotate=25` | — | 0.50 , 0.185 | 25.00 deg |

The `rotate=25` genuinely turns the *shape* (long axis 0 deg → 25 deg), not just its position.

CeTz 0.5.0 (the version `HEADER` imports) offers exactly one ellipse primitive:
`draw/shapes.typ:89` — `circle` draws `drawable.ellipse(cx, cy, cz, rx, ry, …)`, and its `radius:
(rx, ry)` is documented (`shapes.typ:56`) as "the first number is the `x` radius and the second is
the `y` radius" in the canvas axes. There is **no** `angle:`/rotation argument on it, unlike the
`polygon`/`n-star` shapes (`shapes.typ:681,771`) which *do* take `angle:`. A rotated ellipse is
therefore not a canvas primitive.

The emitter's single transform path bakes the scope matrix into absolute coordinates and emits bare
shape calls — point geometry (line endpoints, rect corners) survives because points can be rotated,
but an ellipse's `(rx, ry)` pair is not a point, so `circle(baked_centre, radius:(rx,ry))` would be
drawn axis-aligned and be wrong by 25 deg. The two alternatives are disallowed by the brief: a Bezier
approximation of the turned ellipse is forbidden (rule 4, "no approximate ellipses"), and introducing
a canvas-level `rotate()`/`transform()` wrapper would be a second transform mechanism alongside the
baked matrices (rule 5, "one path only").

Control proof (`tests.py`): the same picture with `rotate=25` removed **does** emit
`circle((0.12, 0.2), radius: (1, 0.37))`; the turned one returns `None`. The refusal is exactly the
turn, which is what TeX reports. This is a real, measured refusal, not a stub.
