# Measurements behind the 3D-axis work (`_work/pic-3d/`)

Everything below is read off a PDF that pdflatex (TeXLive 2025) compiled from a control case, with
fitz/PyMuPDF; `cm = 28.346 pt`, page y flipped to y-up because TeX grows upward and pymupdf grows
downward. A vector is always a *difference of two measured dot centres*, so nothing depends on where
the tight `standalone` page box starts. Drivers: `measure_geom.py` (bases), `measure_names.py`
(node names and the `.west` anchor), `verify_qf.py` (the refused statement end to end). The compiled
control PDFs and their `.tex` sources are in `_work/pic-3d/measure/`; the printed tables are in
`_work/pic-3d/measure_geom.out`.

The predicted column in every table is not re-derived by hand: it is `_apply(xf, ...)` with `xf`
from the production reader (`_transform` on the picture's own option list, plus the `scoped()` walk
for nested scopes), so a disagreement would be a bug in `cetz.py`, not in this script's arithmetic.

## 1. The three papers' own bases (`measure_geom.py`)

### `measure/asharp.pdf` — `scale=1.25, x={(1cm,0cm)}, y={(0.45cm,0.35cm)}, z={(0cm,1.5cm)}`

`_transform` reads `(1.25,0,0,1.25, 1.0,0.0, 0.45,0.35, 0.0,1.5, 0,0)`: the scale is the canvas
matrix and the three axis vectors are the page image of one user unit of each axis.

| point | measured (cm) | cetz (cm) | err |
|---|---|---|---|
| (1.4,-1,1) | 1.1875, 1.4375 | 1.1875, 1.4375 | 0.0000 |
| (1.4,1.3,1) | 2.4813, 2.4438 | 2.4813, 2.4438 | 0.0001 |
| (-1.4,1.3,1) | -1.0188, 2.4438 | -1.0187, 2.4438 | 0.0001 |
| (-1,-0.65,1) | -1.6157, 1.5907 | -1.6156, 1.5906 | 0.0000 |
| (0,1,1) | 0.5625, 2.3126 | 0.5625, 2.3125 | 0.0001 |
| (-1.4,-0.91,1.4) | -2.2619, 2.2269 | -2.2619, 2.2269 | 0.0001 |
| (2.3,-1,0.65) | 2.3126, 0.7813 | 2.3125, 0.7812 | 0.0001 |
| (0,0,1) | 0.0000, 1.8751 | 0.0000, 1.8750 | 0.0001 |
| (-1.65,-1.0725,1.65) | -2.6658, 2.6246 | -2.6658, 2.6245 | 0.0001 |

worst deviation 0.0001 cm. Arithmetic from these numbers to what the canvas emits for the refused
statement `\fill[gray!8] (-1.4,-1,1)--(1.4,-1,1)--(1.4,1.3,1)--(-1.4,1.3,1)--cycle`:

    x' = 1.25 * (1*x + 0.45*y + 0*z)      y' = 1.25 * (0*x + 0.35*y + 1.5*z)
    (-1.4,-1,1): 1.25*(-1.4-0.45) = -2.3125   1.25*(-0.35+1.5) = 1.4375
    ( 1.4,-1,1): 1.25*( 1.4-0.45) =  1.1875   1.25*(-0.35+1.5) = 1.4375
    ( 1.4, 1.3,1): 1.25*(1.4+0.585) = 2.48125 1.25*(0.455+1.5) = 2.44375
    (-1.4, 1.3,1): -1.01875                   2.44375

and the canvas really says `line((-2.312, 1.438), (1.188, 1.438), (2.481, 2.444), (-1.019, 2.444),
close: true, ...)` (three-decimal `fmt`), with the fourth vertex the mirror of the first.

### `measure/critical.pdf` — `x={(1.10cm,-0.55cm)}, y={(-1.10cm,-0.55cm)}, z={(0cm,1.18cm)}`

xf = `(1,0,0,1, 1.1,-0.55, -1.1,-0.55, 0,1.18, 0,0)`. Dots outside and inside the picture's nested
`\begin{scope}[x=1cm,y=1cm]`:

