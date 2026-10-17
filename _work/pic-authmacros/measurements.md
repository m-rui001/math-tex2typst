# Measurements — author macros defined inside the figure (pic-authmacros)

Every number below is pdflatex's own, from a control compiled in this directory; the `.log` files are
kept next to them. `1cm = 28.45274pt` is the only conversion used, and TeX's `\pgfpointtransformed`
(the point after the scope's transform, which is where the pen lands) is the only reading trusted —
`_orange`-free, no canvas value is asserted from the emitter's own output.

## 0. Why these three pictures quoted as LaTeX

All three figures define their drawing verbs in the body, inside the `\begingroup` that wraps the
picture, i.e. **after** `\begin{document}`:

| paper | line of the `\newcommand` | line of its `\begin{tikzpicture}` |
| --- | --- | --- |
| Cylinder-amplitudes… | 347 `\newcommand{\FiniteSquare}[3]` | 375 |
| Gaussian-free-field-limits-of-weighted-integer-Lipschitz… | 3598 `\newcommand{\pinsgroup}[4]` | 3623 |
| Polynomial-PEPS-approximation… | 3265 `\newcommand{\geometrybandat}[5]` | 3276 |

`prep.parse_preamble` stops at `\begin{document}`, so none of these names ever reached the table
`convert_paper` expands a picture against, the statement parser met a verb it did not know, and the
picture was quoted. Two secondary causes:

* `macros.UNSAFE` tested bodies as substrings, so `\fi` inside `\fill` read as a conditional and
  `\FiniteSquare`/`\pinsgroup` were refused even once the region was parsed (`_probe_out.txt`
  records the before/after of the folded declarations).
* the same `\begingroup` blocks also declare the figure's `\tikzset` styles and `\colorlet` inks,
  which a picture never saw: the GFF figure separates its `+` and `-` families by ink, and without
  the declaration it draws both in black.

## 1. The probe method (m_probe_method.tex)

A `\pp` probe is `\pgf@process{\pgfpointtransformed{\pgfpointxy{x}{y}}}` plus `\typeout`. Measured:
inside `\begin{scope}[shift={(2,3)}]` the local point `(-.35,-.35)` answers `-.35cm` to
`\pgfpointxy` alone and `1.65cm` once transformed. Only the transformed reading is where TeX inks the
page, so it is the number a canvas has to carry.

## 2. Cylinder — `\FiniteSquare{.70}{-1.08}{}` (m_cylinder.tex)

`x=1cm,y=1cm`, `shift={(.70,-1.08)}`:

| local point | TeX answer | ÷ 28.45274 | canvas line |
| --- | --- | --- | --- |
| `(-.35,-.35)` | `9.95819pt,-40.68764pt` | `(0.35,-1.43)` | `rect((0.35, -1.43), (1.05, -0.73), …)` |
| `(.35,.35)` | `29.87546pt,-20.77037pt` | `(1.05,-0.73)` | same rect, far corner |
| port dot `(0,0)` | `19.91682pt,-30.729pt` | `(0.70,-1.08)` | `circle((0.7, -1.08), radius: 0.03528, …)` |
| arc controls `(-.35,0)(-.13,0)(0,.13)(0,.35)` | `61.17322 / 67.43286 / 71.13185 / 71.13185pt` | `(2.15,-1.08) (2.37,-1.08) (2.5,-0.95) (2.5,-0.73)` | `bezier((2.15, -1.08), (2.5, -0.73), (2.37, -1.08), (2.5, -0.95), …)` |

`\fill … circle (1pt)` is a 1pt radius = `0.03528cm`; `\foreach` port dots at `(-.35,0),(0,-.35),
(.35,0),(0,.35)` land at `(0.35,-1.08) (0.70,-1.43) (1.05,-1.08) (0.70,-0.73)`, which is what the
canvas carries. `\FiniteTriangle` (`(-.48,-.33)(.48,-.33)(0,.51)`) and `\FiniteCap`
(`(-.48,.22)(-.48,-.35)(.48,-.35)(.48,.22)`) are probed the same way in the same file.

## 3. Gaussian free field — `\pinsgroup`, `\pinskzero`, `\pinsprojection` (m_gff.tex)

| point | TeX answer | canvas |
| --- | --- | --- |
| `\pinsgroup{0}{.95}` origin | `0.0pt,27.03001pt` = `(0,0.95)cm` | `circle((0, 0.95), radius: (0.34, 0.23), …)` |
| its dot `(-.23,.03)` | `-6.544pt,27.88356pt` = `(-0.23,0.98)` | `circle((-0.23, 0.98), radius: 0.018, fill: rgb("#000099"))` |
| ellipse corner `(.34,.23)` | `9.67383pt,33.57402pt` = `(0.34,1.18)` | the `x radius=.34cm,y radius=.23cm` the author wrote |
| `\pinsgroup{-1.70}{0}` origin | `-48.36957pt,0.0pt` = `(-1.70,0)` | `circle((-1.7, 0), …)` |
| `\pinsprojection` axis ends | `±65.44139pt,-55.48276pt` = `(±2.30,-1.95)` | `line((-2.3, -1.95), (2.3, -1.95), …)` |
| its order labels | `±39.83366pt,-57.75903pt` = `(±1.40,-2.03)` | `content((-1.4, -2.03), …)` |
| panel (b), nested `shift={(7.15,0)}∘shift={(.90,.95)}` | `229.04422pt,27.03001pt` = `(8.05,0.95)` | `circle((8.05, 0.95), …)` |
| panel (d), `shift={(7.15,-5.65)}∘shift={(0,-1.47)}` | `203.43694pt,-202.58337pt` = `(7.15,-7.12)` | the two `pins move` arrows from `(7.15,-7.12)` |

The doubly nested shift is the reason the declarations are folded *into* the picture rather than
merged into the preamble table: it is the scope composition itself that is measured.

## 4. Polynomial PEPS — `\geometryrow`, `\geometryband`, `\geometrybandat` (m_peps.tex)

The picture sets `x=.86cm,y=1cm`, so only the abscissa scales:

| point | TeX answer | ÷28.45274 | canvas |
| --- | --- | --- | --- |
| tick column `-8` top/bottom | `-195.755pt,13.65718pt` / `-147.10063pt` | `(-6.88,0.48)` / `(-6.88,-5.17)` | `line((-6.88, 0.48), (-6.88, -5.17), …)` |
| tick label | `-195.755pt,19.06328pt` | `(-6.88,0.67)` | `content((-6.88, 0.67), [$-8$], anchor: "south")` |
| `\geometryrow` label at `(-8.20,0)` | `-200.6488pt,0.0pt` | `(-7.075,0)` | `content((-7.075, 0), …, anchor: "east")` |
| band `-8…0` about `y=0` | `0.0pt,5.69046pt` | `(0,±0.20)` | `rect((-6.88, -0.2), (0, 0.2), …)` |
| `\geometryband{-.82}{-8}{-6}{C}` midpoint | `MID: (-8+-6)/2 = -7.0` | `(-6.02,-0.82)` | `content((-6.02, -0.82), [$C$])` |

`{(#2+#3)/2}` is a braced pgfmath expression written in a macro argument: `\pgfmathsetmacro` answers
`-7.0` and `-4.0` for the two midpoints probed, and the canvas carries the axis-scaled product.
`\geometryband` calls `\geometrybandat`, so the expansion has to run to a fixed point, which
`prep.expand_macros` already does — the missing part was only ever the table it ran against.

## 5. Did the expansion change the drawing? (step3_verify.py → `_verify/`)

For each picture, **A** compiles it as the paper stands (figure's `\begingroup` definitions in front),
**B** compiles the core the pipeline hands CeTz (declarations folded inside the picture, every author
macro replaced). Both compiled, and the pages are the same ink:

| picture | A vs B path points | A vs B curves | words |
| --- | --- | --- | --- |
| cylinder #0 | 1078 / 1078 | 236 / 236 | identical |
| gff #1 | 1246 / 1246 | 272 / 272 | identical |
| peps #0 | 286 / 286 | 2 / 2 | identical |

Then the emitted canvas is overlaid on B's page (`step3b_geometry.py`): the two point clouds vote
their own translation (the canvas keeps the author's frame, TeX inks from the page corner), and each
sampled segment is required to lie on the other within 0.02cm:

| picture | canvas segs | TeX segs | canvas on TeX ink | TeX ink on canvas | worst residual |
| --- | --- | --- | --- | --- | --- |
| cylinder | 1998 | 1955 | 5789/5994 | 5696/5865 | 0.030cm (0.85pt) |
| gff | 2207 | 2255 | 5999/6621 | 6096/6765 | 0.066cm (1.9pt) |
| peps | 139 | 155 | 411/417 | 436/465 | 0.093cm (2.6pt) |

The misses are the two places where a dash phase and an arrow tip cannot agree point for point:
`pins gap` is `densely dashed` (TeX starts its dashes at the path end, CeTz at the segment start) and
`-{Stealth[…]}` is a filled curve TeX samples more finely than the canvas triangle. No miss is a
placement error, and none exceeds 2.6pt.

## 6. The ink the folded declarations carry (m_colors.tex, `_verify/*_B.pdf`)

`\extractcolorspecs` reads xcolor's own definition:

| name | xcolor | as RGB | what `cetz.RGB` had |
| --- | --- | --- | --- |
| `orange` | `rgb/1,0.5,0` | `(255,128,0)` | `(255,165,0)` — the CSS value |
| `orange!65!black` | `rgb/.65,.325,0` | `(166,83,0)` = `#a65300` | `#a66b00` |
| `orange!35` | `rgb/1,.825,.65` | `(255,210,166)` = `#ffd2a6` | `#ffe0a6` |
| `blue!60!black` | `rgb/0,0,.6` | `#000099` | `#000099` ✓ |
| `black!45` | `gray/.55` | `#8c8c8c` | `#8c8c8c` ✓ |

Reading the compiled page back with fitz confirms it: `gff_B.pdf` inks 24 dots at `#a65300` and 8
ellipse fills at `#f8f1eb`, and `peps_B.pdf` its band at `#ffd2a6`. So the corrected value is
delivered, but as its own `cetz-orange.patch` — `cetz.RGB` is a shared table that 132 of the 724
papers' pictures name (489 occurrences, `step7_orange_surface.py`), which is not this family's
mechanism. With it applied the GFF canvas reads `rgb("#a65300")`/`rgb("#f8f1eb")` and the PEPS band
`rgb("#ffd3a6")`, i.e. TeX's ink to within one 1/255 step; without it the geometry is still right and
only the second family's orange is a shade too yellow.

## 7. The traps, checked against these three figures (step2b_traps.py)

| macro | nargs | `[default]` | `%` in body | `##` | braces open/close | `\<word>#1` |
| --- | --- | --- | --- | --- | --- | --- |
| `\FiniteSquare`/`\FiniteTriangle`/`\FiniteCap` | 3 | none | 0 | 0 | 4/4 | 0 |
| `\pinsgroup` / `\pinskzero` / `\pinsprojection` | 4 / 0 / 6 | none | 0 | 0 | 4/4, 1/1, 5/5 | 0 |
| `\geometrybandat` / `\geometryband` / `\geometryrow` | 5 / 4 / 2 | none | 0 | 0 | 4/4, 5/5, 1/1 | 0 |

None of the three bodies uses a `%` comment, a `#`-default, an unbalanced brace or a control word
glued to a parameter, so the expansion path needed no new handling for them; the existing
`macros._read_args`/`_subst` behaviour (which the suite already pins) is what these figures exercise.
The one trap that did bite is the substring safety test, fixed by reading control words the way TeX
does — `\fill` accepted, `\ifmmode…\fi`, `\@ifnextchar` and `\csname` still refused.

## 8. What else the patch can touch (step4b_scan.py, step4_matrix.py)

`step4b_scan.py` compares, for all 724 papers, the string the shipped path hands CeTz with the string
the patched path hands it: **10 papers** have a picture that changes. `step4_matrix.py` then runs all
10 through the real `convert_paper` (pandoc included, `typst compile` stubbed) under both trees and
records each picture's own decision:

* 3 pictures flip refused → converted — the three this family owns (raw-latex 1 → 0 in each paper).
* 0 pictures flip converted → refused. The other 7 papers' 18 pictures decide identically.
* the *prose* macro table is unchanged for all 724 papers (`step4_scan.py`: `preamble macro table
  differs: 0`), so nothing outside a picture moves.
