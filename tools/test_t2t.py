"""Regression checks for failures that previously corrupted whole papers."""
import json
import math
import types
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
from t2t.mathconv import clean, convert_formulas

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

    def test_a_label_inside_a_float_names_that_float_however_far_its_caption_sits(self):
        # _work/probe_ltbl_aux.py: a longtable whose caption carries one \label and whose rows carry
        # \phantomsection\label of their own. pdflatex's aux answers 4 for all seven names -- the only
        # counter a float steps is its caption's -- while pandoc hands the float the last \label of the
        # whole region and drops the rest, so the caption's own name is the one that goes missing
        body = ("\\begin{longtable}{lr}\n"
                "\\caption{Bounds.}\\label{tab:bounds}\\\\\n"
                "one & \\phantomsection\\label{row:one} 1\\\\\n"
                "two & \\phantomsection\\label{row:two} 2\\\\\n"
                "\\end{longtable}\n")
        self.assertEqual({"tab:bounds": "row:two", "row:one": "row:two"},
                         prep.label_aliases(body))

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

    def test_deprecated_symbol_names_come_out_of_pandoc_renamed(self):
        # pandoc's writer still spells four symbols the way Typst 0.13 did, so every page carrying a
        # normal-subgroup sign or a `\models` compiled with a deprecation warning on it. The
        # replacements print the same glyph -- U+22B2, U+22B4, U+22B3, U+22B5, U+22A8 read back off the
        # page with fitz (_work/measure_symbol_glyphs.py) -- and Typst's hint only names the base
        # symbol, so the decorated spellings have to be renamed as themselves or ⊴ becomes ⊲. A
        # subscript ends the name (`lt.tri.eq_o`), so it must not be read as part of one.
        converted, refused, _ = convert_formulas(
            [r'G \triangleleft K', r'A \trianglelefteq B', r'A \trianglerighteq B', r'\models',
             r'N \trianglelefteq_o \Gamma'])
        self.assertEqual(set(converted), {0, 1, 2, 3, 4}, str(refused))
        joined = " ".join(converted.values())
        for piece in ("lt.closed", "lt.closed.eq", "gt.closed.eq", "tack.rr", "lt.closed.eq_o"):
            self.assertIn(piece, joined, joined)
        for old in ("lt.tri", "gt.tri", "tack.r.double"):
            self.assertNotIn(old, joined, joined)
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder, 'syms.typ')
            path.write_text("#set page(width: 200pt, height: auto)\n"
                            + "\n".join("$%s$" % v for v in converted.values()), encoding='utf-8')
            proc = subprocess.run(['typst', 'compile', str(path)], capture_output=True)
            self.assertEqual(proc.returncode, 0, proc.stderr.decode('utf-8'))
            self.assertNotIn(b"deprecated", proc.stderr)

    def test_tex_negative_thinspace_is_priced_as_a_mu_not_an_em(self):
        # pandoc's Typst writer prices TeX's `\!` (which is -3mu) at a whole em: `_work/
        # probe83_space_values.py` measured `A\!B` at 11pt as -1.822pt with pdflatex, -1.834pt with
        # `#h(-0.16667em)` and -11.0pt with `#h(-1em)` -- B's ink landing on top of A's. `\,` and `\:`
        # already come out right (thin 1.833, med 2.444), so they must stay as the writer spells them.
        # `#h(-1em)` has no other producer to catch: a `\hspace{12mm}` carries its length across
        # pandoc in its own token and comes back as `#h(12mm)`, never as a bare em.
        converted, refused, _ = convert_formulas([r"\int f(x)\!dx", r"A\,B", r"A\:B"])
        self.assertEqual(set(converted), {0, 1, 2}, str(refused))
        joined = " ".join(converted.values())
        self.assertIn("#h(-0.16667em)", joined, joined)
        self.assertNotIn("#h(-1em)", joined, joined)
        for spelling in ("thin", "med"):
            self.assertIn(spelling, joined, joined)
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder, 'space.typ')
            path.write_text("#set page(width: 200pt, height: auto)\n"
                            + "\n".join("$%s$" % v for v in converted.values()), encoding='utf-8')
            proc = subprocess.run(['typst', 'compile', str(path)], capture_output=True)
            self.assertEqual(proc.returncode, 0, proc.stderr.decode('utf-8'))

    def test_a_hspace_length_survives_pandoc_as_a_typst_length(self):
        # pandoc's Typst writer answers `#h(0em)` for every `\hspace`, whatever the argument, so the
        # length used to be dropped: clean() rewrote each one to `\,` (1.67pt at 10pt) while
        # `\hspace{12mm}` is 34pt on the page. The length is now read in clean() and carried across
        # pandoc in a `\text{}` token, then put back as a Typst length. Measured over the corpus
        # (`_work/probe87c_hspace_units.py`): 310 in-maths `\hspace{}` over 190 papers, units
        # mm 228 / cm 42 / em 35 / pt 5, every one a plain number+unit.
        converted, refused, _ = convert_formulas(
            [r"A\hspace{12mm}B", r"A\hspace{2em}B", r"A\hspace{12pt}B",
             r"A\hspace{\fill}B", r"A\hfill B", r"A\;B", r"a\text{x\hspace{2mm}y}b"])
        self.assertEqual(set(converted), {0, 1, 2, 3, 4, 5, 6}, str(refused))
        self.assertIn("#h(12mm)", converted[0], converted[0])
        self.assertIn("#h(2em)", converted[1], converted[1])
        # TeX's pt is 1/72.27in against Typst's 1/72in, so the argument is scaled
        self.assertIn("#h(11.9552pt)", converted[2], converted[2])
        # an elastic `\hfill` carries no length to read: it keeps the old bounded `\,`
        self.assertIn("thin", converted[3], converted[3])
        self.assertIn("thin", converted[4], converted[4])
        # `\;` (5mu) shares one token with `\enspace`, and is read at its own price
        self.assertIn("#h(0.27778em)", converted[5], converted[5])
        # a `\hspace` inside `\text{}` is flattened into that run, so the token must still be
        # found wherever it sits rather than leaking the sentinel onto the page
        self.assertIn("#h(2mm)", converted[6], converted[6])
        self.assertNotIn("ZQHSP", " ".join(converted.values()))
        self.assertNotIn("#h(0em)", " ".join(converted.values()))
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder, 'hspace.typ')
            path.write_text("#set page(width: 200pt, height: auto)\n"
                            + "\n".join("$%s$" % v for v in converted.values()), encoding='utf-8')
            proc = subprocess.run(['typst', 'compile', str(path)], capture_output=True)
            self.assertEqual(proc.returncode, 0, proc.stderr.decode('utf-8'))

    def test_a_matrix_behind_a_sized_delimiter_still_reaches_typst_as_a_matrix(self):
        # pandoc reads a matrix only when it can see the delimiters, and `\bigl(` is a size, not a
        # delimiter: the smallmatrix came out as loose `&`/`\` text, which is inert inside a cases
        # branch -- the page printed `(10u_01)` for a 2x2 matrix and Typst warned about the row
        # break. `\left…\right` is the spelling pandoc turns into `mat(`.
        self.assertEqual(
            prep.grow_matrix_delims(r'\bigl(\begin{smallmatrix}1&0\\u&1\end{smallmatrix}\bigr)'),
            r'\left(\begin{smallmatrix}1&0\\u&1\end{smallmatrix}\right)')
        # an array keeps its column preamble, and the delimiter it was written with
        self.assertEqual(
            prep.grow_matrix_delims(r'\Bigl[\begin{array}{rc}a&b\\c&d\end{array}\Bigr]'),
            r'\left[\begin{array}{rc}a&b\\c&d\end{array}\right]')
        # a matrix that already carries its delimiters is none of this rule's business
        for untouched in (r'\bigl(\begin{pmatrix}a&b\\c&d\end{pmatrix}\bigr)',
                          r'\left(\begin{matrix}a&b\\c&d\end{matrix}\right)',
                          r'\bigl( x \bigr)'):
            self.assertEqual(prep.grow_matrix_delims(untouched), untouched, untouched)

        tex = r'''\documentclass{article}
\usepackage{amsmath}
\begin{document}
\[
 H=\begin{cases}
  I,&3\mid c,\\
  \bigl(\begin{smallmatrix}1&0\\u_0&1\end{smallmatrix}\bigr),&v(c)=1.
 \end{cases}
\]
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'nest.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'nested')
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertIn('mat(delim: "(", 1, 0; u_0, 1)', result)
            self.assertEqual(report['compile_warnings'], 0, result)
            self.assertTrue(report['compile_ok'], report['compile_err_full'])

    def test_a_figure_vdash_keeps_both_its_bars(self):
        # `\Vdash` is U+22A9 in pdflatex and `forces` in Typst, while `\vDash` is U+22A8 and `tack.rr`:
        # the old entry sent `\Vdash` to the one-barred tack, and to a deprecated spelling of it
        # (_work/measure_vdash.py).
        self.assertIn("forces", cetz.build(r"\begin{tikzpicture}\node {$p \Vdash q$};"
                                           r"\end{tikzpicture}"))

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
        # every line says what its pen weighs: pgf's own 0.4pt, which Typst's 1pt default is not
        self.assertIn('line((1, 0.2), (1, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10))', shifted)
        self.assertIn('line((0.3, 1), (2.3, 1), stroke: (thickness: 0.4pt, miter-limit: 10))', shifted)
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

    def test_an_anchor_beside_a_labelled_heading_leaves_the_heading_its_name(self):
        # \hypertarget straight under a \section\label: a bare `#label` binds to the PRECEDING
        # content, so Typst saw two labels on one heading, warned "content labelled multiple
        # times", kept the anchor and threw the section's own name away -- every \pageref to the
        # section then dangled. The anchor now stands on a metadata element of its own.
        tex = r'''\documentclass{article}
\usepackage{hyperref}
\begin{document}
\noindent\hyperlink{sec:app}{appendix}\nobreak\hfill\pageref*{sec:app}\par
\noindent\hyperlink{scale-law-interface}{interface}\par
\section{Appendix: Companion interfaces}\label{sec:app}
\hypertarget{scale-law-interface}{}
Body text.
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'app.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'appendix')
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertIn('#metadata(none)\n#label("scale-law-interface")', result)
            self.assertEqual(report['compile_warnings'], 0, result)
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            self.assertEqual((report['stats'] or {}).get('dangling_ref', 0), 0)
            # both names are read off the page -- `counter(page).at(<sec:app>)` is a hard compile
            # error if the heading lost its label, which is exactly what used to happen
            self.assertIn('#link(<scale-law-interface>)[interface]', result)
            self.assertIn('counter(page).at(<sec:app>)', result)


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

    def test_a_minipage_that_names_its_float_type_becomes_that_float(self):
        # a figure set in a minipage: \def\@captype makes the \caption a figure's, but pandoc
        # sees only a minipage, so lift_captions used to pull the caption out and leave the
        # drawing behind -- measured on the IID-threshold paper, whose caption floated a page
        # away from its picture. The outer minipage becomes the float; inner ones stay put.
        body = ("\\noindent\\begin{minipage}{\\linewidth}\n"
                "\\makeatletter\\def\\@captype{figure}\\makeatother\n"
                "\\begin{tikzpicture}\\draw (0,0)--(1,1);\\end{tikzpicture}\n"
                "\\caption{The two averages.}\\label{fig:averages}\n"
                "\\end{minipage}\n")
        promoted = prep.promote_minipage_floats(body)
        self.assertIn("\\begin{figure}", promoted)
        self.assertIn("\\end{figure}", promoted)
        self.assertNotIn("minipage", promoted)
        # the caption is now a figure's own, so it is left in place
        self.assertEqual(prep.lift_captions(promoted), promoted)

        # an inner minipage is the float's own layout and must survive
        nested = ("\\begin{minipage}{\\textwidth}\\def\\@captype{figure}\n"
                  "\\begin{minipage}[t]{0.5\\textwidth}\\mbox{left}\\end{minipage}\n"
                  "\\begin{minipage}[t]{0.5\\textwidth}\\mbox{right}\\end{minipage}\n"
                  "\\caption{Two panels.}\n\\end{minipage}\n")
        out = prep.promote_minipage_floats(nested)
        self.assertEqual(out.count("\\begin{minipage}"), 2)
        self.assertEqual(out.count("\\end{minipage}"), 2)
        self.assertEqual(out.count("\\begin{figure}"), 1)

        # a minipage with no \@captype is not a float and is left alone
        plain = "\\begin{minipage}{.5\\linewidth}Just a column.\\end{minipage}"
        self.assertEqual(prep.promote_minipage_floats(plain), plain)

    def test_a_picture_written_tight_after_a_control_word_still_reaches_the_page(self):
        # convert lifts each picture out of the body as the token ZQT2TTIKZ<i> and puts the
        # drawing back when the token is found in the parsed text. `\centering\begin{tikzpicture}`
        # writes the token with no space after a control word, and TeX -- pandoc included -- reads
        # `\centeringZQT2TTIKZ1` as one command name: the token is never there to find, and the
        # figure keeps its caption over a printed `2TTIKZ1`. Three of the four pictures in the
        # Cylinder-amplitudes paper went that way.
        tex = r'''\documentclass{article}
\usepackage{tikz}
\title{Tight paper}
\begin{document}
\section{One}
\begin{figure}[htbp]
\centering\begin{tikzpicture}
\draw[->] (0,0) -- (2,0);
\end{tikzpicture}
\caption{An arrow, written tight.}
\end{figure}
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'tight')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertIn('#cetz.canvas(', result)
            self.assertNotIn('TTIKZ', result)
            self.assertIn('mark: (end: ">"', result)
            self.assertIn('An arrow, written tight', result)

    def test_a_picture_in_a_subfigure_is_sized_to_the_subfigure_column(self):
        # TeX redefines \linewidth inside a minipage, while cetz resolves a picture's \linewidth
        # into centimetres of the *page* column: a drawing sized for a 0.48\linewidth panel came
        # out twice as large as the paper ships it and pushed its float past the page bottom.
        pic = ("\\begin{minipage}[t]{0.48\\linewidth}\n"
               "\\begin{tikzpicture}[x=0.205\\linewidth,y=0.205\\linewidth]\n"
               "\\node[text width=0.5\\linewidth] at (0,0) {a};\n"
               "\\end{tikzpicture}\n\\end{minipage}\n")
        out = prep.scale_linewidth_in_minipages(pic)
        self.assertIn("x=0.0984\\linewidth", out)
        self.assertIn("text width=0.2400\\linewidth", out)
        # a picture outside any minipage keeps its share, and a minipage does not redefine
        # \textwidth, so that macro stays the page's own
        outside = "\\begin{tikzpicture}[x=0.3\\linewidth]\\draw (0,0);\\end{tikzpicture}"
        self.assertEqual(prep.scale_linewidth_in_minipages(outside), outside)
        wide = ("\\begin{minipage}{0.5\\textwidth}\\begin{tikzpicture}[x=\\textwidth]"
                "\\end{tikzpicture}\\end{minipage}")
        self.assertEqual(prep.scale_linewidth_in_minipages(wide), wide)

    def test_an_fbox_keeps_what_it_encloses(self):
        # pandoc has no \fbox and drops the command with its argument: `Text before \fbox{hello}
        # after.` answers `Text before after.`, and a cell written \fbox{\begin{tabular}...} loses
        # the whole table. Removing the wrapper keeps the words; \fboxsep is another command.
        self.assertEqual(prep.unwrap_fbox("Text before \\fbox{hello world} after."),
                         "Text before {hello world} after.")
        cell = "&\\fbox{\\begin{tabular}{@{}c@{}}$T_1$\\\\own\\end{tabular}}&"
        self.assertEqual(prep.unwrap_fbox(cell),
                         "&{\\begin{tabular}{@{}c@{}}$T_1$\\\\own\\end{tabular}}&")
        self.assertEqual(prep.unwrap_fbox("\\setlength{\\fboxsep}{8pt}"),
                         "\\setlength{\\fboxsep}{8pt}")

    def test_a_boxed_minipage_travels_as_a_parbox(self):
        # pandoc abandons a tabular whose cell holds `\fbox{\begin{minipage}{W}…}`: the float reaches
        # the page as the array preamble and the `&` separators printed as words, and keeping the
        # `\fbox` is worse -- a table with every cell emptied. `\parbox{W}{…}` is the one spelling
        # that gives both the table and its five cells (_work/probe_tabular_env_out.py).
        cell = (r"\begin{tabular}{cc}\fbox{\begin{minipage}[c]{0.36\linewidth}"
                r"Ordinary rarity\end{minipage}} & B \end{tabular}")
        got = prep.unwrap_fbox(cell)
        self.assertIn(r"\parbox{0.36\linewidth}{Ordinary rarity}", got)
        self.assertNotIn(r"\fbox", got)
        self.assertNotIn(r"\begin{minipage}", got)

    def test_a_stacked_cell_keeps_every_line(self):
        # pandoc's LaTeX reader knows neither `\shortstack` nor `\makecell` and drops the command
        # together with its braced argument: the words below the row separator simply do not reach
        # the page (34 uses over 11 flat sources, `_work/probe_multiline_cell_spellings.py`). One
        # cell whose lines break with `\newline` is the spelling that keeps both the table and the
        # text -- and it keeps the math too.
        got = prep.unstack_cells("&\\shortstack{terminal gap\\\\on good paths}&")
        self.assertEqual(got, "&terminal gap\\newline on good paths&")
        opt = prep.unstack_cells("\\makecell*[t]{one \\\\[2pt]two $x_i$}")
        self.assertEqual(opt, "one \\newline two $x_i$")
        self.assertEqual(prep.unstack_cells("\\shortstack{alone}"), "alone")

        tex = r'''\documentclass{article}
\begin{document}
\begin{tabular}{cc} \shortstack{terminal gap\\on good paths} & beta \\
gamma & \makecell{down\\arrow $x_i$} \end{tabular}
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'stacked')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            result = (out / 'main.typ').read_text(encoding='utf-8')
        for word in ('terminal', 'paths', 'arrow'):
            self.assertIn(word, result)
        self.assertNotIn('shortstack', result)
        self.assertNotIn('makecell', result)

    def test_a_table_reaches_the_page_as_a_typst_call(self):
        # a page body is markup, so `table(` there is the word `table` followed by text: 137 top-level
        # grid lines in 83 papers, plus 20 inside a figure's content block, printed `columns: 2,
        # table.cell(...)` as words (_work/probe_table_code_on_page.py). Every grid now carries the
        # `#` that makes it a call, and a captioned one is passed as content so the `#` stays legal.
        tex = r'''\documentclass{article}
\begin{document}
\section{Tables}
\begin{tabular}{cc} alpha & beta \\ gamma & delta \end{tabular}
\begin{table}[htbp]\caption{Counts.}\label{tab:counts}
\begin{tabular}{cc} one & two \\ three & four \end{tabular}
\end{table}
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'tablecall')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            result = (out / 'main.typ').read_text(encoding='utf-8')
        self.assertEqual(2, result.count("#table("), result)
        self.assertNotIn("\ntable(", result)
        self.assertNotIn("[table(", result)
        self.assertIn("alpha", result)

    def test_a_table_cell_is_not_justified(self):
        # the preamble justifies the body, and a narrow column then pulls its word spaces out to the
        # column width: the spectral-gap paper's figure 1 printed `Weighted-mean estimate` with an
        # 18.3 pt space where that page's prose uses 2.8 (_work/probe_gap_fig1_words.py). Each grid
        # travels in a block that turns justification off, and the rule stops at that block.
        tex = r'''\documentclass{article}
