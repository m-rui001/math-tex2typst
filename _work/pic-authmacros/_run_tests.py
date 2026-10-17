"""Regression checks for failures that previously corrupted whole papers."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parent))
from t2t.convert import collect_formulas, convert_paper
from t2t import cetz
from t2t import macros
from t2t import convert, prep
from t2t.emit import _typst_str, names_counter
from t2t.mathconv import convert_formulas


class ConversionTests(unittest.TestCase):
    def test_nested_ast_lists_are_walked(self):
        ast = {'blocks': [{'t': 'Div', 'c': [[], [{'t': 'Para', 'c': [
            {'t': 'Math', 'c': [{'t': 'InlineMath'}, 'x^2']}
        ]}]]}]}
        self.assertEqual(collect_formulas(ast, set()), {'x^2'})

    def test_macro_parameters_join_text_but_keep_control_words_separable(self):
        table, _skipped = macros.parse_definitions(
            '\\newcommand{\\cataloguesection}[2]{\\hypertarget{subject#2}{}\\foo#2\\bar#1}\n')
        got = macros.expand('\\cataloguesection{Algebra}{3}', table)
        self.assertIn('\\hypertarget{subject3}{}', got)
        self.assertIn('\\foo3', got)
        self.assertIn('\\bar Algebra', got)

    def test_strings_compile_and_preserve_quotes_and_backslashes(self):
        text = 'quote " end\\\n\\label{a}\n\\[x\\] $$'
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'test.typ')
            src.write_text('#let proof(body) = block(body)\n#proof[#raw(' + _typst_str(text) + ')]', encoding='utf-8')
            proc = subprocess.run(['typst', 'compile', str(src)], capture_output=True)
            self.assertEqual(proc.returncode, 0, proc.stderr.decode('utf-8'))

    def test_pandoc_refusals_are_not_reported_as_converted(self):
        converted, refused, _ = convert_formulas([r'x^2', r'\unknownmacro{x}'])
        self.assertIn(0, converted)
        self.assertNotIn(1, converted)
        self.assertIn(1, refused)

    def test_legacy_fonts_and_aligned_equations_remain_native(self):
        converted, refused, _ = convert_formulas([
            r'F_{\rm presc}',
            r'\begin{align}a&=b\\c&=d\end{align}',
        ])
        self.assertEqual(set(converted), {0, 1})
        self.assertFalse(refused)
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder, 'math.typ')
            path.write_text('\n\n'.join(converted.values()), encoding='utf-8')
            proc = subprocess.run(['typst', 'compile', str(path)], capture_output=True)
            self.assertEqual(proc.returncode, 0, proc.stderr.decode('utf-8'))

    def test_a_painted_array_cell_keeps_its_content(self):
        # \colorbox paints a cell, and pandoc's math reader has no colour node to carry it: the box
        # has to go with its colour while the cell's maths stays, or the whole array falls back and
        # prints its source on the page.
        body = r"""\begin{array}{c|ccccc|l}
 &1&\cdots&b&\cdots&n&\text{row parameter}\\ \hline
 1&y_{11}&\cdots&\colorbox{blue!10}{$y_{1b}$}&\cdots&y_{1n}&E_1\\
 b&\colorbox{green!12}{$y_{b1}$}&\fcolorbox{black}{yellow!25}{$y_{bb}$}&E_b
