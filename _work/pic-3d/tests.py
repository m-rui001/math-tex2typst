# New tests for the 3D-axis family -- append these inside `class ConversionTests`.
#
# Every number asserted here is pdflatex's own, read off the compiled control PDFs in
# _work/pic-3d/measure/ with fitz: asharp.pdf, critical.pdf, diffeo.pdf, plainz.pdf and
# plainz_scale2.pdf each hold one dot per 3D point, in its own ink, and a vector is the difference
# of two measured centres (page y flipped to y-up, cm = 28.346 pt), so nothing depends on where the
# tight page box starts. names_spaced.pdf / names_plain.pdf are the two spellings of one coordinate
# name, and qf_plain.pdf is the polyline the Critical-bond picture refused.

    def test_three_part_point_lands_on_the_page_pdflatex_measured(self):
        # measure/asharp.pdf, the A-sharp picture's own basis with scale=1.25: the page image of
        # (1.4,-1,1) is 1.1875,1.4375cm off the origin dot and (0,0,1) is 0,1.8751 -- a third
        # component is a term of the scope's z column, not a special case of the reader
        xf = cetz._transform(cetz.opts(r"scale=1.25,x={(1cm,0cm)},y={(0.45cm,0.35cm)},"
                                       r"z={(0cm,1.5cm)}"))
        self.assertIsNotNone(xf)
        for at, want in (((1.4, -1, 1), (1.1875, 1.4375)),
                         ((1.4, 1.3, 1), (2.4813, 2.4438)),
                         ((-1.4, 1.3, 1), (-1.0188, 2.4438)),
                         ((-1, -0.65, 1), (-1.6157, 1.5907)),
                         ((-1.4, -0.91, 1.4), (-2.2619, 2.2269)),
                         ((2.3, -1, 0.65), (2.3126, 0.7813)),
                         ((0, 0, 1), (0.0, 1.8751)),
                         ((-1.65, -1.0725, 1.65), (-2.6658, 2.6246))):
            got = cetz._apply(xf, *at)
            self.assertAlmostEqual(got[0], want[0], delta=1e-3, msg=str(at))
            self.assertAlmostEqual(got[1], want[1], delta=1e-3, msg=str(at))

    def test_unset_z_is_pgf_own_vector_and_scale_stretches_it(self):
        # measure/plainz.pdf reads the axis a picture never mentions as (-0.3850,-0.3850)cm and
        # two units of it as (-0.7700,-0.7700); measure/plainz_scale2.pdf, with scale=2 added,
        # moves (1,0,0) to 2.0001cm but leaves (0,0,1) at (-0.7700,-0.7700), so `scale=` stretches
        # z like the other two and the two readings are the same vector times the scale
        plain = cetz._transform(cetz.opts(r"x=1cm,y=1cm"))
        self.assertAlmostEqual(cetz._apply(plain, 0, 0, 1)[0], -0.385, delta=1e-3)
        self.assertAlmostEqual(cetz._apply(plain, 0, 0, 1)[1], -0.385, delta=1e-3)
        self.assertAlmostEqual(cetz._apply(plain, 0, 0, 2)[0], -0.77, delta=1e-3)
        scaled = cetz._transform(cetz.opts(r"scale=2,x=1cm,y=1cm"))
        got = cetz._apply(scaled, 0, 0, 1)
        self.assertAlmostEqual(got[0], -0.77, delta=1e-3)
        self.assertAlmostEqual(got[1], -0.77, delta=1e-3)
        self.assertAlmostEqual(cetz._apply(scaled, 1, 0, 0)[0], 2.0, delta=1e-3)

    def test_scope_rewriting_x_and_y_keeps_the_enclosing_z_column(self):
        # measure/critical.pdf puts a dot on (0,0,1) inside \begin{scope}[x=1cm,y=1cm] of the
        # cubic-lattice basis at (0.0000,1.1800)cm: the rewritten axes are the page centimetres the
        # author asked for, while the z the scope never mentions carries over and still counts
        base = cetz._transform(cetz.opts(r"x={(1.10cm,-0.55cm)},y={(-1.10cm,-0.55cm)},"
                                         r"z={(0cm,1.18cm)}"))
        nested = cetz._transform(cetz.opts("x=1cm,y=1cm"), base)
        self.assertAlmostEqual(cetz._apply(nested, 0, 0, 1)[1], 1.18, delta=1e-3)
        for at, want in (((0, 0), (0.0, 0.0)), ((2.38, 0), (2.3801, 0.0)),
                         ((-2.95, -1.63), (-2.9501, -1.6301)),
                         ((-2.40, -1.905), (-2.4001, -1.9051))):
            got = cetz._apply(nested, *at)
            self.assertAlmostEqual(got[0], want[0], delta=1e-3, msg=str(at))
            self.assertAlmostEqual(got[1], want[1], delta=1e-3, msg=str(at))

    def test_shifted_three_d_scope_lands_the_prism_points(self):
        # measure/difeo.pdf, the Strong-diffeomorphic input-face scope: shift={(7.1cm,.35cm)} with
        # its own three axes puts (1,.7,2.55) at 8.6943,3.8661cm and (-.15,0,.72) at
        # 6.9052,1.2716cm off the page origin dot
        xf = cetz._transform(cetz.opts(r"shift={(7.1cm,.35cm)},x={(1.3cm,0cm)},"
                                       r"y={(.42cm,.36cm)},z={(0cm,1.28cm)}"))
        for at, want in (((0, 0, 0), (7.1002, 0.35)), ((2, 0, 0), (9.7, 0.35)),
                         ((1, .7, 2.55), (8.6943, 3.8661)),
                         ((2.12, 1.4, .65), (10.4443, 1.686)),
                         ((-.15, 0, .72), (6.9052, 1.2716)),
                         ((1.6, .7, 1.7), (9.4743, 2.7781))):
            got = cetz._apply(xf, *at)
            self.assertAlmostEqual(got[0], want[0], delta=1e-3, msg=str(at))
            self.assertAlmostEqual(got[1], want[1], delta=1e-3, msg=str(at))

    def test_fill_with_three_part_points_draws_the_measured_face(self):
        # the statement the cubic-lattice picture refused: measure/critical.pdf reads its four
        # corners off the page as (2.2001,-1.1800), (0.0000,-2.2801), (0.0000,0.0800) and
        # (2.2001,1.1800)cm, which is what the canvas has to put on those four vertices
        canvas = cetz.build(r"""\begin{tikzpicture}[x={(1.10cm,-0.55cm)},
          y={(-1.10cm,-0.55cm)},z={(0cm,1.18cm)}]
          \fill[black!3] (1,-1,-1)--(1,1,-1)--(1,1,1)--(1,-1,1)--cycle;
        \end{tikzpicture}""")
        self.assertIsNotNone(canvas)
        self.assertIn("line((2.2, -1.18), (0, -2.28), (0, 0.08), (2.2, 1.18), close: true",
                      canvas)

    def test_node_at_a_three_part_point_lands_where_tex_puts_it(self):
        # measure/difeo.pdf puts (1,.7,2.55) at 8.6943,3.8661cm off the page origin; the label the
        # picture hung there has to sit on the same number, which is what refused the paper before
        canvas = cetz.build(r"""\begin{tikzpicture}[font=\small]
          \begin{scope}[shift={(7.1cm,.35cm)},x={(1.3cm,0cm)},y={(.42cm,.36cm)},
                        z={(0cm,1.28cm)}]
            \node[font=\bfseries] at (1,.7,2.55) {Input face prism};
          \end{scope}
        \end{tikzpicture}""")
        self.assertIsNotNone(canvas)
        self.assertIn("content((8.694, 3.866), [Input face prism])", canvas)

    def test_a_node_name_may_hold_a_space(self):
        # measure/names_spaced.pdf and measure/names_plain.pdf drew the identical line, so pgf
        # reads `(qf axes)' as one name and a paper that names its points that way is not a
        # coordinate the reader may answer None for
        canvas = cetz.build(r"""\begin{tikzpicture}
          \coordinate (qf axes) at (1,2);
          \draw[red] (qf axes)--(3,2);
        \end{tikzpicture}""")
        self.assertIsNotNone(canvas)
        self.assertIn("line((1, 2), (3, 2)", canvas)

    def test_a_name_carries_its_page_point_into_a_nested_scope(self):
        # measure/qf_plain.pdf, the refused arrow of the cubic-lattice picture: its vertices land
        # at (2.7001,0), (2.3801,0) and (0.5720,-0.1532)cm off the scope origin -- the first is the
        # west edge of a node placed with anchor=west, the last a coordinate defined in the outer
        # 3D scope and only named inside the nested one, so the page point is what travels
        canvas = cetz.build(r"""\begin{tikzpicture}[x={(1.10cm,-0.55cm)},
          y={(-1.10cm,-0.55cm)},z={(0cm,1.18cm)},font=\small]
          \coordinate (qf representative) at (1,0.48,0.56);
          \begin{scope}[x=1cm,y=1cm]
            \node[anchor=west] (qf label) at (2.70,0.00) {$F_{1,+}^{+,+}$};
            \draw[line width=0.45pt] (qf label.west)--(2.38,0.00)--(qf representative);
          \end{scope}
        \end{tikzpicture}""")
        self.assertIsNotNone(canvas)
        self.assertIn("line((2.7, 0), (2.38, 0), (0.572, -0.1532)", canvas)
