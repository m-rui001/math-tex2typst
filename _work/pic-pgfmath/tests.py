r"""New tests for the pgfmath/ifnum family -- append these inside `class ConversionTests`.

Every number asserted here is pdflatex's own, read out of the \write dumps compiled in
_work/pic-pgfmath/: meas_pgfmath.txt and meas_trunc.txt (the operator table, and the two ways pgf
cuts a number off), meas_finite.txt (the 81 lattice cells TeX computes for itself),
meas_universal.txt (which cells TeX puts inside the staircase) and meas_strip.txt (the shift each
of the nine honeycomb cells sits on).

The three meas_abs_*.txt dumps go one step further and read back the point TeX actually drew, with
\pgfextractx/\pgfextracty on a zero-size node placed by the picture's own expression, and
meas_arc_cell.pdf is that cell compiled and measured with fitz. Those readouts are true TeX
dimensions, so 1cm = 28.45274pt converts them, while fitz's numbers are PDF big points and take
1cm = 28.3465bp; 1e-3 cm covers the canvas's four-digit print either way.

The suite imports no `re` today; these tests read coordinates out of a canvas, so append them with
`import re` added to the module's own import block (an `import re` inside the class body would not
be visible from a method).
"""

    def test_pgfmath_comparisons_fold_to_the_digits_tex_writes(self):
        # meas_pgfmath.txt: \pgfmathtruncatemacro\v{1+1<=10} writes 1 and {10+1<=10} writes 0, so a
        # comparison is a number the coordinate reader can use, not a branch we guess at
        self.assertEqual(cetz.expr("1+1<=10"), 1.0)
        self.assertEqual(cetz.expr("10+1<=10"), 0.0)
        self.assertEqual(cetz.expr("3<2"), 0.0)
        self.assertEqual(cetz.expr("2>3"), 0.0)
        self.assertEqual(cetz.expr("3>=3"), 1.0)
        self.assertEqual(cetz.expr("3<=3"), 1.0)
        self.assertEqual(cetz.expr("3==3"), 1.0)
        self.assertEqual(cetz.expr("3!=3"), 0.0)
        # + - * / bind tighter than the comparison: TeX writes 1+2<4 as 1 and 4<1+2 as 0
        self.assertEqual(cetz.expr("1+2<4"), 1.0)
        self.assertEqual(cetz.expr("4<1+2"), 0.0)
        self.assertEqual(cetz.expr("2*3>5"), 1.0)
        self.assertEqual(cetz.expr("3*(2==1)"), 0.0)
        # one comparison level, run left to right: TeX reads 2==1<1 as (2==1)<1, which is 1, and
        # grouping it the other way as 2==(1<1) would have written 0
        self.assertEqual(cetz.expr("2==1<1"), 1.0)
        self.assertEqual(cetz.expr("2<1==1"), 0.0)
        self.assertEqual(cetz.expr("1+1==1<1"), 1.0)
        self.assertEqual(cetz.expr("(1<2)*3"), 3.0)
        # a bare `=' is no pgfmath operator at all -- pgf itself answers "Unknown operator `='" --
        # and an expression we cannot read still refuses instead of inventing a number
        self.assertIsNone(cetz.expr("3=3"))
        self.assertIsNone(cetz.expr("3<>3"))

    def test_pgfmath_truncatemacro_cuts_toward_zero_like_tex(self):
        # meas_pgfmath.txt: \pgfmathtruncatemacro writes 2 for 2.7, -2 for -2.7, 0 for 0.5, 1 for
        # 1.5 and 2 for 2.5 -- it cuts toward zero and never rounds, so a .5 tail goes down and a
        # negative value comes up. Rounding the value first writes 3 and 2 where TeX has 2 and 1.
        got = cetz.expand_pgfmath(r"\pgfmathtruncatemacro{\v}{2.7}\draw (0,\v) -- (1,\v);"
                                  r"\pgfmathtruncatemacro{\w}{-2.7}\draw (0,\w) -- (1,\w);"
                                  r"\pgfmathtruncatemacro{\u}{0.5}\draw (0,\u) -- (1,\u);"
                                  r"\pgfmathtruncatemacro{\t}{1.5}\draw (0,\t) -- (1,\t);")
        self.assertIn("(0,2) -- (1,2)", got)
        self.assertIn("(0,-2) -- (1,-2)", got)
        self.assertIn("(0,0) -- (1,0)", got)
        self.assertIn("(0,1) -- (1,1)", got)

    def test_pgfmath_floor_and_ceil_walk_out_while_int_only_cuts(self):
        # meas_pgfmath.txt: floor(-0.6) = -1, ceil(-0.6) = 0, int(-0.6) = 0 -- the first two walk
        # out to the neighbouring integer, the third just drops the fraction
        self.assertEqual(cetz.expr("floor(-0.6)"), -1.0)
        self.assertEqual(cetz.expr("ceil(-0.6)"), 0.0)
        self.assertEqual(cetz.expr("int(-0.6)"), 0.0)
        self.assertEqual(cetz.expr("floor(8/5)"), 1.0)
        self.assertEqual(cetz.expr("floor(-1/3*2)"), -1.0)
        # the honeycomb strip's own shifts, meas_strip.txt: cell 8 sits 1.45*3 across and 2.1 down
        self.assertEqual(cetz.expr("-2.1*floor(8/5)*1cm"), -2.1)
        self.assertEqual(cetz.expr("1.45*mod(8,5)*1cm"), 4.35)

    def test_a_redefined_pgfmath_macro_keeps_the_value_of_its_own_cell(self):
        # meas_finite.txt is pdflatex's \write dump of this real nested \foreach: its 81 centres run
        # from (-5.40002, -5.40002) to (5.40002, 5.40002). Writing the values back only after the
        # last definition is folded away would print all 81 squares on the last cell, and a fixed
        # budget of definitions refused the picture for being long. The head's own [scale=0.95]
        # turns TeX's -5.40002 into -5.13002, which the emitter prints at four digits as -5.13.
        pic = (r"\begin{tikzpicture}[scale=0.95]"
               r" \begin{scope}"
               r"  \clip (-2,-2) rectangle (2,2);"
               r"  \foreach \i in {-4,...,4} {\foreach \j in {-4,...,4} {"
               r"   \pgfmathsetmacro{\cx}{\i+.35*\j}"
               r"   \pgfmathsetmacro{\cy}{\j+.35*\i}"
               r"   \draw[blue!45,line width=.4pt]"
               r"     ({\cx-.5},{\cy-.5}) rectangle ({\cx+.5},{\cy+.5});"
               r"   \fill[blue!75!black] (\cx,\cy) circle (.03);"
               r"  }}"
               r"  \fill[blue!20,opacity=.45] (-.5,-.5) rectangle (.5,.5);"
               r"  \draw[blue!85!black,line width=1.1pt] (-.5,-.5) rectangle (.5,.5);"
               r"  \fill[blue!85!black] (0,0) circle (.035);"
               r" \end{scope}"
               r" \draw (-2,-2) rectangle (2,2);"
               r"\end{tikzpicture}")
        canvas = cetz.build(pic)
        self.assertIsNotNone(canvas)
        self.assertEqual(canvas.count("circle("), 82)   # 81 cell dots and the drawn centre
        self.assertEqual(canvas.count("rect("), 84)     # 81 squares, the framed one twice, the frame
        self.assertIn("circle((-5.13, -5.13)", canvas)
        self.assertIn("rect((-5.605, -5.605), (-4.655, -4.655)", canvas)
        self.assertIn("circle((-4.797, -4.18)", canvas)  # TeX's cell i=-4 j=-3: -5.05002, -4.40002
        self.assertIn("circle((5.13, 5.13)", canvas)
        self.assertIn("rect((4.655, 4.655), (5.605, 5.605)", canvas)

    def test_the_staircase_comparison_colours_the_cells_tex_coloured(self):
        # meas_universal.txt: TeX puts 45 cells inside the staircase \row+\column<=10 and 4 outside
        # it. The grid is drawn on the picture's own axes x=.31cm, y=-.31cm, so cell 1/10 sits
        # .31*9 = 2.79 along x and cell 10/1 .31*9 = 2.79 down the flipped y -- both outside it.
        pic = (r"\begin{tikzpicture}[x=.31cm,y=-.31cm,every node/.style={font=\small}]"
               r" \foreach \row/\width in {1/10,2/9,3/7,4/6,5/5,6/4,7/3,8/2,9/2,10/1}{"
               r"  \foreach \column in {1,...,\width}{"
               r"   \pgfmathtruncatemacro{\staircasecell}{\row+\column<=10}"
               r"   \ifnum\staircasecell=1"
               r"    \fill[blue!15] (\column-1,\row-1) rectangle (\column,\row);"
               r"   \else"
               r"    \fill[orange!45] (\column-1,\row-1) rectangle (\column,\row);"
               r"   \fi"
               r"   \draw[black!55] (\column-1,\row-1) rectangle (\column,\row);"
               r"  }"
               r" }"
               r"\end{tikzpicture}")
        canvas = cetz.build(pic)
        self.assertIsNotNone(canvas)
        self.assertEqual(canvas.count('fill: rgb("#d9d9ff")'), 45)
        self.assertEqual(canvas.count('fill: rgb("#ffd68c")'), 4)
        self.assertIn('rect((2.79, 0), (3.1, -0.31), fill: rgb("#ffd68c")', canvas)
        self.assertIn('rect((0, -2.79), (0.31, -3.1), fill: rgb("#ffd68c")', canvas)
        self.assertIn('rect((0, 0), (0.31, -0.31), fill: rgb("#d9d9ff")', canvas)

    def test_the_ifnum_branches_a_seventy_two_test_strip_decides(self):
        # meas_strip.txt: cell j sits at xshift 1.45*mod(j,5) cm and yshift -2.1*floor(j/5) cm, and
        # the only thick strand a cell draws is the \ifnum\j=N test whose N is the loop's own j.
        # Nine cells of eight tests each is 72 conditionals -- past the old budget of 64.
        pic = (r"\begin{tikzpicture}[x=1cm,y=1cm,font=\small]"
               r"\foreach \j/\wt in {0/1,1/A,2/A,3/B,4/B,5/U,6/U,7/E,8/F}{"
               r" \begin{scope}[xshift={1.45*mod(\j,5)*1cm},yshift={-2.1*floor(\j/5)*1cm}]"
               r" \draw[black!30] (-.45,0) rectangle (.45,1);"
               r" \foreach \x in {-.25,.25}{\fill[black!25] (\x,0) circle (1.5pt);"
               r"\fill[black!25] (\x,1) circle (1.5pt);}"
               r" \ifnum\j=1 \draw[very thick] (-.25,0)--(-.25,1);\fi"
               r" \ifnum\j=2 \draw[very thick] (.25,0)--(.25,1);\fi"
               r" \ifnum\j=3 \draw[very thick] (-.25,0)--(.25,1);\fi"
               r" \ifnum\j=4 \draw[very thick] (.25,0)--(-.25,1);\fi"
               r" \ifnum\j=5 \draw[very thick] (-.25,0) .. controls (-.25,.45) and (.25,.45) "
               r".. (.25,0);\fi"
               r" \ifnum\j=6 \draw[very thick] (-.25,1) .. controls (-.25,.55) and (.25,.55) "
               r".. (.25,1);\fi"
               r" \ifnum\j=7 \draw[very thick] (-.25,0)--(-.25,1) (.25,0)--(.25,1);\fi"
               r" \ifnum\j=8 \draw[very thick] (-.25,0) .. controls (-.25,.45) and (.25,.45) "
               r".. (.25,0);\draw[very thick] (-.25,1) .. controls (-.25,.55) and (.25,.55) "
               r".. (.25,1);\fi"
               r" \node at (0,-.35) {$\wt$};"
               r" \end{scope}"
               r"}"
               r"\end{tikzpicture}")
        canvas = cetz.build(pic)
        self.assertIsNotNone(canvas)
        self.assertEqual(canvas.count("rect("), 9)
        self.assertEqual(canvas.count("circle("), 36)   # four dots to a cell, as TeX fills them
        self.assertEqual(canvas.count("bezier("), 4)    # cells 5 and 6, and twice in cell 8
        # cell 1's strand is -0.25 inside a scope 1.45 across, and cell 0 -- whose tests all fail --
        # draws the same segment at xshift 0 not at all
        self.assertIn("line((1.2, 0), (1.2, 1))", canvas)
        self.assertNotIn("line((-0.25, 0), (-0.25, 1))", canvas)
        self.assertIn("line((4.1, 0), (4.6, 1))", canvas)                    # cell 3's crossing
        self.assertIn("line((2.65, -2.1), (2.65, -1.1), (3.15, -2.1), "
                      "(3.15, -1.1))", canvas)                               # cell 7's pair
        self.assertIn("rect((3.9, -2.1), (4.8, -1.1)", canvas)               # cell 8's box
        self.assertIn("content((0, -0.35), [$1$])", canvas)                  # TeX's own \wt for j=0
        self.assertIn("content((4.35, -2.45), [$F$])", canvas)               # and for j=8

    def test_the_nine_strip_cells_land_on_the_points_tex_read_back(self):
        # meas_abs_strip.txt: \pgfextractx/\pgfextracty of a zero-size node planted by the picture's
        # own scope and expressions. Each row is cell j's box corners, its label under the box and
        # the strand its \ifnum branch took; 1cm = 28.45274pt, and cells 5 and 8 arc over to the
        # right so their probe was parked at the control height .5, a handle rather than a vertex.
        pt = 1.0 / 28.45274
        measured = {
            0: [((-12.80363, 0.0), (12.80363, 28.45274), (0.0, -9.95863)), ()],
            1: [((28.45274, 0.0), (54.06001, 28.45274), (41.25638, -9.95863)),
                ((34.1432, 0.0), (34.1432, 28.45274))],
            2: [((69.70914, 0.0), (95.3164, 28.45274), (82.51277, -9.95863)), ((89.62595, 28.45274),)],
            3: [((110.96553, 0.0), (136.5728, 28.45274), (123.76917, -9.95863)),
                ((116.65599, 0.0), (130.88234, 28.45274))],
            4: [((152.22192, 0.0), (177.8292, 28.45274), (165.02556, -9.95863)), ((157.91238, 28.45274),)],
            5: [((-12.80363, -59.75093), (12.80363, -31.29819), (0.0, -69.70956)),
                ((-7.11317, -59.75093),)],
            6: [((28.45274, -59.75093), (54.06001, -31.29819), (41.25638, -69.70956)),
                ((48.36955, -31.29819),)],
            7: [((69.70914, -59.75093), (95.3164, -31.29819), (82.51277, -69.70956)),
                ((75.3996, -59.75093), (89.62595, -31.29819))],
            8: [((110.96553, -59.75093), (136.5728, -31.29819), (123.76917, -69.70956)),
                ((116.65599, -59.75093),)],
        }
        pic = (r"\begin{tikzpicture}[x=1cm,y=1cm,font=\small]"
               r"\foreach \j/\wt in {0/1,1/A,2/A,3/B,4/B,5/U,6/U,7/E,8/F}{"
               r" \begin{scope}[xshift={1.45*mod(\j,5)*1cm},yshift={-2.1*floor(\j/5)*1cm}]"
               r" \draw[black!30] (-.45,0) rectangle (.45,1);"
               r" \ifnum\j=1 \draw[very thick] (-.25,0)--(-.25,1);\fi"
               r" \ifnum\j=2 \draw[very thick] (.25,0)--(.25,1);\fi"
               r" \ifnum\j=3 \draw[very thick] (-.25,0)--(.25,1);\fi"
               r" \ifnum\j=4 \draw[very thick] (.25,0)--(-.25,1);\fi"
               r" \ifnum\j=5 \draw[very thick] (-.25,0) .. controls (-.25,.45) and (.25,.45) "
               r".. (.25,0);\fi"
               r" \ifnum\j=6 \draw[very thick] (-.25,1) .. controls (-.25,.55) and (.25,.55) "
               r".. (.25,1);\fi"
               r" \ifnum\j=7 \draw[very thick] (-.25,0)--(-.25,1) (.25,0)--(.25,1);\fi"
               r" \ifnum\j=8 \draw[very thick] (-.25,0) .. controls (-.25,.45) and (.25,.45) "
               r".. (.25,0);\draw[very thick] (-.25,1) .. controls (-.25,.55) and (.25,.55) "
               r".. (.25,1);\fi"
               r" \node at (0,-.35) {$\wt$};"
               r" \end{scope}}"
               r"\end{tikzpicture}")
        canvas = cetz.build(pic)
        self.assertIsNotNone(canvas)
        emitted = [tuple(float(v) for v in m.groups())
                   for m in re.finditer(r"\((-?[\d.]+), (-?[\d.]+)\)", canvas)]
        for j, (anchors, strand) in sorted(measured.items()):
            for x, y in anchors + strand:
                near = min(max(abs(a - x * pt), abs(b - y * pt)) for a, b in emitted)
                self.assertLess(near, 1e-3, "cell %d's point (%.5f, %.5f) cm" % (j, x * pt, y * pt))

    def test_the_staircase_corners_are_the_ones_tex_measured(self):
        # meas_abs_universal.txt: the corners of the four cells outside the staircase, read out of
        # TeX on the picture's own axes x=.31cm, y=-.31cm -- 8.82028pt to the column, 79.38254pt
        # down the tenth row. The same dump writes 45 cells BLUE and 4 ORANGE.
        pt = 1.0 / 28.45274
        outside = {"1/10": (79.38254, 0.0, 88.20282, -8.82028),
                   "2/9": (70.56226, -8.82028, 79.38254, -17.64056),
                   "9/2": (8.82028, -70.56226, 17.64056, -79.38254),
                   "10/1": (0.0, -79.38254, 8.82028, -88.20282)}
        pic = (r"\begin{tikzpicture}[x=.31cm,y=-.31cm,every node/.style={font=\small}]"
               r" \foreach \row/\width in {1/10,2/9,3/7,4/6,5/5,6/4,7/3,8/2,9/2,10/1}{"
               r"  \foreach \column in {1,...,\width}{"
               r"   \pgfmathtruncatemacro{\staircasecell}{\row+\column<=10}"
               r"   \ifnum\staircasecell=1"
               r"    \fill[blue!15] (\column-1,\row-1) rectangle (\column,\row);"
               r"   \else"
               r"    \fill[orange!45] (\column-1,\row-1) rectangle (\column,\row);"
               r"   \fi"
               r"  }}"
               r"\end{tikzpicture}")
        canvas = cetz.build(pic)
        self.assertIsNotNone(canvas)
        emitted = [tuple(float(v) for v in m.groups())
                   for m in re.finditer(r"\((-?[\d.]+), (-?[\d.]+)\)", canvas)]
        for cell, (x0, y0, x1, y1) in outside.items():
            # the emitter prints a coordinate at four significant digits, which is where TeX's
            # 79.38254pt becomes the canvas's 2.79
            corners = [float("%.4g" % (v * pt)) for v in (x0, y0, x1, y1)]
            want = "rect((%g, %g), (%g, %g), fill: rgb(\"#ffd68c\")" % tuple(corners)
            self.assertIn(want, canvas, "cell " + cell)

    def test_the_lattice_squares_are_where_tex_put_them(self):
        # meas_abs_finite.txt: a node planted at ({\cx-.5},{\cy-.5}) of the loop's own cell, read
        # back in pt -- the anchor is the unscaled drawing point, so the head's [scale=0.95] is the
        # one factor between TeX's number and the canvas. Cell 0/-1 is one the last iteration's
        # values used to be printed on; 4/4 is the iteration they were printed from.
        pt = 1.0 / 28.45274
        cells = {(-4, -4): (-153.64218, -153.64218, -167.86824, -167.86824,
                            -139.4161, -139.4161),
                 (0, -1): (-9.9584, -28.45212, -24.18446, -42.67818, 4.26762, -14.22604),
                 (4, 4): (153.64218, 153.64218, 167.86824, 167.86824, 139.4161, 139.4161)}
        pic = (r"\begin{tikzpicture}[scale=0.95]"
               r" \foreach \i in {-4,...,4} {\foreach \j in {-4,...,4} {"
               r"   \pgfmathsetmacro{\cx}{\i+.35*\j}"
               r"   \pgfmathsetmacro{\cy}{\j+.35*\i}"
               r"   \draw[blue!45,line width=.4pt]"
               r"     ({\cx-.5},{\cy-.5}) rectangle ({\cx+.5},{\cy+.5});"
               r"   \fill[blue!75!black] (\cx,\cy) circle (.03);"
               r"  }}"
               r"\end{tikzpicture}")
        canvas = cetz.build(pic)
        self.assertIsNotNone(canvas)
        emitted = [tuple(float(v) for v in m.groups())
                   for m in re.finditer(r"\((-?[\d.]+), (-?[\d.]+)\)", canvas)]
        self.assertEqual(len(emitted), 81 * 3)      # a centre and two corners to each of 81 cells
        for key, values in cells.items():
            want = [tuple(v * pt * 0.95 for v in values[n:n + 2]) for n in (0, 2, 4)]
            for x, y in want:
                near = min(max(abs(a - x), abs(b - y)) for a, b in emitted)
                self.assertLess(near, 1e-3, "cell %s at (%.5f, %.5f) cm" % (key, x, y))

    def test_a_cells_arc_starts_on_the_floor_tex_drew_at(self):
        # measure_arc_cell.py: cell 5's thick arc, read off meas_arc_cell.pdf. The box TeX drew is
        # 0.90000 x 1.00001 cm, and against that floor the arc's endpoints sit 0.00000 cm above it
        # at +-0.25000 cm across, its two control points 0.45000 cm above it -- the canvas's numbers
        # to the digit. (PDF user units are big points, 1/72 in: pgf writes a 1cm axis as 28.3465bp,
        # not the 28.45274pt \pgfextractx reads back, and using the pt figure here once made the
        # whole curve look 0.4% short.)
        canvas = cetz.build(r"\begin{tikzpicture}[x=1cm,y=1cm,font=\small]"
                            r" \begin{scope}[xshift={1.45*mod(5,5)*1cm},"
                            r"yshift={-2.1*floor(5/5)*1cm}]"
                            r"  \draw[black!30] (-.45,0) rectangle (.45,1);"
                            r"  \draw[very thick] (-.25,0) .. controls (-.25,.45) and (.25,.45) "
                            r".. (.25,0);"
                            r" \end{scope}"
                            r"\end{tikzpicture}")
        self.assertIsNotNone(canvas)
        floor = -2.1
        m = re.search(r"bezier\(\((-?[\d.]+), (-?[\d.]+)\), \((-?[\d.]+), (-?[\d.]+)\), "
                      r"\((-?[\d.]+), (-?[\d.]+)\), \((-?[\d.]+), (-?[\d.]+)\)", canvas)
        start, stop, c1, c2 = (tuple(float(v) for v in m.group(n, n + 1)) for n in (1, 3, 5, 7))
        self.assertAlmostEqual(start[0], -0.25000, delta=0.0005)
        self.assertAlmostEqual(stop[0], 0.25000, delta=0.0005)
        self.assertAlmostEqual(start[1] - floor, 0.0, delta=0.0005)
        self.assertAlmostEqual(stop[1] - floor, 0.0, delta=0.0005)
        self.assertAlmostEqual(c1[1] - floor, 0.45000, delta=0.0005)
        self.assertAlmostEqual(c2[1] - floor, 0.45000, delta=0.0005)

