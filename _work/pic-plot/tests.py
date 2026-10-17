r"""New tests for the `plot` family -- append these inside `class ConversionTests`.

Every number asserted here is pdflatex's own, read off the control PDFs compiled in
_work/pic-plot/meas/ (verify_family.py re-measures all of them, verify_chain.py the path semantics,
verify_canvas.py the two refused papers' own pictures):

  law_p5 / law_tension / verify_p5_tension{1,2}   the support at an interior knot, default tension
      and tension=1 and 2: 0.2775 * tension times the vector between the neighbouring knots.
  law_3, verify_knots2                            the two ends carry no support at all.
  law_smoothvalue                                 a value written on `smooth` itself is ignored.
  verify_scope_smooth, verify_scope_tension        `smooth`/`tension=` read off the `\draw`.
  verify_tension0                                 tension=0 collapses onto the knot polyline.
  verify_cycle                                    `smooth cycle` follows another law -> still refused.
  verify_sm_join                                  the spline starts its own subpath: no join line.
  fn70 / verify_fn70                              70 samples over `domain=`, straight joins, and
      TeX's own `tanh(-2.97) = -0.994677`.
  honey_a/b, at_a/b/c/d, hardsphere_whole.pdf      the refused pictures' own chains in page cm.

A canvas point is printed by `cetz.fmt` with `%.4g`, so at magnitude 12 the last digit it can carry
is 0.01; the deltas below are that wide or wider on purpose, never tighter than the print.
"""


def _canvas_calls(self, canvas, kind):
    """The point lists of every `kind(...)` call the canvas emits, in drawing order."""
    import re
    pair = r"\((-?\d+(?:\.\d+)?(?:e-?\d+)?), (-?\d+(?:\.\d+)?(?:e-?\d+)?)\)"
    out = []
    for line in canvas.splitlines():
        m = re.match(r"\s*%s\(" % kind, line)
        if not m:
            continue
        head = line.split("stroke:")[0]
        out.append([(float(a), float(b)) for a, b in re.findall(pair, head)])
    return out


def test_plot_smooth_pieces_are_texs_measured_supports(self):
    # law_p5.pdf: knots (0,0)(1,1)(2,0)(3,1)(4,0) at default tension=0.5 draw four cubics whose
    # interior controls sit 0.13875 (= 0.2775 * 0.5) of the neighbour-vector away from their knot
    got = cetz.smooth_curve([(0, 0), (1, 1), (2, 0), (3, 1), (4, 0)])
    self.assertEqual([(0.7225, 1.0), (1.2775, 1.0), (1.7225, 0.0)],
                     [tuple(round(v, 4) for v in c) for c in
                      (got[0][3], got[1][2], got[1][3])])
    # and the chain's ends carry no support at all (law_3): the first control sits on its own start,
    # the last on its own stop
    self.assertEqual(got[0][2], (0.0, 0.0))
    self.assertEqual(got[-1][3], (4.0, 0.0))
    # a polyline would put every control on the knot it belongs to -- TeX does not, so neither may we
    self.assertTrue(any(piece[2] != piece[0] for piece in got[1:]))
    # the three-knot chain TeX measured: piece 0 (start,c1,c2,stop) = (0,0),(0,0),(0.7225,1),(1,1)
    three = cetz.smooth_curve([(0, 0), (1, 1), (2, 0)])
    self.assertEqual([(0.0, 0.0), (1.0, 1.0), (0.0, 0.0), (0.7225, 1.0)],
                     [tuple(round(v, 4) for v in p) for p in three[0]])
    self.assertEqual([(1.0, 1.0), (2.0, 0.0), (1.2775, 1.0), (2.0, 0.0)],
                     [tuple(round(v, 4) for v in p) for p in three[1]])
    # two knots have no interior knot: TeX draws the plain segment, and that is what one degenerate
    # piece is (verify_knots2.pdf: one line item (0,0)--(1,1))
    self.assertEqual(cetz.smooth_curve([(0, 0), (1, 1)]), [((0, 0), (1, 1), (0, 0), (1, 1))])


def test_plot_smooth_tension_scales_the_support_as_tex_does(self):
    # law_tension.pdf (tension=1) reads the first piece's far control at (0.445,1) and verify_p5_tension2
    # at (-0.11,1): the offset is 0.2775 * tension, so it doubles exactly, overshoot and all
    knots = [(0, 0), (1, 1), (2, 0), (3, 1), (4, 0)]
    one = cetz.smooth_curve(knots, 1.0)
    self.assertEqual((0.445, 1.0), tuple(round(v, 4) for v in one[0][3]))
    self.assertEqual((1.555, 1.0), tuple(round(v, 4) for v in one[1][2]))
    self.assertEqual((1.445, 0.0), tuple(round(v, 4) for v in one[1][3]))
    two = cetz.smooth_curve(knots, 2.0)
    self.assertEqual((-0.11, 1.0), tuple(round(v, 4) for v in two[0][3]))
    self.assertEqual((2.11, 1.0), tuple(round(v, 4) for v in two[1][2]))
    # verify_tension0.pdf: tension=0 collapses every control onto its own knot, the straight polyline
    zero = cetz.smooth_curve([(6, 3), (7, 4), (8, 3), (9, 4)], 0.0)
    self.assertEqual(zero, [((6, 3), (7, 4), (6, 3), (7, 4)),
                            ((7, 4), (8, 3), (7, 4), (8, 3)),
                            ((8, 3), (9, 4), (8, 3), (9, 4))])


