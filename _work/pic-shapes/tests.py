r"""Regression tests for the pic-shapes family, asserting values measured from real TeX.

Every number below comes from a pdflatex control case recorded in `measurements.md` (the drivers
`measure_loop.py`, `measure_outer_sep.py`, `measure_fallback_anchor.py`, `measure_ellipse_page.py`
in this directory), not from what the emitter happens to print -- so a change of output that
leaves the TeX geometry untouched stays green, and a change that drifts from TeX goes red.

These are methods of the same shape as the assertions in `tools/test_t2t.py`'s ConversionTests;
move them into that class when appending. They run standalone here for the sandbox.
"""
import re
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from t2t import cetz  # noqa: E402

# the self-loop control case: a `slot` circle on pgf's default rule, loop out=135/in=45/looseness=5
LOOP = (r"\begin{tikzpicture}[x=1cm,y=1cm,"
        r"slot/.style={circle,draw,minimum size=8mm,inner sep=2pt,font=\small}]"
        r"\node[slot] (six) at (0,0) {$6$};"
        r"\draw (six) to[out=135,in=45,looseness=5] (six);"
        r"\end{tikzpicture}")


class PicShapesTests(unittest.TestCase):

    def _bezier(self, canvas):
        for line in canvas.splitlines():
            if line.strip().startswith("bezier"):
                return [tuple(map(float, p)) for p in re.findall(r"\(([-\d.]+), ([-\d.]+)\)", line)]
        self.fail("no bezier emitted for the self-loop: %r" % canvas)

    def test_self_loop_leaves_and_returns_on_the_measured_border_ring(self):
        # measure_loop.py node_l5: start=(-0.2878, 0.2878) end=(0.2878, 0.2878),
        # controls (-1.0815, 1.0815) and (1.0815, 1.0815). A `to` off a named node takes its
        # anchors from the border (0.4070cm for an 8mm circle), never from the centre.
        pts = self._bezier(cetz.build(LOOP))
        start, end, c1, c2 = pts
        for got, want in ((start, (-0.2878, 0.2878)), (end, (0.2878, 0.2878))):
            self.assertAlmostEqual(got[0], want[0], places=3)
            self.assertAlmostEqual(got[1], want[1], places=3)
        # the controls are emitted at CeTz's %.4g precision, so they match TeX only to 2 places
        for got, want in ((c1, (-1.0815, 1.0815)), (c2, (1.0815, 1.0815))):
            self.assertAlmostEqual(got[0], want[0], places=2)
            self.assertAlmostEqual(got[1], want[1], places=2)

    def test_default_outer_sep_is_half_the_pgf_rule_width(self):
        # measure_outer_sep.py: an 8mm circle (half-size 0.4000cm) sits its loop anchors at radius
        # 0.4070cm on pgf's 0.4pt rule -> the rule contributes 0.0070cm = 0.4pt / 2, drawn or not.
        self.assertAlmostEqual(cetz._outer_sep({}, cetz.IDENT), 0.4 * cetz.UNITS["pt"] / 2.0, places=6)
        self.assertAlmostEqual(cetz._outer_sep({"circle": True, "draw": True}, cetz.IDENT),
                              0.4 * cetz.UNITS["pt"] / 2.0, places=6)

    def test_a_written_outer_sep_or_line_width_replaces_the_default_rule(self):
        # measure_outer_sep.py: outer sep=0pt -> R 0.4000 (no rule), outer sep=1mm -> R 0.5000,
        # line width=2pt -> R 0.4351 (2pt/2 = 0.0351 over the 0.4000 half-size).
        self.assertAlmostEqual(cetz._outer_sep({"outer sep": "0pt"}, cetz.IDENT), 0.0, places=6)
        self.assertAlmostEqual(cetz._outer_sep({"outer sep": "1mm"}, cetz.IDENT), 0.1, places=6)
        self.assertAlmostEqual(cetz._outer_sep({"line width": "2pt"}, cetz.IDENT), 0.0351, places=2)

    def test_anchor_ring_rounds_a_declared_circle_and_only_a_declared_circle(self):
        # measure_outer_sep.py: minimum size=8mm circle -> ring 0.4070; minimum size=20mm -> 1.0070.
        self.assertAlmostEqual(
            cetz._anchor_ring({"circle": True, "minimum size": "8mm"}, cetz.IDENT), 0.4070, places=3)
        self.assertAlmostEqual(
            cetz._anchor_ring({"circle": True, "minimum size": "20mm"}, cetz.IDENT), 1.0070, places=3)
        # a rectangle's border is not a circle -- measure_loop.py box_l5 leaves at (-0.4067, 0.4070),
        # an ellipse the emitter has no ring for -- so a non-circle keeps the ring None and its loop
        # stays refused rather than drawn on a guessed radius.
        self.assertIsNone(cetz._anchor_ring({"minimum size": "8mm"}, cetz.IDENT))
        self.assertIsNone(cetz._anchor_ring({"circle": True}, cetz.IDENT))  # text-sized, box unwritten

    def test_unwritten_out_and_in_stand_for_their_own_measured_directions(self):
        # measure_fallback_anchor.py: `out only` (no in) arrives along 135 deg, `in only` (no out)
        # leaves along 45 deg -- a missing key answers with its own direction, not the other key's.
        self.assertEqual(cetz._tangent_dirs((None, 135)), (45.0, 135))
        self.assertEqual(cetz._tangent_dirs((135, None)), (135, 135.0))

    def test_paren_delimited_node_math_reaches_typst_as_math(self):
        # The Thompsons legend wrote maths as plain-TeX `\( ... \)`; the prose pass deleted the
        # command names and left the delimiters on the page (`\([\alpha-\eta,\alpha+\eta]\)` ->
        # `\[-,+\]`). The fix routes both `$...$` and `\( ... \)` through the maths body, so no
        # literal `\(` survives.
        self.assertEqual(cetz.node_text(r"\(D(D-1)\) terms"), "$D(D-1)$ terms")
        greek = cetz.node_text(r"\([\alpha-\eta,\alpha+\eta]\)")
        self.assertNotIn("\\(", greek)
        self.assertTrue(greek.startswith("$") and greek.endswith("$"))
        # `\\(i)` is a line break before a paren, not an opening delimiter -- TeX reads `\\` whole.
        self.assertIn("#linebreak()", cetz.node_text("alpha\\\\(i)"))

    def test_turned_ellipse_is_refused_but_the_same_ellipse_unturned_is_drawn(self):
        # measure_ellipse_page.py: the scope's rotate=25 puts the ellipse's long axis at 25.00 deg
        # on the page (the rotate=0 control puts it at 0.00 deg). CeTz's only ellipse primitive is
        # `circle(radius: (rx, ry))`, documented x-radius/y-radius in the canvas axes with no angle
        # (unlike polygon/n-star, which take `angle:`), so a turned ellipse has nothing to emit.
        turned = (r"\begin{tikzpicture}[x=1cm,y=1cm,capacityellipse/.style={draw=blue,thick}]"
                  r"\begin{scope}[shift={(.12,.20)},rotate=25]"
                  r"\draw[capacityellipse] (0,0) ellipse (1.00 and .37);"
                  r"\end{scope}\end{tikzpicture}")
        self.assertIsNone(cetz.build(turned))
        # one-feature control: same picture with rotate=0 must draw the axis-aligned ellipse.
        unturned = cetz.build(turned.replace(",rotate=25", ""))
        self.assertIn("circle((0.12, 0.2), radius: (1, 0.37)", unturned)


if __name__ == "__main__":
    unittest.main()