\begin{document}
\begin{tabular}{cc} Weighted-mean estimate long enough to wrap & beta \end{tabular}
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'justify')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            result = (out / 'main.typ').read_text(encoding='utf-8')
        self.assertIn("#set par(justify: false)", result)
        self.assertEqual(1, result.count("#set par(justify: false)"), result)

    def test_a_column_keeps_the_alignment_its_spec_wrote(self):
        # `emit.tabular()` used to read only `len(cols)` out of pandoc's column specs, and Typst's
        # table aligns every column left, so a `{cc}` table arrived as a left-aligned one
        # (_work/probe_pandoc_colspec.py: the specs come back as AlignLeft/Center/Right, and a
        # `\multicolumn{2}{c}{…}` names AlignCenter on the cell itself).
        tex = r'''\documentclass{article}
\begin{document}
\begin{tabular}{lcr} a & b & c \\ \multicolumn{2}{c}{wide} & r \end{tabular}
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'paper.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'align')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            result = (out / 'main.typ').read_text(encoding='utf-8')
        self.assertIn("align: (left, center, right,)", result)
        self.assertIn("colspan: 2, align: center)", result)

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
        self.assertIn("line((0, 0), (0.866, 0.5), stroke: (thickness: 0.4pt, miter-limit: 10))", basis)

        # a node's own `rotate=` is CeTz's `content(..., angle:)`: the runtime turns the node about its
        # own box and leaves the placement alone.  Wrapping the body in Typst's `rotate()` instead would
        # keep the layout box unturned, so the words would swing out of the box the anchors name
        # (`_work/probe101d_rot_typst.py` -- `#page_rotate(-90deg)[uncapped band]` still measures
        # 62.11 x 11.40pt on the page while its ink is 11.40 x 62.11)
        node = cetz.convert(r"\begin{tikzpicture}\node[rotate=90] at (2,1) {t};\end{tikzpicture}")
        self.assertIsNotNone(node)
        self.assertIn("content((2, 1), [t], angle: 90deg)", node)
        self.assertNotIn("page_rotate", node)
        inpath = cetz.build(r"\begin{tikzpicture}\draw (0,0) node[rotate=90] {t};"
                            r"\end{tikzpicture}")
        self.assertIn("content((0, 0), [t], angle: 90deg)", inpath)

        # pgf turns the node and puts the TURNED anchor on the point, so an `anchor=` beside a `rotate=`
        # is not the sum of its halves: `anchor=east,rotate=90` hangs the label a half-box BELOW the
        # point and `anchor=south` a half-height WEST of it (`_work/probe100h_rot_anchors.py`), the
        # vector is read on the box WITH `inner sep` entering whole -- pgf's default `.3333em` leaves
        # the ink 3.28pt off the point (`_work/probe101a_rot_variants.py`) -- and CeTz does all of that
        # itself from Typst's measured box: its anchors are `centre + R(angle) * (±w, ±h)`
        # (cetz-0.5.0/src/draw/shapes.typ:1180), which lands the anchored edge within 0.20pt of
        # pdflatex on twelve forms at 34, 45, 63 and 90 degrees, with `inner sep` 0 and 3pt and with
        # `font=\footnotesize` (`_work/label101i_cetz_angle.txt`, against
        # `_work/label101b_pgf_nodes.txt` for the corpus's own ten labels)
        turned = cetz.build(r"\begin{tikzpicture}\node[anchor=east,rotate=90] at (-0.93,2.45)"
                            r" {uncapped band};\end{tikzpicture}")
        self.assertIn('content((-0.93, 2.45), [uncapped band], anchor: "east", angle: 90deg,'
                      ' padding: 0.1176cm)', turned)
        south = cetz.build(r"\begin{tikzpicture}\node[rotate=90,anchor=south] at (0,0)"
                           r" {uncapped band};\end{tikzpicture}")
        self.assertIn('content((0, 0), [uncapped band], anchor: "south", angle: 90deg', south)
        # a bare side word IS an anchor (`above` alone names the south point and shifts nothing), and a
        # `rotate=` on the scope turns that anchor the same way the node's own does
        scope = cetz.build(r"\begin{tikzpicture}[rotate=90]\node[anchor=east] at (0,0) {t};"
                           r"\end{tikzpicture}")
        self.assertIn('content((0, 0), [t], anchor: "east", angle: 90deg, padding: 0.1176cm)', scope)
        self.assertIn('content((0, 0), [t], anchor: "south", angle: 90deg, padding: 0.1176cm)',
                      cetz.build(r"\begin{tikzpicture}\node[above,rotate=90] at (0,0) {t};"
                                 r"\end{tikzpicture}"))
        # the node's own `inner sep` rides on the same padding, whole on both axes
        sep = cetz.build(r"\begin{tikzpicture}\node[inner sep=3pt,rotate=90,anchor=south] at (0,0) {t};"
                         r"\end{tikzpicture}")
        self.assertIn('content((0, 0), [t], anchor: "south", angle: 90deg, padding: 0.1058cm)', sep)

        # an arc is read inside the turned frame, so its sweep moves with the plane
        arc = cetz.build(r"\begin{tikzpicture}[rotate=45]\draw (0,0) arc (0:90:2);"
                         r"\end{tikzpicture}")
        self.assertIn("start: 45deg, stop: 135deg", arc)

        # a lattice is laid out in the scope's own units and then turned, not refused for being
        # tilted; unturned it still lands on the same integers it always did
        turned = cetz.build(r"\begin{tikzpicture}[rotate=90]\draw (-1,-1) grid (1,1);"
                            r"\end{tikzpicture}")
        self.assertIn("line((1, -1), (-1, -1)", turned)
        flat = cetz.build(r"\begin{tikzpicture}\draw (0,0) grid (2,2);\end{tikzpicture}")
        self.assertIn("line((1, 0), (1, 2)", flat)

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
        self.assertIn("content((1, 0), [t], angle: 90deg)", tilted)

        # a length we cannot read moves nothing, so the node is refused rather than drawn wrong
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\node[xshift=1foo] at (0,0) {t};"
                                     r"\end{tikzpicture}"))

    def test_a_scope_shift_goes_through_the_matrix_in_force_at_it(self):
        # the same length written on a `scope` belongs to the coordinate system, not to the page.
        # Measured with pdflatex against a reference rect outside the scope
        # (_work/probe81e_scale_shift.py, _work/probe81k_list_order.py): the picture's `scale=1.45`
        # stretches a scope's +-1.7cm apart to +-2.456cm, its `rotate=90` turns the shift onto the
        # other axis, and its axis vectors leave it alone -- 1.7cm is a length, not a count of units.
        self.assertIn("content((-2.465, 0), [t])",
                      cetz.build(r"\begin{tikzpicture}[scale=1.45]\begin{scope}[xshift=-1.7cm]"
                                 r"\node at (0,0) {t};\end{scope}\end{tikzpicture}"))
        self.assertIn("content((6.123e-17, 1), [t], angle: 90deg)",
                      cetz.build(r"\begin{tikzpicture}[rotate=90]\begin{scope}[xshift=1cm]"
                                 r"\node at (0,0) {t};\end{scope}\end{tikzpicture}"))
        self.assertIn("content((1, 0), [t])",
                      cetz.build(r"\begin{tikzpicture}[x=2cm,y=2cm]\begin{scope}[xshift=1cm]"
                                 r"\node at (0,0) {t};\end{scope}\end{tikzpicture}"))

        # options apply in the order they are written, so a shift before this list's own `scale=`
        # stays 1.7cm where one after it reads 3.4cm; pdflatex gives the two edges at +-1.694 and
        # +-3.387cm. The corpus writes the shift first in all 13 such lists (_work/probe81j_head_face)
        self.assertIn("content((1.7, 0), [t])",
                      cetz.build(r"\begin{tikzpicture}\begin{scope}[xshift=1.7cm,scale=2]"
                                 r"\node at (0,0) {t};\end{scope}\end{tikzpicture}"))
        self.assertIn("content((3.4, 0), [t])",
                      cetz.build(r"\begin{tikzpicture}\begin{scope}[scale=2,xshift=1.7cm]"
                                 r"\node at (0,0) {t};\end{scope}\end{tikzpicture}"))

    def test_a_coordinate_offset_moves_the_named_point_under_it(self):
        # ([yshift=1cm]a) is a placement the author wrote onto a name. The reader kept the field
        # indices of the four-field transform it replaced, so it added the basis vectors instead
        # of the offset and refused every picture that used one -- 18 over 20 papers
        self.assertIn("line((0, 0), (0, 1), stroke: (thickness: 0.4pt, miter-limit: 10))",
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
        # `\fill` turns on the fill mode and nothing else: the rectangle is a field with no border,
        # and saying `stroke: none` is the only way CeTz does not draw its own 1pt rule around it
        self.assertIn('rect((0, 0), (4.2, 1.3), fill: rgb("#e0e0ee"), stroke: none)', body)
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
        self.assertIn("bezier((0, 0), (3, 0), (1, 1), (2, 1)",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) .. controls +(1,1) and +(-1,1) .."
                                 r" (3,0);\end{tikzpicture}"))
        # one of each: the relative entry resolves off the start, the written point is taken as it is
        self.assertIn("bezier((0, 0), (3, 0), (0, 1.15), (2, 1)",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) .. controls +(0,1.15) and (2,1) .."
                                 r" (3,0);\end{tikzpicture}"))
        # the form that already drew is untouched by the change
        self.assertIn("bezier((0, 0), (3, 0), (1, 1), (2, 1)",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) .. controls (1,1) and (2,1) .."
                                 r" (3,0);\end{tikzpicture}"))
        # a unit-less offset follows the axes: +1 is 1cm across and 2cm up, and its pair is not
        self.assertIn("bezier((0, 0), (3, 0), (1, 2), (2, 2)",
                      cetz.build(r"\begin{tikzpicture}[x=1cm,y=2cm]\draw (0,0) .. controls +(1,1)"
                                 r" and +(-1,1) .. (3,0);\end{tikzpicture}"))

    def test_a_node_written_on_a_segment_sits_on_that_segment(self):
        pic = (r"\begin{tikzpicture}\draw (0,0) -- node[above] {mid} (4,0)"
               r" -- node[pos=.25] {quarter} (4,3);\end{tikzpicture}")
        body = cetz.build(pic)
        # TikZ puts an unlabelled in-path node midway along the segment it interrupts, and a
        # node with no segment after it hangs off the last point drawn; 'above' is the side of
        # that point the box stands on, so it reaches CeTz as the box's south anchor
        self.assertIn('content((2, 0), [mid], anchor: "south", padding: 0.1176cm)', body)
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
        # the arrow leaves through the label's own rows, not through the point they hang on
        # (test_an_arrow_into_a_node_the_author_never_sized_stops_at_its_words prices them)
        self.assertIn("line((1, 0.2007), (1, 1)", body)
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
        self.assertIn("bezier((0, 0), (2, 0), (4.776e-17, 0.78), (1.22, 9.552e-17)",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) to[out=90,in=180] (2,0);"
                                 r"\end{tikzpicture}"))
        self.assertIn("bezier((0, 0), (2, 0), (0.6755, 0.39), (1.448, 0.5515)",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) to[out=30] (2,0);"
                                 r"\end{tikzpicture}"))
        # a connector with no tangent at all is still the straight line it always was
        self.assertIn("line((0, 0), (2, 0), stroke: (thickness: 0.4pt, miter-limit: 10))",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) to (2,0);"
                                 r"\end{tikzpicture}"))
        # a bend is a tangent `to` whose angles are read off the chord, so it shares this geometry
        self.assertIn("bezier((0, 0), (2, 0), (4.776e-17, 0.78), (2, 0.78)",
                      cetz.build(r"\begin{tikzpicture}\draw (0,0) to[bend left=90] (2,0);"
                                 r"\end{tikzpicture}"))
        self.assertIn("bezier((0, 0), (4, 0), (1, 2), (3, 2)",
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

        self.assertIn("bezier((0, 0), (2, 0), (-0.5515, 0.5515), (2.552, 0.5515)",
                      curve("out=135,in=45"))
        self.assertIn("bezier((0, 0), (2, 0), (-2.758, 2.758), (4.758, 2.758)",
                      curve("out=135,in=45,looseness=5"))
        # the factor is read wherever it sits in the list
        self.assertIn("bezier((0, 0), (2, 0), (-0.2758, 0.2758), (2.276, 0.2758)",
                      curve("looseness=0.5,out=135,in=45"))
        # a bend stretches the same way, because it IS a tangent `to` with the chord's own angles
        self.assertIn("bezier((0, 0), (2, 0), (2.758, 2.758), (-0.7577, 2.758)",
                      curve("bend left=45,looseness=5"))
        self.assertIn("bezier((0, 0), (2, 0), (2.758, 2.758), (-0.7577, 2.758)",
                      curve("looseness=5,bend left=45"))

    def test_a_bent_edge_is_a_tangent_to_whose_angles_come_off_the_chord(self):
        # the bend had its own circular-arc formula, and that formula put the arc on the wrong side
        # and the label at the chord's midpoint: `_work/measure_bend_curve.py` reads pgf's beziers
        # out of a pdflatex PDF and they leave along chord+deg and arrive along chord-deg -- so
        # `bend left=45` on a horizontal chord is exactly `to[out=45,in=-45]`, and
        # `_work/measure_bend_arm.py` reads the arm as 0.39 of the chord at 10..90 degrees and on
        # chords of 1..5cm alike: the angle steers the arm, it never lengthens it. A bare
        # `bend left` is 30, not 45 (`_work/measure_bend_default.py`).
        def curve(opts):
            built = cetz.build(r"\begin{tikzpicture}\draw (0,0) to[%s] (3,0);"
                               r"\end{tikzpicture}" % opts) or ""
            return [l.strip() for l in built.splitlines() if "bezier" in l or "content" in l]

        self.assertEqual(curve("bend left=45"),
                         ['bezier((0, 0), (3, 0), (0.8273, 0.8273), (2.173, 0.8273), '
                          'stroke: (thickness: 0.4pt, miter-limit: 10))'])
        # mirrored, and the default angle
        self.assertEqual(curve("bend right=45"),
                         ['bezier((0, 0), (3, 0), (0.8273, -0.8273), (2.173, -0.8273), '
                          'stroke: (thickness: 0.4pt, miter-limit: 10))'])
        self.assertEqual(curve("bend left"),
                         ['bezier((0, 0), (3, 0), (1.013, 0.585), (1.987, 0.585), '
                          'stroke: (thickness: 0.4pt, miter-limit: 10))'])
        # a node written on the bent edge hangs off the curve's own midpoint, `above` parking the
        # label's south anchor there -- the chord midpoint would leave it sitting on the line
        bent = cetz.build(r"\begin{tikzpicture}\draw (0,0) to[bend left=45] node[above] {X} (3,0);"
                         r"\end{tikzpicture}")
        self.assertIn('content((1.5, 0.6205), [X], anchor: "south", padding: 0.1176cm)', bent)

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
            self.assertIn('content((0.3, 1.8), [$M$], anchor: "south-east", padding: 0.1176cm)', body)
        # the dot itself still paints, and a line written after a circle starts from its centre
        self.assertIn("circle((1, 1), radius: 0.07056, fill: black, stroke: none)",
                      drawn(r"\fill (1,1) circle (2pt);"))
        self.assertIn("line((1, 1), (3, 1)",
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
                         'content((0, 0), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), '
                         '[#set text(hyphenate: false, top-edge: "cap-height", '
                         'bottom-edge: "baseline"); #align(center)[Label]])])')
        self.assertEqual(node("[draw=none]"), "content((0, 0), [Label])")
        # a bare colour on an unframed node inks its text: `\node[blue!65!black] at (...) {primary
        # pieces};` stands on the author's page with no rectangle, and reading that colour as a
        # stroke request boxed 222 labels the papers never show
        self.assertEqual(node("[blue!65!black]"),
                         'content((0, 0), [#text(fill: rgb("#0000a6"))[Label]])')
        self.assertEqual(node("[red!70!black,very thick,dashed]"),
                         'content((0, 0), [#text(fill: rgb("#b20000"))[Label]])')
        # an ink and a corner the author wrote down move into the box, which paints its fill too
        self.assertIn('radius: 5.669pt, stroke: (paint: rgb("#ff0000"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffff00")',
                      cetz.build(r"\begin{tikzpicture}\node[draw=red,fill=yellow,"
                                 r"rounded corners=2mm] at (0,0) {L};\end{tikzpicture}"))
        # 'every node/.style' is a default no node names, and it is how a flowchart frames them all
        self.assertIn('#box(inset: 0.3333em, radius: 4pt',
                      cetz.build(r"\begin{tikzpicture}[every node/.style={draw,rounded corners}]"
                                 r"\node (a) {Alpha};\end{tikzpicture}"))
        # the same corner on a node whose size the author wrote down (54 statements, #61): that frame is
        # Typst's too, because CeTz's `frame: "rect"` is a hardcoded line-strip with nowhere to put a
        # radius, and the page says Typst honours the declared box and the centring over it
        self.assertIn('#box(width: 1cm, height: 1cm, inset: 0.3333em, radius: 4pt',
                      cetz.build(r"\begin{tikzpicture}\node[draw, rounded corners,"
                                 r" minimum size=1cm] at (0,0) {L};\end{tikzpicture}"))
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[draw, rounded corners,"
                                     r" minimum size=1cm] at (0,0) {L};\end{tikzpicture}"))
        # a box of Typst markup inside a CeTz canvas has to survive the compiler the page runs on
        self.assertIn('#box(inset: 0.3333em',
                      cetz.convert(r"\begin{tikzpicture}\node[draw] at (0,0) {Label};"
                                   r"\end{tikzpicture}"))

    def test_a_framed_node_lands_on_the_anchor_the_author_named(self):
        # 262 nodes over 69 papers wrote `anchor=` (or a side word, or `above=20pt`) on a node with a
        # frame, and only the frame-less branch passed it on: the drawn box straddled its own coordinate
        # and stood on the row above it (`_work/dump_canvas.py` on A-Counterexample-to-Kuroshs p9, where
        # the bottom box covered the cards). CeTz's `anchor:` moves the LAID-OUT body, and TeX's metrics
        # are not needed to say by how much (`_work/measure_node_anchor_north.py`: north, south, east
        # and north-east each land within 0.2bp of pgf's rectangle).
        def node(opt):
            built = cetz.build(r"\begin{tikzpicture}\node" + opt + r" at (0,0) {Label};"
                               r"\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertEqual(node("[draw, anchor=north]"),
                         'content((0, 0), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), '
                         '[#set text(hyphenate: false, top-edge: "cap-height", '
                         'bottom-edge: "baseline"); #align(center)[Label]])], anchor: "north")')
        self.assertTrue(node("[fill=white, anchor=west]").endswith(', anchor: "west")'))
        self.assertTrue(node("[draw, text width=2cm, anchor=north-west]")
                        .endswith(', anchor: "north-west")'))
        # a declared size is pinned the same way: the box is moved whole, and its measure stands
        sized = node("[draw, minimum size=1cm, anchor=north]")
        self.assertIn('content((0, 0), [#box(width: 1cm, height: 1cm', sized)
        self.assertTrue(sized.endswith(', anchor: "north")'))
        self.assertTrue(node("[draw, minimum size=1cm, anchor=east]").endswith(', anchor: "east")'))
        # a side word is the same request, and a node that names nothing keeps its centre
        self.assertTrue(node("[draw, above]").endswith(', anchor: "south")'))
        self.assertNotIn("anchor:", node("[draw]"))
        self.assertIn('anchor: "south"', node("[above]"))
        # CeTz sizes the body it anchors by `cap-height -> baseline` and then adds the drop from the
        # baseline to the content's own bottom edge, so an auto-measured block is a band TALLER than the
        # frame drawn inside it and `south` names the bottom of the band: a one-line box hung 2.62bp over
        # its point, and a four-line, a `font=\small` 9pt and a `text width` paragraph the same
        # 2.1-3.0bp (_work/measure_anchor_bottom_edge.py). Writing the wrapper's own two edges back into
        # the body makes the library's measures agree, the band vanishes, and the drawn box keeps the
        # height it had (14.57 -> 14.57bp), so south, north and centre all read 0.00 against the ruler.
        self.assertIn('top-edge: "cap-height", bottom-edge: "baseline"',
                      node("[draw, anchor=south]"))
        # a box whose height the author wrote down is Typst's measure rather than an auto-measured band,
        # and its words are set mid-height by `horizon`, which reads Typst's own edges -- those keep them.
        self.assertNotIn("top-edge:", node("[draw, minimum size=1cm, anchor=north]"))
        self.assertIn('top-edge: "cap-height", bottom-edge: "baseline"',
                      node("[draw, minimum width=2cm, anchor=south]"))

    def test_a_math_body_is_measured_by_its_own_bounds_not_by_the_text_edges(self):
        # `cap-height -> baseline` is a TEXT law, and a maths body has neither: Typst's `#box` answered
        # 14.85bp for EVERY one, whatever it held, while pdflatex prices each separately (17.34 / 13.78
        # / 17.00 / 18.98 / 13.89 for `$x_i^2$`, `$\frac{a}{b}$`, `$f_\alpha^{(k)}$`,
        # `$\sum_{k=1}^{n} k$`, `$n+1$`), so the ink ran out of the frame the converter drew around it --
        # a subscript 0.62bp under the bottom rule, a fraction 1.62bp, a sum's limits 3.40bp below and
        # over the top (_work/measure69_bottom_edge.py). On the 724 products that is math+bottom 1,168
        # escapes over 242 papers and math+top 796 over 203
        # (_work/probe_frame_ink_overflow.py --all --over 0.2). `bounds` on both edges is the one
        # candidate that reads escape 0.00 on all ten bodies (`descender` alone leaves the sum +1.28)
        # and it keeps the anchor law: south -0.00, north +0.00, centre symmetric.
        def node(label, opt="[draw, anchor=south]"):
            built = cetz.build(r"\begin{tikzpicture}\node" + opt + r" at (0,0) {" + label +
                               r"};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertIn('top-edge: "bounds", bottom-edge: "bounds"', node(r"$x_i^2$"))
        self.assertIn('top-edge: "bounds", bottom-edge: "bounds"', node(r"$\sum_{k=1}^{n} k$"))
        # prose is already right at cap-height -> baseline (14.57bp against pgf's 15.50) and `bounds`
        # would grow it to 17.63, so only a body carrying a math delimiter changes its edges -- a
        # dollar is all the maths has left of itself by the time the body is Typst markup, and no
        # escaped dollar occurs in the corpus to confuse it with (0 real `\$` over 724 flat files,
        # _work/probe_escaped_dollar_node.py)
        self.assertIn('top-edge: "cap-height", bottom-edge: "baseline"', node("Abg"))
        self.assertIn('top-edge: "bounds", bottom-edge: "bounds"', node(r"node $x_i^2$ here"))
        self.assertIn('top-edge: "cap-height", bottom-edge: "baseline"',
                      node(r"Abg", r"[draw, font=\small, anchor=south]"))
        # a height the author wrote down is Typst's own measure and its words go mid-height by
        # `horizon`, which reads Typst's edges: no edge is written for it either way (#63)
        self.assertNotIn("top-edge:", node(r"$x_i^2$", "[draw, minimum size=1cm, anchor=south]"))

    def test_a_written_size_is_a_minimum_a_multi_line_label_grows_past(self):
        # TikZ grows `minimum height` around a two-line label, and CeTz's `content(range, frame:)`
        # did the same, so the frame kept the declared width and let the height be measured (575 nodes
        # over 104 papers, _work/probe_grown_box.py). Typst's `box` honours a declared `height:` and
        # nothing more -- `_work/measure_box_vertical_align.py` watched a 3cm x 2cm box hold
        # 3.0000 x 2.0000 while three lines of words ran out through its bottom -- so only the label
        # that breaks its own lines is given a free height. `box` has no `align:` argument; measured
        # there too, the centring is a call, mid-height by `horizon`.
        def node(label):
            built = cetz.build(r"\begin{tikzpicture}\node[draw, minimum width=2cm,"
                               r" minimum height=1cm] at (0,0) {" + label +
                               r"};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        grown = node(r"A\\B")
        self.assertIn("[#box(width: 2cm, inset: 0.3333em", grown)
        self.assertIn('[#set text(hyphenate: false, top-edge: "cap-height", '
                      'bottom-edge: "baseline"); #align(center)[A#linebreak()B]]', grown)
        self.assertNotIn("height:", grown)
        self.assertNotIn("frame:", grown)
        kept = node("One line only")
        self.assertIn("#box(width: 2cm, height: 1cm", kept)
        self.assertIn("#align(center + horizon)[One line only]", kept)
        self.assertNotIn("frame:", kept)
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[draw, minimum width=2cm,"
                                     r" minimum height=1cm] at (0,0) {A\\B};"
                                     r"\end{tikzpicture}"))

    def test_a_declared_measure_lays_the_frame_that_wide(self):
        # `text width=2.8cm` is the measure of the paragraph TeX sets, so the frame TeX draws is that
        # width plus `inner sep` on each side, while `minimum width=2cm` is the frame itself and
        # centres what it holds (`_work/measure_textwidth_frame.py`, pdflatex + fitz). The converter
        # used to hand Typst an `inset:` and no `width:`, so the box hugged its words: a 5.7cm frame in
        # a flowchart came out text-sized and its 9mm connector read as a floating dash. `box`'s
        # `width:` is the OUTER size, and CeTz puts the laid-out box's centre on the node's own point
        # (`_work/probe_box_anchor_ruler.py` read -30.3..+30.3 around the coordinate both with and
        # without the added width), so a wider frame needs no compensation.
        def node(opts, label="some long label that TeX wraps"):
            built = cetz.build(r"\begin{tikzpicture}\node[" + opts +
                               r"] at (0,0) {" + label + r"};\end{tikzpicture}") or ""
            return [l.strip() for l in built.splitlines() if "content(" in l][-1]

        wide = node("draw, text width=2.8cm")
        self.assertIn("#box(width: 3.035cm, inset: 0.3333em", wide)
        self.assertNotIn("#align(", wide)
        self.assertIn("#box(width: 2cm, ", node("draw, minimum width=2cm"))
        self.assertIn("#align(center)", node("draw, minimum width=2cm"))
        self.assertIn("#align(center)", node("draw, text width=2.8cm, align=center"))
        self.assertNotIn("#align(", node("draw, minimum width=2cm, align=left"))
        # a measure the author gave no frame for is still a paragraph, so the `box` carries the width
        # and nothing asks for a stroke -- a bare `box` draws no rule at all
        # (`_work/measure_box_default_stroke.py` reads zero drawing operators for one). Without it the
        # label sets as ONE line: the note in Canonical-conformal's shell picture ran to 36cm, took the
        # canvas to 1018pt and left the figure half off the page, its own rectangle reading x=-440pt
        # (`_work/clip_by_colour.py`). 138 nodes in 56 papers write a `text width` and no frame, 24
        # more a `minimum width` (`_work/probe_invisible_measure.py`).
        bare = node("text width=2.8cm")
        self.assertIn("#box(width: 3.035cm, inset: 0.3333em", bare)
        self.assertNotIn("stroke:", bare)
        self.assertNotIn("fill:", bare)
        self.assertIn("#align(center)", node("minimum width=2cm"))
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[draw, text width=2cm,"
                                     r" minimum height=1cm] at (0,0) {A\\B};"
                                     r"\end{tikzpicture}"))

    def test_a_paragraph_break_in_a_node_label_stays_a_paragraph_break(self):
        # `\par` ends a paragraph and `\\` only a line, and the two have to reach Typst differently:
        # a fixed-width `box` honours `#parbreak()` (`_work/measure_node_par.py` reads 20.4pt between
        # the paragraphs against 14.4pt of line spacing), where the command name itself is deleted by
        # the markup pass and the three paragraphs of a figure's note printed as one run-on block.
        # Four labels in four papers write one; `\partial` is in far more, so the break is matched as
        # a control word.
        built = cetz.build(r"\begin{tikzpicture}\node[text width=7.4cm, align=left, inner sep=0pt]"
                           r" at (6.7,4.25) {First note.\par\medskip Second note.};"
                           r"\end{tikzpicture}")
        self.assertIn("#box(width: 7.4cm, inset: 0cm", built)
        self.assertIn("First note.#parbreak() Second note.", built)
        self.assertNotIn("#align(", built)
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[text width=7.4cm, align=left,"
                                     r" inner sep=0pt] at (6.7,4.25) {First note.\par\medskip"
                                     r" Second note.};\end{tikzpicture}"))
        both = cetz.build(r"\begin{tikzpicture}\node[draw] at (0,0) {a\\b\par c};"
                          r"\end{tikzpicture}")
        self.assertIn("#linebreak()", both)
        self.assertIn("#parbreak()", both)
        # the control word has to stay a prefix of nothing else
        self.assertNotIn("#parbreak()", cetz.build(r"\begin{tikzpicture}\node[draw] at (0,0)"
                                                   r" {$\partial D$};\end{tikzpicture}"))

    def test_a_display_span_in_a_node_label_stands_as_its_own_equation(self):
        # TeX sets `\[ ... \]` as a centred display even inside a node's paragraph, so the gate
        # figure's note (`Canonical-conformal-limits-o` p99) carries two of them between prose.
        # Left to the prose pass, the markup stripped the delimiters' command names and printed the
        # equation escaped: `e^ Hm_*w>2B_0.` on the page. A math span alone in its paragraph is what
        # makes Typst set it as a display, hence the breaks; one at either end of the label would
        # only add an empty paragraph TeX never draws.
        built = cetz.build(r"\begin{tikzpicture}\node[text width=5cm, align=left] at (9.7,2.9)"
                           r" {since \[ e^{\xi H}m_*w>2B_0. \] from};"
                           r"\end{tikzpicture}")
        self.assertIn("since #parbreak()$e^( xi H)m_*w>2B_0.$ #parbreak() from", built)
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[text width=5cm, align=left]"
                                     r" at (9.7,2.9) {since \[ e^{\xi H}m_*w>2B_0. \] from};"
                                     r"\end{tikzpicture}"))
        # a line break's optional gap is not an opening delimiter, and a label that opens with the
        # display draws no empty paragraph above it
        self.assertIn("a#linebreak()b", cetz.build(r"\begin{tikzpicture}\node[draw] at (0,0)"
                                                   r" {a\\[2pt]b};\end{tikzpicture}"))
        self.assertEqual(cetz.node_text(r"\[ a+b \] tail"), "$a+b$ #parbreak() tail")
        self.assertEqual(cetz.node_text(r"\[ a+b \]"), "$a+b$")
        # the paper sets the display on lines of its own, so the span has to cross newlines
        self.assertEqual(cetz.node_text("since\n \\[\n a+b\n \\]\n end"),
                         "since #parbreak()$a+b$ #parbreak() end")
        # the display an equation wraps the whole picture in is stripped outside the drawing
        # alone, so the label's own display survives it
        enveloped = cetz.convert(r"\[\begin{tikzpicture}\node[text width=5cm] at (0,0)"
                                 r" {since \[ a+b \] end};\end{tikzpicture}\]")
        self.assertIn("since #parbreak()$a+b$ #parbreak() end", enveloped)

    def test_a_node_that_writes_its_own_inner_sep_pads_its_box_by_that(self):
        # `box_args` spent pgf's *default* `inner sep` on every framed node, so a node written
        # `inner sep=5pt` got a frame TeX sized by 5pt and Typst padded by 0.3333em -- 1,207 of the
        # 1,402 framed nodes in the corpus (_work/probe_inset_face.py). The two numbers Typst needs are
        # measured in `_work/measure_box_inset_gap.py`: an `inset:` is spent exactly on both sides
        # (9.5pt of words becomes 19.5pt of frame at `inset: 5pt`), a `box` with none has no padding at
        # all, and `0.3333em` follows the node's own font (3.33pt at 10pt, 3.00pt inside
        # `#text(size: 9pt)`) -- which is why the default stays in em instead of the cm a declared
        # value becomes. With `text width` the same sep is what `node_frame_width` already added to the
        # frame, so the two together land the paragraph back on the measure the author wrote.
        def node(opts):
            built = cetz.build(r"\begin{tikzpicture}\node[" + opts +
                               r"] at (0,0) {some long label that TeX wraps};"
                               r"\end{tikzpicture}") or ""
            return [l.strip() for l in built.splitlines() if "content(" in l][-1]

        self.assertIn("inset: 0.1764cm", node("draw, inner sep=5pt"))
        self.assertIn("inset: 0.2117cm", node("draw, inner sep=6pt"))
        self.assertIn("inset: 0cm", node("draw, inner sep=0pt"))
        self.assertIn("inset: 0.3333em", node("draw"))
        self.assertIn("#box(width: 3.153cm, inset: 0.1764cm", node("draw, text width=2.8cm,"
                                                                   " inner sep=5pt"))
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[draw, inner sep=5pt,"
                                     r" text width=2cm] at (0,0) {wrap};\end{tikzpicture}"))

    def test_a_padding_written_on_one_axis_pads_that_axis_only(self):
        # pgf spells the same gap per axis -- `inner xsep` for the horizontal, `inner ysep` for the
        # vertical, 42 framed nodes over 8 papers write it that way and the converter read none of them
        # (`_work/probe_padding_face.py`). pdflatex says each key touches only its own axis and the two
        # spellings are executed in the order written (`_work/measure_tex_inset_axes.py`: a framed `ab`
        # node is 8.811pt half-width by default, `inner xsep=7pt` moves the width to 12.478 and leaves
        # the height at 7.005; `text width=3cm` reads 46.212 half-width, 49.879 with `inner xsep=7pt`
        # and still 46.212 with `inner ysep=7pt`). Typst spends a per-axis `inset:` the same way but
        # gives an axis the dictionary omits NOTHING rather than the default
        # (`_work/measure_inset_axes.py`: `inset: (x: 7pt)` measures the same height as no inset), so
        # both axes are named as soon as they differ -- and the unwritten one keeps the em default.
        def node(opts, label="some long label that TeX wraps"):
            built = cetz.build(r"\begin{tikzpicture}\node[" + opts +
                               r"] at (0,0) {" + label + r"};\end{tikzpicture}") or ""
            return [l.strip() for l in built.splitlines() if "content(" in l][-1]

        self.assertIn("inset: (x: 0.2469cm, y: 0.3333em)", node("draw, inner xsep=7pt"))
        self.assertIn("inset: (x: 0.3333em, y: 0.2469cm)", node("draw, inner ysep=7pt"))
        self.assertIn("inset: (x: 0.2469cm, y: 0.2117cm)",
                      node("draw, inner xsep=7pt, inner ysep=6pt"))
        # equal axes need no dictionary, and Typst reads the two forms the same
        self.assertIn("inset: 0.1764cm", node("draw, inner xsep=5pt, inner ysep=5pt"))
        # only the horizontal padding widens a paragraph frame; the vertical one leaves it alone
        self.assertIn("#box(width: 3.494cm, inset: (x: 0.2469cm, y: 0.3333em)",
                      node("draw, text width=3cm, inner xsep=7pt", label="wrap"))
        self.assertIn("#box(width: 3.235cm, inset: (x: 0.3333em, y: 0.2469cm)",
                      node("draw, text width=3cm, inner ysep=7pt", label="wrap"))
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[draw, inner xsep=7pt,"
                                     r" inner ysep=6pt, text width=2cm] at (0,0) {wrap};"
                                     r"\end{tikzpicture}"))

    def test_a_label_hangs_off_the_edge_it_names(self):
        # `label=above:$f$` is a SECOND node hanging off the first, and the converter read no `label`
        # key at all: the 385 dots whose only content is a `label=` (`_work/probe_label_option.py`)
        # printed as bare dots with their names gone. Measured (`_work/measure_label_offset.py`): TeX
        # pins the label's own box -- 1pt of `inner sep` included -- on the point where the direction's
        # ray leaves the parent, with no gap; `above` on a `minimum size=6pt` dot reads 0.1482cm against
        # the 0.1411 of half-size plus that 1pt (the last 0.007 is TikZ's `outer sep`, which is never
        # measured here); `above left:` and `135:` are one and the same measurement, and the ray leaves
        # a 1.2cm by 8pt box through its TOP edge, (-0.1482, 0.1482), not through its corner; a bare
        # `label:$f$` is `above`. CeTz's `anchor:` knows the label's own extent, so only the parent's
        # half-size and the 1pt are added -- and a parent nobody sized keeps its point.
        def lines(opts, label=""):
            built = cetz.build(r"\begin{tikzpicture}\node[" + opts + r"] at (0,0) {" + label +
                               r"};\end{tikzpicture}") or ""
            return [l.strip() for l in built.splitlines() if l.strip().startswith("content(")]

        dot = "circle, inner sep=0pt, minimum size=6pt, fill=black"
        self.assertEqual(lines(dot + ", label=above:$f$"),
                         ['content((0, 0.1411), [$f$], anchor: "south")'])
        self.assertEqual(lines(dot + ", label=left:{$p$}"),
                         ['content((-0.1411, 0), [$p$], anchor: "east")'])
        self.assertEqual(lines(dot + ", label=above left:$x$"),
                         ['content((-0.1308, 0.1308), [$x$], anchor: "south-east")'])
        self.assertEqual(lines(dot + ", label={above:$f$}"),
                         ['content((0, 0.1411), [$f$], anchor: "south")'])
        self.assertEqual(lines(dot + ", label=$f$"),
                         ['content((0, 0.1411), [$f$], anchor: "south")'])
        # two labels on one node are two nodes in TeX, so `opts` keeps the key as a list and both draw
        self.assertEqual(lines(dot + ", label=above:$f$, label=below:$g$"),
                         ['content((0, 0.1411), [$f$], anchor: "south")',
                          'content((0, -0.1411), [$g$], anchor: "north")'])
        # a diagonal ray leaves a wide box through its short edge
        self.assertEqual(lines("draw, minimum width=1.2cm, minimum height=8pt, label=above left:$f$",
                               "text")[1:],
                         ['content((-0.1661, 0.1661), [$f$], anchor: "south-east")'])
        # a position that is no compass word is quoted with the picture, not drawn at a guess
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\node[" + dot +
                                     r", label={[name=L]above:$f$}] at (0,0) {};"
                                     r"\end{tikzpicture}"))
        # A bracketed preamble restyles the label node, and three of its keys answer in coordinates:
        # `inner sep` replaces the 1pt the box is pinned with, `label distance` adds to that push,
        # `xshift`/`yshift` slide the result. These spellings came out of pictures that built BEFORE
        # the fix, so each one was a figure the fix would have thrown away (`LOST`, three papers).
        self.assertEqual(lines(dot + ", label={[inner sep=3pt]right:$p$}"),
                         ['content((0.2117, 0), [$p$], anchor: "west")'])
        self.assertEqual(lines(dot + ", label={[label distance=3pt]left:$x$}"),
                         ['content((-0.2469, 0), [$x$], anchor: "east")'])
        self.assertEqual(lines(dot + ", label={[xshift=2pt,yshift=1pt]above right:$0$}"),
                         ['content((0.2013, 0.1661), [$0$], anchor: "south-west")'])
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[" + dot +
                                     r", label=above right:{$A_1$}] at (0,0) {};"
                                     r"\node[draw, circle, label=below:{$q$}] at (2,1) {B};"
                                     r"\end{tikzpicture}"))

    def test_an_edges_label_is_a_node_written_before_its_target(self):
        # `\path (A) edge node {x} (B)` puts x at the middle of the edge. The walker read `to`/`edge`
        # only where a bracket or a coordinate followed, so the label's own `node` word stopped it and
        # the whole picture was quoted: two papers, and the same rule already places `-- node {x} --`.
        built = cetz.build(r"\begin{tikzpicture}\node (a) at (0,0) {A};\node (b) at (2,0) {B};"
                           r"\path (a) edge node[left] {red} (b);\end{tikzpicture}") or ""
        lines = [l.strip() for l in built.splitlines() if "content(" in l or "line(" in l]
        # the edge stops at each label's border rather than running through both letters
        self.assertIn("line((0.2657, 0), (1.734, 0), stroke: none)", lines)
        self.assertIn("content((1, 0), [red], anchor: \"east\", padding: 0.1176cm)", lines)
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node (a) at (0,0) {A};"
                                     r"\path (a) edge node[above] {$f_{i+1}$} (1,1);"
                                     r"\end{tikzpicture}"))

    def test_node_math_carries_no_grouping_braces(self):
        # Typst has no grouping braces in maths and prints the ones it is handed, so a stripped
        # command name left its argument's braces on the page: `\underline{\mathbb{Q}}` came out as
        # `{ {Q}}` and `\frac{K}{K_0}` as `{K}{K_0}`. A brace only stays as the group of a script.
        # A declaration that selects a font keeps its function: `\mathbb{Q}` is Typst's `bb(Q)`,
        # and `\frac` its `frac(a, b)` (probe_verify_funcs.py), so the style is no longer dropped.
        def math(tex):
            return cetz.build(r"\begin{tikzpicture}\node at (0,0) {$%s$};"
                              r"\end{tikzpicture}" % tex)
        self.assertIn("[$bb(Q)$]", math(r"\underline{\mathbb{Q}}"))
        self.assertIn("[$frac(K, K_0)$]", math(r"\frac{K}{K_0}"))
        # amsmath's `\tfrac12` is the same fraction with TeX's brace-less arguments, and the name
        # is not in the symbol table, so the quote pass printed it as `"tfrac" 12` on the page
        self.assertIn("frac(1, 2)$]", math(r"t=\tfrac12"))
        self.assertIn("frac(a, b)$]", math(r"\dfrac{a}{b}"))
        # a script's group is printed too, which `_work/brace_probe4.typ` shows at 350 dpi:
        # `$x_{i+1}$` reaches the page WITH its braces, while `$x_(i+1)$` and `$x_i$` set a clean
        # subscript. So a group is rewritten into the parentheses Typst honours; a single atom needs
        # no group at all, and a run of letters is spaced so each letter stays a variable.
        self.assertIn("[$hat(A)_i$]", math(r"\hat{A}_{i}"))
        self.assertIn("[$x_12$]", math(r"x_{12}"))
        self.assertIn("[$x_(i j)$]", math(r"x_{ij}"))
        self.assertIn("[$x_(i+1)$]", math(r"x_{i+1}"))
        self.assertIn("[$N_(e,0)$]", math(r"N_{e,0}"))
        self.assertIn("[$z_a^(c_1)$]", math(r"z_a^{c_1}"))
        # an escaped brace prints as a character AND the group that carries it prints its own braces,
        # which `_work/brace_probe6.typ` shows: `$c_{\{k,j\}}$` sets `c{{k,j}}`, one pair too many,
        # while `$c_(\{k,j\})$` sets the `c{k,j}` the author meant. So the group still goes into
        # parentheses and the escaped pair stays inside them.
        self.assertIn("[$\\1_(\\{v\\})$]", math(r"\1_{\{v\}}"))
        self.assertIn("[$c_(\\{k,j\\})$]", math(r"c_{\{k,j\}}"))
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node at (0,0)"
                                     r" {$\underline{\mathbb{Q}} \leq \frac{K}{K_0}$};"
                                     r"\end{tikzpicture}"))

    def test_a_fill_only_node_frame_interrupts_its_line_without_a_border(self):
        # An in-path `node` IS a node: its bracket may name a `/.style` the picture declared, and the
        # keys that make a label visible at all usually live there -- the Partition triangle's
        # `node[overlap]` is `{fill=white, inner sep=3pt}`, the white that interrupts the line it sits
        # on. The lookup was only ever done for a standalone `\node`, so the options vanished
        # (_work/probe_inpath_node_options.py). A fill asks for a background and NOT for a rule:
        # pdflatex draws the white label borderless, while Typst strokes a `box` whose `stroke:` is
        # left off, so the absence has to be said out loud (_work/clip_figure.py).
        pic = (r"\begin{tikzpicture}[overlap/.style={fill=white,inner sep=3pt}]"
               r"\draw (0,0) -- (3,0) node[midway,overlap] {$D_u$};\end{tikzpicture}")
        built = cetz.build(pic) or ""
        self.assertEqual(
            built.splitlines()[-2].strip(),
            'content((1.5, 0), [#box(inset: 0.1058cm, stroke: none, '
            'fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", '
            'bottom-edge: "bounds"); #align(center)[$D_u$]])])')
        self.assertTrue(cetz.convert(pic))
        # `draw=` still asks for the rule, sized by pgf's default when unsized
        framed = cetz.build(r"\begin{tikzpicture}\node[draw] at (0,0) {A};"
                           r"\end{tikzpicture}") or ""
        self.assertIn("#box(inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10)", framed)

    def test_a_path_can_take_its_arrow_from_an_invoked_style(self):
        # 'flow/.style={->,draw=blue!60}' is read back for a node but was never resolved for a
        # '\draw[flow]', so 38 pictures drew the line and dropped its head and ink. 'every node'
        # is merged for a node only: TikZ applies it to nodes, and on a path it would fill the
        # connecting lines white.
        built = cetz.build(r"\begin{tikzpicture}[flow/.style={->,draw=blue!60,line width=.8pt},"
                           r"every node/.style={fill=white}]\node (a) at (0,0) {A};"
                           r"\draw[flow] (a) -- (2,0);\end{tikzpicture}") or ""
        lines = [l.strip() for l in built.splitlines() if l.strip().startswith("line(")]
        self.assertIn('line((0.2657, 0), (2, 0), stroke: (paint: rgb("#6666ff"), '
                      'thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))', lines)
        self.assertNotIn("#ffffff", lines[0])
        # the frame is a fill alone, and pgf paints no border for one (see
        # test_a_fill_only_node_frame_interrupts_its_line_without_a_border)
        self.assertIn('#box(inset: 0.3333em, stroke: none, fill: rgb("#ffffff")', built)
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}[f/.style={<-}]\draw[f] (0,0) -- (1,1);"
                                     r"\end{tikzpicture}"))

    def test_a_named_arrow_tip_takes_the_mark_that_draws_the_same_head(self):
        # TikZ names a head two ways: a mnemonic character CeTz spells the same, and, since
        # `arrows.meta`, a word. The words were dropped whole, so 137 pictures drew a bare line where
        # the author asked for a head (_work/probe_arrowtips.py). Measured against pdflatex
        # (_work/measure_tikz_tips.py), Stealth and Latex paint a solid head of aspect .75 -- the head
        # CeTz's ">>" and ")>" draw (_work/probe_mark_shapes.py) -- while a bare ">" is an open V in
        # both engines, so only the words take the line's own ink as a fill, and an author's
        # length/width belong to the side that declared them (_work/probe_mark_per_side.py).
        pic = (r"\begin{tikzpicture}[>=stealth,flow/.style={-{Stealth[length=2mm]},draw=red},"
               r"both/.style={{Latex[length=1.3mm]}-{Latex[length=1.3mm]}}]"
               r"\draw[flow] (0,0) -- (2,0);\draw[|-|] (0,1) -- (2,1);"
               r"\draw[both] (0,2) -- (2,2);\draw (0,3) -- (2,3);\end{tikzpicture}")
        built = cetz.build(pic) or ""
        lines = [l.strip() for l in built.splitlines() if l.strip().startswith("line(")]
        self.assertIn('mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#ff0000")))',
                      lines[0])
        self.assertIn('mark: (start: "|", end: "|")', lines[1])
        self.assertIn('mark: (start: (symbol: ")>", length: 0.13cm, fill: black),'
                      ' end: (symbol: ")>", length: 0.13cm, fill: black))', lines[2])
        self.assertNotIn("mark:", lines[3])
        self.assertTrue(cetz.convert(pic))

    def test_the_pictures_arrow_default_reheads_every_bare_character(self):
        # `>=<name>` is not a drawing statement: it re-points the CHARACTERS `>` and `<` at a named
        # tip, so every `->` in the picture changes head. 453 pictures write it (`_work/
        # probe_tip_default_face.py`) and the emitter was reading the declaration and dropping it,
        # leaving 1,659 canvas lines with an open V. pdflatex measures the regimes as three different
        # heads (`_work/measure_tikz_tips.py`, with `arrows.meta` as 476 flat papers load it): nothing
        # written gives an open V 2.07 x 4.78pt -- CeTz's bare ">" mark, so an unset picture keeps its
        # drawing -- `[>=latex]` a filled 3.99 x 2.99pt, `[>=Stealth]` a filled 3.57 x 2.69pt. Both
        # ends take it, as the same measurement's `\draw[<-]` shows, and a tip that already names
        # itself is not re-named by the default.
        pic = (r"\begin{tikzpicture}[>=Stealth]\draw[->] (0,0) -- (1,0);\draw[<-] (0,1) -- (1,1);"
               r"\draw[-{Latex}] (0,2) -- (1,2);\draw (0,3) -- (1,3);\end{tikzpicture}")
        lines = [l.strip() for l in (cetz.build(pic) or "").splitlines()
                 if l.strip().startswith("line(")]
        self.assertIn('mark: (end: (symbol: ">>", fill: black))', lines[0])
        self.assertIn('mark: (start: (symbol: ">>", fill: black))', lines[1])
        self.assertIn('mark: (end: (symbol: ")>", fill: black))', lines[2])
        self.assertNotIn("mark:", lines[3])
        # the corpus writes the name in both cases, and they are the same two heads
        for decl in ("latex", "Latex"):
            self.assertIn('mark: (end: (symbol: ")>", fill: black))',
                          cetz.build(r"\begin{tikzpicture}[>=%s]\draw[->] (0,0)"
                                     r" -- (1,0);\end{tikzpicture}" % decl))
        # a picture that sets nothing draws what it has always drawn
        self.assertIn('mark: (end: ">")',
                      cetz.build(r"\begin{tikzpicture}\draw[->] (0,0) -- (1,0);"
                                 r"\end{tikzpicture}"))
        # a name we have not measured keeps its characters rather than a guess
        self.assertIn('mark: (end: ">")',
                      cetz.build(r"\begin{tikzpicture}[>=Triangle]\draw[->] (0,0)"
                                 r" -- (1,0);\end{tikzpicture}"))
        # the default is no reason to refuse: the picture that declares one still converts
        self.assertTrue(cetz.convert(pic))

    def test_a_tip_default_written_where_the_arrow_is_written_reheads_that_arrow(self):
        # the same declaration is legal in three places, and pgf reads the INNERMOST one -- measured in
        # both option orders (`_work/measure_tikz_tips.py`, `site:` cases): `\draw[<->,>=Stealth]` and
        # `\draw[>=Stealth,<->]` both draw solid Stealth heads, and so does a style that carries the
        # key. Six canvases kept an open V until the emitter read the statement's own options
        # (`_work/probe_tip_residue.py`), and one wrote the name in its own group
        # (`>={Stealth}`, the Morse-number picture's five arrows) -- which pgf peels, so `arrow_default`
        # peels it too.
        self.assertIn('mark: (start: (symbol: ">>", fill: black),'
                      ' end: (symbol: ">>", fill: black))',
                      cetz.build(r"\begin{tikzpicture}\draw[<->,>=Stealth] (0,0) -- (1,0);"
                                 r"\end{tikzpicture}"))
        self.assertIn('mark: (end: (symbol: ")>", fill: black))',
                      cetz.build(r"\begin{tikzpicture}\draw[>=latex,->] (0,0) -- (1,0);"
                                 r"\end{tikzpicture}"))
        for decl in (r">={Latex}", r">= {Stealth}"):
            self.assertIn('mark: (end: (symbol: "%s", fill: black))'
                          % (")>" if "Latex" in decl else ">>"),
                          cetz.build(r"\begin{tikzpicture}[%s]\draw[->] (0,0)"
                                     r" -- (1,0);\end{tikzpicture}" % decl))
        # a statement that says nothing takes the picture's name; one that says its own takes that,
        # and the declaration does not leak out of the statement that wrote it
        pic = (r"\begin{tikzpicture}[>=Stealth,arrow/.style={->,>=latex}]"
               r"\draw[arrow] (0,0) -- (1,0);\draw[->] (0,1) -- (1,1);"
               r"\draw[<->,>=Latex] (0,2) -- (1,2);\draw[->] (0,3) -- (1,3);"
               r"\end{tikzpicture}")
        lines = [l.strip() for l in (cetz.build(pic) or "").splitlines()
                 if l.strip().startswith("line(")]
        self.assertIn('mark: (end: (symbol: ")>", fill: black))', lines[0])
        self.assertIn('mark: (end: (symbol: ">>", fill: black))', lines[1])
        self.assertIn('mark: (start: (symbol: ")>", fill: black),'
                      ' end: (symbol: ")>", fill: black))', lines[2])
        self.assertIn('mark: (end: (symbol: ">>", fill: black))', lines[3])
        # an innermost name we have not measured keeps its characters instead of falling back to
        # the outer one, which is the guess the guard exists to refuse
        self.assertIn('mark: (end: ">")',
                      cetz.build(r"\begin{tikzpicture}[>=Stealth,t/.style={->,>=Triangle}]"
                                 r"\draw[t] (0,0) -- (1,0);\end{tikzpicture}"))
        self.assertTrue(cetz.convert(pic))

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
        self.assertIn('stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10)',
                      cetz.build(r"\begin{tikzpicture}\draw[blue!65!black] (0,0) -- (1,1);"
                                 r"\end{tikzpicture}"))
        # an ink we cannot model colours nothing, so the picture is quoted rather than mis-inked
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\node at (0,0) {\textcolor{nosuch}{t}};"
                                     r"\end{tikzpicture}"))
        # the colouring is page markup, so it has to survive the compiler the page runs on
        self.assertIn('#text(fill: rgb("#bf0000"))[t]',
                      cetz.convert(r"\begin{tikzpicture}\node at (0,0)"
                                   r" {\textcolor{red!75!black}{t}};\end{tikzpicture}"))

    def test_a_nodes_colour_lands_on_words_border_and_field_separately(self):
        # `_work/measure_bare_color_node.py` puts 34 node spellings through pdflatex, one picture per
        # page, and reads every page back with fitz for the colour of its text spans and of every
        # stroked and filled path; `_work/check_node_color_law.py` runs the converter over the same
        # option groups and the two tables answer line for line.  A bare colour key is the node's
        # GENERAL colour: it inks the words, and only a `draw` written without a value borrows it.
        def pic(opts):
            return cetz.build("\\begin{tikzpicture}\\node%s at (1,1) {ab};\\end{tikzpicture}"
                              % opts)

        blue, red = 'rgb("#0000ff")', 'rgb("#ff0000")'
        out = pic("[blue]")
        self.assertIn("#text(fill: %s)[ab]" % blue, out)
        self.assertNotIn("stroke", out)
        out = pic("[blue,draw]")
        self.assertIn("stroke: (paint: %s, thickness: 0.4pt, miter-limit: 10)" % blue, out)
        self.assertIn("#text(fill: %s)[ab]" % blue, out)
        out = pic("[blue,draw=red]")
        self.assertIn("stroke: (paint: %s, thickness: 0.4pt, miter-limit: 10)" % red, out)
        self.assertIn("#text(fill: %s)[ab]" % blue, out)
        out = pic("[blue,fill=white]")
        self.assertIn("stroke: none", out)
        self.assertIn("fill: rgb(\"#ffffff\")", out)
        self.assertIn("#text(fill: %s)[ab]" % blue, out)
        # `text=` outvotes the general colour on the words and joins nothing else
        out = pic("[blue,text=red,draw]")
        self.assertIn("stroke: (paint: %s, thickness: 0.4pt, miter-limit: 10)" % blue, out)
        self.assertIn("#text(fill: %s)[ab]" % red, out)
        out = pic("[text=red,draw=blue]")
        self.assertIn("stroke: (paint: %s, thickness: 0.4pt, miter-limit: 10)" % blue, out)
        self.assertIn("#text(fill: %s)[ab]" % red, out)
        # a `fill` or `draw` with no value takes the general colour, empty spelling included
        out = pic("[blue,fill]")
        self.assertIn("fill: %s" % blue, out)
        out = pic("[blue,fill=]")
        self.assertIn("fill: %s" % blue, out)
        out = pic("[blue,draw=]")
        self.assertIn("stroke: (paint: %s, thickness: 0.4pt, miter-limit: 10)" % blue, out)
        # and `draw=none` takes the border back without taking the field with it
        out = pic("[blue,fill=red,draw=none]")
        self.assertIn("stroke: none", out)
        self.assertIn("fill: %s" % red, out)
        self.assertIn("#text(fill: %s)[ab]" % blue, out)
        # a shaped node follows the same rule: fill alone is a field with no rule around it
        out = pic("[circle,fill=red]")
        self.assertIn('frame: "circle"', out)
        self.assertIn("stroke: none", out)

    def test_a_statement_strokes_what_pgf_turned_on_and_nothing_more(self):
        # pgf keeps two modes and the verb picks one: `\draw`/`\filldraw` stroke, `\path`/`\fill` do
        # not, and `draw=`/`draw=none` turns the mode on or off wherever it is written. All of it was
        # read off pdflatex page by page (_work/measure_path_mode.py): `\path (0,0)--(2,0);`,
        # `\path[red] …` and `\path[red,->] …` leave an EMPTY page -- no rule and no tip, because a
        # tip belongs to a stroke. CeTz answers 1pt black for a silence we never meant
        # (_work/measure_fill_stroke_default.py), so the absence has to be said out loud and a rule
        # that IS drawn has to name pgf's own weight.
        def pic(body):
            return cetz.build(r"\begin{tikzpicture}" + body + r"\end{tikzpicture}")
        self.assertIn("line((0, 0), (2, 0), stroke: none)", pic(r"\path (0,0)--(2,0);"))
        self.assertIn("line((0, 0), (2, 0), stroke: none)", pic(r"\path[red] (0,0)--(2,0);"))
        self.assertNotIn("mark:", pic(r"\path[red,->] (0,0)--(2,0);"))
        # `draw=red` turns the mode on inside a `\path`, and `draw=none` turns it back off
        self.assertIn("line((0, 0), (2, 0), stroke: (paint: rgb(\"#ff0000\"), thickness: 0.4pt, miter-limit: 10))",
                      pic(r"\path[draw=red] (0,0)--(2,0);"))
        self.assertIn("line((0, 0), (2, 0), stroke: none)", pic(r"\draw[draw=none] (0,0)--(2,0);"))
        # a drawn line weighs pgf's 0.4pt, not Typst's 1pt, and keeps its tip
        self.assertIn("line((0, 0), (2, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: ", pic(r"\draw[->] (0,0)--(2,0);"))
        # `\filldraw` strokes and fills at once, `\fill` fills with no border at all
        self.assertIn("rect((0, 0), (1, 1), fill: rgb(\"#ff0000\"), stroke: none)",
                      pic(r"\fill[red] (0,0) rectangle (1,1);"))
        self.assertIn("stroke: (thickness: 0.4pt, miter-limit: 10)",
                      pic(r"\filldraw[fill=red] (0,0) rectangle (1,1);"))
        # a written `line width` still outranks the default weight
        self.assertIn("stroke: (thickness: 1.4173pt, miter-limit: 10)", pic(r"\draw[line width=0.5mm] (0,0)--(2,0);"))

    def test_the_end_and_corner_of_a_written_pen_reach_the_page(self):
        # pgf and Typst spell a path's ends and corners differently, and Typst's own numbers differ
        # from pgf's: `rect` is Typst's `square`, and where pgf carries a miter to 10 times the
        # half-pen (beveling only from a 11.4deg corner) Typst gives up at 4 (from 28.5deg), so every
        # corner in between points on the TeX page and is cut on the product page until the limit is
        # said out loud.  All six readings, both engines, one ruler: _work/measure90_cap_join.py.
        def pic(body):
            return cetz.build(r"\begin{tikzpicture}" + body + r"\end{tikzpicture}")
        self.assertIn('cap: "butt"', pic(r"\draw[line cap=butt] (0,0)--(2,0);"))
        self.assertIn('cap: "round"', pic(r"\draw[line cap=round] (0,0)--(2,0);"))
        self.assertIn('cap: "square"', pic(r"\draw[line cap=rect] (0,0)--(2,0);"))
        self.assertIn('join: "round"', pic(r"\draw[line join=round] (0,0)--(1,1)--(2,0);"))
        # a join that never miters has no limit to carry, so the key goes
        self.assertNotIn("miter-limit", pic(r"\draw[line join=round] (0,0)--(1,1)--(2,0);"))
        self.assertNotIn("miter-limit", pic(r"\draw[line join=bevel] (0,0)--(1,1)--(2,0);"))
        self.assertIn('join: "miter", miter-limit: 10', pic(r"\draw[line join=miter] (0,0)--(1,1);"))
        # and a corner the author said nothing about still gets pgf's limit rather than Typst's
        self.assertIn("stroke: (thickness: 0.4pt, miter-limit: 10)", pic(r"\draw (0,0)--(1,1)--(2,0);"))
        # a key on the picture's own brackets is pgf's scope default and reaches every path AND every
        # node frame: _work/measure90_head_on_node.py reads lineJoin=1 and lineCap=1 back off the
        # rect of `\node[draw] {X}` under such a head, while the statement's own key still outranks it
        head = cetz.build(r"\begin{tikzpicture}[line cap=round, line join=round]"
                          r"\draw (0,0)--(1,1);\node[draw, line cap=butt] at (3,0) {X};"
                          r"\end{tikzpicture}")
        self.assertIn('line((0, 0), (1, 1), stroke: (thickness: 0.4pt, cap: "round", join: "round"))', head)
        self.assertIn('stroke: (thickness: 0.4pt, cap: "butt", join: "round")', head)

    def test_a_pen_named_by_pgf_and_a_pen_written_on_the_head_reach_the_rule(self):
        # pgf sells six pens by name and the corpus buys them by the thousand -- 882 `[thick]` and 316
        # `[very thick]` on a statement's own brackets, 7 more on a picture head, and the same names
        # inside `/.style` tables (_work/probe129_pen_width_spellings.py, counted out of the option
        # tables the emitter reads).  Their prices are one ruler: ultra thin .100, thin .398,
        # semithick .598, thick .797, very thick 1.196, ultra thick 1.594 pt, read off pages pdflatex
        # drew (_work/measure91_pen_widths.py A).  `thin` is the default, so it must not change a word.
        def pic(body, head=""):
            return cetz.build(r"\begin{tikzpicture}" + head + body + r"\end{tikzpicture}")
        for name, pt in (("ultra thin", "0.1"), ("thin", "0.4"), ("semithick", "0.6"),
                         ("thick", "0.8"), ("very thick", "1.2"), ("ultra thick", "1.6")):
            self.assertIn("stroke: (thickness: %spt" % pt, pic(r"\draw[%s] (0,0)--(2,0);" % name))
        # the weight joins the scope default #90 measured for the ends and corners: a head pen reaches
        # a plain path, a node's rect and its circle alike, and a statement that says its own pen --
        # by name OR by length -- still outranks the brackets
        heavy = cetz.build(r"\begin{tikzpicture}[line width=2pt]\draw (0,0)--(1,1);"
                           r"\node[draw, thin] (a) at (3,0) {X};\end{tikzpicture}")
        self.assertIn("line((0, 0), (1, 1), stroke: (thickness: 2.0pt", heavy)
        self.assertIn("stroke: (thickness: 0.4pt", heavy)
        self.assertIn("stroke: (thickness: 0.8pt",
                      pic(r"\draw (0,0)--(1,1);\node[draw] at (3,0) {X};", "[thick]"))
        # a name carried by a style is the same pen as a name written out
        self.assertIn("stroke: (thickness: 1.2pt",
                      pic(r"\draw[pen] (0,0)--(1,1);", "[pen/.style={very thick}]"))
        # and a pen is an ABSOLUTE page length: `scale=2` and `x=2cm` leave pgf's rule at 1.993pt
        # (_work/measure91_pen_widths.py C), so the transform must not reprice it
        self.assertIn("stroke: (thickness: 0.8pt",
                      cetz.build(r"\begin{tikzpicture}[scale=2]\draw[thick] (0,0)--(1,1);"
                                 r"\end{tikzpicture}"))

    def test_a_pen_priced_by_every_path_outranks_the_head_and_loses_to_the_statement(self):
        # `every path/.style={line width=2pt}` is a declaration no statement invokes, and pgf applies it
        # to each path on its own -- so it lands on a plain rule AND on a node's frame, and it beats the
        # brackets' own `line width=1pt` (1.993pt on the page), while the statement's key (0.398) and a
        # style the statement invokes (0.797) still outrank it: `_work/measure91_every_path.py`.  The
        # corpus writes it 12 times over 8 papers, always as a weight alone
        # (`_work/probe138_scope_style_contents.py`).
        def pic(head, stmt):
            return cetz.build(r"\begin{tikzpicture}" + head + stmt + r"\end{tikzpicture}")
        self.assertIn("thickness: 2.0pt",
                      pic("[every path/.style={line width=2pt}]", r"\draw (0,0)--(2,0);"))
        self.assertIn("thickness: 2.0pt",
                      pic("[every path/.style={line width=2pt}, line width=1pt]",
                          r"\draw (0,0)--(2,0);"))
        self.assertIn('stroke: (thickness: 2.0pt, miter-limit: 10)',
                      pic("[every path/.style={line width=2pt}]", r"\node[draw] at (1,1) {X};"))
        self.assertIn("thickness: 0.4pt",
                      pic("[every path/.style={line width=2pt}]",
                          r"\draw[line width=0.4pt] (0,0)--(2,0);"))
        self.assertIn("thickness: 0.4pt",
                      pic("[every path/.style={line width=2pt}]", r"\draw[thin] (0,0)--(2,0);"))
        self.assertIn("thickness: 0.8pt",
                      pic("[every path/.style={line width=2pt}, my/.style={line width=0.8pt}]",
                          r"\draw[my] (0,0)--(2,0);"))
        # a name inside the declaration is still a name, and a head cap key stays with the cap
        self.assertIn("thickness: 1.6pt",
                      pic("[every path/.style={ultra thick}]", r"\draw (0,0)--(2,0);"))
        self.assertIn('cap: "round"',
                      pic("[every path/.style={line width=2pt}, line cap=round]",
                          r"\draw (0,0)--(2,0);"))

    def test_a_rounded_rectangle_path_carries_its_corner_radius(self):
        # pgf rounds the corners of a `rectangle` path, not only a node's frame, and CeTz's `rect`
        # takes the same `radius:`. 4pt is pgf's own default, a written dimension keeps its unit
        # (_work/measure_rounded_corners.py: the arcs start 3.985bp from the corner for a bare
        # `rounded corners` and 7.970bp for `=8pt` -- fitz counts bp, which is 0.99651 of a TeX pt).
        def pic(body):
            return cetz.build(r"\begin{tikzpicture}" + body + r"\end{tikzpicture}")
        self.assertIn("rect((0, 0), (2, 1), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)",
                      pic(r"\draw[rounded corners] (0,0) rectangle (2,1);"))
        self.assertIn("radius: 8pt", pic(r"\draw[rounded corners=8pt] (0,0) rectangle (2,1);"))
        self.assertIn("radius: 28.35pt", pic(r"\draw[rounded corners=1cm] (0,0) rectangle (2,1);"))
        # the key reaches the rectangle through a declared style as readily as through the brackets
        self.assertIn("radius: 6pt", pic(
            r"\tikzset{box/.style={draw,rounded corners=6pt}}"
            r"\draw[box] (0,0) rectangle (2,1);"))
        # a corner nobody rounded stays square, and a radius that cannot be read is left out rather
        # than guessed -- the same rule the node frame already follows
        self.assertNotIn("radius", pic(r"\draw (0,0) rectangle (2,1);"))
        self.assertNotIn("radius", pic(r"\draw[rounded corners=soon] (0,0) rectangle (2,1);"))
        self.assertIn("#box(inset: 0.3333em, radius: 4pt", pic(r"\node[draw,rounded corners] {x};"))

    def test_a_style_table_declared_inside_the_picture_frames_its_nodes(self):
        # a flowchart that only needs its styles mid-body writes `\tikzset{bit/.style={…}}`; the
        # statement draws nothing, so it was an unknown verb that refused the whole picture and
        # left the reader a block of quoted LaTeX instead of the drawing. The range is the DECLARED
        # box shrunk by sqrt(2), because CeTz puts the CIRCUMSCRIBED circle of the range it is given
        # around it -- see test_a_circle_keeps_its_round_border_whatever_it_declares.
        # around a `draw` with no colour of its own the rule is now named out loud at pgf's own 0.4pt.
        # Typst answers 1pt for a frame nobody tells it otherwise about, and _work's
        # probe_frame_stroke_none.py reads the two spellings' PDFs as widths 1 and 0.4.
        self.assertIn('content((-0.06236, -0.06236), (0.06236, 0.06236), [#set text(hyphenate:'
                      ' false); #align(center + horizon)[1]], frame: "circle",'
                      ' stroke: (thickness: 0.4pt, miter-limit: 10))',
                      cetz.build(r"\begin{tikzpicture}\tikzset{bit/.style={circle,draw,"
                                 r"minimum size=5pt,inner sep=0pt}}\node[bit] (a) at (0,0) {1};"
                                 r"\end{tikzpicture}"))
        # a \tikzset that also sets a picture-wide default we cannot honour is not silently dropped
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\tikzset{line width=2pt}"
                                     r"\node (a) {1};\end{tikzpicture}"))

    def test_a_circle_keeps_its_round_border_whatever_it_declares(self):
        # pgf's `circle` has ONE diameter: with pdflatex `minimum width=1cm`, `minimum height=1cm` and
        # `minimum size=1cm` each read `east - center` as 14.426pt on BOTH axes, and two unequal keys
        # take the larger in either order (_work/measure_shaped_node_frame.py). CeTz frames a range
        # with the CIRCUMSCRIBED circle of it, so the range is the declared measure shrunk by sqrt(2):
        # 0.9030cm drawn against pdflatex's 0.9000 for `minimum size=9mm`, where the unshrunk range
        # gave 1.2758cm (_work/measure_cetz_frame_circle.py). Before this a circle that declared one
        # measure was drawn by Typst as a rectangle and lost its shape.
        for decl in ("minimum width=1cm", "minimum height=1cm", "minimum size=1cm"):
            self.assertIn('content((-0.3536, -0.3536), (0.3536, 0.3536), [#set text(hyphenate:'
                          ' false); #align(center + horizon)[ab]], frame: "circle"',
                          cetz.build(r"\begin{tikzpicture}\node[circle, draw, %s] (a) at (0,0)"
                                     r" {ab};\end{tikzpicture}" % decl))
        # `[shape=circle]` names the same outline and both spellings are in the corpus
        self.assertIn('frame: "circle"',
                      cetz.build(r"\begin{tikzpicture}\node[shape=circle, draw, minimum size=1cm]"
                                 r" (a) at (0,0) {ab};\end{tikzpicture}"))
        # a circle nobody sized is drawn around its own words -- Typst measures them, and `padding:`
        # is what carries `inner sep` into the frame (an `inset:` there changes nothing); the two
        # engines then agree to 3% on the same bodies (_work/measure_circle_pair_engines.py)
        self.assertIn('content((0, 0), [ab], frame: "circle", padding: 0.03528cm',
                      cetz.build(r"\begin{tikzpicture}\node[circle, draw, inner sep=1pt] (a) at"
                                 r" (0,0) {ab};\end{tikzpicture}"))
        # an empty node is a circle of its own padding, sqrt(2) * `inner sep` -- the `inner sep=1pt`
        # vertex dot the corpus writes 773 times lands on the 0.05cm the converter used to hardcode,
        # and a declared measure wins once it is the larger of the two
        self.assertIn('circle((0, 0), radius: 0.04989, stroke: (thickness: 0.4pt, miter-limit: 10))',
                      cetz.build(r"\begin{tikzpicture}\node[circle, draw, inner sep=1pt] (a) at"
                                 r" (0,0) {};\end{tikzpicture}"))
        self.assertIn('circle((0, 0), radius: 0.5, stroke: (thickness: 0.4pt, miter-limit: 10))',
                      cetz.build(r"\begin{tikzpicture}\node[circle, draw, minimum size=1cm] (a) at"
                                 r" (0,0) {};\end{tikzpicture}"))
        # nothing asked for a border, so nothing is drawn -- a bare `\node` is ink and place only
        self.assertIn('content((0, 0), [ab])',
                      cetz.build(r"\begin{tikzpicture}\node[circle, inner sep=1pt] (a) at (0,0)"
                                 r" {ab};\end{tikzpicture}"))

    def test_a_sized_frame_holds_its_words_in_the_middle(self):
        # A node's words sit MID-HEIGHT in the box whose size the author wrote down: pdflatex reads
        # dX 0.00, dY +0.45pt for one line and for two (_work/measure_tex_node_text_centre.py), the
        # same dY an unsized node gives. Neither engine does that on its own -- CeTz lays the body of
        # a `content(range, ..., frame:)` at the range's TOP-LEFT (a letter in a 2cm x 1cm box sits dX
        # -26.1pt, dY +11.2pt off its centre, _work/measure_cetz_range_align.py) and Typst puts a
        # fixed-height `box`'s content at its top as well (bare ink mid 1.1296 against box mid 2.0000
        # in a declared 3cm x 2cm) -- so both need the same call, and `#align(<horizontal> + horizon)`
        # lands both halves on either one (CeTz: -0.1, -0.4; Typst: ink 2.0020 against box 2.0000,
        # _work/measure_box_vertical_align.py).
        self.assertIn('#box(width: 2cm, height: 1cm',
                      cetz.build(r"\begin{tikzpicture}\node[draw, minimum width=2cm,"
                                 r" minimum height=1cm] (a) at (0,0) {j};\end{tikzpicture}"))
        self.assertIn('#align(center + horizon)[j]]',
                      cetz.build(r"\begin{tikzpicture}\node[draw, minimum width=2cm,"
                                 r" minimum height=1cm] (a) at (0,0) {j};\end{tikzpicture}"))
        # the horizontal half stays the author's word: `align=` wins, and a forced paragraph width
        # with no `align=` is ragged-left in TeX -- but mid-height all the same
        self.assertIn('#align(right + horizon)[j]]',
                      cetz.build(r"\begin{tikzpicture}\node[draw, minimum width=2cm,"
                                 r" minimum height=1cm, align=right] (a) at (0,0)"
                                 r" {j};\end{tikzpicture}"))
        self.assertIn('#align(left + horizon)[ab cd ef]]',
                      cetz.build(r"\begin{tikzpicture}\node[draw, text width=2cm,"
                                 r" minimum height=1cm] (a) at (0,0)"
                                 r" {ab cd ef};\end{tikzpicture}"))
        # a frame Typst measures for itself has no middle to sit in: the box hugs its text, so the
        # vertical call belongs to the range path only -- and the round node drawn from its own words
        # (`frame: "circle", padding:`) is the same case
        for pic in (r"\node[draw, minimum width=2cm] (a) at (0,0) {j};",
                    r"\node[circle, draw, inner sep=1pt] (a) at (0,0) {ab};"):
            self.assertNotIn("horizon",
                             cetz.build(r"\begin{tikzpicture}" + pic + r"\end{tikzpicture}"))

    def test_a_node_positioned_by_two_distances_reads_which_is_which(self):
        # 'below left=12mm and -12mm of t' names the two axes in the order its direction word
        # does, measured against pdflatex in _work/measure_positioned.py: the first number moved
        # the vertical of 'below left' and the second its horizontal. OF_TARGET read one number
        # for both axes, so every two-value node in the corpus refused its picture.
        #
        # The two axes each carry the two boxes' own half-extent, because TikZ measures the distance
        # edge to edge: pdflatex reads `right=12mm of t` between two single-letter nodes as x=1.7605cm
        # -- 12mm plus t's 0.2753cm and the placed node's own 0.2807cm (_work/measure_positioned_own_
        # width.py, which also answers `below left=12mm and -12mm of t` at 0.6485 where we write
        # 0.6685). The heights are `_text_height`'s ink law -- a capital letter stands 13.896pt at
        # the body size, against pdflatex's 13.8993 for `T` (_work/node_vertical_ink.txt) -- and the
        # widths come from #73's ink count, so a bare node moves its neighbour on both axes.
        def placed(opt, decl=r"\node (t) at (0,0) {T};"):
            built = cetz.build(r"\begin{tikzpicture}" + decl +
                               r"\node[" + opt + r"] {N};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content" in line][-1]

        self.assertEqual(placed("below left=12mm and -12mm of t"),
                         "content((0.6685, -1.69), [N])")
        self.assertEqual(placed("above right=1cm and 2cm of t"), "content((2.531, 1.49), [N])")
        # one distance still means both axes, and a length we cannot read moves nothing
        self.assertEqual(placed("below=1cm of t"), "content((0, -1.49), [N])")
        self.assertEqual(placed("right=1cm and 2cm of t"), "content((1.531, 0), [N])")
        # 'below=of a' writes no distance and means \\node distance, and 'of a.south' names the
        # reference's own anchor -- the two spellings the corpus's flowcharts actually use
        self.assertEqual(placed("below=of t"), "content((0, -1.49), [N])")
        self.assertEqual(placed("below=23mm of t.south"), "content((0, -2.79), [N])")
        # a box the author fixed moves the anchor the text one cannot
        self.assertEqual(placed("below=1cm of t.south",
                                r"\node[minimum size=2cm] (t) at (0,0) {T};"),
                         "content((0, -2.245), [N])")
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}\node (t) at (0,0) {T};"
                                     r"\node[below left=1foo and 2cm of t] {N};"
                                     r"\end{tikzpicture}"))

    def test_a_fit_node_gathers_the_box_its_references_stand_in(self):
        # `\node[fit=(a)(b)] (f) {}` names a box, not a point: pgf builds it as the UNION of the
        # boxes a and b, and a placement off `f` reads that box like any other node's border.  Left
        # unread the name is no name at all, `below=10mm of branches` falls back to the scope origin,
        # and the third stage of a flowchart lands on its second (_work/label104c_fit_face.py: 4 of
        # the corpus's 5 fit= statements are consumed this way, over 4 canvases / 4 papers).
        #
        # The numbers below are pgf's own anchors, dumped through `\pgfpointanchor` + `\pgfgetlastxy`
        # (`_work/measure_fit_box.py`, in cm at x=y=1cm) for two `text width=2cm` nodes standing at
        # (0,0) and (3.2,2.4) -- a = x [-1.1242, +1.1242] y [-0.4273, +0.4273], b the same width at
        # y [2.1660, 2.6340] -- and for a = 2cm-square and b at (4,3).
        def rect(opt, names=None):
            return cetz.fit_rect(cetz.opts(opt), names or {
                "a": (0.0, 0.0, 1.1242, 0.4273, None),
                "b": (3.2, 2.4, 1.1242, 0.234, None)}, cetz.IDENT)

        # both seps written as nothing is the bare union, to the last decimal
        got = rect("fit=(a)(b),inner sep=0pt,outer sep=0pt")
        self.assertAlmostEqual(got[0], 1.6000, places=4)
        self.assertAlmostEqual(got[1], 1.1033, places=4)
        self.assertAlmostEqual(got[2], 2.7242, places=4)
        self.assertAlmostEqual(got[3], 1.5307, places=4)
        # the node's own padding grows the union on EVERY side, and writing neither spends pgf's
        # default .3333em at the class size plus a half-pen, which reads 0.1241cm a side
        widened = rect("fit=(a)(b)")
        self.assertAlmostEqual(widened[2] - got[2], 0.1241, delta=0.001)
        self.assertAlmostEqual(widened[3] - got[3], 0.1241, delta=0.001)
        # an axis the author separated keeps its own length and costs nothing on the other
        axes = rect("fit=(a)(b),inner xsep=4mm,inner ysep=8mm,outer sep=0pt")
        self.assertAlmostEqual(axes[2] - got[2], 0.4, places=4)
        self.assertAlmostEqual(axes[3] - got[3], 0.8, places=4)
        # a bare `\coordinate` has no box, so the gathered rect is the one THROUGH the two points
        pts = rect("fit=(p)(q),inner sep=0pt", {"p": (-1.0, -1.0, None, None, None),
                                                "q": (4.0, 3.0, None, None, None)})
        self.assertAlmostEqual(pts[0], 1.5, places=4)
        self.assertAlmostEqual(pts[1], 1.0, places=4)
        self.assertAlmostEqual(pts[2] - 2.5, 0.007, delta=0.001)
        self.assertAlmostEqual(pts[3] - 2.0, 0.007, delta=0.001)
        # a name the picture never declares gathers nothing, and the picture is refused on it rather
        # than standing the node on the scope origin
        self.assertIsNone(rect("fit=(a)(missing)"))

        # end to end, where the boxes are the emitter's own measure so the law can be read exactly:
        # two 2cm squares at (0,0) and (4,3) gather into x [-1, 5] y [-1, 4], and the node placed
        # 10mm under it leaves edge to edge -- its north edge at -2, its centre a half-height lower.
        built = cetz.build(r"\begin{tikzpicture}[x=1cm,y=1cm]"
                           r"\node[minimum size=2cm] (a) at (0,0) {A};"
                           r"\node[minimum size=2cm] (b) at (4,3) {B};"
                           r"\node[fit=(a)(b),inner sep=0pt,outer sep=0pt,draw] (f) {};"
                           r"\node[minimum size=2cm,below=10mm of f] (g) {N};"
                           r"\end{tikzpicture}")
        self.assertIn("rect((-1, -1), (5, 4)", built)
        self.assertIn("content((2, -3), [#box(width: 2cm", built)
        # the same stack with an invisible gatherer ships no border yet still moves the neighbour
        hidden = cetz.build(r"\begin{tikzpicture}[x=1cm,y=1cm]"
                            r"\node[minimum size=2cm] (a) at (0,0) {A};"
                            r"\node[minimum size=2cm] (b) at (4,3) {B};"
                            r"\node[fit=(a)(b),inner sep=0pt,outer sep=0pt] (f) {};"
                            r"\node[minimum size=2cm,below=10mm of f] (g) {N};"
                            r"\end{tikzpicture}")
        self.assertNotIn("rect(", hidden)
        self.assertIn("content((2, -3), [#box(width: 2cm", hidden)

    def test_the_pictures_own_node_distance_separates_the_bare_placements(self):
        # `node distance=13mm and 36mm` on the picture's own brackets is the gap every bare
        # `right=of t` inside it separates its boxes by, and the head names its two axes in the
        # order OPPOSITE to a statement's: 13mm moved the vertical and 36mm the horizontal, where
        # `right=1cm and 2cm of t` in the test above follows its own direction word
        # (_work/m100_nd_probe.tex, read back by _work/probe100b_read_nd.py: `B.west - A.east` comes
        # back 102.430pt = 36mm against the default 28.453pt = 1cm, and `B.south - A.north` 36.989pt
        # = 13mm; a reference node three times as wide leaves the same 102.430pt, the gap being edge
        # to edge). A single value answers both axes and a distance the statement writes itself
        # outranks the head. Left unread until #100, 52 pictures over 48 papers placed their nodes by
        # 1cm while the author wrote up to 36mm (_work/probe100_node_distance_face.py) -- and the key
        # is only ever on the head: 56 pictures there, 0 on a scope, in a `\tikzset{}` or on a node
        # statement (_work/probe100c_where_node_distance.py). A head value we cannot read refuses the
        # picture rather than drawing it at the default.
        def placed(opt, head=None):
            built = cetz.build(r"\begin{tikzpicture}" + ("[" + head + "]" if head else "") +
                               r"\node (t) at (0,0) {T};" +
                               r"\node[" + opt + r"] {N};\end{tikzpicture}") or ""
            return ([line.strip() for line in built.splitlines() if "content(" in line][-1]
                    if built else None)

        dist = "node distance=13mm and 36mm"
        self.assertEqual(placed("right=of t", dist), "content((4.131, 0), [N])")
        self.assertEqual(placed("above=of t", dist), "content((0, 1.79), [N])")
        swap = "node distance=36mm and 13mm"
        self.assertEqual(placed("right=of t", swap), "content((1.831, 0), [N])")
        self.assertEqual(placed("above=of t", swap), "content((0, 4.09), [N])")
        self.assertEqual(placed("right=of t", "node distance=2cm"), "content((2.531, 0), [N])")
        # a diagonal takes each axis's own component, with no 1/sqrt(2) folding -- that is the
        # direction-key-with-a-length law (轴 63), not this one
        self.assertEqual(placed("above right=of t", dist), "content((4.131, 1.79), [N])")
        self.assertEqual(placed("right=2cm of t", dist), placed("right=2cm of t"))
        self.assertIsNone(placed("right=of t", "node distance=1foo"))

    def test_a_node_positioned_off_a_calc_reference_lands_on_it(self):
        # 'below=16mm of $(count)!0.5!(bounds)$' names the midpoint of two anchors, not a box:
        # OF_TARGET read only a bare name, so the node fell through to the scope origin and drew
        # on top of whatever else stood there (the Purely-Cosmetic structure figure, where the
        # wide 'Compatible perturbations' box sat on 'Ordinary units and cap pairing'). The calc
        # reference is read by _calc_point, and its answer is a point with no box, so the gap is
        # measured from that point.
        decl = (r"\node[text width=1cm] (count) at (0,0) {C};"
                r"\node[text width=1cm] (bounds) at (6,0) {B};")

        def placed(opt):
            built = cetz.build(r"\begin{tikzpicture}" + decl +
                               r"\node[" + opt + r"] {N};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertEqual(placed("below=1cm of $(count)!0.5!(bounds)$"),
                         "content((3, -1.245), [N])")
        # an anchor on either operand is honoured, so the midpoint sits on the two south edges
        self.assertEqual(placed("below=1cm of $(count.south)!0.5!(bounds.south)$"),
                         "content((3, -1.49), [N])")
        # a form _calc_point refuses must not fall back to the origin: the picture is refused
        self.assertIsNone(cetz.build(r"\begin{tikzpicture}" + decl +
                                     r"\node[below=1cm of $(count)!2cm!(bounds)$] {N};"
                                     r"\end{tikzpicture}"))

    def test_a_node_sized_by_its_own_text_stands_tall_enough_to_be_stepped_over(self):
        # the Turn-Based flowchart: `stage/.style={text width=5.7cm, align=left, inner sep=8pt}`
        # holds a label the author broke into six rows, one of them with `\\[3pt]`, and
        # `\node[below=6mm of up]` hangs the next box under it. While that label's height went
        # unmeasured the gap was counted from `up`'s CENTRE and the neighbour drew across the box
        # above. pdflatex reads the six rows as 78.275pt -- twice the 8pt inner sep, 4.275pt for the
        # line at \small, 11pt for each of the five rows after the first, and the 3pt the break
        # carries (_work/measure_node_row_height.py) -- so its half-height is 1.3807cm, and the
        # one-line node under it adds its own half of 13.2159pt (_work/node_vertical_ink_small.txt:
        # cmr9's capital over the slack pgf froze at the DOCUMENT's .3333em, not at the 9pt label).
        pic = (r"\begin{tikzpicture}[font=\small,"
               r"stage/.style={draw=black!60,text width=5.7cm,align=left,inner sep=8pt}]"
               r"\node[stage] (up) at (0,0) {one\\[3pt]two\\three\\four\\five\\six};"
               r"\node[below=6mm of up] (p) {P};\end{tikzpicture}")
        lines = [line.strip() for line in cetz.build(pic).splitlines() if "content(" in line]
        self.assertEqual(lines[1], 'content((0, -2.214), [#text(size: 9pt)[P]])')
        # a label TeX never sets as a paragraph does not break at all, so the same three rows stand on
        # one line however many `\\` they carry -- and the line is as tall as the tallest mark any row
        # holds, `b`'s 0.694em (14.0104pt, `_work/node_vertical_ink.txt`), not a guessed height
        bare = cetz.build(r"\begin{tikzpicture}\node (t) at (0,0) {a\\b\\c};"
                          r"\node[below=6mm of t] {P};\end{tikzpicture}")
        self.assertEqual([line.strip() for line in bare.splitlines() if "content(" in line][-1],
                         'content((0, -1.092), [P])')

    def test_a_node_label_is_as_tall_as_the_marks_tex_set_inside_it(self):
        # #74's law, face-on. `_text_height` used to answer one flat 10.3748pt for every label that
        # wrote no height, so it under-measured a `T` by 3.5pt and a `$F_{1,+}^{+,+}$` by 9pt, and a
        # vertical arrow into such a node printed its head across the letters. The two parts come from
        # three control figures: the ink and its ems from `_work/measure_node_vertical_ink.py` (24
        # labels at the class's 10/11/12pt) and `_work/measure_node_roman_letters.py` (each roman
        # letter alone, which is where `f` shows no descender though italic `$f$` does), and the
        # slack from `_work/measure_node_sep_whose_font.py` -- 3.3330pt on every side of a `P` from
        # `\tiny` to a 20pt label, because pgf freezes its `.3333em` default at the DOCUMENT font
        # while the ink follows the node's own. A fifth of a point is the band: it is what the ems
        # rounding of the tables costs, and the rows the law misses are the residuals it names.
        def pts(text, o):
            got = cetz._text_height(o, None, text)
            self.assertIsNotNone(got, text)
            return got / cetz.UNITS["pt"]

        for text, measured in (("T", 13.8993), ("x", 11.3715), ("typical", 15.9548),
                               ("mapsto", 15.1612), ("$y_1$", 13.3159), ("$e^x$", 13.7087),
                               ("$KX_1(D)$", 17.0659), ("$E+u_0$", 15.3992),
                               ("$\\overline{u}$", 13.3714), (r"$\{\ell^2\}$", 17.7060),
                               ("$\\int_0^1 f$", 20.7161), ("$\\mathcal{F}$", 13.8993),
                               ("a\\\\b\\\\c", 14.0104)):
            self.assertAlmostEqual(pts(text, {}), measured, delta=0.2, msg=text)
        # the same label at `font=\small`: the ink is cmr9's, the slack is still the 10pt document's
        small = {"font": "\\small"}
        for text, measured in (("P", 13.2159), ("one", 10.9409), ("Readout", 13.3159),
                               ("$KX_1(D)$", 16.0659)):
            self.assertAlmostEqual(pts(text, small), measured, delta=0.2, msg=text)
        # what each shape pays for, axis by axis, against pdflatex's readings of single maths atoms
        # (`_work/node_glyph_heights.txt`, the 10pt column): an accent rides above its argument and
        # costs nothing below, a root keeps the surd's own depth, a fraction stacks the two halves,
        # and a pair of scripts lifts the sup above the single one it would have been
        for text, top, bottom in (("$u$", 0.431, 0.0), ("$\\hat{u}$", 0.694, 0.0),
                                  ("$\\sqrt{x}$", 0.800, 0.240), ("$\\frac{1}{2}$", 0.845, 0.345)):
            self.assertAlmostEqual(cetz._ink_v(text)[0], top, delta=0.02, msg=text)
            self.assertAlmostEqual(cetz._ink_v(text)[1], bottom, delta=0.02, msg=text)
        # a sub and a sup TOGETHER are the one shape the rule leaves short: TeX drops the subscript
        # to clear the superscript's descender and lifts both further than this pairing, so
        # `$F_{1,+}^{+,+}$` stands 2.4pt taller than we answer. It is #74's named residual, priced
        # through the whole node by `$x_i^2$` in the table above (-0.135pt) and left unfudged here.
        # the ITALIC f of `$f$` descends and the roman f of `five` does not (_work/measure_node_
        # roman_letters.py: every roman depth belongs to g p q y j), so a prose label is not priced
        # as though it carried one
        self.assertEqual(cetz._ink_v("five"), (0.694, 0.0))
        # `\left`…`\right` stretches about the maths axis, and a script ON that group takes the
        # pairing branch of the placement rule -- which reads the atom's own ride flag, and the
        # delimiter answers none. TeX never shrinks the delimiter below its own glyph, though:
        # pdflatex stands `\left(x\right)` at a whole em of ink -- 0.750 over 0.250, the unstretched
        # delimiter -- for `x`, `a`, `u`, `q`, `y` and a prose label alike, while a taller body
        # stretches it about the axis (_work/measure_left_delim_floor.py). TeX then rounds that
        # stretch up to its next sized variant, which we do not: a fraction inside pays +0.108em and
        # an integral misses 0.208em of the rung, the two #74 residuals that stay open.
        for text in (r"$\left(x\right)$", r"$\left|q\right|$", r"$\left\{u\right\}$"):
            self.assertEqual(cetz._ink_v(text), (0.750, 0.250))
        self.assertAlmostEqual(cetz._ink_v(r"$\left(\frac{1}{2}\right)$")[0], 0.904, delta=0.01)
        self.assertGreater(cetz._ink_v(r"$\left(x\right)^{2}$")[0],
                           cetz._ink_v(r"$\left(x\right)$")[0])
        # an axis the author wrote reaches only its own axis, and 0pt leaves the ink alone: pdflatex
        # reads a `T` at 7.2333pt with `inner sep=0pt`, half a point of which is the rule it draws
        self.assertAlmostEqual(pts("T", {"inner ysep": "0pt"}), 6.8333, delta=0.01)
        self.assertAlmostEqual(pts("T", {"inner ysep": "20pt"}), 46.8333, delta=0.01)
        self.assertAlmostEqual(pts("T", {"inner xsep": "20pt"}), pts("T", {}), delta=0.01)
        # and a PARAGRAPH label is priced by its rows: six of them at \small, one carrying `\\[3pt]`,
        # are pdflatex's 78.275pt -- the 4.275pt line TeX keeps for the first row rather than the
        # 3.879pt of its own `one`, 11pt of leading for each row after it, the 3pt written, and the
        # 8pt of `inner sep` the style gives on both axes (_work/measure_node_row_height.py)
        stage = {"font": "\\small", "text width": "5.7cm", "align": "left", "inner sep": "8pt"}
        self.assertAlmostEqual(pts("one\\\\[3pt]two\\\\three\\\\four\\\\five\\\\six", stage),
                               78.275, delta=0.2)
        # a paragraph at a leading the table never measured is left unpriced rather than guessed
        self.assertIsNone(cetz._text_height({"text width": "2cm",
                                             "font": "\\fontsize{11}{13}"}, None, "a"))

    def test_an_arrow_into_a_node_the_author_never_sized_stops_at_its_words(self):
        # the witness on the page (Novikov p14, BSD p16): `(a) -- (b)` between two nodes carrying no
        # measure was clipped at their CENTRES, so the arrowhead printed inside the letters. TikZ
        # sizes such a node to its label -- pdflatex reads `\node {$U_+$}` as `east - center` =
        # 11.143pt at 11pt, the ink's 14.588pt halved plus `.3333em` and half the 0.4pt rule, the
        # same 7.699pt of slack on every label tried (_work/measure_node_label_ink.py), and the ink
        # itself is INK_EM a visible character (_work/measure_node_label_width.py: 67 of the corpus's
        # own labels, median error +1.3% on the border, and the tip clears the ink on 61 of 67).
        pic = (r"\begin{tikzpicture}\node (a) at (0,0) {$U_+$};"
               r"\node (b) at (3,0) {$X$};\draw (a) -- (b);\end{tikzpicture}")
        # 0.3275cm is short of TeX's border (0.393cm at its metrics) but past the last glyph's
        # 0.257cm, which is the line the head must not cross
        self.assertIn("line((0.3275, 0), (2.734, 0)", cetz.build(pic))
        # a label TeX sets as a PARAGRAPH is as wide as its widest row, and one it never breaks runs
        # on a single line however many `\\` it carries -- the same `one\\twothree` prices 4em under
        # `align=` and 5.5em without it, the one-line half being what `_text_height` measured too
        rows = r"\begin{tikzpicture}\node%s (a) at (0,0) {one\\twothree};" \
               r"\node (b) at (4,0) {X};\draw (a) -- (b);\end{tikzpicture}"
        self.assertIn("line((0.8302, 0)", cetz.build(rows % "[align=center]"))
        self.assertIn("line((1.095, 0)", cetz.build(rows % ""))
        # where the author fixed a measure that number stands alone: a `text width=2cm` node is the
        # 2.2cm box Typst is told to lay out, and the counted ink never argues with it
        sized = (r"\begin{tikzpicture}\node[text width=2cm] (a) at (0,0) {N};"
                 r"\node (b) at (4,0) {X};\draw (a) -- (b);\end{tikzpicture}")
        self.assertIn("line((1.118, 0)", cetz.build(sized))
        # and a neighbour `right=1cm of` such a node steps over its words: 0.786cm of box plus the
        # written centimetre plus the half-width of the one-letter node that moves
        step = (r"\begin{tikzpicture}\node (a) at (0,0) {$KX_1(B)$};"
                r"\node[right=1cm of a] (b) {P};\end{tikzpicture}")
        self.assertIn("content((2.052, 0), [P])", cetz.build(step))

    def test_a_node_pinned_by_an_anchor_records_its_centre_not_its_coordinate(self):
        # The name table is read as a CENTRE, and an anchored node's centre is not the place it names:
        # `\node[anchor=west] (qf label) at (2.70,0)` (Novikov p14) stands with its west edge on
        # 2.70cm and its centre a half-width east of there. pdflatex reads that centre at x=3.5818cm
        # for `$F_{1,+}^{+,+}$` at (3cm, 1cm), the coordinate plus `east - center` = 0.5705cm, and the
        # same step on `north` (y=0.6060) and on the corner (`_work/measure_anchor_center.py`). Charged
        # at zero while labels had no width, the reading put the point itself at the centre -- and once
        # #73 priced the ink, `(qf label.west)` clipped from 2.70cm out to 2.103cm, a whole half-box
        # west of the letters. Typst needs no such step: its `anchor:` moves the laid-out body.
        pinned = (r"\begin{tikzpicture}\node[anchor=west] (qf label) at (2.70,0.00) "
                  r"{$F_{1,+}^{+,+}$};\draw[line width=0.45pt] "
                  r"(qf label.west)--(2.38,0.00);\end{tikzpicture}")
        self.assertIn("line((2.7, 0), (2.38, 0)", cetz.build(pinned))
        # the same step the named point takes, read straight off the centre: pdflatex stands a bare
        # `T` 13.8993pt tall (_work/node_vertical_ink.txt), so its centre is 0.2451cm above the spot
        centre = (r"\begin{tikzpicture}\node[above] (a) at (0,0) {T};"
                  r"\draw (a.center) -- (0,2);\end{tikzpicture}")
        self.assertIn("line((0, 0.2451), (0, 2)", cetz.build(centre))

    def test_an_unturned_anchor_lands_on_the_box_pgf_pins_not_on_the_words(self):
        # pgf pins the named point of the node's BOX, and the box's slack is `.3333em` of the CLASS the
        # package was loaded at, not of the node's own `font=`: pdflatex reads the same 3.333pt around a
        # `P` from `\tiny` to a 20pt label (`_work/measure_node_sep_whose_font.py`) and the same edge on
        # `[anchor=east]` and `[anchor=east,font=\small]` (`_work/label103b_unrotated_pad.txt`, which
        # puts this engine's ink 3.49pt and 3.52pt past pgf with no `padding:` and 0.16pt and 0.52pt
        # with it).  So the pad is not the turn's reward -- and 0.1cm, the same `.3333em` read at the
        # wrong size, is half a point short on every one of these forms.
        def node(opts):
            built = cetz.build(r"\begin{tikzpicture}\node[" + opts +
                               r"] at (0,0) {band};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertEqual(node("anchor=east"),
                         'content((0, 0), [band], anchor: "east", padding: 0.1176cm)')
        self.assertEqual(node("anchor=west,font=\\small"),
                         'content((0, 0), [#text(size: 9pt)[band]], anchor: "west", padding: 0.1176cm)')
        # the turn keeps exactly the same value it did before this law widened
        self.assertEqual(node("rotate=90,anchor=south"),
                         'content((0, 0), [band], anchor: "south", angle: 90deg, padding: 0.1176cm)')
        # a node pinned at its CENTRE is the form no symmetric pad can move (#101i rows 5 and 6)
        self.assertEqual(node("anchor=center"),
                         'content((0, 0), [band], anchor: "center", padding: 0.1176cm)')
        # a measure or a frame already carries the sep inside the body as `inset:`, not as padding
        self.assertNotIn("padding:", node("anchor=east,text width=2cm"))
        self.assertNotIn("padding:", node("anchor=east,draw,minimum width=2cm"))
        # and the author's own `inner sep` still overrides the default on the side it names
        self.assertEqual(node("anchor=west,inner sep=1mm"),
                         'content((0, 0), [band], anchor: "west", padding: 0.1cm)')

    def test_a_node_held_by_a_named_point_pins_that_point_on_the_coordinate(self):
        # 'above' does not move the box, it says which of the box's points sits on the spot: the
        # south one. CeTz's content carries that as an offset anchor, but spells its corners with
        # a hyphen (anchor.typ's named-border-anchors) where TikZ writes 'north west'. Measured on
        # the corpus in _work/probe_anchor_population.py: 4,179 anchors over 418 papers.
        def pinned(opt, decl=""):
            built = cetz.build(r"\begin{tikzpicture}" + decl +
                               r"\node[" + opt + r"] at (1,1) {N};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertEqual(pinned("above"), 'content((1, 1), [N], anchor: "south", padding: 0.1176cm)')
        self.assertEqual(pinned("below"), 'content((1, 1), [N], anchor: "north", padding: 0.1176cm)')
        self.assertEqual(pinned("right"), 'content((1, 1), [N], anchor: "west", padding: 0.1176cm)')
        self.assertEqual(pinned("above right"), 'content((1, 1), [N], anchor: "south-west", padding: 0.1176cm)')
        # both of TikZ's corner spellings, and a label written on a segment asks the same question
        self.assertEqual(pinned("anchor=north east"), 'content((1, 1), [N], anchor: "north-east", padding: 0.1176cm)')
        self.assertEqual(pinned("anchor=north-west"), 'content((1, 1), [N], anchor: "north-west", padding: 0.1176cm)')
        built = cetz.build(r"\begin{tikzpicture}\draw (0,0) -- node[above] {mid} (4,0);"
                           r"\end{tikzpicture}") or ""
        self.assertIn('content((2, 0), [mid], anchor: "south", padding: 0.1176cm)', built)
        # a point we do not know leaves the text centred rather than shifted by a guess. A node
        # carrying a frame asks the same question and gets the same answer: CeTz moves the laid-out box
        # it has measured, so no half height of ours is involved (`_work/measure_node_anchor_north.py`,
        # and #62 found 262 such nodes over 69 papers drawn straddling their coordinate)
        self.assertEqual(pinned("anchor=north west corner"), "content((1, 1), [N])")
        self.assertEqual(pinned("draw,above"),
                         'content((1, 1), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), '
                         '[#set text(hyphenate: false, top-edge: "cap-height", '
                         'bottom-edge: "baseline"); #align(center)[N]])], anchor: "south")')
        self.assertTrue(pinned("draw,minimum width=2cm,anchor=north west")
                        .endswith(', anchor: "north-west")'))

    def test_an_edge_label_that_names_its_distance_stands_that_far_off_the_line(self):
        # `above=20pt` is the spelling an edge label writes, and it carries TWO promises: the same
        # south point pinned on the spot, and that point moved 20pt off it. pdflatex
        # (_work/measure_side_key_offset.py) puts the south anchor exactly `d` away -- no half
        # height, no `outer sep` added -- so the shift is the dimension and nothing else.
        def pinned(opt, decl=""):
            built = cetz.build(r"\begin{tikzpicture}" + decl +
                               r"\node[" + opt + r"] at (1,1) {N};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertEqual(pinned("above=20pt"), 'content((1, 1.706), [N], anchor: "south", padding: 0.1176cm)')
        self.assertEqual(pinned("below=6mm"), 'content((1, 0.4), [N], anchor: "north", padding: 0.1176cm)')
        self.assertEqual(pinned("right=1cm"), 'content((2, 1), [N], anchor: "west", padding: 0.1176cm)')
        self.assertEqual(pinned("left=1cm"), 'content((0, 1), [N], anchor: "east", padding: 0.1176cm)')
        # an explicit anchor keeps its own point and still moves by the distance
        self.assertEqual(pinned("above=20pt,anchor=north"),
                         'content((1, 1.706), [N], anchor: "north", padding: 0.1176cm)')
        # on a segment the label hangs off the point it was placed at, exactly as it does standalone
        built = cetz.build(r"\begin{tikzpicture}\draw (0,0) -- node[above=20pt] {t} (4,0);"
                           r"\end{tikzpicture}") or ""
        self.assertIn('content((2, 0.7056), [t], anchor: "south", padding: 0.1176cm)', built)
        # `above=6mm of up` places the node beside another one, which `placed_at` answers on its own
        # terms; a distance we cannot read (pgf's `em` is the font's own) moves nothing rather than
        # half-applying an anchor the caller would then have nothing to pair with.
        self.assertNotIn("anchor", pinned("above=6mm of up"))
        self.assertEqual(pinned("above=2em"), "content((1, 1), [N])")

    def test_a_diagonal_side_key_carries_its_distance_as_a_radius_not_per_axis(self):
        # `above left=2pt` writes the same two promises on a corner, and pdflatex
        # (_work/measure_diagonal_offset.py, positioning library loaded) measures the SECOND one
        # differently from the single-side case: the corner travels `d` along the 45-degree ray, so
        # each axis takes d/sqrt(2) -- 2pt gives (-1.4142, +1.4142)pt, not (-2, +2)pt. The corner it
        # pins is the one the bare spelling already picks (SIDE_ANCHOR), and `outer sep` adds nothing.
        def pinned(opt):
            built = cetz.build(r"\begin{tikzpicture}"
                               r"\node[" + opt + r"] at (1,1) {N};\end{tikzpicture}") or ""
            return [line.strip() for line in built.splitlines() if "content(" in line][-1]

        self.assertEqual(pinned("above left=2pt"), 'content((0.9501, 1.05), [N], anchor: "south-east", padding: 0.1176cm)')
        self.assertEqual(pinned("above right=3pt"), 'content((1.075, 1.075), [N], anchor: "south-west", padding: 0.1176cm)')
        self.assertEqual(pinned("below left=2mm"), 'content((0.8586, 0.8586), [N], anchor: "north-east", padding: 0.1176cm)')
        self.assertEqual(pinned("below right=1cm"), 'content((1.707, 0.2929), [N], anchor: "north-west", padding: 0.1176cm)')
        self.assertEqual(pinned("above left=2pt,anchor=north"),
                         'content((0.9501, 1.05), [N], anchor: "north", padding: 0.1176cm)')
        # the two spellings this round deliberately does not honour: `d1 and d2` is per-axis and only
        # ever appears with `of` in the corpus, and `left above` is not a TikZ key at all -- both stay
        # where they were, so no mapping is invented for a writing no author uses.
        self.assertEqual(pinned("above left=2pt of x"), "content((1, 1), [N])")
        self.assertEqual(pinned("above left=2pt and 4pt"), "content((1, 1), [N])")
        self.assertEqual(pinned("left above=2pt"), "content((1, 1), [N])")

    def test_an_accent_written_on_a_node_composes_into_its_letter(self):
        # The markup pass deletes command names, and TeX's accent IS a command name with a letter
        # after it: `K\"ahler` lost its backslash and Typst set the bare `"` as a curly quote, so
        # the figure printed `K“ahler`. `_accents` runs first and hands the pair to Unicode.
        # Measured end to end in _work/probe_accent_emit.py: the page reads `Hyperkähler`.
        built = cetz.build(r"\begin{tikzpicture}\node[draw] at (0,0) "
                           r"{Hyperk\"ahler caf\'{e} \v{c}esk\'a};\end{tikzpicture}") or ""
        self.assertIn("Hyperkähler café česká", built)
        self.assertTrue(cetz.convert(r"\begin{tikzpicture}\node[draw] at (0,0) "
                                     r"{\"{o}ver \u{a}ppel};\end{tikzpicture}"))
        # a punctuation symbol takes its letter directly, a letter command only across a space or a
        # group: TeX reads `\vc` and `\color` as one word each, and an instrument that forgets that
        # finds 369 accents in this corpus's `\draw` statements
        for chunk in (r"\color red", r"\draw node", r"\vc", r"\cycle", r"\alpha"):
            self.assertEqual(cetz._accents(chunk), chunk)
        self.assertEqual(cetz._accents(r"\v c \vc \v{c}"), "č \\vc č")

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

    def test_a_formula_that_quotes_an_external_bibliography_cites_it(self):
        # a paper carrying refs.bib has no numbers to bake before Typst runs, so a `\citep` inside a
        # display printed `[??]`. The key crosses pandoc as a token and comes back a real citation:
        # measured on one page, `#cite` is legal inside `$ ... $` and the note follows it as text
        # (`[17] Lemma 2.9, Equation (19)` on the Kadisons paper's page 4).
        conv = cetz.mathconv
        refs = {"Dickson2014": (conv.cite_token("Dickson2014"), "")}
        got, refused, _err = conv.convert_formulas(
            ["$ a=b \\qquad\\text{\\citep[Lemma~2.9]{Dickson2014}}. $"], refs)
        self.assertFalse(refused)
        self.assertIn('#cite(label("Dickson2014"))', got[0])
        self.assertIn("Lemma 2.9", got[0])
        self.assertNotIn("??", got[0])
        self.assertNotIn("ZQMCITE", got[0])
        # a key the bibliography never defines still reads as unresolved, and a citation with no
        # note carries no trailing text
        plain, _r, _e = conv.convert_formulas(["$ a=b \\text{\\citep{Nope}} $"], refs)
        self.assertIn("??", plain[0])
        cited, _r, _e = conv.convert_formulas(["$ a=b \\text{\\citep{Dickson2014}} $"], refs)
        self.assertEqual(cited[0].count("upright"), 0)

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
        # 'arrow.l.curve' is a Typst symbol name; the 'curve' a `\mathrm{curve}` carries is a word,
        # and Typst reads an unquoted one as a variable and fails the canvas -- so the argument is
        # quoted inside the `upright(...)` function the declaration selects.
        self.assertEqual(cetz._math_body(r"\curvearrowleft"), "arrow.l.curve")
        self.assertEqual(cetz._math_body(r"\mathrm{curve}"), 'upright("curve")')
        # a symbol's own path still has to fuse with the script that follows it
        self.assertEqual(cetz._math_body(r"\Downarrow_x"), "arrow.b.double_x")

    def test_a_script_hangs_from_anything_typst_ends_an_atom_with(self):
        # `math_safe` used to allow a base only from a list -- alphanumerics and `"`, `}`, `)`, `]` --
        # and everything else lost its maths: `_math_body` quotes the formula as a last resort, and a
        # quoted string in Typst math prints the author's own `_`, `^` and command names as letters.
        # Measured against the corpus's own refusals (`_work/measure_refused_formulas.py`): all 80
        # distinct formulas that test rejected compile as the maths they were, so the rule is now the
        # short list of what cannot END an atom -- an opening delimiter or another script.  (A slash is
        # off that list because `_math_body`'s last pass has already turned it into the `"/"` glyph by
        # the time the guard runs; see test_a_slash_in_canvas_maths_... )
        self.assertEqual(cetz._math_body(r"P'_{u,b}"), "P'_(u,b)")
        self.assertEqual(cetz._math_body(r"|E_b|_{g_b}^2"), "|E_b|_(g_b)^2")
        self.assertTrue(cetz.math_safe("A ⊗_(kR) B"))
        self.assertTrue(cetz.math_safe("a +_(x)"))
        self.assertFalse(cetz.math_safe("a (_(x)"))
        self.assertFalse(cetz.math_safe("_(x)"))
        self.assertFalse(cetz.math_safe("a_ ^b"))
        # the KL flowchart box that started the hunt: maths, not the source
        canvas = cetz.convert(r"\begin{tikzpicture}\node (a) at (0,0) "
                              r"{$P_{y,b}=P'_{\iota(y),b'}$};\end{tikzpicture}")
        self.assertIn("[$P_(y,b)=P'_( iota (y),b')$]", canvas)

    def test_tex_s_spacing_token_costs_tex_s_own_space_rather_than_typst_s_punctuation(self):
        # Typst reads a TeX spacing token with its OWN lexer: `\ ` breaks the line and `\,` prints a
        # comma (`_work/probe86_control_space_face.py test`), so the row `$n=-s,\ v=s$` reached the page
        # as two rows whose ink crossed by 3.63pt. pdflatex prices the family in mu with 18mu = 1 quad
        # = 2em (`_work/measure86_space_tokens.py`, the ink gap after a comma over the gap of a space TeX
        # ignores): `\,` 1.664pt = .1664em, `\;` 2.769 = .2769, `\ ` 3.317 = .3317, `\!` -1.664 = -.1664.
        # A `#h(<x>em)` charges exactly that fraction of the size the node is set at, and is written
        # off from what follows it by a space: Typst reads `h(...)(` as a SECOND call and refused 8
        # canvases in run139. Measured (`_work/measure86_h_paren.py`, 10pt): tight and spaced set the
        # same line at a letter -- slope 10.0000 pt/em, base 0.000 -- so the space costs nothing.
        self.assertEqual(cetz._math_body(r"n=-s,\ v=s"), r"n=-s,#h(0.3333em) v=s")
        self.assertEqual(cetz._math_body(r"P(R \, n)"), r"P(R#h(0.1667em) n)")
        self.assertEqual(cetz._math_body(r"u \; v"), r"u#h(0.2778em) v")
        self.assertEqual(cetz._math_body(r"R \! S"), r"R#h(-0.1667em) S")
        # the input separator TeX ignores in maths and Typst prints is eaten with the token, or a
        # `\,` written between two spaces would cost an interword space on top of its thin
        self.assertEqual(cetz._math_body(r"\alpha \, \beta"), "alpha#h(0.1667em) beta")
        # the author's own parenthesis is the case the parser bites on
        self.assertEqual(cetz._math_body(r"y;\ (A,B)"), r"y;#h(0.3333em) (A,B)")
        canvas = cetz.convert(r"\begin{tikzpicture}\node at (0,0) {$y;\ (A,B)$};"
                              r"\end{tikzpicture}")
        self.assertIn("$y;#h(0.3333em) (A,B)$", canvas)
        self.assertTrue(cetz.compiles(canvas))
        # `\\ ` is a line break followed by a space, not a word space: the break keeps its own backslash
        self.assertEqual(cetz.node_text(r"{a\\ b $c\,d$}"), "a#linebreak()b $c#h(0.1667em) d$")
        # a slash after the call rides with it: the guard takes the span as maths now
        canvas = cetz.convert(r"\begin{tikzpicture}\node at (0,0) {$A\,C_*/2$};"
                              r"\end{tikzpicture}")
        self.assertIn('[$A#h(0.1667em) C_*"/"2$]', canvas)
        self.assertTrue(cetz.compiles(canvas))
        # a label the safety guard DOES refuse still goes to plain text, and there the call would be
        # PRINTED, so it becomes the space the author asked for
        self.assertEqual(cetz._math_body(r"A\,#B"), '"A #B"')

    def test_a_slash_in_canvas_maths_reaches_the_page_as_a_glyph_not_a_stacked_fraction(self):
        # Typst reads `/` in maths as a fraction whose DENOMINATOR RUNS TO THE END of the span, where
        # TeX sets an ordinary inline slash: `$R^2/d_{ij}^{2}$` reached the page as three LINES and
        # `$G^{-1/4}$` as two, over 261 spans in 122 papers (`_work/probe93_slash_classes2.py`).  The
        # quoted string is the glyph -- measured against a pdflatex node of the author's own TeX
        # (`_work/measure93_slash_fidelity.py`), fifteen shapes come back with the control's own line
        # strings and gaps, worst 0.72pt and 0.000 for a bare ratio.  Tight, because a space beside it
        # costs 3.32pt that TeX does not charge; the author's own spaces around the slash go with it
        # (42 spans over 30 papers write one, and a space in TeX maths is nothing).
        self.assertEqual(cetz._math_body(r"1/2"), r'1"/"2')
        self.assertEqual(cetz._math_body(r"A/k"), r'A"/"k')
        self.assertEqual(cetz._math_body(r"G^{-1/4}"), r'G^(-1"/"4)')
        self.assertEqual(cetz._math_body(r"\beta /4"), r'beta"/"4')
        self.assertEqual(cetz._math_body(r"L_*/3+O(b_m)"), r'L_*"/"3+O(b_m)')
        # a leading slash: the shape 轴 74 parked, and `/` can no longer end an atom's base either
        self.assertEqual(cetz._math_body(r"/b"), r'"/"b')
        # `\frac` is not a slash: it became a `frac` call three passes earlier and keeps its stack
        self.assertEqual(cetz._math_body(r"\frac{1}{2}"), "frac(1, 2)")
        # TeX's italic correction `\/` draws nothing, so it is not the slash the law is about: turned
        # into a glyph it would hang an accent on the preceding letter (`_work/probe93_italic_face.py`).
        self.assertEqual(cetz._math_body(r"X \/ G"), r"X \/ G")
        canvas = cetz.convert(r"\begin{tikzpicture}\node at (0,0) {$R^2/d_{ij}^{\,2}$};"
                              r"\end{tikzpicture}")
        self.assertIn(r'[$R^2"/"d_(i j)^(#h(0.1667em) 2)$]', canvas)
        self.assertTrue(cetz.compiles(canvas))

    def test_a_hash_and_a_fused_letter_digit_reach_the_page_as_maths_not_source(self):
        # Typst reads a bare '#' in maths as a switch to code, and glues a letter to the digit behind
        # it into ONE identifier (`unknown variable: l1`), so either spelling lost its whole label to
        # quoted source text -- 23 of the 29 refusals `_work/probe92_refused_sites.py` counted over
        # 14 papers.  Measured against a pdflatex control of the author's own node
        # (`_work/probe92_sites_fidelity.py`): the escaped hash sets the same characters at the same
        # gaps, and the boundary space costs 0.62pt where TeX sets 0.0-0.5pt.
        self.assertEqual(cetz._math_body(r"A\#B"), r"A\#B")
        self.assertEqual(cetz._math_body(r"\#^q"), r"\#^q")
        self.assertEqual(cetz._math_body(r"W_{s0}"), "W_s 0")
        self.assertEqual(cetz._math_body(r"1^n0"), "1^n 0")
        # a hash in front of a word run keeps both: the guard's old '#' test took the whole label
        self.assertEqual(cetz._math_body(r"\#\text{net}"), '\\# "net"')
        canvas = cetz.convert(r"\begin{tikzpicture}\node at (0,0) {$A\,\#B$};"
                              r"\end{tikzpicture}")
        self.assertIn(r"[$A#h(0.1667em) \#B$]", canvas)
        self.assertTrue(cetz.compiles(canvas))

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
        self.assertIn("line((1.2, 0), (1.2, 1)", canvas)
        self.assertNotIn("line((-0.25, 0), (-0.25, 1))", canvas)
        self.assertIn("line((4.1, 0), (4.6, 1)", canvas)                    # cell 3's crossing
        self.assertIn("line((2.65, -2.1), (2.65, -1.1), (3.15, -2.1), "
                      "(3.15, -1.1), stroke:", canvas)                         # cell 7's pair
        self.assertIn("rect((3.9, -2.1), (4.8, -1.1)", canvas)               # cell 8's box
        # TeX's own \wt for j=0, at the picture's `font=\small` = 9pt (measure_tex_sizes.py)
        self.assertIn("content((0, -0.35), [#text(size: 9pt)[$1$]])", canvas)
        self.assertIn("content((4.35, -2.45), [#text(size: 9pt)[$F$]])", canvas)  # and for j=8
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
    # from _work/probe98_loop_build.py
    def test_a_loop_key_is_pgfs_angles_plus_looseness_8_and_a_5mm_floor(self):
        # `loop above` is `above,out=105,in=75,loop`, and the `loop` key is a `to path` carrying its own
        # `looseness=8, min distance=5mm` (tikzlibrarytopaths.code.tex).  A loop's chord is ZERO, so no
        # chord-proportional control distance can reproduce one -- the floor is what pgf answers with,
        # and measure_loop.py reads it as a 0.5cm ray: (-0.1294, 0.4830) at 105 deg.
        head = r"\begin{tikzpicture}[x=1cm,y=1cm]\draw (0,0) to[%s] (0,0);\end{tikzpicture}"
        want = {"loop": ((0.3536, 0.3536), (-0.3536, 0.3536)),
                "loop above": ((-0.1294, 0.4830), (0.1294, 0.4830)),
                "loop below": ((0.1294, -0.4830), (-0.1294, -0.4830)),
                "loop left": ((-0.4830, -0.1294), (-0.4830, 0.1294)),
                "loop right": ((0.4830, 0.1294), (0.4830, -0.1294))}
        for key, (one, two) in want.items():
            start, end, c1, c2 = self._bezier(cetz.build(head % key))
            self.assertEqual((0.0, 0.0), start, key)  # a coordinate self-`to` keeps its point
            self.assertEqual((0.0, 0.0), end, key)
            self.assertAlmostEqual(c1[0], one[0], places=4, msg=key)
            self.assertAlmostEqual(c1[1], one[1], places=4, msg=key)
            self.assertAlmostEqual(c2[0], two[0], places=4, msg=key)
            self.assertAlmostEqual(c2[1], two[1], places=4, msg=key)
    # from _work/probe98_loop_build.py
    def test_a_loops_control_distance_is_the_floor_but_a_written_looseness_is_not(self):
        # the 5mm floor is a dimension literal, so a loop off a node's border scales with the border's
        # chord: measure_loop.py circle_loop_above reads 0.3285cm -- 8 x 0.39 x the 0.4212cm chord --
        # above the floor.  `looseness` written on the statement layers on top of the `to path`'s own
        # options, so it overwrites the 8 AND the floor: circle_loop_above_l4 reads 4 x 0.39 x 0.2106.
        ring = (r"\begin{tikzpicture}[x=1cm,y=1cm,slot/.style={circle,draw,minimum size=8mm,"
                r"inner sep=2pt,font=\small}]\node[slot] (six) at (0,0) {$6$};"
                r"\draw (six) to[%s] (six);\end{tikzpicture}")
        start, end, c1, c2 = self._bezier(cetz.build(ring % "loop above"))
        self.assertAlmostEqual(start[0], -0.1054, places=3)  # six.105, the ring, not the centre
        self.assertAlmostEqual(start[1], 0.3932, places=3)
        self.assertAlmostEqual(c1[0], -0.2755, places=3)
        self.assertAlmostEqual(c1[1], 1.028, places=2)
        start, end, c1, c2 = self._bezier(cetz.build(ring % "loop above,looseness=4"))
        self.assertAlmostEqual(c1[0], -0.1904, places=3)
        self.assertAlmostEqual(c1[1], 0.7107, places=3)
    # from _work/probe98_loop_build.py
    def test_a_loop_label_rides_the_curve_instead_of_printing_on_its_node(self):
        # run146's worst on-ink pair, 5.66pt: a `to[loop above]` fell through to the straight-piece
        # branch and shipped as `line((x, y), (x, y))`, no ink for the path, and the statement's own
        # `node[above]` was then placed at that point -- on top of the node it hung off of.
        canvas = cetz.build(
            r"\begin{tikzpicture}[x=1cm,y=1cm]\node (R) at (3,0) {$R$};"
            r"\draw[->] (R) to[loop above] node[above] {$b_L$} (R);\end{tikzpicture}")
        start, end, c1, c2 = self._bezier(canvas)
        self.assertAlmostEqual(start[0], 2.9343, places=3)  # R.105 on the text ink, R.75 back in
        self.assertAlmostEqual(start[1], 0.2451, places=3)
        self.assertAlmostEqual(end[0], 3.0657, places=3)
        pair = r"content\(\(([-\d.eE+-]+), ([-\d.eE+-]+)\), \[\$b_L\$\], anchor: \"south\", padding: [^)]+\)"
        got = re.search(pair, canvas)
        self.assertIsNotNone(got, canvas)
        self.assertAlmostEqual(3.0, float(got.group(1)), places=3)
        self.assertLess(start[1], float(got.group(2)))  # above the border it left from
        self.assertLess(float(got.group(2)), c1[1])     # and below the curve's own top
    # from _work/probe99g_fix_pages.py, the three shapes priced on pages in _work/label99d_annulus.txt
    def test_even_odd_rule_fills_the_region_between_the_subpaths(self):
        # `even odd rule` asks pgf to fill the region BETWEEN a statement's sub-paths, and two filled
        # shapes cannot say that -- the later one paints the hole shut.  600 dpi, sample point taken off
        # each drawing's own fitz box: the pdflatex control reads the gap at the paper (255, 255, 255),
        # the two filled `circle`s read it at the fill (208, 209, 208), and one CetZ `compound-path`
        # reads it at the paper again with fills=1.
        def pic(rule):
            return (r"\begin{tikzpicture}[x=1cm,y=1cm]\fill[black!18%s]"
                    "(2.2,-4.62) circle (1.19cm) (2.2,-4.62) circle (0.68cm);"
                    r"\end{tikzpicture}") % rule

        def shapes(canvas):
            return [l.strip() for l in canvas.splitlines()
                    if l.strip().startswith(("circle(", "rect(", "compound-path("))]

        got = shapes(cetz.build(pic(",even odd rule")))
        self.assertEqual(1, len(got), got)
        self.assertTrue(got[0].startswith("compound-path({"), got[0])
        self.assertIn('fill-rule: "even-odd"', got[0])
        self.assertEqual(2, got[0].count("circle("), got[0])  # both rings ride inside the block
        # `nonzero rule` is pgf's own default and Typst's, so it needs nothing -- and neither does a
        # statement with no rule at all: both still ship the two filled circles they always shipped.
        for no_rule in ("", ",nonzero rule"):
            got = shapes(cetz.build(pic(no_rule)))
            self.assertEqual(0, sum("compound-path" in s for s in got), got)
            self.assertEqual(2, len(got), got)
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
        # an ellipse the emitter has no ring for.  So `ring` stays None and the loop answers from the
        # node's own ink box instead (`_tangent_endpoints`), never from a guessed radius.
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
        # `\\` is one control sequence and TeX starts a fresh line after it, so a delimiter pair
        # written tight behind a break is still maths: measure_node_break_math.py sets
        # `{Reset\\\(t\in[2,5]\)}` as `Reset` over an italic `t ∈ [2, 5]`. 64 labels in 23 papers
        # printed the escaped delimiters instead while the inline pair carried a lookbehind. Only
        # the display pair keeps it, because there the backslash really begins something else --
        # a `\\[3pt]` is the break's own spacing argument.
        bsl = chr(92)
        self.assertNotIn("$", cetz.node_text("alpha" + bsl * 2 + "(i)"))
        self.assertEqual("alpha#linebreak()$t in [2,5]$",
                         cetz.node_text("alpha" + bsl * 3 + "(t" + bsl + "in[2,5]" + bsl + ")"))
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
        self.assertIn("circle((0, 0.5), radius: 0.07056, fill: black, stroke: none)",
                      cetz.build(core, {}, 15.0))
    # from _work/pic-authmacros/tests.py
    def test_a_colour_table_declared_above_the_first_panel_reaches_the_last_one(self):
        # Canonical-conformal-limits-o p99: one `\definecolor` block opens the figure and three
        # tikzpictures follow -- panels (a), (b) and (c) of one drawing. A top-level `\definecolor`
        # is not in a group, so TeX keeps it in force for the rest of the paper and every panel draws
        # in gatecore!12. When the table travelled only into the picture that stood below it, the
        # later panels came out as solid black slabs: `cetz.translate_path` answers black for an ink
        # it cannot resolve.
        panel = "\\filldraw[fill=gatecore!12] (0,0) rectangle (1,1);"
        body = ("\\definecolor{gatecore}{rgb}{0.77,0.31,0.32}\nsome prose\n"
                "\\begin{tikzpicture}\n%s\n\\end{tikzpicture}\nmore prose\n"
                "\\begin{tikzpicture}\n%s\n\\end{tikzpicture}\n" % (panel, panel))
        scopes = convert.picture_scopes(body, {})
        self.assertEqual(len(scopes), 2)
        for _table, decls in scopes:
            self.assertIn("\\definecolor{gatecore}{rgb}{0.77,0.31,0.32}", decls)
            canvas = cetz.build(convert.with_declarations(
                "\\begin{tikzpicture}\n%s\n\\end{tikzpicture}" % panel, decls), {}, 15.0)
            self.assertIn("rgb(", canvas)
            self.assertNotIn("fill: black", canvas)
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
                      'stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10))', built)
        self.assertIn('circle((0.7, -1.08), radius: 0.03528, fill: rgb("#8c8c8c"), stroke: none)', built)
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
                      'stroke: (paint: rgb("#e6e6e6"), thickness: 0.3pt, miter-limit: 10))', built)
        self.assertIn('rect((-6.88, -1.02), (-5.16, -0.62), fill: rgb("#e0e0e0")', built)
        # the label's `font=\scriptsize` is TeX's 7pt (measure_tex_sizes.py), and the band's own
        # coordinates are absolute centimetres measured at that size
        self.assertIn("content((-6.02, -0.82), [#text(size: 7pt)[$C$]])", built)
    # from _work/pic-authmacros/tests.py
    def test_a_named_colour_mixes_at_the_value_tex_prints(self):
        # xcolor answers \extractcolorspecs{orange} = rgb/1,0.5,0 (m_colors.tex), not the CSS 165
        # the table carried, and the compiled GFF page inks its `orange!65!black` family at #a65300
        # with the `!8` fill at #f8f1eb (gff_B.pdf, read back with fitz). Mixed the other way the
        # second family gets a yellower ink than the author's figure separates it by.
        built = cetz.build(
            "\\begin{tikzpicture}\\draw[orange!65!black,line width=.8pt] (0,0) -- (1,1);"
            "\\fill[blue!60!black] (2,0) circle (2pt);\\end{tikzpicture}", {}, 15.0)
        self.assertIn('line((0, 0), (1, 1), stroke: (paint: rgb("#a65300"), thickness: 0.8pt, miter-limit: 10))',
                      built)
        self.assertIn('circle((2, 0), radius: 0.07056, fill: rgb("#000099"), stroke: none)', built)
        self.assertIn('fill: rgb("#ffd3a6")', cetz.build(
            "\\begin{tikzpicture}[bandA/.style={fill=orange!35}]"
            "\\path[bandA] (0,0) rectangle (1,1);\\end{tikzpicture}", {}, 15.0))

    def test_a_table_taller_than_a_page_splits_and_puts_its_caption_after_the_last_row(self):
        # typst 0.15 figures are non-breakable blocks: the 52-row barrier table of Complex-Matrix
        # overflowed the bottom margin of p85 instead of splitting, caption riding on the overflow.
        # The prelude therefore makes table figures breakable; without that rule every row and the
        # caption land on one page, past the margin. The rule matches even though nothing we emit
        # writes `kind:` -- a figure's kind defaults to auto and resolves to table from its body, so
        # grepping the products for `kind: table` finds only the rule and says nothing about it.
        import fitz
        paper = types.SimpleNamespace(geometry={"margin": "1in"}, fontsize="11pt",
                                      documentclass="article")
        rows = "".join("  table.cell[row%02d], table.cell[%d],\n" % (i, i) for i in range(40))
        body = convert._prelude(paper)
        body += '#set page(width: 300pt, height: 400pt, margin: 20pt)\n'
        body += ("#figure(\n  table(\n  columns: 2,\n  inset: 4pt,\n  table.header([i], [j]),\n"
                 + rows + "),\n  caption: [Table 1: The barrier.],\n)\n")
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, "long.typ")
            src.write_text(body, encoding="utf-8")
            proc = subprocess.run(["typst", "compile", str(src)], capture_output=True)
            self.assertEqual(proc.returncode, 0, proc.stderr.decode("utf-8"))
            doc = fitz.open(str(Path(folder, "long.pdf")))
            pages = [p.get_text().replace("\n", " ") for p in doc]
            doc.close()
        self.assertEqual(len(pages), 2, pages)
        self.assertIn("row00", pages[0])
        self.assertIn("row39", pages[1])
        self.assertIn("Table 1: The barrier.", pages[1])
        self.assertNotIn("Table 1: The barrier.", pages[0])

    def test_a_stacked_tikzcd_cell_keeps_its_lines_on_one_grid_row(self):
        # a `gathered` cell breaks its own lines with `\\`, the same token that ends a tikzcd row;
        # split on it and the Abundance proof map put each half on its own row, leaked the
        # environment name into the maths, and drew the arrow between the two halves of one cell.
        canvas = cetz.build_cd(
            "\\begin{tikzcd}[row sep=large]"
            "\\begin{gathered}\\text{first line}\\\\ \\text{second line}\\end{gathered} \\arrow[d] \\\\"
            "\\text{below}"
            "\\end{tikzcd}")
        self.assertNotIn("gathered", canvas)
        self.assertIn("content((0, 0.293), [$upright(\"first line\")$])", canvas)
        self.assertIn("content((0, -0.293), [$upright(\"second line\")$])", canvas)
        # `row sep=large` is the gap between the two rows' boxes, so the next row lands a separation
        # plus half of each box below: 1.040 + (1.131 + 0.545)/2 (`_work/probe90_cd_sep_law.py`)
        self.assertIn("content((0, -1.878), [$upright(\"below\")$])", canvas)
        # the arrow leaves under the stacked cell's last line and enters the one-line cell above
        self.assertIn("line((0, -0.5655), (0, -1.606), mark: (end: \">\"))", canvas)

    def test_an_arrow_label_clears_its_own_line_by_its_own_box(self):
        # tikz-cd hangs a label by its ink: the ink's near edge sits 0.077cm off the shaft, so the
        # centre is 0.077 + half the label's own extent along the normal (`_work/measure48_cd_bend.py`
        # on a pdflatex page).  Our own extent is measured at 300 dpi by `_work/measure48_cd_hang.py`:
        # a label's ink reaches 0.204cm below the anchor Typst centres it on, so the height term is
        # 0.41.  The flat 0.45cm this replaces was that term applied to every direction, and on a
        # vertical arrow it ran the shaft through the middle of `group and residue duality` on the
        # page.
        # Both extents belong to a label the environment sets in `\scriptstyle`: the same diagram at
        # the three class sizes reads cells 9.96/10.91/11.96pt against labels 6.97/7.97/7.97pt, in
        # amscd as well (`_work/probe88b_cd_label_size.py`), so the box terms carry CD_LABEL_EM and
        # the gap does not -- the gap was read off a script-size label to begin with.
        wide = cetz.build_cd("\\begin{tikzcd} A \\arrow[d,\"group and residue duality\"] \\\\ B"
                             " \\end{tikzcd}")
        # the shaft runs from box edge to box edge: a one-line cell's box is 0.545cm tall, so half of
        # it is what the arrow leaves and enters
        self.assertIn("line((0, -0.2725), (0, -0.9661)", wide)
        # 0.077 the gap plus half the label's width at its own size; a downward arrow's left is the
        # page's right, which is the side tikz-cd puts a plain label on
        self.assertIn("content((1.479, -0.6193),", wide)
        # a one-line label on a horizontal arrow clears its shaft by 0.077 + half of 0.41 at that size
        short = cetz.build_cd("\\begin{tikzcd} A \\arrow[r,\"f\"] & B \\end{tikzcd}")
        self.assertIn("content((0.7978, 0.2266), [#text(size: 0.73em)[$f$]])", short)
        # and `swap` moves it to the far side of the same line
        swap = cetz.build_cd("\\begin{tikzcd} A \\arrow[r,\"f\"'] & B \\end{tikzcd}")
        self.assertIn("content((0.7978, -0.2266), [#text(size: 0.73em)[$f$]])", swap)
        # the cells keep the page's own size: only what hangs off an arrow shrinks
        self.assertIn("content((0, 0), [$A$])", short)
        # tikz-cd's own default separation is the `normal` step, and it is the gap BETWEEN the boxes:
        # two one-letter cells (0.672cm each) sit 0.924 + 0.672 apart, where the page measures 0.924
        # + 0.622 (`_work/probe90_cd_sep_law.py`: a narrow pair's centres 43.80pt = 1.545cm)
        self.assertIn("content((1.596, 0), [$B$])", short)
        self.assertIn("line((0.336, 0), (1.26, 0), mark: (end: \">\"))", short)

    def test_a_bent_tikzcd_arrow_is_pgf_s_own_cubic_on_the_left_of_travel(self):
        # tikz-cd's `bend left=deg` is pgf's `to[bend left=deg]`: arms of 0.39 * chord at +-deg off
        # the chord, the arc bulging to the LEFT of travel, and a bare `bend left` standing for
        # 30 degrees (`_work/measure48_cd_bend.py` reads 0.3912*chord and 0.2925*chord*sin(deg) on
        # six bodies).  Two straight segments with a fixed 0.9cm bulge put the arc on the right of
        # travel instead, and the label with it.
        canvas = cetz.build_cd("\\begin{tikzcd} A \\arrow[rr,bend left=22,\"f\"] & & B"
                               " \\end{tikzcd}")
        self.assertIn("bezier((0.336, 0), (2.723, 0), (1.199, 0.3488), (1.86, 0.3488),"
                      " mark: (end: \">\"))", canvas)
        # the label rides outside the bulge, at its own script size, 0.2266cm past the curve's
        # midpoint (0.077 the gap plus half the label's height at that size)
        self.assertIn("content((1.53, 0.4882), [#text(size: 0.73em)[$f$]])", canvas)
        back = cetz.build_cd("\\begin{tikzcd} A \\arrow[rr,bend right=22,\"f\"] & & B"
                             " \\end{tikzcd}")
        self.assertIn("bezier((0.336, 0), (2.723, 0), (1.199, -0.3488), (1.86, -0.3488),", back)
        self.assertIn("content((1.53, -0.4882), [#text(size: 0.73em)[$f$]])", back)
        bare = cetz.build_cd("\\begin{tikzcd} A \\arrow[rr,bend left,\"f\"] & & B \\end{tikzcd}")
        self.assertIn("bezier((0.336, 0), (2.723, 0), (1.142, 0.4655), (1.917, 0.4655),", bare)

    def test_a_tikzcd_hook_barbs_to_the_left_of_travel(self):
        # pgf's `hook` curls the barb to the arrow's left, measured as -0.06cm off a 1.9cm shaft
        # (`_work/measure48_cd_hook.py`); the fixed bulge's normal used to point the other way, so
        # every one of the corpus's 40 hooks barbed away from its own arrow.
        canvas = cetz.build_cd("\\begin{tikzcd} A \\arrow[r,hook] & B \\end{tikzcd}")
        self.assertIn("line((0.336, 0), (0.336, 0.3))", canvas)

    def test_an_exchange_diagram_separation_is_read_as_the_gap_between_boxes(self):
        # the author's `column sep` / `row sep` used to reach the layout only as three names, and the
        # numbers behind them were centre distances.  12 pictures over 11 papers write a value the old
        # table did not answer (`_work/probe89_cd_sep_census.py`), and `Global-quantum-geometric-…#0`
        # collides on the page because its `column sep=8em` came back as the default.
        # The named steps are multiples of one base per axis and the dimensions are the author's own
        # (`_work/probe90_cd_sep_law.py`, all at 11pt: column tiny 6.545pt, row tiny 4.907pt).
        cm = 28.3465
        measured = {"tiny": (6.55, 4.92), "small": (13.09, 9.83), "scriptsize": (19.64, 14.73),
                    "normal": (26.18, 19.64), "large": (39.27, 29.46), "huge": (52.36, 39.28)}
        for name, (column, row) in measured.items():
            self.assertAlmostEqual(cetz.cd_gap("[column sep=%s]" % name, "column sep") * cm,
                                   column, places=1, msg=name)
            self.assertAlmostEqual(cetz.cd_gap("[row sep=%s]" % name, "row sep") * cm,
                                   row, places=1, msg=name)
        self.assertAlmostEqual(cetz.cd_gap("[column sep=8em]", "column sep") * cm,
                               87.27, places=0)
        self.assertAlmostEqual(cetz.cd_gap("[column sep=3.2cm]", "column sep"), 3.2, places=3)
        self.assertAlmostEqual(cetz.cd_gap("[column sep={2.5em}]", "column sep") * cm,
                               2.5 * 11, places=0)
        # nothing written asks for `normal`, and so does anything this cannot read: a step tikz-cd
        # does not know is an error on its own page, not a value to place
        self.assertAlmostEqual(cetz.cd_gap("", "column sep") * cm, 26.18, places=1)
        self.assertAlmostEqual(cetz.cd_gap("[column sep=7mm]", "column sep"), 0.7, places=3)
        self.assertAlmostEqual(cetz.cd_gap("[column sep=wobble]", "column sep") * cm, 26.18,
                               places=1)
        # a converted `CD` carries amscd's own spacing rather than a tikz-cd name: its cells keep a
        # 41.3pt ink-to-ink gap across a column whatever they are made of, and a fixed 21.10pt centre
        # pitch down a row (`_work/probe92_cd_amscd_sep.py`), which the head this translation writes
        # reproduces through the same additive law
        self.assertIn("column sep=1.125cm,row sep=0.199cm",
                      cetz.xy_to_tikzcd("\\begin{CD} A @>>> B \\end{CD}"))

    def test_a_rounded_corner_of_a_polyline_is_cut_by_an_arc_at_its_own_radius(self):
        # `rounded corners` written on a multi-segment `\draw` used to reach the page as a plain
        # polyline: the option is read for rectangles and for node frames (#60, #61) and for nothing
        # else, so 14 statements over 6 papers lost every arc
        # (`_work/probe109_rounded_poly_true_face.py`).
        # The corner is cut at the DECLARED radius and not at a share of the edge -- a pdflatex control
        # measured 39.991pt from corner to tangent point on a 1cm edge written `=40pt`, which is 11.5pt
        # PAST the path's own end, and the same 40pt at both ends of a 0.6cm middle segment
        # (`_work/measure89_rounded_clamp.py`). The radius is a length of the PAGE: 19.995pt under
        # `x=.5cm`, `scale=.5`, the anisotropic `x=1cm,y=.5cm` and `rotate=30` alike
        # (`_work/measure89b_rounded_radius_space.py`).
        canvas = cetz.build("\\begin{tikzpicture}\\draw[rounded corners=8pt] (0,0) -- (4,0) -- (4,4)"
                            " -- (0,4);\\end{tikzpicture}")
        self.assertIn("line((0, 0), (3.718, 0)", canvas)
        self.assertIn("arc((3.718, 0), start: -180deg, stop: -270deg, radius: 0.2822cm", canvas)
        self.assertIn("line((4, 0.2822), (4, 3.718)", canvas)
        self.assertIn("arc((4, 3.718), start: -90deg, stop: -180deg, radius: 0.2822cm", canvas)
        # the last point is the path's end, not a corner, so it stays sharp
        self.assertIn("line((3.718, 4), (0, 4)", canvas)
        # the two radius vectors point back along the incoming edge and forward along the outgoing
        # one, so their difference is the turn's exterior angle; CeTz follows `stop - start` with its
        # sign, and a turn the other way reads +90 rather than the -270 the raw angles give
        left = cetz.build("\\begin{tikzpicture}\\draw[rounded corners=8pt] (0,0) -- (4,0) -- (4,-4);"
                          "\\end{tikzpicture}")
        self.assertIn("arc((3.718, 0), start: -180deg, stop: -90deg", left)
        # an edge shorter than the radius is drawn past rather than shortened: the first run ends
        # behind the path's own start point, 40pt = 1.411cm of page away from the corner at 1cm
        overshoot = cetz.build("\\begin{tikzpicture}\\draw[rounded corners=40pt] (0,0) -- (1,0)"
                               " -- (1,4);\\end{tikzpicture}")
        self.assertIn("line((0, 0), (-0.4111, 0)", overshoot)
        self.assertIn("arc((-0.4111, 0), start: -180deg, stop: -270deg, radius: 1.411cm", overshoot)
        # the picture's own scale halves the drawing but not the cut: (4,0) lands at 2cm and the arc
        # still starts 8pt before it
        scaled = cetz.build("\\begin{tikzpicture}[x=0.5cm,y=0.5cm]\\draw[rounded corners=8pt] (0,0)"
                            " -- (4,0) -- (4,4);\\end{tikzpicture}")
        self.assertIn("arc((1.718, 0), start: -180deg, stop: -270deg, radius: 0.2822cm", scaled)
        # a corner that turns nothing has no arc to give, and a bare `rounded corners` is pgf's 4pt
        straight = cetz.build("\\begin{tikzpicture}\\draw[rounded corners=8pt] (0,0) -- (2,0) -- (4,0)"
                              " -- (4,4);\\end{tikzpicture}")
        self.assertIn("line((0, 0), (3.718, 0)", straight)
        self.assertNotIn("(2, 0)", straight)
        bare = cetz.build("\\begin{tikzpicture}\\draw[rounded corners] (0,0) -- (4,0) -- (4,4);"
                          "\\end{tikzpicture}")
        self.assertIn("radius: 0.1411cm", bare)
        # the tip rides on the end of the path, and cutting the corners does not move it off the last
        # straight piece and onto the arc before it
        marked = cetz.build("\\begin{tikzpicture}\\draw[->,rounded corners=6pt] (0,0) -- (4,0)"
                            " -- (4,-4) -- (0,-4);\\end{tikzpicture}")
        tipped = [line for line in marked.splitlines() if "mark:" in line]
        self.assertEqual(len(tipped), 1, marked)
        self.assertIn("line((3.788, -4), (0, -4))}", tipped[0])
        # and the cut is ONE path, not a line and an arc lying end to end: stroking the pieces apart
        # leaves a butt-cap bite at every junction, invisible with a hair pen and a white notch with a
        # 12pt one turning a 12pt corner (`_work/measure89d_rounded_seam_typst.py`, both ways)
        self.assertEqual(marked.count("merge-path("), 1, marked)
        self.assertEqual(len([l for l in canvas.splitlines() if "arc(" in l]), 1, canvas)

    def test_a_numbered_display_sets_its_number_at_the_right_margin(self):
        # LaTeX puts the number flush with the right margin, outside the body's centring; a
        # `quad "(1)"` inside the maths set it beside the formula and widened an already
        # overwide display by the number's own width -- for 32 papers the worst line on the
        # page was their own equation tag.
        import fitz
        tex = r'''\documentclass{article}