| point | scope | measured | cetz | err |
|---|---|---|---|---|
| (1,-1,-1) | outer | 2.2001, -1.1800 | 2.2000, -1.1800 | 0.0001 |
| (1,1,-1) | outer | 0.0000, -2.2801 | 0.0000, -2.2800 | 0.0001 |
| (1,1,1) | outer | 0.0000, 0.0800 | 0.0000, 0.0800 | 0.0000 |
| (1,-1,1) | outer | 2.2001, 1.1800 | 2.2000, 1.1800 | 0.0001 |
| (-1,1,-1) | outer | -2.2001, -1.1800 | -2.2000, -1.1800 | 0.0001 |
| (1,0.48,0.56) | outer | 0.5720, -0.1532 | 0.5720, -0.1532 | 0.0000 |
| (1,0,-1) | outer | 1.1000, -1.7300 | 1.1000, -1.7300 | 0.0000 |
| (2.38,0) | nested | 2.3801, 0.0000 | 2.3800, 0.0000 | 0.0001 |
| (-2.95,-1.63) | nested | -2.9501, -1.6301 | -2.9500, -1.6300 | 0.0001 |
| (-2.40,-1.905) | nested | -2.4001, -1.9051 | -2.4000, -1.9050 | 0.0001 |
| (-2.95,-0.99) | nested | -2.9501, -0.9900 | -2.9500, -0.9900 | 0.0001 |
| (0,0,1) | nested | 0.0000, 1.1800 | 0.0000, 1.1800 | 0.0000 |

The last row is the measured statement of the inheritance rule: a scope that rewrites `x=` and `y=`
but never mentions `z` still counts its third component along the *enclosing* 3D axis, and `x=1cm`
inside a 3D basis lands one page centimetre along the page x. The first six rows are the four
`\fill` faces of the refused picture: the canvas emits
`line((2.2, -1.18), (0, -2.28), (0, 0.08), (2.2, 1.18), close: true, ...)`.

### `measure/difeo.pdf` — outer picture plus `shift={(7.1cm,.35cm)}, x={(1.3cm,0cm)}, y={(.42cm,.36cm)}, z={(0cm,1.28cm)}`

xf = `(1,0,0,1, 1.3,0, 0.42,0.36, 0,1.28, 7.1,0.35)`; the black dot is the outer origin.

| point | measured | cetz | err |
|---|---|---|---|
| (0,0,0) | 7.1002, 0.3500 | 7.1000, 0.3500 | 0.0002 |
| (2,0,0) | 9.7003, 0.3500 | 9.7000, 0.3500 | 0.0003 |
| (2,1.4,0) | 10.2883, 0.8540 | 10.2880, 0.8540 | 0.0003 |
| (0,1.4,0) | 7.6882, 0.8540 | 7.6880, 0.8540 | 0.0002 |
| (1,.7,2.55) | 8.6943, 3.8661 | 8.6940, 3.8660 | 0.0003 |
| (2.12,1.4,.65) | 10.4443, 1.6860 | 10.4440, 1.6860 | 0.0003 |
| (-.15,0,.72) | 6.9052, 1.2716 | 6.9050, 1.2716 | 0.0002 |
| (1.6,.7,1.7) | 9.4743, 2.7781 | 9.4740, 2.7780 | 0.0003 |
| (.8,.56,1.7) | 8.3755, 2.7277 | 8.3752, 2.7276 | 0.0003 |

worst deviation 0.0003 cm. `(1,.7,2.55)` is the refused `\node[font=\bfseries] at (1,.7,2.55)
{Input face prism}`: the canvas emits `content((8.694, 3.866), [Input face prism])`, and the same
arithmetic (x' = 7.1 + 1.3*1 + 0.42*0.7, y' = 0.35 + 0.36*0.7 + 1.28*2.55) puts it there.

## 2. The axis a picture never mentions (`measure/plainz.pdf`, `plainz_scale2.pdf`)

With only `x=1cm,y=1cm`, pgf's own third axis is read as **(-0.3850, -0.3850) cm** per unit and
(0,0,2) as (-0.7700,-0.7700); with `scale=2` added, (1,0,0) moves to 2.0001 cm while (0,0,1) lands
on (-0.7700,-0.7700) — the same vector times the scale, never times x and y only. That is exactly
`IDENT`'s `(-0.385, -0.385)` in `cetz.py:38` and the `_zcol` multiplication, so the live claim is
confirmed rather than trusted; the second Critical-bond picture (which sets no `z`) reads
`(1.35,0,0,1.05, 1.35,0, 0,1.05, -0.385,-0.385, 0,0)` and converts with those numbers.

## 3. Node names may hold a space (`measure/names_spaced.pdf`, `names_plain.pdf`)

Two control cases that differ in exactly one feature — the spelling of one coordinate name:

    \coordinate (qf axes) at (1,2);  \draw[red] (qf axes)--(3,2);     % spaced
    \coordinate (qfaxes) at (1,2);   \draw[red] (qfaxes)--(3,2);      % plain

