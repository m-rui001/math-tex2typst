# Measurements behind the pgfmath / `\ifnum` family

All numbers below are pdflatex's own (TeXLive 2025, `pdflatex -interaction=nonstopmode`), read out
of `\immediate\write` dumps or of a compiled PDF with fitz. Every control `.tex` sits in this folder
next to its `.txt`. 1 cm = 28.45274 pt is the only conversion used anywhere.

## 1. The operator table: a comparison is a number

`meas_pgfmath.tex` -> `meas_pgfmath.txt`. One control per operator, plus the precedence questions.

| TeX wrote | expression | what it settles |
| --- | --- | --- |
| `T 1+1<=10 == 1`, `T 10+1<=10 == 0` | `\pgfmathtruncatemacro` | `<=` returns 1/0, so the universal picture's `\row+\column<=10` is arithmetic, not a branch to guess |
| `T 3<2 == 0`, `T 3>2 == 1`, `T 3<=3 == 1`, `T 3>=3 == 1`, `T 3==3 == 1`, `T 3!=4 == 1` | each relation alone | the six spellings `< <= > >= == !=` and their digits |
| `T 3=3 == 0`, `T 3<>3 == 0` | bare `=`, `<>` | pgf logs *Unknown operator* and leaves the value at 0: `=` is `\ifnum`'s sign, not a pgfmath one. `expr("3=3")` stays `None` -> refusal |
| `T 1+2<4 == 1`, `T 4<1+2 == 0`, `T 2*3>5 == 1` | precedence | `+ - * /` bind tighter than the comparison |
| `T 2==1<1 == 1`, `T 2<1==1 == 0`, `T 1<2<3 == 1`, `T 2<3<1 == 0` | one level, left to right | a chain mixes `<` and `==` at a single level: `2==1<1` is `(2==1)<1` |
| `T (1<2)*3 == 3`, `T (2==1)<1 == 1` (from `meas_paren.tex`) | parentheses | a comparison inside `( )` is a value usable by `*` |

Arithmetic to the emitted code: `expr()` now enters through `_relation` (one comparison level over
`_add`) instead of `_add` alone, and `CMPS` is the table above; `TOKEN_RX` had to grow `<= >= == !=`
and a bare `<>` before the single-character class, so `<=` never tokenises as `<` then `=`.

## 2. How pgf cuts a number off

`meas_pgfmath.txt` and `meas_trunc.txt`.

| TeX wrote | input | settles |
| --- | --- | --- |
| `T 2.7 == 2`, `T -2.7 == -2`, `T 0.5 == 0`, `T 1.5 == 1`, `T 2.5 == 2` | `\pgfmathtruncatemacro` | cut toward zero, never round (`round(2.7)` would write 3) |
| `T 0.7*10 == 6`, `T 1.1*3 == 3`, `T 0.1+0.2 == 0`, `T 2.699999 == 2` | same | pgf's own float tail is cut, not hidden: `"%d" % int(val)` reproduces it because Python floats give the same 6.999999999999999 |
| `T floor(-0.6) == -1`, `T ceil(-0.6) == 0`, `T int(-0.6) == 0`, `T floor(8/5) == 1`, `T floor(-1/3*2) == -1` | the three ways to reach an integer | `floor`/`ceil` walk out to the neighbouring integer, `int` only drops the fraction -> the two missing entries in the function table |
| `T mod(8,5) == 3`, `T mod(-8,5) == -3` | `mod` | already correct in the table, used by the strip's `1.45*mod(\j,5)` |

## 3. A macro redefined in a loop keeps its own iteration's value