\usepackage{amsmath}
\begin{document}
\begin{equation}\label{eq:a}
 D(z) \le C(J_0(z) + E(z))
\end{equation}
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'tag.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'tagged')
            result = (out / 'main.typ').read_text(encoding='utf-8')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            line = [l for l in result.splitlines() if "numbering: n =>" in l][0]
            self.assertIn('numbering: n => "(1)"', line)
            self.assertTrue(line.startswith("#["), line)
            doc = fitz.open(str(out / 'main.pdf'))
            page = doc[0]
            rows = [(fitz.Rect(l["bbox"]), "".join(s["text"] for s in l["spans"]))
                    for b in page.get_text("dict")["blocks"] for l in b.get("lines", [])]
            width = page.rect.width
            doc.close()
        tag = [r for r, t in rows if t.strip() == "(1)"][0]
        body = [r for r, t in rows if abs(r.y0 - tag.y0) < 2 and t.strip() != "(1)"][0]
        self.assertAlmostEqual(tag.x1, width - 72.27, delta=1.5)
        self.assertAlmostEqual((body.x0 + body.x1) / 2, width / 2, delta=2.0)

    def test_an_accessibility_wrapper_keeps_its_hex_label_out_of_the_maths(self):
        # accsupp's ActualText names the glyphs TeX already drew, as UTF-16 code units; one
        # underbrace label runs to 84 hex digits, which a length bound let through as if it
        # were the formula, printing the digits across the page (All-temperature p30).
        hexed = "D835DCB1005F004E0020002800640069006D0020003D002000640029"
        got = clean("\\MathActualText{%s}{\\underbrace{\\mathcal V_N}_{\\dim=d}}" % hexed)
        self.assertNotIn("D835", got)
        self.assertIn("underbrace", got)
        self.assertIn("dim", got)
        # the one-argument shape is the maths itself, not a label to drop
        self.assertEqual(clean("\\MathActualText{x+y}"), "{x+y}")

    def test_a_heading_introduces_a_flush_left_paragraph_unless_the_class_indents_it(self):
        # pdflatex on the two classes the corpus uses (_work/class_control.py): article leaves the
        # paragraph a heading introduces flush left (x0 72.0) and indents the next (88.9), while
        # amsart indents every paragraph at a fixed 12pt (84.0 each). `all: true` gave all 682
        # article papers an indent LaTeX never prints.
        import fitz
        body = ("\\usepackage[margin=1in]{geometry}\n"
                "\\begin{document}\n\\section{First}\n"
                "Alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu xi omicron "
                "pi rho sigma tau upsilon phi chi psi omega alpha beta gamma delta epsilon zeta.\n\n"
                "Second paragraph here, and it keeps going for a while so that the first line is "
                "clearly a full one and the left edge of the two openers can be told apart.\n"
                "\\end{document}")

        def openers(cls):
            tex = "\\documentclass[11pt]{%s}\n%s" % (cls, body)
            with tempfile.TemporaryDirectory() as folder:
                src = Path(folder, "indent.tex")
                src.write_text(tex, encoding="utf-8")
                out = Path(folder, "output")
                report = convert_paper(str(src), str(out), "indent")
                self.assertTrue(report["compile_ok"], report["compile_err_full"])
                doc = fitz.open(str(out / "main.pdf"))
                rows = [(fitz.Rect(l["bbox"]), "".join(s["text"] for s in l["spans"]))
                        for b in doc[0].get_text("dict")["blocks"] for l in b.get("lines", [])]
                doc.close()
            return {k: r.x0 for r, t in rows for k in ("Alpha", "Second")
                    if t.strip().startswith(k)}

        got = openers("article")
        self.assertAlmostEqual(got["Alpha"], 72.27, delta=1.0)
        self.assertAlmostEqual(got["Second"], 72.27 + 16.5, delta=1.0)
        ams = openers("amsart")
        self.assertAlmostEqual(ams["Alpha"], 72.27 + 12.0, delta=1.0)
        self.assertAlmostEqual(ams["Second"], 72.27 + 12.0, delta=1.0)

    def test_heading_sizes_follow_the_paper_own_body_size(self):
        # 11.5pt/13pt were hard-coded, so the one 12pt paper in the corpus got subsection headings
        # smaller than its own body text. The ratios reproduce today's numbers at the 11pt default,
        # which is 722 of 724 papers, so nothing else moves.
        for fontsize, sub, top in (("11pt", "11.5pt", "13pt"), ("12pt", "12.55pt", "14.18pt"),
                                   ("10pt", "10.45pt", "11.82pt")):
            paper = types.SimpleNamespace(geometry={"margin": "1in"}, fontsize=fontsize,
                                          documentclass="article")
            pre = convert._prelude(paper)
            self.assertIn("#show heading: set text(size: %s)" % sub, pre)
            self.assertIn("#show heading.where(level: 1): set text(size: %s)" % top, pre)

    def test_a_node_placed_by_a_group_after_its_name_lands_where_its_neighbour_is(self):
        # TikZ reads a node's option group on either side of the name, and an author placing a node
        # by its neighbours writes it after: `\node (b) [right=of a] {text}`. `_node_at` looked only
        # for `at` in what follows the name, so that group was not an unread placement but a node
        # dropped on the scope origin -- the five diagrams #71 found were canvases whose every
        # coordinate was (0, 0) and whose every arrow was a zero-length one.
        pic = (r"\begin{tikzpicture}[node distance=8mm and 16mm]"
               r"\node (lower) {\(U_-\)};"
               r"\node (finite) [above right=of lower] {\(U_f\)};"
               r"\node (upper) [below right=of finite] {\(U_+\)};"
               r"\draw[->] (lower) -- (finite);"
               r"\end{tikzpicture}")
        canvas = cetz.build(pic)
        self.assertNotIn("(0, 0), (0, 0)", canvas)
        # every node of a placed picture sits somewhere other than the one point
        points = set(re.findall(r"content\(\(([^)]*)\)", canvas))
        self.assertEqual(3, len(points), canvas)

    def test_a_diagram_inside_a_display_keeps_the_equation_written_beside_it(self):
        # A canvas is a block, so a display that holds a picture and the author's own line of maths
        # cannot come out as one formula. `build` reads the picture its string starts with and no
        # more, so handing it the whole display drew the diagram and dropped the line beside it --
        # what the BSD paper's `\[ \picture \qquad U_+/U_- \simeq ... \]` lost. Refusing a string
        # that is not one drawing is what sends it to `cetz.split`, which keeps both halves.
        tex = r'''\documentclass{article}
\usepackage{tikz}
\title{Side by side}
\begin{document}
\section{One}
\[
\begin{tikzpicture}[node distance=8mm]
\node (lower) {\(U_-\)};
\node (finite) [above right=of lower] {\(U_f\)};
\draw[->] (lower) -- (finite);
\end{tikzpicture}
\qquad
 U_+/U_-\simeq(U_f/U_-).
\]
\end{document}'''
        with tempfile.TemporaryDirectory() as folder:
            src = Path(folder, 'aside.tex')
            src.write_text(tex, encoding='utf-8')
            out = Path(folder, 'output')
            report = convert_paper(str(src), str(out), 'aside')
            self.assertTrue(report['compile_ok'], report['compile_err_full'])
            text = Path(out, 'main.typ').read_text(encoding='utf-8')
        self.assertIn('#cetz.canvas(', text)
        self.assertNotIn('Z Q T', text)
        self.assertIn('tilde.eq', text)

    def test_a_bibliography_field_carries_the_text_it_means_not_its_markup(self):
        # Typst reads a .bib field as ink, not as markup: a test compile (2026-10-13)
        # printed `$\mathbb Z_+^N$`, `\href{u}{t}` and `n\times n` character for
        # character, because hayagriva has no TeX reader. The fields therefore go
        # through pandoc's plain writer; the link fields keep their literal slashes.
        bib = ('@article{x,\n'
               '  title = {The invariant theory of {$n\\times n$} matrices},\n'
               '  note = {\\href{https://a.example/b}{arXiv:2410.18372v2}},\n'
               '  doi = {10.1007/978-0-8176-4747-6_16},\n'
               '}')
        out = convert.flatten_bib_fields(bib)
        self.assertIn('n × n', out)
        self.assertIn('arXiv:2410.18372v2', out)
        self.assertIn('10.1007/978-0-8176-4747-6_16', out)
        self.assertNotIn('\\href', out)
        self.assertNotIn('$', out)

    def test_a_bibliography_field_lays_the_shapes_that_need_height_in_one_line(self):
        # The plain writer answers a symbol it has Unicode for and echoes back a shape
        # that needs a second line -- a fraction, a root, a rule over letters -- and the
        # echo prints on the page as TeX (measured: 28 fields / 23 papers,
        # _work/probe_bib_echoes.py). Those shapes are laid out in one line and fed back
        # to the same pass, so the rest of the group still converts.
        bib = ('@article{x,\n'
               '  title = {An $O(\\sqrt{|V|}\\,|E|)$ Algorithm for Finding Maximum Matching},\n'
               '  journal = {The $\\frac{dy}{dx}$ of $\\overline{\\mathbb Q}$},\n'
               '}')
        out = convert.flatten_bib_fields(bib)
        self.assertIn('O(√(|V|) |E|)', out)
        self.assertIn('(dy)/(dx)', out)
        self.assertIn('ℚ', out)
        self.assertNotIn('\\sqrt', out)
        self.assertNotIn('\\frac', out)
        self.assertNotIn('$', out)

    def test_a_bibliography_field_is_read_wherever_its_entry_puts_it(self):
        # A `.bib` entry is a comma-separated list and an author may write two fields on one
        # line. Anchored at the line start alone, the scanner missed the second field of
        # `author={Noga Alon and Vitali D. Milman},title={{$\lambda_1$}, Isoperimetric…}`
        # and the page printed `\lambda_1` (88 fields across the corpus,
        # _work/probe_bib_field_spans.py). A field's own text is skipped whole, so the
        # `{$…$}` protecting a capital-letter term stays ink rather than becoming a field.
        bib = ('@article{x,\n'
               '  author={Noga Alon and Vitali D. Milman},'
               'title={{$\\lambda_1$}, Isoperimetric Inequalities for Graphs},\n'
               '  note = {\\href{https://doi.org/10.1007/s002220000118}{DOI}},\n'
               '  title = {Anomalous quantum {Hall} effect and {Lov{\\\'a}sz} theta},\n'
               '}')
        out = convert.flatten_bib_fields(bib)
        self.assertIn('λ₁, Isoperimetric Inequalities for Graphs', out)
        self.assertIn('quantum Hall effect', out)
        self.assertIn('Lovász', out)
        self.assertNotIn('\\lambda', out)
        self.assertNotIn('\\href', out)

    def test_a_bibliography_fields_hard_space_becomes_a_space(self):
        # `Vol.~II` in a booktitle is TeX's non-breaking space, not a character. Such a field carries
        # no `$\^_` markup, so the plain writer never read it and the page printed the tilde (88
        # tildes / 52 papers, _work/probe_bib_tilde_face.py). A URL's own tilde is data and stays:
        # the writer answers `\url{…}` verbatim, and no field it reads holds a bare URL (0 across
        # the corpus, _work/probe_bib_bare_url.py).
        bib = ('@incollection{x,\n'
               '  booktitle = {Arithmetic and Geometry, Vol.~II},\n'
               '  note = {\\url{https://pi.math.cornell.edu/~hatcher/AT/AT.pdf}},\n'
               '  url = {https://www.renyi.hu/~gharcos/bombieri.pdf},\n'
               '}')
        out = convert.flatten_bib_fields(bib)
        self.assertIn('Vol. II', out)
        self.assertNotIn('Vol.~II', out)
        self.assertIn('https://pi.math.cornell.edu/~hatcher/AT/AT.pdf', out)
        self.assertIn('https://www.renyi.hu/~gharcos/bombieri.pdf', out)

    def test_a_dash_named_by_pgf_and_a_dash_written_as_lengths_reach_the_rule(self):
        # pgf sells dashes by name and the corpus buys them by the hundred: 671 statements over 225
        # canvases in 144 papers asked for a dash the product never drew, because only the two bare
        # names `dashed`/`dotted` were read -- `densely dashed` (412), `densely dotted` (247),
        # `dash pattern=` (8) and `dash dot` (4) were dropped on the floor
        # (_work/probe102c_dash_emit_face.py).  Their patterns are two rulers read off pages: the
        # dashed family is absolute (3pt/3pt, 3/2, 3/6) while the dotted family rides the pen
        # (`on \pgflinewidth` off ...), tikz.code.tex:1583-1601 confirmed on pdflatex output by
        # _work/probe102a_dash_pgf.py.  Typst spells those same six names with those same six arrays
        # and lets its dotted names follow the thickness too (_work/probe102b_typst_dash.py), so a
        # name crosses with no arithmetic at all.
        def pic(body, head=""):
            return cetz.build(r"\begin{tikzpicture}" + head + body + r"\end{tikzpicture}")
        for name in ("dashed", "densely dashed", "loosely dashed", "dotted", "densely dotted",
                     "loosely dotted"):
            self.assertIn('dash: "%s"' % name.replace(" ", "-"),
                          pic(r"\draw[%s] (0,0)--(2,0);" % name))
        # a dotted name at a thick pen is still just the name: both engines reprice it
        self.assertIn('stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dotted")',
                      pic(r"\draw[densely dotted, thick] (0,0)--(2,0);"))
        # a name reached through a `/.style` is the same name, which is where most of them sit
        self.assertIn('dash: "densely-dashed"',
                      pic(r"\draw[d] (0,0)--(2,0);", "[d/.style={densely dashed}]"))
        # `dash pattern=` prices its own pattern, so its lengths cross as lengths, pt or mm
        self.assertIn("dash: (4pt, 2.5pt)",
                      pic(r"\draw[dash pattern=on 4pt off 2.5pt] (0,0)--(2,0);"))
        self.assertIn("dash: (4pt, 2pt, 1pt, 2pt)",
                      pic(r"\draw[dash pattern=on 4pt off 2pt on 1pt off 2pt] (0,0)--(2,0);"))
        self.assertIn("dash: (1mm, 1mm)",
                      pic(r"\draw[dash pattern=on 1mm off 1mm] (0,0)--(2,0);"))
        # the compound names put the pen INSIDE the pattern, so that one element is said as a number
        self.assertIn("dash: (3pt, 2pt, 0.4pt, 2pt)", pic(r"\draw[dash dot] (0,0)--(2,0);"))
        self.assertIn("dash: (3pt, 2pt, 0.8pt, 2pt)", pic(r"\draw[dash dot, thick] (0,0)--(2,0);"))
        # `solid` is `dash pattern=` with nothing in it, so it asks for no dash
        self.assertNotIn("dash", pic(r"\draw[solid] (0,0)--(2,0);"))
        # a pattern this emitter cannot price is dropped rather than guessed: `\pgflinewidth` is not
        # a length it holds, and `bp` is not a Typst unit at all -- that canvas fails to compile
        self.assertNotIn("dash", pic(r"\draw[dash pattern=on 3pt off 2pt on \pgflinewidth off 2pt]"
                                     r" (0,0)--(2,0);"))
        self.assertNotIn("dash", pic(r"\draw[dash pattern=on 3bp off 2bp] (0,0)--(2,0);"))
        # a dash on the picture's OWN brackets would be a scope default, the way #90 found for the
        # ends and corners -- but the corpus writes it 0 times, on the brackets and inside `every
        # path` alike (_work/probe102e_dash_head_face.py: 932 pictures / 724 papers), so no such line
        # exists to carry it and the key stays with the statement that invokes it
        self.assertNotIn("dash", pic(r"\draw (0,0)--(2,0);", "[densely dashed]"))
        self.assertNotIn("dash", pic(r"\node[draw] at (1,1) {X};", "[densely dashed]"))


if __name__ == '__main__':
    unittest.main()

