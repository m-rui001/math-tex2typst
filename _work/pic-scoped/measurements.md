# Measurements for the `scoped` family (pic-scoped)

All numbers below come from pdflatex (TeXLive 2025) on the control files in
`_work/pic-scoped/`; pgf points are dumped with `\pgfgetlastxy` inside each scope
(a `\typeout` after `\end{scope}` reads empty — the scope group kills the macros).
Conversion: 1pt = 2.54/72.27 cm = 0.0351446 cm; canvas numbers emitted by cetz are cm.

## Control 1 — `m_rotate_expr.tex` (head `x=1cm,y=1cm`)

Calibration: `\path (3,0)` -> `CAL x=85.35823pt, y=0.0pt` = 3cm, so dumped points are
picture-origin-relative canvas cm up to scale.

| case | local point | pdflatex (pt) | cm |
|---|---|---|---|
| `[shift={(45:1.65)},rotate={45/2+90}]` | (.19, 0) | 31.12762, 38.19067 | 1.094017, 1.342233 |
| same | (-.19, 0) | 35.26498, 28.20193 | 1.239424, 0.991183 |
| same | (0, 1) | 6.91043, 22.30860 | 0.611584, 1.974552 |
| `[shift={(45:1.65)},rotate={112.5}]` | (.19, 0) | 31.12762, 38.19067 | identical row |
| same | (-.19, 0) / (0, 1) | 35.26498, 28.20193 / 6.91043, 22.30860 | identical |
| `[rotate={20+30}]` | (1, 0) | 18.28918, 21.79585 | 0.642793, 0.766044 = (cos50°, sin50°) |
| `[shift={(0:1.65)},rotate={0/2+90}]` | (-.19, 0) / (.19, 0) | 46.94684, -5.40608 / 46.94684, 5.40608 | |

Findings:

1. A braced `rotate={...}` angle is **pgfmath-evaluated**: `rotate={45/2+90}` lands on exactly
   the same points as `rotate={112.5}` (all three probes match to the printed digit).
   `rotate={20+30}` turns (1,0) to (cos 50°, sin 50°)cm = 18.28918pt, 21.79585pt
   (28.45274·cos50 = 18.2893, ·sin50 = 21.7958) — so the reader may feed the string to `expr`.
2. `rotate={45/2+90 deg}` **fails in TeX itself** —
   `Package PGF Math Error: Unknown operator 'd' or 'de' (in '45/2+90 deg')` — so a `deg`
   suffix is legal only on a plain number, and the option reader refuses an expression
   carrying letters (`m_rotate_expr.log`, the one `!` in that control).

Arithmetic to what the converter now emits: `_rotate_spec("45/2+90")` -> 112.5°, and the
existing rotate branch of `_transform` builds (cos, -sin; sin, cos)·outer. For the refused
picture's ang=45 scope the outer scope is `shift={(-3.1,0)}`, so the tick endpoints on the
page are (-3.1 + 1.094017, 1.342233) = (-2.00598, 1.34223) and (-3.1 + 1.239424, 0.991183)
= (-1.86058, 0.99118); the emitted canvas line is exactly
`line((-1.861, 0.9912), (-2.006, 1.342), ...)` (out_No-percolati_1.typ).
ang=0 tick: 46.94684pt = 1.65cm = `shift={(0:1.65)}`, y ±5.40608pt = ±0.19·sin90 ✓.

## Control 2 — `m_shift_name.tex` (head `x=2cm,y=2cm`)

| case | pdflatex (pt) | cm |
|---|---|---|
| `\node (A) at (1,0)`; `\path (A)` | 56.9055, 0 | 2.0, 0 |
| `[shift={(A)}]` origin | 56.9055, 0 | 2.0, 0 |
| `[shift={(1,0)}]` origin | 56.9055, 0 | 2.0, 0 |
| `\node[minimum width=2.7cm,minimum height=1.9cm] (B) at (1,2)`; `\path (B.center)` | 56.9055, 113.811 | 2.0, 4.0 |
| `[shift={(B)}]` origin | 56.9055, 113.811 | 2.0, 4.0 |
| `[shift={(A)}]` local (0,.75) | 56.9055, 42.67912 | 2.0, 1.5 |
| inside `[rotate=90]`: `[shift={(A)}]` origin | 56.9055, 0 | 2.0, 0 |
| inside `[rotate=90]`: `[shift={(1,0)}]` origin | 0, 56.9055 | 0, 2.0 |

Findings:

1. `shift={(A)}` with a node name moves the scope origin by the node's **canvas point
   verbatim**: with `x=2cm` a node at user (1,0) sits at page 2cm and the shift moves 2cm —
   a user-unit reading (2cm treated as 2 *units*) would have moved 4cm = 113.8pt.
   So the named cm pair is added to dx,dy without going through `_delta(outer, …)`.
2. The target is the node's **anchor (centre)** even for a sized node (NAMEDSHIFTB equals
   the dumped `B.center`) — which is what `names[...]` already stores (`point()` reads
   `names[x][:2]`), so the existing name table is the right source.
3. Through an enclosing `rotate=90` the named shift still lands at (2.0, 0) — canvas
   verbatim — while the plain pair goes through the enclosing matrix to (0, 2.0). The two
   readings really are different and each is applied in its own branch.
4. Local coordinates inside the named-shift scope keep the outer units
   ((0,.75) -> 1.5cm at y=2cm), i.e. nothing about `_compose`/`_apply` changes.

Arithmetic to the Deligne-Drinfeld picture: its head is `x=1cm,y=1cm`, node A is at
(-4.2, 0) so `names["A"] = (-4.2, 0)` cm; the scope `[shift={(A)}]` gets origin (-4.2, 0)
and the tree apex `(0,.75)` emits as `line((-4.2, 0.75), ...)` — matching the emitted
canvas (out_The-Deligne-_1.typ).

## Walk-time name availability

`scoped()` ran before any registration, so `names` was empty when the scope options were
read (build() registered only afterwards). The walk now registers each statement as it
passes it (`_walk_scopes(..., names, styles)`), which still registers every statement
exactly once with its paired transform before the translate pass starts — the same final
name table, but available to later scope options. TeX imposes the same order: a name a
scope shifts onto must have been placed before the scope opens; a scope shifted onto a
name defined *inside* an unresolved scope keeps refusing (the walk returns False exactly
as before for a nameless point).

## Conversion results (sandbox, whole papers via `convert_paper` with the typst call stubbed)

| paper | before | after |
|---|---|---|
| No-percolation…#1 | `#raw(block: true, lang: "latex")` x1, canvases x2 | raw x0, canvases x3 |
| The-Deligne-Drinfeld…#1 | raw x1, canvases x1 | raw x0, canvases x2 |

No other picture in either paper changed state; sandbox suite 46/47 (the one failure is
the pre-existing `apptr:c` tabular test, failing identically on the live `tools/` tree).