`meas_finite.tex` -> `meas_finite.txt` is the 81-cell dump of the ruled-sets picture's own nested
`\foreach`: cell `i=-4 j=-4` writes `cx=-5.40002 cy=-5.40002 lo=-5.90002,-5.90002`, cell `-4/-3`
writes `cx=-5.05002`, cell `4/4` writes `cx=5.40002`. `meas_loops.tex` -> `meas_loops.txt` does the
same for every other loop in the corpus that redefines a pgfmath macro inside itself (Kurosh
`mod(\j+1,11)`, Gepner `\k+1`, the Hilbert estimate's `\rr`/`\first`/`\aa`, the crossing number's
`\rad`, subpolynomial's `\rowheight`, conditional permutations' `\yb`/`\xc`, finite entropy's `\v`,
Finite-Circle's `\tag`).

The old code collected the values and wrote them back only once, after the last definition, so every
cell of a redefined loop got the *last* iteration's number. That is why 8 canvases that already
converted change under this patch, each toward the dump:

| picture | TeX's dump | live canvas | sandbox canvas |
| --- | --- | --- | --- |
| finite entropy `\v=\j+4` | `ENTROPY 0 -> 4` | `$V_0$` at 5.98 | at 4.14 |
| Finite-Circle `\tag=\i+1` | `CIRCLE source 0 = 1` | `$5$` in all four slots | `$1$`, `$2$`, `$3$`, ... |
| subpolynomial `\rowheight=4.35-0.5*\k` | `SUBP end 0 = 4.0 height 4.35` | every row at 2.622 (= TeX's *last* row, 2.85) | 4.002, 3.542, 3.082, 2.622 |
| conditional permutations `\yb=(4-\row)*.68` | `COND row 1 col 1 y=2.03998 x=0.34` | one row at y=0.34 | 2.04, 1.36, 0.68, 0 |
| crossing number `\rad=(\b-\a)/2` | `CROSS rad 0/1.55 = 0.775` | radius 0.4796 everywhere | 0.682, 1.276, 1.756, 0.3212, ... |
| Hilbert `\yy=-1.18*\sig` | `HILBERT yy(0) = 0.0` | `\(=0\)` at -1.746 | at 0 |
| Gepner `\next=\k+1` | `GEPNER 0 -> 1` | four arrows onto one vertex | onto `v(k+1)` |
| Kurosh `\next=mod(\j+1,11)` | `KUROSH 10 -> 0` | a zero-length segment | the cycle's real chord |

Arithmetic: `expand_pgfmath` now rewrites the text *before* each definition with the values already
computed (`_values_of`), then reads and splices that definition at its new offset, so a use always
sees the number of its own iteration; and the fixed budget of 64 is gone (the 81-cell lattice carries
162 definitions, the strip 72 conditionals — a budget refused them for being long).

## 4. `\ifnum` with 72 tests

`meas_strip.tex` -> `meas_strip.txt`: for each cell `j`, TeX's own `xshift`, `yshift` and which of
the eight tests took a branch — `J 0 ... xshift=0.0cm yshift=0.0cm branch=none`,
`J 1 ... xshift=1.45cm branch=vert-left`, `J 3 ... xshift=4.34999cm branch=diag-up`,
`J 8 ... xshift=4.34999cm yshift=-2.1cm branch=two-arcs`. Nine cells x eight tests = 72 conditionals,
and cell 0 proves the "no branch" case, which the old budget of 64 could never reach.
`meas_universal.tex` -> `meas_universal.txt`: TeX puts 45 cells `BLUE` inside `\row+\column<=10` and
4 `ORANGE` outside (1/10, 2/9, 9/2, 10/1).

## 5. Absolute points: did the substituted numbers land where TeX drew?

`meas_strip2.txt` was the prior writer's attempt and it is *not* a measurement: reading a node
anchor after `\end{scope}` gives `(0.0pt,0.0pt)` for every cell, so it proves nothing and was
replaced.

The three working controls place a zero-size node **inside** the scope and read it back with
`\pgfextractx/\pgfextracty` (`meas_abs_strip.tex`, `meas_abs_universal.tex`, `meas_abs_finite.tex`).
`verify_abs.py` compares every one of those readouts with the coordinates the sandbox canvas emits,
through the production path (paper preamble's line width, the paper's own macros expanded):

```
finite     243 points TeX drew, worst gap 0.000591 cm, over 1e-3: 0
universal   98 points TeX drew, worst gap 0.000024 cm, over 1e-3: 0
strip       38 points TeX drew, worst gap 0.000015 cm, over 1e-3: 0
finite/universal/strip sane(): True
```

Worked examples of the arithmetic from readout to emitted number:

* strip cell 1: `strand=(34.1432pt,0.0pt)--(34.1432pt,28.45274pt)` ->
  `34.1432/28.45274 = 1.199997` cm -> `line((1.2, 0), (1.2, 1))`.
* strip cell 8: `box=(110.96553pt,-59.75093pt)--(136.5728pt,-31.29819pt)` ->
  `(3.89999, -2.10001)--(4.79999, -1.10001)` -> `rect((3.9, -2.1), (4.8, -1.1))`.
* universal cell 1/10 (outside the staircase): `lo=79.38254pt,0.0pt hi=88.20282pt,-8.82028pt` ->
  `(2.78998, 0)--(3.09998, -0.309998)` -> `rect((2.79, 0), (3.1, -0.31), fill: rgb("#ffd68c"))`.
* finite cell `i=-4 j=-4`: `centre=(-153.64218pt,-153.64218pt)` -> `-5.39991` cm, and the head's
  `[scale=0.95]` is applied by pgf only at output, which is why the anchor is the *unscaled* point:
  `-5.39991 * 0.95 = -5.12991` -> `circle((-5.13, -5.13)`. The corner `lo=-167.86824pt` ->
  `-5.89990 * 0.95 = -5.60490` -> `rect((-5.605, -5.605), ...)`.
* the residual 0.0006 cm is the emitter's four-significant-digit print (`%.4g`), not a geometry gap.

Two traps worth recording, both found while building these controls:

* **pgf's printed macro is not the drawn point.** `\pgfmathsetmacro\cx` *writes* `-5.40002` for
  `-4+.35*-4` (its five-digit fixed point), while the anchor of a node placed at `\cx` is
  `-5.39991` cm, i.e. TeX draws at the exact `-5.4`. The converter keeps the exact arithmetic
  (`-5.4 * 0.95 = -5.13`), which is what the page shows; adopting pgf's printed string instead would
  move the drawing by 2e-4 cm and would be the wrong way round anyway.
* **a node placed on the cell floor reads back one cm higher.** `\node (t) at (.25,0) {}` inside a
  scope with `yshift=-2.1cm` reported `-1.1` cm, because `center` is the middle of the node's text
  box (`font=\small` gives it a 10/7 pt body), not the placement point. Nodes probed away from the
  baseline read correctly, which is how the discrepancy was pinned. Cells 5 and 8 therefore park their
  far probe at the control height `.5` and their drawn endpoints are measured off the PDF instead.

## 6. The arc inside an `\ifnum` branch, measured off the PDF

`meas_arc_cell.tex` compiles cell 5 alone (`\draw[very thick] (-.25,0) .. controls (-.25,.45) and
(.25,.45) .. (.25,0);` in the scope shifted `1.45*mod(5,5)=0` across and `-2.1*floor(5/5)=-2.1` cm
down) with `border=0pt`; `measure_arc_cell.py` reads the stroked paths out of the PDF with fitz:

```
box rect (bp): (0.199, 0.1997, 25.7109, 28.5465)
cell width 0.90000 cm, height 1.00001 cm
start   x=-0.25000 cm  0.00000 cm above the floor
ctrl 1  x=-0.25000 cm  0.45000 cm above the floor
ctrl 2  x=+0.25000 cm  0.45000 cm above the floor
stop    x=+0.25000 cm  0.00000 cm above the floor
```

The canvas emits `bezier((-0.25, -2.1), (0.25, -2.1), (-0.25, -1.65), (0.25, -1.65))`: the endpoints
land on the floor TeX drew at `y = -2.1`, the handles exactly `0.45` cm above it.

**The unit trap that was in the way.** PDF user units are *big* points (1/72 in) while a TeX `pt` is
1/72.27 in: pgf writes the picture's `x=1cm` axis as `28.3465bp`, but `\pgfextractx` on the same
distance prints `28.45274pt`. Dividing fitz's numbers by the pt figure shrinks every measured cm by
0.374%, which had shown up as a "0.002 cm shortness" on the arc endpoints and a `0.99628 cm` height
for the box the control writes as `(-.45,0) rectangle (.45,1)`. `measure_arc_cell.py` now converts
with `BP = 72.0/2.54` and the drawing comes out exact, so `tests.py` asserts this arc to
`delta=0.0005` (the emitter's four-significant-digit print) instead of the 0.005 the wrong scale
forced. The `\pgfextractx` readouts of section 5 are true TeX dimensions and still divide by
`28.45274`; nothing else about them changes.

## 7. Corpus-wide before / after

`corpus_diff.py` replays every picture in `_work/flat` that mentions `\pgfmath` or `\ifnum` (25 of
them) through `build()`:

```
live tree    : TOTAL 25 CONVERTED 22
sandbox tree : TOTAL 25 CONVERTED 25
```

The three gains are this family's pictures; the eight changed hashes are the loop corrections of
section 3, verified against `meas_loops.txt`; nothing that converted before stops converting.
`corpus_three.py` runs the three owned papers through the production path:

```
Finite-cylinder-approximation-of-ruled-sets      live pictures=2 drawn=1   sandbox pictures=2 drawn=2
Universal-Tensor-Squares-for-Symmetric-Groups    live pictures=2 drawn=1   sandbox pictures=2 drawn=2
Critical-strip-crossing-mass-on-the-honeycomb    live pictures=5 drawn=4   sandbox pictures=5 drawn=5
```