Both put the red segment from (1.0000, 2.0001) to (3.0001, 2.0001) cm, i.e. pgf takes the whole
parenthesised token as the name. `cetz.py` refused `(qf axes)`, `(qf representative)` and
`(qf label.west)`, which is the only reason the Critical-bond picture still refused after its 3D
basis landed; the patch widens `ANCHORED` and the `\((...)\)` name capture in `_node_at` to the same
reading. The word-character ends in the new pattern keep the gap before `.west` out of the captured
name (`qf label . west` names `qf label`, not `qf label `).

## 4. Where a `.west` anchor is (`measure/west_fixed.pdf`, `west_plain.pdf`)

A node placed `at (1.5,0)`:

* `text width=1cm`, drawn box: `(qf label.west)` starts its line at x = 0.8759 cm, `.center` at
  1.5000 cm — the anchor really is the box edge.
* bare text node `$F_{1,+}^{+,+}$`: `.west` at x = 0.9722 cm, `.center` at 1.5000 cm, so the text
  half-width TeX used is 0.5278 cm.

The reader answers a name with its placed point and ignores the anchor suffix (`point()`'s
`names[...][:2]`, docstring "node sizes are unknown"), because CeTz cannot measure a text box. That
is pre-existing behaviour and the patch does not touch it. It is exact for the refused statement,
measured below, because the author placed that node with `anchor=west`: the point named *is* its
west edge.

## 5. The refused statement end to end (`measure/qf_arrow.pdf`, `qf_plain.pdf`)

The Critical-bond leader line, checked with and without an arrow head, in its own nested scope:

    \coordinate (qf representative) at (1,0.48,0.56);        % defined in the OUTER 3D scope
    \begin{scope}[x=1cm,y=1cm]
      \node[anchor=west] (qf label) at (2.70,0.00) {$F_{1,+}^{+,+}$};
      \draw (qf label.west)--(2.38,0.00)--(qf representative);

measured, relative to the scope origin dot:

| variant | vertices on the page (cm) |
|---|---|
| no arrow head | (2.7001, 0) -> (2.3801, 0) -> (0.5720, -0.1532) |
| with `->` | (2.7001, 0) -> (2.3801, 0) -> (0.5892, -0.1518) |
| the `(2.38,0)` dot | (2.3801, 0) |

The canvas emits `line((2.7, 0), (2.38, 0), (0.572, -0.1532), ..., mark: (end: ">"))`: the vertices
are the no-arrow ones exactly, and the 0.0172 cm (0.49 pt) shortening of the last vertex in the arrow
case is the `stealth` head's own length — the tip still lands on the coordinate, and CeTz draws its
head at the emitted vertex. Two things this one case settles: a name defined in the outer 3D scope
keeps its page point when it is named inside a scope that rewrote the axes (`(0.572, -0.1532)` is
`_apply(outer, 1, 0.48, 0.56)`), and `(qf label.west)` is the point the node was placed at.

## 6. What the converter emits for the papers

Rebuilt through the sandbox with the patch (`rawcount.py paper`), against the live `typst/` output
as it was found (read-only there):

| paper | live canvases / `#raw(block: true, lang: "latex")` | sandbox |
|---|---|---|
| A-sharp-entropy-bound-and-the-simplex-inequality-… | 0 / 1 | 1 / 0 |
| Critical-bond-and-site-percolation-on-the-cubic-lattice-… | 1 / 1 | 2 / 0 |
| Strong-diffeomorphic-approximation-…-for-p-gt-2-… | 4 / 1 | 5 / 0 |
| Strong-diffeomorphic-approximation-…-for-1-le-p-le-2-… | 2 / 0 | 2 / 0 |

Corpus check (`corpus_all.py`, every `\begin{tikzpicture}` of all 724 flat papers through `build()`,
hash of the canvas): live 908 of 932 drawn, sandbox 909 of 932, and the *only* differing line in the
two reports is `Critical-bond-…#0 None` -> `Critical-bond-…#0 26598f33`. Nothing else in the corpus
changed a vertex, so the widened name reader costs no already-drawing picture.

Note on the compile gate: `convert()` asks `compiles()`, which runs the `typst` binary, and this
sandbox is not allowed to invoke it, so `rawcount.py` stubs that one subprocess call. `sane()` — the
structural gate — ran for real on every canvas above; the batch has the last word on compiling.
