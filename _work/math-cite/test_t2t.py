"""Regression checks for failures that previously corrupted whole papers."""
import json
import math
from pathlib import Path
import subprocess
import sys
import tempfile
import re
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parent))
from t2t.convert import collect_formulas, convert_paper
from t2t import cetz
from t2t import convert
from t2t import macros
from t2t import prep
from t2t.emit import _typst_str, names_counter
from t2t.mathconv import convert_formulas

# pic-shapes' self-loop control case: a `slot` circle on pgf's default rule, loop out=135/in=45/looseness=5
LOOP = (r"\begin{tikzpicture}[x=1cm,y=1cm,"
        r"slot/.style={circle,draw,minimum size=8mm,inner sep=2pt,font=\small}]"
        r"\node[slot] (six) at (0,0) {$6$};"
        r"\draw (six) to[out=135,in=45,looseness=5] (six);"
        r"\end{tikzpicture}")


class ConversionTests(unittest.TestCase):

    def _canvas_calls(self, canvas, kind):
        """The point lists of every `kind(...)` call the canvas emits, in drawing order."""
        pair = r"\((-?\d+(?:\.\d+)?(?:e-?\d+)?), (-?\d+(?:\.\d+)?(?:e-?\d+)?)\)"
        out = []
        for line in canvas.splitlines():
            m = re.match(r"\s*%s\(" % kind, line)
            if not m:
                continue
            head = line.split("stroke:")[0]
            out.append([(float(a), float(b)) for a, b in re.findall(pair, head)])
        return out

    def _bezier(self, canvas):
        for line in canvas.splitlines():
            if line.strip().startswith("bezier"):
                return [tuple(map(float, p)) for p in re.findall(r"\(([-\d.]+), ([-\d.]+)\)", line)]
        self.fail("no bezier emitted for the self-loop: %r" % canvas)

    def test_a_caption_chain_hands_pandoc_its_last_name_and_loses_the_rest(self):
        # _work/probe_label_chain_ast.py: pandoc's figure ident comes out as `packet:second-name` and
        # `fig:first-name` is nowhere in the AST, while pdflatex's aux numbers both from this caption
        body = ("\\begin{figure}[!b]\n\\centering\n\\mbox{}\n\\caption{Two names, one number.}\n"
                "\\label{fig:first-name}\n\\label{packet:second-name}\n\\end{figure}\n")
        self.assertEqual({"fig:first-name": "packet:second-name"}, prep.label_aliases(body))
        # one name under a caption is nothing to alias, and a float that keeps two captions of its own
        # is one figure to pandoc, whose number for the earlier names was never measured
        self.assertEqual({}, prep.label_aliases("\\begin{figure}\\caption{a}\\label{x}\\end{figure}"))
        self.assertEqual({}, prep.label_aliases("\\begin{figure}\\caption{a}\\label{x}\\label{y}"
                                                "\\caption{b}\\label{z}\\end{figure}"))

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

    # from _work/pic-3d/tests.py
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
    # from _work/pic-3d/tests.py
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
    # from _work/pic-3d/tests.py
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
    # from _work/pic-3d/tests.py
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
    # from _work/pic-3d/tests.py
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
    # from _work/pic-3d/tests.py
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
    # from _work/pic-3d/tests.py
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
    # from _work/pic-3d/tests.py
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
    # from _work/pic-scoped/tests.py
    def test_rotate_expression_angle_matches_pdflatex(self):
        # _work/pic-scoped/m_rotate_expr.tex, head x=1cm,y=1cm: the refused picture's scope
        # [shift={(45:1.65)},rotate={45/2+90}] puts local (.19,0) at 31.12762pt,38.19067pt and
        # (-.19,0) at 35.26498pt,28.20193pt; pgf points are pt of 1/72.27in -> cm.
        xf = cetz._transform({"shift": "{(45:1.65)}", "rotate": "{45/2+90}"})
        assert xf is not None
        pt = 2.54 / 72.27
        a = cetz._apply(xf, 0.19, 0)
        assert abs(a[0] - 31.12762 * pt) < 1e-4 and abs(a[1] - 38.19067 * pt) < 1e-4
        b = cetz._apply(xf, -0.19, 0)
        assert abs(b[0] - 35.26498 * pt) < 1e-4 and abs(b[1] - 28.20193 * pt) < 1e-4
    # from _work/pic-scoped/tests.py
    def test_rotate_expression_equals_literal_degrees(self):
        # same control: rotate={45/2+90} and rotate={112.5} printed identical coordinates,
        # and a bare rotate={20+30} turns (1,0) to 18.28918pt,21.79585pt
        assert cetz._transform({"rotate": "{45/2+90}"}) == cetz._transform({"rotate": "{112.5}"})
        xf = cetz._transform({"rotate": "{20+30}"})
        pt = 2.54 / 72.27
        a = cetz._apply(xf, 1, 0)
        assert abs(a[0] - 18.28918 * pt) < 1e-4 and abs(a[1] - 21.79585 * pt) < 1e-4
    # from _work/pic-scoped/tests.py
    def test_rotate_plain_and_deg_forms_still_read(self):
        # the reader kept every form the picture-free suites measured: bare, deg-suffixed, centred
        assert abs(cetz._transform({"rotate": "45"})[0] - math.cos(math.radians(45))) < 1e-9
        xf = cetz._transform({"rotate": "90deg"})
        a = cetz._apply(xf, 1, 0)
        assert abs(a[0]) < 1e-9 and abs(a[1] - 1.0) < 1e-9
        spec = cetz._rotate_spec("45:(1,2)")
        assert spec == (45.0, (1.0, 2.0))
        # measured: TeX errors on `rotate={45/2+90 deg}` -- an expression never carries a letter
        assert cetz._transform({"rotate": "{45/2+90 deg}"}) is None
    # from _work/pic-scoped/tests.py
    def test_named_shift_moves_origin_by_the_canvas_point_verbatim(self):
        # _work/pic-scoped/m_shift_name.tex, head x=2cm: shift={(A)} for A at user (1,0) --
        # page 56.9055pt = 2cm -- put the scope origin at 2cm, not at 4cm; a user-unit reading
        # would have doubled it.
        outer = (2.0, 0.0, 0.0, 2.0, 1.0, 0.0, 0.0, 1.0, -0.385, -0.385, 0.0, 0.0)
        xf = cetz._transform({"shift": "{(A)}"}, outer, {"A": (2.0, 0.0, 0.4, 0.3)})
        assert xf is not None
        assert abs(xf[10] - 2.0) < 1e-9 and abs(xf[11]) < 1e-9
        # the same scope with a plain pair stays in user units: shift={(1,0)} -> 2cm
        pair = cetz._transform({"shift": "{(1,0)}"}, outer)
        assert abs(pair[10] - 2.0) < 1e-9
    # from _work/pic-scoped/tests.py
    def test_named_shift_survives_an_enclosing_rotation(self):
        # same control: inside [rotate=90], shift={(A)} still lands at 56.9055pt,0pt (canvas
        # verbatim), while shift={(1,0)} lands at 0pt,56.9055pt (through the enclosing matrix);
        # the head is x=2cm, and TikZ rotate=90 sends (1,0) to (0,1)
        ca, sa = math.cos(math.radians(90)), math.sin(math.radians(90))
        outer = (ca, -sa, sa, ca, 2.0, 0.0, 0.0, 2.0, -0.385, -0.385, 0.0, 0.0)
        xf = cetz._transform({"shift": "{(A)}"}, outer, {"A": (2.0, 0.0, 0.4, 0.3)})
        assert abs(xf[10] - 2.0) < 1e-9 and abs(xf[11]) < 1e-9
        pair = cetz._transform({"shift": "{(1,0)}"}, outer)
        assert abs(pair[10]) < 1e-9 and abs(pair[11] - 2.0) < 1e-9
    # from _work/pic-scoped/tests.py
    def test_scope_shift_onto_earlier_named_node_places_the_body(self):
        # the Deligne-Drinfeld pattern: a sized vertex node, then scope [shift={(A)}];
        # measured NAMEDSHIFTB equals the node's own centre (56.9055pt,113.811pt under x=2cm),
        # and a local (0,.75) inside kept the outer units (LOCALPT 56.9055pt,42.67912pt)
        tikz = (r"\begin{tikzpicture}[x=1cm,y=1cm]"
                r"\node (A) at (-4.2,0) {};"
                r"\begin{scope}[shift={(A)}]\draw (0,.75) -- (.9,-.3);\end{scope}"
                r"\end{tikzpicture}")
        canvas = cetz.build(tikz)
        assert canvas is not None
        assert "line((-4.2, 0.75), (-3.3, -0.3)" in canvas
    # from _work/pic-pgfmath/tests.py
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
    # from _work/pic-pgfmath/tests.py
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
    # from _work/pic-pgfmath/tests.py
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
    # from _work/pic-pgfmath/tests.py
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
    # from _work/pic-pgfmath/tests.py
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
        self.assertEqual(canvas.count('fill: rgb("#ffc68c")'), 4)
        self.assertIn('rect((2.79, 0), (3.1, -0.31), fill: rgb("#ffc68c")', canvas)
        self.assertIn('rect((0, -2.79), (0.31, -3.1), fill: rgb("#ffc68c")', canvas)
        self.assertIn('rect((0, 0), (0.31, -0.31), fill: rgb("#d9d9ff")', canvas)
    # from _work/pic-pgfmath/tests.py
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
    # from _work/pic-pgfmath/tests.py
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
    # from _work/pic-pgfmath/tests.py
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
            want = "rect((%g, %g), (%g, %g), fill: rgb(\"#ffc68c\")" % tuple(corners)
            self.assertIn(want, canvas, "cell " + cell)
    # from _work/pic-pgfmath/tests.py
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
    # from _work/pic-pgfmath/tests.py
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
    # from _work/pic-plot/tests.py
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
    # from _work/pic-plot/tests.py
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
    # from _work/pic-plot/tests.py
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
    # from _work/pic-plot/tests.py
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
    # from _work/pic-plot/tests.py
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
    # from _work/pic-plot/tests.py
    def test_plot_smooth_cycle_still_refuses(self):
        # verify_cycle.pdf: `smooth cycle` closes over four knots with 4 pieces whose end knots *do*
        # carry a support -- a different measured law, so it stays quoted rather than drawn as this one
        self.assertIsNone(cetz.plot_points(" plot[smooth cycle] coordinates {(0,0) (1,1) (2,0) (1,-1)};",
                                           0, {}, cetz.IDENT, {}))
        # the other handlers that are not this one
        for option in ("only marks", "mark=*,", "mesh", "each"):
            self.assertIsNone(cetz.plot_points(" plot[%s] coordinates {(0,0) (1,1) (2,0)};" % option,
                                               0, {}, cetz.IDENT, {}))
    # from _work/pic-plot/tests.py
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
    # from _work/pic-plot/tests.py
    def test_pgfmath_tanh_is_texs_hyperbolic_function(self):
        # m_tanh.tex: `\pgfmathparse{tanh(-2.97)}` writes -0.99475 and `tanh(1)` writes 0.7615 -- pgf
        # keeps five digits, so a difference of 1e-5 is the print, not the function. `tan` reads its
        # argument as an angle (TeX: -0.05186), which is why `tanh` needs its own entry.
        self.assertAlmostEqual(-0.99475, cetz.expr("tanh(-2.97)"), delta=1e-4)
        self.assertAlmostEqual(0.7615, cetz.expr("tanh(1)"), delta=1e-4)
        self.assertAlmostEqual(-0.05186, cetz.expr("tan(-2.97)"), delta=1e-4)
        # the refused paper's own sample, read the way plot_points reads it
        self.assertAlmostEqual(-0.22878, cetz.expr("0.23*tanh(1.35*-2.2)"), delta=1e-4)
    # from _work/pic-plot/tests.py
    def test_plot_smooth_chain_is_emitted_as_curve_segments(self):
        # the refused paper's requirement: a `plot[smooth]` reaches the page as cubic pieces, never as a
        # polyline through its knots -- at_a.pdf draws 6 cubics for the 7 written points
        canvas = cetz.build(
            "\\begin{tikzpicture}[x=0.8cm,y=0.8cm]\\draw[teal] plot[smooth] coordinates "
            "{(0,0.8) (1,1.15) (2,0.9) (3,1.35) (4,1.0) (5,1.2) (6,0.9)};\\end{tikzpicture}")
        self.assertEqual(6, len(self._canvas_calls(canvas, "bezier")))
        self.assertFalse(self._canvas_calls(canvas, "line"))
    # from _work/pic-shapes/tests.py
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
    # from _work/pic-shapes/tests.py
    def test_default_outer_sep_is_half_the_pgf_rule_width(self):
        # measure_outer_sep.py: an 8mm circle (half-size 0.4000cm) sits its loop anchors at radius
        # 0.4070cm on pgf's 0.4pt rule -> the rule contributes 0.0070cm = 0.4pt / 2, drawn or not.
        self.assertAlmostEqual(cetz._outer_sep({}, cetz.IDENT), 0.4 * cetz.UNITS["pt"] / 2.0, places=6)
        self.assertAlmostEqual(cetz._outer_sep({"circle": True, "draw": True}, cetz.IDENT),
                              0.4 * cetz.UNITS["pt"] / 2.0, places=6)
    # from _work/pic-shapes/tests.py
    def test_a_written_outer_sep_or_line_width_replaces_the_default_rule(self):
        # measure_outer_sep.py: outer sep=0pt -> R 0.4000 (no rule), outer sep=1mm -> R 0.5000,
        # line width=2pt -> R 0.4351 (2pt/2 = 0.0351 over the 0.4000 half-size).
        self.assertAlmostEqual(cetz._outer_sep({"outer sep": "0pt"}, cetz.IDENT), 0.0, places=6)
        self.assertAlmostEqual(cetz._outer_sep({"outer sep": "1mm"}, cetz.IDENT), 0.1, places=6)
        self.assertAlmostEqual(cetz._outer_sep({"line width": "2pt"}, cetz.IDENT), 0.0351, places=2)
    # from _work/pic-shapes/tests.py
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
    # from _work/pic-shapes/tests.py
    def test_unwritten_out_and_in_stand_for_their_own_measured_directions(self):
        # measure_fallback_anchor.py: `out only` (no in) arrives along 135 deg, `in only` (no out)
        # leaves along 45 deg -- a missing key answers with its own direction, not the other key's.
        self.assertEqual(cetz._tangent_dirs((None, 135)), (45.0, 135))
        self.assertEqual(cetz._tangent_dirs((135, None)), (135, 135.0))
    # from _work/pic-shapes/tests.py
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
    # from _work/pic-shapes/tests.py
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
    # from _work/pic-authmacros/tests.py
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
    # from _work/pic-authmacros/tests.py
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
    # from _work/pic-authmacros/tests.py
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
    # from _work/pic-authmacros/tests.py
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
    # from _work/pic-authmacros/tests.py
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