def test_plot_smooth_reads_its_options_off_the_draw_too(self):
    # verify_scope_smooth.pdf: `smooth` on the \draw curves the plot exactly as on the plot itself,
    # and verify_scope_tension.pdf that `tension=1` there moves the control to (6.445,4) -- the same
    # reading `domain=` and `samples=` already get from the statement
    knots = [(6, 3), (7, 4), (8, 3), (9, 4)]
    statement = " plot[smooth] coordinates {(6,3) (7,4) (8,3) (9,4)};"
    on_plot = cetz.plot_points(statement, 0, {}, cetz.IDENT, {})[2][0]
    on_draw = cetz.plot_points(" plot coordinates {(6,3) (7,4) (8,3) (9,4)};", 0, {},
                              cetz.IDENT, {"smooth": True, "tension": "1"})[2][0]
    self.assertEqual(on_plot[0], on_draw[0])
    self.assertEqual((6.445, 4.0), tuple(round(v, 4) for v in on_draw[3]))
    # law_smoothvalue.pdf: a *value* on `smooth` is not a tension, TeX ignores it entirely
    written = cetz.plot_points(" plot[smooth=2] coordinates {(6,3) (7,4) (8,3) (9,4)};",
                               0, {}, cetz.IDENT, {})[2][0]
    self.assertEqual(on_plot, written)


def test_plot_smooth_under_scale_measures_the_page_not_the_written_knot(self):
    # honey_a.pdf draws the honeycomb's own knots in a `[scale=.8]` picture: the first cubic is
    # (-0.88,-0.56) to (-0.56,-0.4) with controls (-0.88,-0.56) and (-0.5822,-0.4777) in page cm, so
    # the support travels with the scale instead of being computed on the written numbers
    canvas = cetz.build(
        "\\begin{tikzpicture}[scale=.8]\\draw[blue] plot[smooth] coordinates "
        "{(-1.1,-.7) (-.7,-.5) (-.9,0) (-.3,.3) (0,0) (.5,.3) (.2,.8) (.8,.9) (1.1,.5)};"
        "\\end{tikzpicture}")
    first = self._canvas_calls(canvas, "bezier")[0]
    self.assertEqual([(-0.88, -0.56), (-0.56, -0.4), (-0.88, -0.56), (-0.5822, -0.4777)],
                     [tuple(round(v, 4) for v in p) for p in first])
    # at_a.pdf, the Ashkin-Teller arms in `[x=0.8cm,y=0.8cm]`: same law, both axes scaled
    canvas = cetz.build(
        "\\begin{tikzpicture}[x=0.8cm,y=0.8cm]\\draw[teal] plot[smooth] coordinates "
        "{(0,0.8) (1,1.15) (2,0.9) (3,1.35) (4,1.0) (5,1.2) (6,0.9)};\\end{tikzpicture}")
    first = self._canvas_calls(canvas, "bezier")[0]
    self.assertEqual([(0.0, 0.64), (0.8, 0.92), (0.0, 0.64), (0.578, 0.9089)],
                     [tuple(round(v, 4) for v in p) for p in first])


def test_plot_smooth_starts_its_own_subpath(self):
    # verify_sm_join.pdf: `(4,4) -- (5,3) plot[smooth] coordinates {(6,3) ...}` strokes one line,
    # (4,4)--(5,3), then cubics from (6,3); TeX draws no join from the point the path stood on
    canvas = cetz.build(
        r"\begin{tikzpicture}\draw[red] (4,4) -- (5,3) plot[smooth] coordinates "
        r"{(6,3) (7,4) (8,3) (9,4) };\end{tikzpicture}")
    self.assertIn("line((4, 4), (5, 3),", canvas)
    pieces = self._canvas_calls(canvas, "bezier")
    self.assertEqual(3, len(pieces))
    self.assertEqual((6.0, 3.0), pieces[0][0])
    self.assertFalse(any((6.0, 3.0) in call for call in self._canvas_calls(canvas, "line")))
    # and the path carries on *from* the last knot, as TeX's own cursor does
    self.assertEqual((9.0, 4.0), pieces[-1][1])


