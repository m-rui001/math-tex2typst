r"""New `def test_*` methods for tools/test_t2t.py -- append them inside `class ConversionTests`.

Every number asserted here is pdflatex's own answer, read out of the control cases compiled in
_work/pic-authmacros/ and recorded in measurements.md:

  m_cylinder.tex   the figure's own \FiniteSquare/\FiniteTriangle/\FiniteCap drawn for real, and the
                   same scopes replaced by \pp probes: `shift={(.70,-1.08)}` puts (-.35,-.35) at
                   9.95819pt,-40.68764pt, i.e. (0.35,-1.43) cm.
  m_gff.tex        \pinsgroup/\pinskzero/\pinsprojection with the doubly nested scope of panel (d).
  m_peps.tex       the x=.86cm axis (-8 inks at -195.755pt = -6.88cm) and \pgfmathsetmacro's own
                   answer for the band midpoint, (-8+-6)/2 = -7.0.
  m_colors.tex     \extractcolorspecs for every name cetz.RGB carries, and the compiled page's ink.
  _verify/*.pdf    the picture as published (A) against the expanded core the emitter reads (B):
                   the two ink the same page, point for point.

None of it is what the converter happened to print.

The suite imports `cetz`, `macros` and `prep` but not the `convert` module itself (it imports two of
its names), so append these with `from t2t import convert` added to the module's own import block --
`picture_scopes` and `with_declarations` are what the second test measures.

The last method asserts the ink correction that ships as `cetz-orange.patch`, not as part of the
family's `cetz.patch`: `cetz.RGB` is a shared table 132 papers' pictures read, so it is applied on its
own schedule. Drop that method if the colour patch is deferred; the other four belong to this family.
"""

    def test_a_macro_that_only_looks_like_a_conditional_still_expands(self):
        # The cylinder figure's \FiniteSquare fills a path, and the safety test read the substring
        # `\fi` inside `\fill` as a conditional, so the definition was refused and the whole picture
        # quoted as LaTeX. TeX ends a control word at the first non-letter, which is what the test
        # has to do too -- and a genuine conditional is still refused, because pandoc cannot read
        # one. m_cylinder.tex draws this body for real.
        table, _skipped = macros.parse_definitions(
            "\\newcommand{\\FiniteSquare}[3]{\\draw (0,0) rectangle (1,1);#3"
            "\\fill (0,0) circle (1pt);}")
        self.assertIn("\\FiniteSquare", table)
        self.assertEqual(
            macros.expand("\\FiniteSquare{.70}{-1.08}{}", table),
            "\\draw (0,0) rectangle (1,1);\\fill (0,0) circle (1pt);")
        for body in ("\\ifmmode#1\\fi", "\\@ifnextchar x{#1}{}", "\\csname foo\\endcsname"):
            refused, _ = macros.parse_definitions("\\newcommand{\\qq}[1]{%s}" % body)
            self.assertNotIn("\\qq", refused, body)

    def test_a_figure_that_defines_its_macros_in_the_body_reaches_the_canvas(self):
        # \begingroup ... \newcommand ... \begin{tikzpicture} is where a preprint puts its drawing
        # macros, below \begin{document}, so `prep.parse_preamble` never reads them and the statement
        # parser met a verb it did not know. A picture is now expanded against its own figure's
        # scope, and the styles and colours that scope declares travel into the picture, where
        # `cetz.expand_tikzset` and `cetz._colors` already fold a declaration table in: left behind,
        # the GFF figure that separates two families by ink would draw both of them in black.
        body = ("\\begingroup\n\\colorlet{ink}{blue!60!black}\n"
                "\\tikzset{gap/.style={draw=black!45}}\n"
                "\\newcommand{\\grouppic}[1]{\\fill (0,#1) circle (2pt);}\n"
                "\\begin{tikzpicture}[x=1cm]\n\\grouppic{.5}\n\\end{tikzpicture}\n")
        pic = "\\begin{tikzpicture}[x=1cm]\n\\grouppic{.5}\n\\end{tikzpicture}"
        scopes = convert.picture_scopes(body, {})
        self.assertEqual(len(scopes), 1)
        table, decls = scopes[0]
        self.assertIn("\\grouppic", table)
        self.assertEqual(decls, "\\colorlet{ink}{blue!60!black}\n"
                                "\\tikzset{gap/.style={draw=black!45}}")
        # the declarations stand after the picture's own option group, which is where TeX has them
        # in force, so a picture that re-declares a style still overrides them later, as it does there
        core = prep.expand_macros(convert.with_declarations(pic, decls), table)
        self.assertEqual(core, "\\begin{tikzpicture}[x=1cm]\n"
                               "\\colorlet{ink}{blue!60!black}\n"
                               "\\tikzset{gap/.style={draw=black!45}}\n\n"
                               "\\fill (0,.5) circle (2pt);\n\\end{tikzpicture}")
        self.assertIn("circle((0, 0.5), radius: 0.07056, fill: black)",
                      cetz.build(core, {}, 15.0))

    def test_a_scope_a_body_macro_opens_lands_where_tex_inks_it(self):
        # m_cylinder.tex: with x=y=1cm, `shift={(.70,-1.08)}` puts the rectangle's corners at
        # 9.95819pt,-40.68764pt and 29.87546pt,-20.77037pt -- (0.35,-1.43) and (1.05,-0.73) cm -- and
        # its port dot at (0.70,-1.08) with a 1pt radius = 0.03528cm. The canvas carries TeX's
        # transformed answer, not the macro's local (-.35,-.35): m_probe_method.tex measured that
        # \pgfpointxy alone still answers -.35cm inside a shifted scope.
        built = cetz.build(
            "\\begin{tikzpicture}[x=1cm,y=1cm,"
            "finite boundary/.style={draw=black!30,line width=.4pt}]\n"
            "\\begin{scope}[shift={(.70,-1.08)}]\n"
            "\\draw[finite boundary] (-.35,-.35) rectangle (.35,.35);\n"
            "\\fill[black!45] (0,0) circle (1pt);\n"
            "\\end{scope}\n\\end{tikzpicture}", {}, 15.0)
        self.assertIn('rect((0.35, -1.43), (1.05, -0.73), '
                      'stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt))', built)
        self.assertIn('circle((0.7, -1.08), radius: 0.03528, fill: rgb("#8c8c8c"))', built)

    def test_a_band_on_a_narrow_axis_carries_the_axis_scale_and_the_pgfmath_midpoint(self):
        # m_peps.tex: the picture sets x=.86cm, so TeX inks the tick column -8 at -195.755pt =
        # -6.88cm and leaves the ordinate alone. \geometryband writes its label's abscissa as the
        # braced expression {(#2+#3)/2}, and \pgfmathsetmacro answers (-8+-6)/2 = -7.0, which the
        # same axis puts at -6.02cm; the band's own edges are #1-.20 and #1+.20 about -.82.
        built = cetz.build(
            "\\begin{tikzpicture}[x=.86cm,y=1cm,"
            "bandC/.style={fill=black!12,draw=black!35,line width=.3pt}]\n"
            "\\draw[black!10,line width=.3pt] (-8,.48) -- (-8,-5.17);\n"
            "\\path[bandC] (-8,{-0.82-.20}) rectangle (-6,{-0.82+.20});\n"
            "\\node[font=\\scriptsize] at ({(-8+-6)/2},-.82) {$C$};\n"
            "\\end{tikzpicture}", {}, 15.0)
        self.assertIn('line((-6.88, 0.48), (-6.88, -5.17), '
                      'stroke: (paint: rgb("#e6e6e6"), thickness: 0.3pt))', built)
        self.assertIn('rect((-6.88, -1.02), (-5.16, -0.62), fill: rgb("#e0e0e0")', built)
        self.assertIn("content((-6.02, -0.82), [$C$])", built)

    def test_a_named_colour_mixes_at_the_value_tex_prints(self):
        # xcolor answers \extractcolorspecs{orange} = rgb/1,0.5,0 (m_colors.tex), not the CSS 165
        # the table carried, and the compiled GFF page inks its `orange!65!black` family at #a65300
        # with the `!8` fill at #f8f1eb (gff_B.pdf, read back with fitz). Mixed the other way the
        # second family gets a yellower ink than the author's figure separates it by.
        built = cetz.build(
            "\\begin{tikzpicture}\\draw[orange!65!black,line width=.8pt] (0,0) -- (1,1);"
            "\\fill[blue!60!black] (2,0) circle (2pt);\\end{tikzpicture}", {}, 15.0)
        self.assertIn('line((0, 0), (1, 1), stroke: (paint: rgb("#a65300"), thickness: 0.8pt))',
                      built)
        self.assertIn('circle((2, 0), radius: 0.07056, fill: rgb("#000099"))', built)
        self.assertIn('fill: rgb("#ffd3a6")', cetz.build(
            "\\begin{tikzpicture}[bandA/.style={fill=orange!35}]"
            "\\path[bandA] (0,0) rectangle (1,1);\\end{tikzpicture}", {}, 15.0))
