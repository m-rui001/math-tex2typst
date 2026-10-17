# Measurements: `plot[smooth]` splines and `domain=`/`samples=` function plots

Everything below is pdflatex (TeXLive 2025) reading its own output. Two kinds of instrument:

* **path readback** — the control is drawn in a `tikzpicture` that also strokes two reference axes
  from `(0,0)` to `(10,0)` and `(0,10)`, so the picture origin and the 28.45274 pt/cm are read off
  the same PDF (`meas/pdfpaths.py`, `measure` = written picture units, `centimetres` = page cm).
  Cubic items come back as `(start, control1, control2, stop)`; a canvas `bezier(...)` is
  `(start, stop, control1, control2)`.
* **`\pgfmathparse` … `\typeout`** for numbers a plot feeds (`meas/m_tanh.tex`).

Drivers: `meas/verify_family.py` (the spline law, 22 checks), `meas/verify_chain.py` (path
semantics), `meas/verify_canvas.py` (the two refused papers' own pictures, whole). The prior
writer's controls `law_*.tex`, `sm_*.tex`, `fn70.tex`, `honey_*.tex`, `at_*.tex`, `hs_*.tex` are
still in `meas/` and were re-measured rather than trusted: one of its recorded numbers was wrong
(`tanh`, below).

## 1. The support law: 0.2775 x tension x (next knot - previous knot)

`plot[smooth]` swaps the plot handler for pgf's `\pgfplothandlercurveto`; each piece is the cubic
from the *support* of one knot to the support of the next.

Control `verify_p5_default` (`x=y=1cm`), knots `(0,0) (1,1) (2,0) (3,1) (4,0)`, default tension:

| piece | start | c1 | c2 | stop |
|---|---|---|---|---|
| 0 | (0.0000,0.0000) | (0.0000,0.0000) | **(0.7225,1.0000)** | (1.0000,1.0000) |
| 1 | (1.0000,1.0000) | **(1.2775,1.0000)** | **(1.7225,0.0000)** | (2.0000,0.0000) |
| 2 | (2.0000,0.0000) | (2.2775,0.0000) | (2.7225,1.0000) | (3.0000,1.0000) |
| 3 | (3.0000,1.0000) | (3.2775,1.0000) | (4.0000,0.0000) | (4.0000,0.0000) |

The offsets are 0.13875 of the neighbour vector = `0.2775 * 0.5`, and **the two end knots carry no
support at all**: `c1` of the first piece sits on its own start, `c2` of the last on its own stop.
`tension=1` (`verify_p5_tension1`) doubles it: `(0.4450,1)`, `(1.5550,1)`, `(1.4450,0)`; `tension=2`
(`verify_p5_tension2`) doubles it again and overshoots as TeX does: `(-0.1100,1)`, `(2.1100,1)`,
`(0.8900,0)`. So `t = 0.2775 * tension`, and `cetz.PLOT_TENSION = 0.2775`.

`smooth` with a *value* — `plot[smooth=2]` — is ignored by TeX (`verify_smoothvalue`, identical to
the table above to 4e-6), so only `tension=` moves `t`. `tension=0` collapses every support and TeX
strokes three plain knot-to-knot lines (`verify_tension0`); the emitter's degenerate cubics are the
same segment.

Three knots (`verify_knots3`): piece 0 `(0,0),(0,0),(0.7225,1),(1,1)`, piece 1
`(1,1),(1.2775,1),(2,0),(2,0)`. Two knots (`verify_knots2`): **one line item**, no curveto — and
`smooth_curve` returns exactly one piece whose controls are its own ends.

`verify_family.py` compares all of these with `cetz.smooth_curve`: worst control offset over
`p5_default, p5_tension1, p5_tension2, knots3, honey_a, honey_b, at_a, at_b, at_c, at_d,
smoothvalue, fn_smooth, chain` = **0.000027 units** (float noise; 20 of 22 under 1e-5).

## 2. Where the options are read from

`verify_scope_smooth` — `\draw[blue,very thick,smooth] plot coordinates {(6,3) (7,4) (8,3) (9,4)}`
draws 3 cubics, first piece `(6,3),(6,3),(6.7225,4),(7,4)`: `smooth` on the `\draw` is the same
handler. `verify_scope_tension` — `tension=1` on the `\draw` puts the first control at
`(6.4450,4.0000)` = 7 - 0.2775*2. So `tension=` is read from the statement's option list as
`domain=`/`samples=` already were.

## 3. The spline is its own subpath

`verify_sm_join` — `\draw (4,4) -- (5,3) plot[smooth] coordinates {(6,3) (7,4) (8,3) (9,4)};`
strokes items `l, c, c, c`: the only line is `(4.000,4.000)->(5.000,3.000)`; nothing joins `(5,3)`
to the spline's first knot `(6,3)`. The emitter therefore `flush()`es the running polyline, adds the
pieces, and resumes the polyline *at the last knot* (the picture's cursor after a plot is its last
point).

## 4. `smooth cycle` is a different law and stays refused

`verify_cycle` — 4 knots close to 4 cubic pieces whose **end knots do carry supports**, so the table
in §1 does not reproduce them (`verify_family.cycle_differs`: worst offset > tolerance by design,
and `plot_points` returns None). `only marks`, `mark=`, `each`, `mesh`, `surfaces` keep refusing.

## 5. A sampled function plot: 70 knots, straight joins, and pgf's `tanh`

`verify_fn70` — `plot[domain=-2.2:2.2,samples=70] ({5+\x},{5+.23*tanh(1.35*\x)})`: **69 line items,
0 curveto items**, 70 knots, first at the domain's own end, every step 0.063766 cm = `(hi-lo)/69`.
The knots `cetz.plot_points` emits agree with the PDF to **0.000111 units** worst case.

`m_tanh.tex` — `\pgfmathparse{tanh(-2.97)}` writes `-0.99475`, `tanh(1)` `0.7615`,
`0.23*tanh(-2.97)` `-0.22878`, while `tan(-2.97)` writes `-0.05186` (an angle). pgf keeps five
digits, `math.tanh` matches them, hence the `"tanh": math.tanh` entry in the pgfmath table. **The
prior writer recorded `tanh(-2.97) = -0.994807`, read off a PDF coordinate; TeX's own `\typeout` says
-0.99475**, and the comment in `cetz.py` now quotes the direct measurement.

## 6. From the law to the canvas (affine, then page cm)

Supports are affine combinations of the knots, so building them *after* the picture transform is
applied gives the same page geometry as building them first — measured on the refused papers' own
pictures in page cm (`verify_canvas.py`, chains matched piece by piece; `place` = where the chain
sits, `shape` = the spline after sliding it onto TeX's first knot, in cm past the last digit
`cetz.fmt`'s `%.4g` can print):

```
honeycomb chain 0   OK  shape +0.00000 past print, place 0.0000 cm, 8 pieces
honeycomb chain 1   OK  shape +0.00000 past print, place 1.2004 cm, 6 pieces
ashkin chain 0..3   OK  shape +0.00000 past print, place 0.0001-0.0031 cm, 6/6/5/5 pieces
hardsphere chain 0  OK  shape +0.00004 past print, place 0.0050 cm, 69 pieces
```

* `honey_a.pdf` (the honeycomb's first plot under the picture's own `scale=.8`): TeX's first piece is
  `(-0.8800,-0.5600), (-0.8800,-0.5600), (-0.5822,-0.4777), (-0.5600,-0.4000)` — the written knots
  times 0.8, with controls built from those same scaled knots. The canvas prints exactly that.
* `at_a.pdf` (`x=0.8cm,y=0.8cm`): `(-0.0000,0.6400), (0.0000,0.6400), (0.5780,0.9089), (0.8000,0.9200)`
  and the canvas agrees to the digit.
* `hardsphere_whole.pdf`: head `(8.1001,2.3213)`, tail `(12.5000,2.7788)`; the canvas line of 70
  points reads `(8.1000,2.3210)` … `(12.5000,2.7790)` — 4 significant digits is all it can express.

## 7. One placement defect this family does NOT own

`honeycomb chain 1` sits 1.2004 cm right of TeX. Inside a picture with `scale=.8`, TeX scales the
scope's `xshift=6cm` to 4.8 cm (measured: the knot lands at 3.9201 = -0.88 + 4.8) while the canvas
adds the full 6.0. That is the scope reader (`_transform`/`SCOPE`), which the `pic-scoped` family
owns and is patching separately; the spline geometry inside the shifted chain is exact, so the
picture converts and is only displaced as a whole scope along with every other item in that scope
(the dashed circles in the same scope are displaced identically by the live code).