def test_plot_smooth_cycle_still_refuses(self):
    # verify_cycle.pdf: `smooth cycle` closes over four knots with 4 pieces whose end knots *do*
    # carry a support -- a different measured law, so it stays quoted rather than drawn as this one
    self.assertIsNone(cetz.plot_points(" plot[smooth cycle] coordinates {(0,0) (1,1) (2,0) (1,-1)};",
                                       0, {}, cetz.IDENT, {}))
    # the other handlers that are not this one
    for option in ("only marks", "mark=*,", "mesh", "each"):
        self.assertIsNone(cetz.plot_points(" plot[%s] coordinates {(0,0) (1,1) (2,0)};" % option,
                                           0, {}, cetz.IDENT, {}))


def test_plot_function_samples_are_texs_knots_and_stay_straight(self):
    # fn70.pdf: `domain=-2.2:2.2, samples=70` puts the first knot at the domain's own end, steps it
    # by (hi-lo)/(n-1) = 0.0637681 and draws 69 *straight* pieces -- no curveto item at all
    got = cetz.plot_points(r" plot[domain=-2.2:2.2,samples=70]"
                           r" ({10.3+\x},{2.55+.23*tanh(1.35*\x)});",
                           0, {}, cetz.IDENT, {"domain": "-2.2:2.2", "samples": "70"})
    pts, _end, pieces = got
    self.assertIsNone(pieces)
    self.assertEqual(70, len(pts))
    # hardsphere_whole.pdf reads the same chain in page cm: head (8.1001,2.3213), tail (12.5,2.7788)
    self.assertAlmostEqual(8.1001, pts[0][0], delta=2e-3)
    self.assertAlmostEqual(2.3213, pts[0][1], delta=2e-3)
    self.assertAlmostEqual(12.5000, pts[-1][0], delta=2e-3)
    self.assertAlmostEqual(2.7788, pts[-1][1], delta=2e-3)
    self.assertAlmostEqual(4.4 / 69, pts[1][0] - pts[0][0], delta=1e-4)
    # the refused paper's own drawing: one polyline of 70 points, not a spline
    canvas = cetz.build(
        "\\begin{tikzpicture}[x=1cm,y=1cm]\\draw[blue] plot[domain=-2.2:2.2,samples=70] "
        "({10.3+\\x},{2.55+.23*tanh(1.35*\\x)});\\end{tikzpicture}")
    self.assertFalse(self._canvas_calls(canvas, "bezier"))
    self.assertEqual(70, len(self._canvas_calls(canvas, "line")[0]))


def test_pgfmath_tanh_is_texs_hyperbolic_function(self):
    # m_tanh.tex: `\pgfmathparse{tanh(-2.97)}` writes -0.99475 and `tanh(1)` writes 0.7615 -- pgf
    # keeps five digits, so a difference of 1e-5 is the print, not the function. `tan` reads its
    # argument as an angle (TeX: -0.05186), which is why `tanh` needs its own entry.
    self.assertAlmostEqual(-0.99475, cetz.expr("tanh(-2.97)"), delta=1e-4)
    self.assertAlmostEqual(0.7615, cetz.expr("tanh(1)"), delta=1e-4)
    self.assertAlmostEqual(-0.05186, cetz.expr("tan(-2.97)"), delta=1e-4)
    # the refused paper's own sample, read the way plot_points reads it
    self.assertAlmostEqual(-0.22878, cetz.expr("0.23*tanh(1.35*-2.2)"), delta=1e-4)


def test_plot_smooth_chain_is_emitted_as_curve_segments(self):
    # the refused paper's requirement: a `plot[smooth]` reaches the page as cubic pieces, never as a
    # polyline through its knots -- at_a.pdf draws 6 cubics for the 7 written points
    canvas = cetz.build(
        "\\begin{tikzpicture}[x=0.8cm,y=0.8cm]\\draw[teal] plot[smooth] coordinates "
        "{(0,0.8) (1,1.15) (2,0.9) (3,1.35) (4,1.0) (5,1.2) (6,0.9)};\\end{tikzpicture}")
    self.assertEqual(6, len(self._canvas_calls(canvas, "bezier")))
    self.assertFalse(self._canvas_calls(canvas, "line"))


if __name__ == "__main__":
    # these belong inside `class ConversionTests`; bound here so the file can be run on its own
    import sys
    import unittest
    from pathlib import Path

    sys.path.insert(0, str(Path(__file__).resolve().parent))
    from t2t import cetz

    class PlotFamilyTests(unittest.TestCase):
        pass

    PlotFamilyTests._canvas_calls = _canvas_calls
    for name in [n for n in dir() if n.startswith("test_")]:
        setattr(PlotFamilyTests, name, locals()[name])
    unittest.main(argv=[sys.argv[0]], exit=False)