\end{array}"""
        converted, refused, _ = convert_formulas([body])
        self.assertIn(0, converted, str(refused))
        out = converted[0]
        self.assertNotIn("colorbox", out)
        self.assertNotIn("\\begin", out)
        for piece in ('y_11', 'y_(1 b)', 'y_(b b)', 'upright("row parameter")'):
            self.assertIn(piece, out, out)
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder, 'math.typ')
            path.write_text(out, encoding='utf-8')
            proc = subprocess.run(['typst', 'compile', str(path)], capture_output=True)
            self.assertEqual(proc.returncode, 0, proc.stderr.decode('utf-8'))

    def test_equations_theorems_and_numbering_in_a_real_document(self):
        tex = r'''\documentclass{article}
\usepackage{amsmath,amsthm}
\newtheorem{theorem}{Theorem}[section]
\numberwithin{equation}{section}
\title{Regression paper}
\begin{document}
\section{First}\label{sec:first}
\begin{theorem}\label{thm:first}Let $x=1$.\end{theorem}
\begin{proof}We have
\begin{equation}\label{eq:first}x^2=1\end{equation}
and $\unknownmacro{"quoted"}$.
\end{proof}
\section{Second}
\begin{equation}\label{eq:second}y=2\end{equation}
See \eqref{eq:first} and \eqref{eq:second}.
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'regression')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            self.assertGreaterEqual(report['formulas'], 4)
            self.assertEqual(report['math_failed'], 1)
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertIn('(1.1)', result)
            self.assertIn('(2.1)', result)
            self.assertNotIn('$$', result)

    def test_a_description_list_keeps_its_equations(self):
        tex = r'''\documentclass{article}
\usepackage{amsmath}
\title{List paper}
\begin{document}
\begin{description}
\item[($\alpha$)] The first case needs
\begin{equation}\label{eq:inlist}z=3\end{equation}
\end{description}
As \eqref{eq:inlist} shows.
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'deflist')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            stats = report.get('stats') or {}
            self.assertFalse(stats.get('unhandled_block:DefinitionList'))
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertRegex(result, r"z\s*=\s*3")
            self.assertIn('(1)', result)
            self.assertNotIn('[??]', result)

    def test_a_float_with_two_captions_becomes_two_floats(self):
        # pandoc numbers a float from its one caption, so in a table that stacks two tabulars
        # the second caption loses its number, its words and every \ref naming it
        region = ("\\begin{table}\n\\caption{First.}\\label{tab:a}\n"
                  "\\begin{tabular}{cc}1&2\\end{tabular}\n"
                  "\\caption{Second.}\\label{tab:b}\n"
                  "\\begin{tabular}{cc}3&4\\end{tabular}\n\\end{table}\n")
        lifted = prep.lift_captions(region)
        self.assertEqual(lifted.count("\\begin{table}"), 2)
        self.assertEqual(lifted.count("\\end{table}"), 2)
        self.assertIn("\\caption{First.}\\label{tab:a}", lifted)
        self.assertIn("\\caption{Second.}\\label{tab:b}", lifted)
        # each caption keeps the tabular that stood under it
        self.assertLess(lifted.index("tab:a"), lifted.index("1&2"))
        self.assertLess(lifted.index("1&2"), lifted.index("tab:b"))
        self.assertLess(lifted.index("tab:b"), lifted.index("3&4"))

    def test_a_written_rule_reaches_the_page(self):
        tex = r'''\documentclass{article}
\begin{document}
\textbf{Before.}
\rule{\linewidth}{0.4pt}
text after
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'rule')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            self.assertFalse((report.get('stats') or {})
                             .get('unhandled_block:HorizontalRule'))
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertIn('#line(length: 100%', result)

    def test_a_caption_outside_a_float_keeps_its_words_and_number(self):
        tex = r'''\documentclass{article}
\begin{document}
\begin{minipage}{0.6\linewidth}
\begin{picture}(30,30)\put(3,3){\circle{6}}\end{picture}
\caption{The support disc.}\label{fig:disc}
\end{minipage}
See Figure~\ref{fig:disc}.
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'lifted')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            self.assertEqual(report['figures'], 1)
            self.assertFalse((report.get('stats') or {}).get('dangling_ref'))
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertIn('The support disc.', result)

    def test_grid_spacing_follows_the_axis_step_and_the_origin(self):
        # pdflatex measures a bare 'step=1' as one unit of its own axis, so on .52cm
        # axes the strokes lie .52cm apart, both directions inclusive of the far edge
        scaled = cetz.convert(r'\begin{tikzpicture}[x=.52cm,y=.52cm]'
                              r'\draw[step=1,gray!60] (0,0) grid (2,-2);'
                              r'\end{tikzpicture}')
        self.assertIsNotNone(scaled)
        self.assertEqual(scaled.count('line('), 6)
        self.assertIn('line((0.52, -1.04), (0.52, 0)', scaled)

        # with no step at all the spacing is 1cm, and the lattice is anchored to the
        # origin rather than to the corners, so a grid from (.3,.2) draws at 1 and 2
        shifted = cetz.convert(r'\begin{tikzpicture}\draw (0.3,0.2) grid (2.3,2.2);'
                               r'\end{tikzpicture}')
        self.assertIsNotNone(shifted)
        self.assertEqual(shifted.count('line('), 4)
        self.assertIn('line((1, 0.2), (1, 2.2))', shifted)
        self.assertIn('line((0.3, 1), (2.3, 1))', shifted)
        self.assertNotIn('line((0.3, 0.2)', shifted)

    def test_ifnum_branches_survive_only_when_the_numbers_decide_them(self):
        # expand_foreach writes the loop variable back as digits, which makes the
        # comparison a fact: k<2 keeps the then-branch, k=2 the else-branch
        pic = (r'\begin{tikzpicture}\foreach \k in {0,...,2}{\ifnum\k<2'
               r'\draw (0,\k) -- (1,\k);\else\draw (2,\k) -- (3,\k);\fi}'
               r'\end{tikzpicture}')
        canvas = cetz.convert(pic)
        self.assertIsNotNone(canvas)
        self.assertIn('line((0, 0), (1, 0)', canvas)
        self.assertIn('line((0, 1), (1, 1)', canvas)
        self.assertIn('line((2, 2), (3, 2)', canvas)
        self.assertNotIn('line((0, 2)', canvas)
        self.assertNotIn('line((2, 0)', canvas)

        # an operand that is still a macro is a branch we would have to guess at
        self.assertIsNone(cetz.build(r'\begin{tikzpicture}\ifnum\a<2 \draw (0,0)--(1,1);'
                                     r'\fi\end{tikzpicture}'))

    def test_hypertarget_names_carry_their_links_and_pages(self):
        # the catalogue's table of contents links forward to a \hypertarget that carries
        # no number; the name has to reach Typst as an anchor or every entry dangles,
        # and the page it names has to survive too, which pandoc would otherwise delete
        tex = r'''\documentclass{article}
\usepackage{hyperref}
\begin{document}
\noindent\hyperlink{subject1}{Number theory}\nobreak\hfill\pageref*{subject1}\par
\hypertarget{subject1}{}\label{subject1}
Section text.
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'cat.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'catalogue')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            self.assertEqual((report['stats'] or {}).get('dangling_ref', 0), 0)
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertIn('#label("subject1")', result)
            self.assertIn('#link(<subject1>)[Number theory]', result)
            self.assertIn('#context counter(page).at(<subject1>).first()', result)


    def test_a_caption_outside_its_float_becomes_a_float_of_its_own(self):
        # pandoc keeps a \caption only under figure or table, so one written below a
        # picture environment loses both its number and every \ref that names it
        body = ("\\begin{picture}(200,60)\n\\put(10,10){\\vector(1,0){100}}\n\\end{picture}\n"
                "\\caption{The shift map.}\\label{fig:shift}\n"
                "text \\caption[Short head]{A long caption.}\\label{tab:index}\n")
        lifted = prep.lift_captions(body)
        self.assertEqual(lifted.count("\\begin{figure}"), 1)
        self.assertEqual(lifted.count("\\begin{table}"), 1)
        self.assertIn("\\caption{The shift map.}\\label{fig:shift}", lifted)
        self.assertIn("[Short head]", lifted)
        self.assertEqual(lifted.count("\\caption"), body.count("\\caption"))

        # a float's own caption is left where the author put it
        own = ("\\begin{figure}\n\\includegraphics{a}\n"
               "\\caption{Own.}\\label{fig:own}\n\\end{figure}\n")
        self.assertEqual(prep.lift_captions(own), own)

    def test_a_tilted_picture_turns_what_it_draws(self):
        # the tilt is a 2x2 matrix carried into every emitted point: until it landed, a picture
        # that rotated its plane was refused and the reader got quoted LaTeX instead of a figure
        turned = cetz.build(r"\begin{tikzpicture}[rotate=90]\draw (0,0) rectangle (2,1);"
                            r"\end{tikzpicture}")
        self.assertIn("(-1, 2)", turned)
        self.assertIn("close: true", turned)   # a tilted rectangle is four corners, not a rect
        self.assertNotIn("rect(", turned)

        # an oblique axis arrives as the image of its unit
        basis = cetz.build(r"\begin{tikzpicture}[x={(0.866cm,0.5cm)}]\draw (0,0)--(1,0);"
                           r"\end{tikzpicture}")
        self.assertIn("line((0, 0), (0.866, 0.5))", basis)

        # Typst turns page text clockwise, TikZ and CeTz counter-clockwise, so the angle negates;
        # a node's own rotate turns its contents about its anchor, leaving the placement alone
        node = cetz.convert(r"\begin{tikzpicture}\node[rotate=90] at (2,1) {t};\end{tikzpicture}")
        self.assertIsNotNone(node)
        self.assertIn("content((2, 1), [#page_rotate(-90deg)[t]])", node)
        inpath = cetz.build(r"\begin{tikzpicture}\draw (0,0) node[rotate=90] {t};"
                            r"\end{tikzpicture}")
        self.assertIn("#page_rotate(-90deg)[t]", inpath)

        # an arc is read inside the turned frame, so its sweep moves with the plane
        arc = cetz.build(r"\begin{tikzpicture}[rotate=45]\draw (0,0) arc (0:90:2);"
                         r"\end{tikzpicture}")
        self.assertIn("start: 45deg, stop: 135deg", arc)

        # a lattice is laid out in the scope's own units and then turned, not refused for being
        # tilted; unturned it still lands on the same integers it always did
        turned = cetz.build(r"\begin{tikzpicture}[rotate=90]\draw (-1,-1) grid (1,1);"
                            r"\end{tikzpicture}")
        self.assertIn("line((1, -1), (-1, -1))", turned)
        flat = cetz.build(r"\begin{tikzpicture}\draw (0,0) grid (2,2);\end{tikzpicture}")
        self.assertIn("line((1, 0), (1, 2))", flat)

        # two shapes have no turned form and refuse rather than draw themselves untilted
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}[rotate=30]"
                                     r"\draw (0,0) ellipse (2cm and 1cm);\end{tikzpicture}"))
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\node[rotate around={45:(0,0)}]"
                                     r" at (1,0) {t};\end{tikzpicture}"))

    def test_a_citation_of_a_key_the_bibliography_lacks_prints_a_question(self):
        # \cite{B,C,Dv} with no \bibitem{Dv} used to hand the whole key list to the page as text,
        # so two defined entries lost their numbers and the reader saw raw cite keys; the missing
        # key alone is a ?, which is what LaTeX prints, and the note names the key that is missing
        tex = r'''\documentclass{article}
\begin{document}
Both are \cite{A,B}. Only one is missing in \cite{B,Zz}.
\begin{thebibliography}{9}
\bibitem{A} First.
\bibitem{B} Second.
\end{thebibliography}
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'bib.tex')
            src.write_text(tex, encoding='utf-8')
            report = convert_paper(str(src), str(Path(folder, 'out')), 'bib')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            self.assertEqual((report['stats'] or {}).get('missing_bibkey'), 1)
            result = (Path(folder, 'out') / 'main.typ').read_text(encoding='utf-8')
            self.assertIn('[1,2]', result)
            self.assertIn('[2,?]', result)
            self.assertNotIn('[B,Zz]', result)

    def test_a_node_moves_by_its_own_shift(self):
        # TikZ places a node and then moves it, so a shift written on the node is a placement;
        # nothing read it, and the corpus's 16 such labels sat on their unshifted point
        self.assertIn("content((1, 0), [t])",
                      cetz.build(r"\begin{tikzpicture}\node[xshift=1cm] at (0,0) {t};"
                                 r"\end{tikzpicture}"))
        self.assertIn("content((1, 3), [t])",
                      cetz.build(r"\begin{tikzpicture}\node[yshift=2cm] at (1,1) {t};"
                                 r"\end{tikzpicture}"))
        self.assertIn("content((1, 0), [t])",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) node[xshift=1cm] {t};"
                                 r"\end{tikzpicture}"))

        # the shift is an absolute length even inside a turned scope, and the node's own rotate=
        # still turns only its contents
        tilted = cetz.build(r"\begin{tikzpicture}[rotate=90]\node[xshift=1cm] at (0,0) {t};"
                            r"\end{tikzpicture}")
        self.assertIn("content((1, 0), [#page_rotate(-90deg)[t]])", tilted)

        # a length we cannot read moves nothing, so the node is refused rather than drawn wrong
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\node[xshift=1foo] at (0,0) {t};"
                                     r"\end{tikzpicture}"))

    def test_a_coordinate_offset_moves_the_named_point_under_it(self):
        # ([yshift=1cm]a) is a placement the author wrote onto a name. The reader kept the field
        # indices of the four-field transform it replaced, so it added the basis vectors instead
        # of the offset and refused every picture that used one -- 18 over 20 papers
        self.assertIn("line((0, 0), (0, 1))",
                      cetz.build(r"\begin{tikzpicture}\coordinate (a) at (0,0);"
                                 r"\draw (0,0) -- ([yshift=1cm]a);\end{tikzpicture}"))
        # two offsets on one coordinate add up, and an anchor name still resolves underneath them
        self.assertIn("content((1, 2), [t])",
                      cetz.build(r"\begin{tikzpicture}\node (n) at (0,0) {t};"
                                 r"\node[xshift=1cm] at ([yshift=2cm]n) {t};"
                                 r"\end{tikzpicture}"))
        # a stretch written where only a shift belongs moves nothing
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\coordinate (a) at (0,0);"
                                     r"\draw (0,0) -- ([scale=2]a);\end{tikzpicture}"))

    def test_a_colour_aliased_inside_the_picture_mixes_like_a_defined_one(self):
        # `\colorlet{crossink}{blue!45!black}` is a declaration, not a drawing statement, so the body
        # held it and every statement that used the name refused. The alias folds into the picture's
        # own palette and resolves against what was declared above it; a name we cannot model still
        # loses the drawing, because guessing its ink would redraw the figure wrong.
        body = cetz.build(r"\begin{tikzpicture}\colorlet{crossink}{blue!45!black}"
                          r"\fill[crossink!12] (0,0) rectangle (4.2,1.3);"
                          r"\end{tikzpicture}")
        self.assertIn('rect((0, 0), (4.2, 1.3), fill: rgb("#e0e0ee"))', body)
        self.assertNotIn("colorlet", body)
        # the alias sees a colour the same picture defined earlier
        self.assertIn('fill: rgb("#e0e0ee")', cetz.build(
            r"\begin{tikzpicture}\definecolor{base}{rgb}{0,0,0.45}"
            r"\colorlet{alias}{base}\fill[alias!12] (0,0) rectangle (1,1);"
            r"\end{tikzpicture}"))
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\colorlet{bad}{nosuchcolor}"
                                     r"\fill[bad] (0,0) rectangle (1,1);"
                                     r"\end{tikzpicture}"))

    def test_a_relative_control_offset_leaves_from_its_own_endpoint(self):
        # `.. controls +(1,1) and +(-1,1) ..` refused because _coord_at forwarded the `+` to `point`
        # with no cursor. Measured (`_work/measure_relcontrols.py`, pdflatex under x=1cm, y=2cm): the
        # first control hangs off the start and the second off the end, a unit-less pair is read along
        # the scope's own axes, and one written with units stays absolute.
        self.assertIn("bezier((0, 0), (3, 0), (1, 1), (2, 1))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) .. controls +(1,1) and +(-1,1) .."
                                 r" (3,0);\end{tikzpicture}"))
        # one of each: the relative entry resolves off the start, the written point is taken as it is
        self.assertIn("bezier((0, 0), (3, 0), (0, 1.15), (2, 1))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) .. controls +(0,1.15) and (2,1) .."
                                 r" (3,0);\end{tikzpicture}"))
        # the form that already drew is untouched by the change
        self.assertIn("bezier((0, 0), (3, 0), (1, 1), (2, 1))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) .. controls (1,1) and (2,1) .."
                                 r" (3,0);\end{tikzpicture}"))
        # a unit-less offset follows the axes: +1 is 1cm across and 2cm up, and its pair is not
        self.assertIn("bezier((0, 0), (3, 0), (1, 2), (2, 2))",
                      cetz.build(r"\begin{tikzpicture}[x=1cm,y=2cm]\draw (0,0) .. controls +(1,1)"
                                 r" and +(-1,1) .. (3,0);\end{tikzpicture}"))

    def test_a_node_written_on_a_segment_sits_on_that_segment(self):
        pic = (r"\begin{tikzpicture}\draw (0,0) -- node[above] {mid} (4,0)"
               r" -- node[pos=.25] {quarter} (4,3);\end{tikzpicture}")
        body = cetz.build(pic)
        # TikZ puts an unlabelled in-path node midway along the segment it interrupts, and a
        # node with no segment after it hangs off the last point drawn; 'above' is the side of
        # that point the box stands on, so it reaches CeTz as the box's south anchor
        self.assertIn('content((2, 0), [mid], anchor: "south")', body)
        self.assertIn("content((4, 0.75), [quarter])", body)
        self.assertIn("content((4, 3), [tail])",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) -- (4,3) node {tail};"
                                 r"\end{tikzpicture}") or "")

    def test_a_trailing_node_with_a_place_goes_on_the_segment_just_walked(self):
        # `_work/node_place_probe.pdf` measures the three placements apart: no key puts the node on
        # the last point drawn, `midway` puts it on the middle of the segment just walked, and the
        # name in brackets is where a later statement points
        pic = (r"\begin{tikzpicture}\draw (0,0) -- (2,0) node[midway] (m) {x};"
               r"\draw[->] (m) -- ++(0,1);\end{tikzpicture}")
        body = cetz.build(pic)
        self.assertIn("content((1, 0), [x])", body)
        self.assertIn("line((1, 0), (1, 1)", body)
        self.assertIn("content((2, 0), [y])",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) -- (2,0) node {y};"
                                 r"\end{tikzpicture}"))

    def test_an_axis_sized_to_the_text_column_draws_on_the_pages_own_width(self):
        pic = (r"\begin{tikzpicture}[x=.5\linewidth,y=1cm]"
               r"\draw (0,0) -- (2,0) -- (2,1);\end{tikzpicture}")
        # with no page to measure against the dimension stays a macro, and the picture refuses
        self.assertIsNone(cetz.build(pic))
        self.assertIsNotNone(cetz.build(pic, line_cm=10.0))
        self.assertAlmostEqual(cetz._dim_cm(cetz.expand_linewidth(r".98\linewidth", 10.0)),
                               9.8, places=3)
        self.assertAlmostEqual(cetz._dim_cm(cetz.expand_linewidth(r"\textwidth", 16.5)),
                               16.5, places=3)

    def test_a_tangent_option_bends_the_connector_it_sits_on(self):
        # to[out=,in=] was parsed and dropped, so the curve printed as its own chord -- a wrong
        # picture that counted as converted. pdflatex puts both controls 0.39 of the chord along
        # their tangent, and a key the author omitted means an absolute 45 at the start and 135
        # at the end, whatever the chord's own direction is.
        self.assertIn("bezier((0, 0), (2, 0), (4.776e-17, 0.78), (1.22, 9.552e-17))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) to[out=90,in=180] (2,0);"
                                 r"\end{tikzpicture}"))
        self.assertIn("bezier((0, 0), (2, 0), (0.6755, 0.39), (1.448, 0.5515))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) to[out=30] (2,0);"
                                 r"\end{tikzpicture}"))
        # a connector with no tangent at all is still the straight line it always was
        self.assertIn("line((0, 0), (2, 0))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) to (2,0);"
                                 r"\end{tikzpicture}"))
        # bend keeps its circular-arc control, and written controls outrank a tangent
        self.assertIn("bezier((0, 0), (2, 0), (1, -0.8284), (1, -0.8284))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) to[bend left=90] (2,0);"
                                 r"\end{tikzpicture}"))
        self.assertIn("bezier((0, 0), (4, 0), (1, 2), (3, 2))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) .. controls (1,2) and (3,2) "
                                 r".. (4,0);\end{tikzpicture}"))

    def test_a_looseness_option_moves_both_controls_out_along_their_tangents(self):
        # `to` threw away keys it did not know, so a curve the author stretched printed at its
        # unstretched size. pdflatex (_work/measure_looseness.py) reads the control distance as
        # 0.39 of the chord times the factor -- r=0.195 at looseness=0.5, 1.9499 at 5 -- so the
        # whole curve scales about its endpoints and the tangent angles do not move.
        def curve(opts):
            return cetz.build(r"\begin{tikzpicture}[x=1cm,y=1cm]\draw (0,0) to[%s] (2,0);"
                              r"\end{tikzpicture}" % opts) or ""

        self.assertIn("bezier((0, 0), (2, 0), (-0.5515, 0.5515), (2.552, 0.5515))",
                      curve("out=135,in=45"))
        self.assertIn("bezier((0, 0), (2, 0), (-2.758, 2.758), (4.758, 2.758))",
                      curve("out=135,in=45,looseness=5"))
        # the factor is read wherever it sits in the list
        self.assertIn("bezier((0, 0), (2, 0), (-0.2758, 0.2758), (2.276, 0.2758))",
                      curve("looseness=0.5,out=135,in=45"))
        # a bend's single control is the apex of its arc, not a tangent length, so how that apex
        # answers a looseness is a question this measurement does not answer; it stays unstretched
        self.assertIn("bezier((0, 0), (2, 0), (1, -0.3978), (1, -0.3978))",
                      curve("bend left=45,looseness=5"))

    def test_a_node_written_after_a_path_circle_hangs_on_its_centre(self):
        # `\fill (.3,1.8) circle (1.2pt) node[above left] {$M$};` is how a paper names a dot, and
        # the circle branch cleared the current point when it closed, so the node found nothing to
        # hang on and the label vanished from the page -- 231 of them across the corpus, measured
        # by _work/probe_fill_path_node.py and _work/probe_invented_frames.py. TikZ carries the
        # path on through the centre, which is where the label then sits.
        def drawn(stmt):
            return cetz.build(r"\begin{tikzpicture}[x=1cm,y=1cm]" + stmt
                              + r"\end{tikzpicture}") or ""

        for verb in ("fill", "draw", "path"):
            body = drawn(r"\%s (.3,1.8) circle (1.2pt) node[above left] {$M$};" % verb)
            self.assertIn("circle((0.3, 1.8), radius: 0.04233", body)
            self.assertIn('content((0.3, 1.8), [$M$], anchor: "south-east")', body)
        # the dot itself still paints, and a line written after a circle starts from its centre
        self.assertIn("circle((1, 1), radius: 0.07056, fill: black)",
                      drawn(r"\fill (1,1) circle (2pt);"))
        self.assertIn("line((1, 1), (3, 1))",
                      drawn(r"\draw (1,1) circle (2pt) -- (3,1);"))

    def test_a_picture_reads_the_styles_and_inks_declared_above_it(self):
        # `box/.style` names a box a node invokes, and `every node/.style` fixes the frames of a
        # whole flowchart without any node naming it; a colour the paper \definecolor-s is the
        # ink the picture borrows. None of the three reached a picture before.
        head = cetz.opts("every node/.style={draw,rounded corners}, box/.style={thick}")
        styles = cetz.picture_styles(head)
        self.assertEqual(sorted(cetz.resolve_opts({"box": True}, styles)),
                         ["box", "draw", "rounded corners", "thick"])
        self.assertEqual(sorted(cetz.resolve_opts({"draw": "black"}, styles)),
                         ["draw", "rounded corners"])
        self.assertIn('rgb("#1f4e79")',
                      cetz.build(r"\begin{tikzpicture}\draw[crossink] (0,0) -- (1,1);"
                                 r"\end{tikzpicture}", {"crossink": ("HTML", "1F4E79")}))

    def test_a_frame_the_author_asked_for_is_drawn_around_the_nodes_text(self):
        # `\node[draw]` names no colour, so the bare key used to answer nothing and the frame went
        # missing: run69's flowcharts printed their labels floating. We cannot measure glyphs, so
        # Typst's own `box` strokes the layout box of the content it is given, padded by TikZ's
        # default `inner sep` of 0.3333em.
        def node(opt):
            built = cetz.build(r"\begin{tikzpicture}\node" + opt + r" at (0,0) {Label};"
                               r"\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertEqual(node(""), "content((0, 0), [Label])")
        self.assertEqual(node("[draw]"),
                         "content((0, 0), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), "
                         "[Label])])")
        self.assertEqual(node("[draw=none]"), "content((0, 0), [Label])")
        # a bare colour on an unframed node inks its text: `\node[blue!65!black] at (...) {primary
        # pieces};` stands on the author's page with no rectangle, and reading that colour as a
        # stroke request boxed 222 labels the papers never show
        self.assertEqual(node("[blue!65!black]"),
                         'content((0, 0), [#text(fill: rgb("#0000a6"))[Label]])')
        self.assertEqual(node("[red!70!black,very thick,dashed]"),
                         'content((0, 0), [#text(fill: rgb("#b20000"))[Label]])')
        # an ink and a corner the author wrote down move into the box, which paints its fill too
        self.assertIn('radius: 5.669pt, stroke: (paint: rgb("#ff0000")), fill: rgb("#ffff00")',
                      cetz.build(r"\begin{tikzpicture}\node[draw=red,fill=yellow,"
                                 r"rounded corners=2mm] at (0,0) {L};\end{tikzpicture}"))
        # 'every node/.style' is a default no node names, and it is how a flowchart frames them all
        self.assertIn('#box(inset: 0.3333em, radius: 4pt',
                      cetz.build(r"\begin{tikzpicture}[every node/.style={draw,rounded corners}]"
                                 r"\node (a) {Alpha};\end{tikzpicture}"))
        # a box of Typst markup inside a CeTz canvas has to survive the compiler the page runs on
        self.assertIn('#box(inset: 0.3333em',
                      cetz.convert(r"\begin{tikzpicture}\node[draw] at (0,0) {Label};"
                                   r"\end{tikzpicture}"))

    def test_a_written_size_is_a_minimum_a_multi_line_label_grows_past(self):
        # TikZ grows `minimum height` around a two-line label; CeTz's `content(range, frame:)`
        # paints exactly the range it is handed, so the second line escaped its own border. The
        # frame keeps the declared width and lets Typst measure the height (575 nodes over 104
        # papers, _work/probe_grown_box.py). `box` has no `align:` argument -- measured, the
        # centring is a `#align(center)` call.
        def node(label):
            built = cetz.build(r"\begin{tikzpicture}\node[draw, minimum width=2cm,"
                               r" minimum height=1cm] at (0,0) {" + label +
                               r"};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        grown = node(r"A\\B")
        self.assertIn("[#box(width: ", grown)
        self.assertIn("[#set text(hyphenate: false); #align(center)[A#linebreak()B]]", grown)
        self.assertNotIn("frame:", grown)
        self.assertIn('frame: "rect"', node("One line only"))
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[draw, minimum width=2cm,"
                                     r" minimum height=1cm] at (0,0) {A\\B};"
                                     r"\end{tikzpicture}"))

    def test_an_edges_label_is_a_node_written_before_its_target(self):
        # `\path (A) edge node {x} (B)` puts x at the middle of the edge. The walker read `to`/`edge`
        # only where a bracket or a coordinate followed, so the label's own `node` word stopped it and
        # the whole picture was quoted: two papers, and the same rule already places `-- node {x} --`.
        built = cetz.build(r"\begin{tikzpicture}\node (a) at (0,0) {A};\node (b) at (2,0) {B};"
                           r"\path (a) edge node[left] {red} (b);\end{tikzpicture}") or ""
        lines = [l.strip() for l in built.splitlines() if "content(" in l or "line(" in l]
        self.assertIn("line((0, 0), (2, 0))", lines)
        self.assertIn("content((1, 0), [red], anchor: \"east\")", lines)
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node (a) at (0,0) {A};"
                                     r"\path (a) edge node[above] {$f_{i+1}$} (1,1);"
                                     r"\end{tikzpicture}"))

    def test_node_math_carries_no_grouping_braces(self):
        # Typst has no grouping braces in maths and prints the ones it is handed, so a stripped
        # command name left its argument's braces on the page: `\underline{\mathbb{Q}}` came out as
        # `{ {Q}}` and `\frac{K}{K_0}` as `{K}{K_0}`. A brace only stays as the group of a script.
        def math(tex):
            return cetz.build(r"\begin{tikzpicture}\node at (0,0) {$%s$};"
                              r"\end{tikzpicture}" % tex)
        self.assertIn("[$Q$]", math(r"\underline{\mathbb{Q}}"))
        self.assertIn("[$K K_0$]", math(r"\frac{K}{K_0}"))
        # a script's group is printed too, which `_work/probe_sub_label.typ` shows on one page:
        # `$a_{0}$` reaches it as `a_{0}` while `$a_0$` and `$a_12$` set clean subscripts. So a
        # group of one atom loses its braces; a compound one keeps them, because attaching only its
        # first atom would move the rest of the author's maths out of the subscript.
        self.assertIn("[$A_i$]", math(r"\hat{A}_{i}"))
        self.assertIn("[$x_12$]", math(r"x_{12}"))
        self.assertIn("[$x_{i+1}$]", math(r"x_{i+1}"))
        # the loop must not reach inside an escaped brace: a paper's own `\1` macro wrote the
        # character form `\{v\}`, and stripping that printed `1_{\v\}` on the page
        self.assertIn("[$\\1_{\\{v\\}}$]", math(r"\1_{\{v\}}"))
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node at (0,0)"
                                     r" {$\underline{\mathbb{Q}} \leq \frac{K}{K_0}$};"
                                     r"\end{tikzpicture}"))

    def test_a_path_can_take_its_arrow_from_an_invoked_style(self):
        # 'flow/.style={->,draw=blue!60}' is read back for a node but was never resolved for a
        # '\draw[flow]', so 38 pictures drew the line and dropped its head and ink. 'every node'
        # is merged for a node only: TikZ applies it to nodes, and on a path it would fill the
        # connecting lines white.
        built = cetz.build(r"\begin{tikzpicture}[flow/.style={->,draw=blue!60,line width=.8pt},"
                           r"every node/.style={fill=white}]\node (a) at (0,0) {A};"
                           r"\draw[flow] (a) -- (2,0);\end{tikzpicture}") or ""
        lines = [l.strip() for l in built.splitlines() if l.strip().startswith("line(")]
        self.assertIn('line((0, 0), (2, 0), stroke: (paint: rgb("#6666ff"), '
                      'thickness: 0.8pt), mark: (end: ">"))', lines)
        self.assertNotIn("#ffffff", lines[0])
        self.assertIn('#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff")',
                      built)
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}[f/.style={<-}]\draw[f] (0,0) -- (1,1);"
                                     r"\end{tikzpicture}"))

    def test_a_path_macro_written_inside_the_picture_draws_its_own_body(self):
        # `\def\wall{(0,0)--(2,0)--cycle}` then `\fill \wall;` is the author's path spelled out in TeX
        # before pgf reads it, so the name is the text; the picture that used one was quoted whole.
        built = cetz.build(r"\begin{tikzpicture}\def\wall{(0,0)--(2,0)--(2,2)--cycle}"
                           r"\fill[black!14] \wall;\end{tikzpicture}")
        self.assertTrue(built)
        self.assertNotIn("wall", built)
        # `#1` is an argument we would have to guess, so that macro is left for the refusal path
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\def\seg#1{(0,0)--#1}"
                                     r"\draw \seg{(1,1)};\end{tikzpicture}"))
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\def\sq{(0,0)--(1,0)--(1,1)--cycle}"
                                     r"\draw \sq;\end{tikzpicture}"))

    def test_a_colour_written_on_node_text_inks_it(self):
        # the text pass deletes command names and keeps their arguments, so \textcolor used to
        # print its colour specification as words on the page
        self.assertIn('content((0, 0), [#text(fill: rgb("#bf0000"))[t]])',
                      cetz.build(r"\begin{tikzpicture}\node at (0,0) {\textcolor{red!75!black}{t}};"
                                 r"\end{tikzpicture}"))
        # a mixed name is a blend of two inks; 'red!75' alone was the share mixed with white
        self.assertIn('stroke: (paint: rgb("#0000a6"))',
                      cetz.build(r"\begin{tikzpicture}\draw[blue!65!black] (0,0) -- (1,1);"
                                 r"\end{tikzpicture}"))
        # an ink we cannot model colours nothing, so the picture is quoted rather than mis-inked
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\node at (0,0) {\textcolor{nosuch}{t}};"
                                     r"\end{tikzpicture}"))
        # the colouring is page markup, so it has to survive the compiler the page runs on
        self.assertIn('#text(fill: rgb("#bf0000"))[t]',
                      cetz.convert(r"\begin{tikzpicture}\node at (0,0)"
                                   r" {\textcolor{red!75!black}{t}};\end{tikzpicture}"))

    def test_a_style_table_declared_inside_the_picture_frames_its_nodes(self):
        # a flowchart that only needs its styles mid-body writes `\tikzset{bit/.style={…}}`; the
        # statement draws nothing, so it was an unknown verb that refused the whole picture and
        # left the reader a block of quoted LaTeX instead of the drawing
        self.assertIn('content((-0.08819, -0.08819), (0.08819, 0.08819), [1], frame: "circle")',
                      cetz.build(r"\begin{tikzpicture}\tikzset{bit/.style={circle,draw,"
                                 r"minimum size=5pt,inner sep=0pt}}\node[bit] (a) at (0,0) {1};"
                                 r"\end{tikzpicture}"))
        # a \tikzset that also sets a picture-wide default we cannot honour is not silently dropped
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\tikzset{line width=2pt}"
                                     r"\node (a) {1};\end{tikzpicture}"))

    def test_a_node_positioned_by_two_distances_reads_which_is_which(self):
        # 'below left=12mm and -12mm of t' names the two axes in the order its direction word
        # does, measured against pdflatex in _work/measure_positioned.py: the first number moved
        # the vertical of 'below left' and the second its horizontal. OF_TARGET read one number
        # for both axes, so every two-value node in the corpus refused its picture.
        def placed(opt, decl=r"\node (t) at (0,0) {T};"):
            built = cetz.build(r"\begin{tikzpicture}" + decl +
                               r"\node[" + opt + r"] {N};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content" in line][-1]

        self.assertEqual(placed("below left=12mm and -12mm of t"), "content((1.2, -1.2), [N])")
        self.assertEqual(placed("above right=1cm and 2cm of t"), "content((2, 1), [N])")
        # one distance still means both axes, and a length we cannot read moves nothing
        self.assertEqual(placed("below=1cm of t"), "content((0, -1), [N])")
        self.assertEqual(placed("right=1cm and 2cm of t"), "content((1, 0), [N])")
        # 'below=of a' writes no distance and means \\node distance, and 'of a.south' names the
        # reference's own anchor -- the two spellings the corpus's flowcharts actually use
        self.assertEqual(placed("below=of t"), "content((0, -1), [N])")
        self.assertEqual(placed("below=23mm of t.south"), "content((0, -2.3), [N])")
        # a box the author fixed moves the anchor the text one cannot
        self.assertEqual(placed("below=1cm of t.south",
                                r"\node[minimum size=2cm] (t) at (0,0) {T};"),
                         "content((0, -2), [N])")
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\node (t) at (0,0) {T};"
                                     r"\node[below left=1foo and 2cm of t] {N};"
                                     r"\end{tikzpicture}"))

    def test_a_node_held_by_a_named_point_pins_that_point_on_the_coordinate(self):
        # 'above' does not move the box, it says which of the box's points sits on the spot: the
        # south one. CeTz's content carries that as an offset anchor, but spells its corners with
        # a hyphen (anchor.typ's named-border-anchors) where TikZ writes 'north west'. Measured on
        # the corpus in _work/probe_anchor_population.py: 4,179 anchors over 418 papers.
        def pinned(opt, decl=""):
            built = cetz.build(r"\begin{tikzpicture}" + decl +
                               r"\node[" + opt + r"] at (1,1) {N};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertEqual(pinned("above"), 'content((1, 1), [N], anchor: "south")')
        self.assertEqual(pinned("below"), 'content((1, 1), [N], anchor: "north")')
        self.assertEqual(pinned("right"), 'content((1, 1), [N], anchor: "west")')
        self.assertEqual(pinned("above right"), 'content((1, 1), [N], anchor: "south-west")')
        # both of TikZ's corner spellings, and a label written on a segment asks the same question
        self.assertEqual(pinned("anchor=north east"), 'content((1, 1), [N], anchor: "north-east")')
        self.assertEqual(pinned("anchor=north-west"), 'content((1, 1), [N], anchor: "north-west")')
        built = cetz.build(r"\begin{tikzpicture}\draw (0,0) -- node[above] {mid} (4,0);"
                           r"\end{tikzpicture}") or ""
        self.assertIn('content((2, 0), [mid], anchor: "south")', built)
        # a point we do not know leaves the text centred rather than shifted by a guess, and a node
        # carrying a frame is placed by that frame, not by half a height nobody measured
        self.assertEqual(pinned("anchor=north west corner"), "content((1, 1), [N])")
        for opt in ("draw,above", "draw,minimum width=2cm,anchor=north west"):
            self.assertNotIn("anchor", pinned(opt))

    def test_a_reference_already_named_in_front_of_it_prints_only_its_number(self):
        # the author writes 'Section~\ref{sec:a}': the word is already on the line, so adding the
        # counter's own name reaches the page as 'Section Section 3'
        self.assertTrue(names_counter("Section ", "Section"))
        self.assertTrue(names_counter("Sections", "Section"))
        self.assertTrue(names_counter("see table", "Tables"))
        self.assertFalse(names_counter("see", "Section"))
        self.assertFalse(names_counter("s", "Section"))
        self.assertTrue(names_counter("(Section ", "Section"))

    def test_a_foreach_item_with_too_few_components_repeats_its_last_one(self):
        # measured in _work/foreach_multi_probe.pdf: `{p}` under two names binds p to both names,
        # while `p/1/2` drops the third component instead of folding it in
        self.assertEqual(cetz._loop_values("p", 2), [("p", "p")])
        self.assertEqual(cetz._loop_values("p/1/2,q/3", 2), [("p", "1"), ("q", "3")])

    def test_a_tag_that_carries_a_formula_is_a_number_written_as_that_formula(self):
        # pdflatex (_work/tag_ref_probe.pdf): the display prints (∗_adj) and \eqref answers with the
        # same formula, so the tag must reach the page as maths -- never as `_{\mathrm{adj}}` text
        got = cetz.mathconv.tag_text(r"\(\ast_{\mathrm{adj}}\)", {})
        self.assertTrue(got.startswith("$") and got.endswith("$"), got)
        self.assertNotIn("\\mathrm", got)
        self.assertEqual(cetz.mathconv.tag_maths(got), got[1:-1].strip())
        self.assertIsNone(cetz.mathconv.tag_maths("4.7"))
        # a tag that is only a symbol, or a borrowed number, stays the text it already was
        self.assertEqual(cetz.mathconv.tag_text(r"\ast", {}), "∗")

    def test_a_numeric_def_is_folded_even_when_its_name_is_not_a_word(self):
        # `expand_def` shadowed this fold for its whole life: DEF_PATH only reads letters, so
        # `\def\s{0.866}` survived as a name the coordinate reader cannot parse
        folded = cetz.expand_def(r"\def\s{0.866} \draw (0,0) circle (\s);")
        self.assertEqual(folded, r" \draw (0,0) circle (0.866);")

    def test_the_blank_that_delimits_a_loop_variable_is_swallowed_as_it_is_in_tex(self):
        # pdflatex reads `(\tag v1)` with \tag = a as one name, `av1`: the blank ends the control
        # word and is gone, so the author's later \draw (av1) finds the node (`_work/
        # space_after_macro_probe.log` compiles with no undefined reference to prove it)
        self.assertEqual(cetz._substitute_cs(r"(\tag v1) at", "tag", "a"), "(av1) at")
        # a digit is not a letter, so it is never part of the word either
        self.assertEqual(cetz._substitute_cs(r"(v\i2) then \i}", "i", "0"), "(v02) then 0}")
        # a longer name is not its prefix, and a closing brace keeps the space that follows it
        self.assertEqual(cetz._substitute_cs(r"(\tags v1)", "tag", "a"), r"(\tags v1)")
        self.assertEqual(cetz._substitute_cs(r"({\tag} v1)", "tag", "a"), "({a} v1)")
        unrolled = cetz.expand_foreach(
            r"\foreach \tag in {a,b}{ \node (\tag v1) at (0,0) {} } \draw (av1)--(bv1);")
        self.assertEqual(unrolled.count("(av1)"), 2)   # the loop defines it, the author's draw uses it
        self.assertEqual(unrolled.count("(bv1)"), 2)
        self.assertNotIn(r"	ag v1", unrolled)

    def test_a_symbol_path_stays_bare_while_the_same_word_as_prose_is_quoted(self):
        # 'arrow.l.curve' is a Typst symbol name; the 'curve' a `\mathrm{curve}` leaves behind is
        # a word, and Typst reads an unquoted one as a variable and fails the canvas.
        self.assertEqual(cetz._math_body(r"\curvearrowleft"), "arrow.l.curve")
        self.assertEqual(cetz._math_body(r"\mathrm{curve}"), '"curve"')
        # a symbol's own path still has to fuse with the script that follows it
        self.assertEqual(cetz._math_body(r"\Downarrow_x"), "arrow.b.double_x")

    def test_a_reference_inside_a_picture_is_answered_rather_than_printed_as_its_label(self):
        answers = {"sec:a": "Section 3", "eq:b": "(2.1)", "hyp:x": "#link(<hyp:x>)[here]"}
        pic = (r"\node at (0,0) {see \ref{sec:a} and $\alpha\eqref{eq:b}$ \ref{hyp:x}};")
        got = cetz.expand_refs(pic, lambda label: answers[label])
        # \text{} carries the number through the prose and the maths path alike
        self.assertIn(r"{see \text{Section 3} and $\alpha\text{(2.1)}$ ", got)
        # an answer that is Typst markup has nowhere to sit inside a node, so it stays as it was
        self.assertIn(r"\ref{hyp:x}};", got)


    def test_an_array_spec_that_carries_an_argument_still_becomes_a_tabular(self):
        # cc|r|rrrr@{\qquad}... is a preamble that sets the glue between two column groups. Read as
        # [^{}]* it is invisible to array_floats, so the float stays one inline formula and pandoc
        # throws its caption and label away with the envelope. Measured in _work/probe_array_spec.py:
        # once the rows are a tabular, pandoc keeps caption and label, the @-expression and the
        # vertical rules included, so the preamble travels over untouched.
        src = (r"\begin{table}[htbp]" "\n"
               r"\(" "\n" r"\begin{array}{cc|r@{\qquad}cc}" "\n" r" a&b\\ c&d" "\n"
               r"\end{array}" "\n" r"\)" "\n"
               r"\caption{Bounds.}" "\n" r"\label{finite:x}" "\n" r"\end{table}")
        got = prep.array_floats(src)
        self.assertIn(r"\begin{tabular}{cc|r@{\qquad}cc}", got)
        self.assertIn(r"\caption{Bounds.}", got)
        self.assertIn("$a$ & $b$", got)


    def test_a_caption_written_after_its_tabular_still_gets_a_float_of_its_own(self):
        # a stacked table float often captions its second tabular from behind:
        # \end{tabular} \caption{...} \label{...} \end{table}. _split_floats cuts the float at that
        # caption, so the new float carries words and no body, and pandoc reads a bodyless table
        # float as nothing: apptr:coupling-table on A-boundary-field-gap lost its caption and its
        # number that way, counted by _work/caption_page_report.py
        src = ("\\begin{table}[htbp]\n\\caption{First block.}\n\\label{tab:a}\n"
               "\\begin{tabular}{cc} a&b \\end{tabular}\n"
               "\\caption{All fifteen couplings here.}\n\\label{apptr:c}\n\\end{table}")
        got = prep.lift_captions(src)
        self.assertEqual(got.count("\\begin{table}"), 2)
        self.assertIn("\\caption{First block.}", got)
        trailing = [f for f in got.split("\n\n") if "All fifteen" in f]
        self.assertEqual(len(trailing), 1)
        self.assertIn("\\label{apptr:c}", trailing[0])
        self.assertIn("\\begin{tabular}{l}\\mbox{}\\end{tabular}", trailing[0])
        # the stand-in goes before the caption, which is where a trailing caption's material sits
        self.assertLess(trailing[0].index("\\mbox{}"), trailing[0].index("All fifteen"))




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

if __name__ == '__main__':
    unittest.main()
