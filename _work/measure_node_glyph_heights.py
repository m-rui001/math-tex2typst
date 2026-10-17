r"""Read the vertical price of every shape a node label is built from, in ems of its own size.

#74 needs the mirror of #73's ink law on the vertical axis. pdflatex puts a one-line node at
15.18pt (bare `T`) to 22.55pt (`$F_{1,+}^{+,+}$`) while `_text_height` answers 10.37pt for all of
them, and center->north equals center->south for every label read -- so the law to write is the
TOTAL: 2 x `inner sep` (measured at 0.3333em) + the ink, where the ink is what TeX's own box is.
TeX's box is not a line height: its height is the tallest thing above the baseline and its depth the
lowest thing below it, so a label's ink is `max(top) + max(depth)` over the shapes it contains. That
is what this gauge prices -- one character, one construction at a time, at the three sizes the
corpus's papers use, in ems so the price is one number whatever the size is.

Everything is measured OUTSIDE a `tikzpicture`: inside one the current font is `nullfont`, and a
first pass here silently reported `HT=0` for every text sample while maths still worked (maths
selects its own fonts). The node box itself is priced separately by
`_work/measure_node_vertical_ink.py`.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-vertical-glyphs")
os.makedirs(OUT, exist_ok=True)

TEXT = list("xdtlbhkfjpqgyTXEF()[]/+=01.,") + ["i", "m", "mbox"]
MATH = ["x", "X", "x_i", "x^i", "x_i^j", "\\int", "\\sum", "\\frac{1}{2}", "\\sqrt{x}",
        "\\overline{u}", "\\hat{u}", "\\tilde{u}", "\\{a\\}", "\\langle a\\rangle", "f",
        "\\ell", "\\phi", "\\Phi", "\\mathcal{F}", "y_1", "e^x", "a+b", "u_0",
        "\\left(\\frac{1}{2}\\right)", "F_{1,+}^{+,+}", "\\int_0^1 f",
        "\\left\\{\\ell^2\\right\\}", "|x|", "\\{\\}", "^{1}_{0}X",
        # a script's own contents move the top and the bottom on their own: the same shift carries a
        # letter, a digit, a capital, an ascender or a descender, and each pair is priced here.
        "x^a", "x^T", "x^2", "x^b", "x^p", "x^\\int", "x_i", "x_T", "x_2", "x_b", "x_p", "x_y",
        "x^{1}_{0}", "x_{p}^{T}", "\\sum_0^1", "\\sum_{n=0}^{\\infty} a_n",
        "\\frac{dy}{dx}", "\\sqrt{\\frac{1}{2}}", "\\overline{X}", "\\overline{y}", "\\hat{y}",
        "\\dot{x}", "\\vec{v}", "\\bar{u}^2", "\\left\\langle\\frac{a}{b}\\right\\rangle",
        "\\binom{n}{k}", "\\Bigl(", "\\bigl(", "\\left|\\begin{matrix}a\\end{matrix}\\right|",
        "\\begin{matrix}a\\\\b\\end{matrix}", "\\begin{pmatrix}a\\\\b\\end{pmatrix}",
        "\\sup", "\\inf", "\\max", "\\lim_{n}", "\\cup", "\\cap", "\\in", "\\otimes",
        "\\alpha", "\\beta", "\\gamma", "\\zeta", "\\xi", "\\rho", "\\pi", "\\chi", "\\psi",
        "\\omega", "\\Gamma", "\\Delta", "\\Omega", "\\emptyset", "\\partial", "\\infty",
        "\\mathbb{Z}", "\\mathbf{Q}", "\\mathrm{d}x", "\\text{var}", "\\operatorname{Fix}",
        "\\hbar", "\\imath", "\\jmath", "\\Re", "\\aleph",
        # the census of what a node label in `_work/flat` actually carries
        # (_work/probe_node_label_shapes.py, 8,139 labels): every spelling with occurrences on a page
        # is priced, and the ones with none (`\\dot`, `\\vec`, `{array}`) are left out on purpose.
        "\\delta", "\\epsilon", "\\varepsilon", "\\theta", "\\vartheta", "\\kappa", "\\lambda",
        "\\mu", "\\nu", "\\sigma", "\\varsigma", "\\tau", "\\upsilon",
        "\\Sigma", "\\Pi", "\\Upsilon", "\\Theta", "\\Lambda", "\\Xi", "\\Psi", "\\Omega",
        "\\to", "\\mapsto", "\\rightarrow", "\\longrightarrow", "\\leftarrow", "\\gets",
        "\\le", "\\ge", "\\ne", "\\neq", "\\equiv", "\\sim", "\\approx", "\\cong", "\\propto",
        "\\subset", "\\supset", "\\subseteq", "\\supseteq", "\\notin", "\\setminus", "\\mid",
        "\\perp", "\\parallel", "\\dagger", "\\star", "\\bullet", "\\circ", "\\cdot", "\\times",
        "\\div", "\\pm", "\\mp", "\\ast", "\\diamond", "\\oplus", "\\ominus", "\\oslash",
        "\\prime", "\\cdots", "\\ldots", "\\vdots", "\\forall", "\\exists", "\\nabla", "\\surd",
        "\\angle", "\\triangleleft", "\\triangleright", "\\leadsto",
        "\\prod", "\\coprod", "\\bigcup", "\\bigcap", "\\bigsqcup", "\\oint", "\\iint", "\\min",
        "\\widehat{uu}", "\\widetilde{uu}", "\\hat{uu}", "\\tilde{uu}", "\\overline{uu}",
        "\\check{u}", "\\breve{u}", "\\acute{a}", "\\grave{a}", "\\mathring{a}", "\\vec{uv}",
        "\\ddot{x}", "\\underline{u}",
        "\\text{long word}", "\\textrm{d}", "\\textit{x}", "\\mbox{ax}", "\\hbox{ax}",
        "\\operatorname{supp}", "\\mathbb{R}", "\\mathcal{L}", "\\mathbf{v}", "\\bm{v}",
        "\\boldsymbol{\\phi}", "\\mathsf{A}", "\\mathtt{a}",
        "\\dfrac{1}{2}", "\\tfrac{1}{2}", "\\frac{x_y}{ab}", "\\frac{a+b}{c-d}",
        "\\lfloor a\\rfloor", "\\lceil a\\rceil", "\\lbrace a\\rbrace", "\\Bigr)", "\\biggr)",
        "\\Bigg(", "\\bigl\\langle a\\bigr\\rangle",
        "\\begin{cases}a\\\\b\\end{cases}", "\\left(\\begin{matrix}a\\\\b\\end{matrix}\\right)",
        "\\sqrt[3]{x}", "\\sqrt{ab}", "x^{\\frac{1}{2}}", "x_{\\sqrt{x}}", "x_{(a)}", "x^{(a)}",
        "a\\cap b", "a\\cup b", "A\\to B", "x\\cdot y", "\\overline{AB}^2", "\\varnothing",
        "\\emptyset \\{ a \\}", "\\alpha_{\\beta}^{\\gamma}", "x^{y}_z", "x^{-1}", "x_{-1}",
        # the punctuation a label carries: `<` and `>` have no OT1 glyph in text mode, so both are
        # read as maths atoms, and `-` is a RELATION in TeX's maths rather than a bar.
        "<", ">", "-", "*", ";", ":", "?", "!", "'", "\\S", "\\P", "\\&", "\\%",
        "a\\colon b", "\\{x\\}^{2}", "x^{- 1}"]


TEMPLATE = r"""\documentclass[@SIZE@pt]{article}
\usepackage{amsmath,amssymb}
\begin{document}
@BODY@
\end{document}
"""

BODY = r"\measure{%(i)s}{%(sample)s}"


def run(size):
    items = [("t%d" % i, c) for i, c in enumerate(TEXT)] + \
            [("m%d" % i, "$%s$" % s) for i, s in enumerate(MATH)]
    body = "\n".join(BODY % {"i": tag, "sample": s} for tag, s in items)
    tex = TEMPLATE.replace("@SIZE@", str(size)).replace("@BODY@", body)
    tex = tex.replace("\\begin{document}", "\\def\\measure#1#2{\\setbox0\\hbox{#2}%\n"
                      "  \\typeout{GOT #1 HT=\\the\\ht0\\ DP=\\the\\dp0\\ WD=\\the\\wd0}}\n"
                      "\\begin{document}")
    name = "g%d.tex" % size
    open(os.path.join(OUT, name), "w", encoding="utf-8").write(tex)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name], cwd=OUT,
                   capture_output=True, text=True)
    log = open(os.path.join(OUT, name[:-4] + ".log"), encoding="utf-8", errors="replace").read()
    got = {}
    for tag, ht, dp, wd in re.findall(
            r"GOT (\S+) HT=([\d.-]+)pt ?\\? ?DP=([\d.-]+)pt ?\\? ?WD=([\d.-]+)pt", log):
        got[tag] = tuple(float(v) for v in (ht, dp, wd))
    return got, items


readings = {}
for size in (10, 11, 12):
    got, items = run(size)
    readings[size] = got
    print("%dpt: %d readings, missing %s" % (size, len(got),
                                             [s for t, s in items if t not in got]))

items = [("t%d" % i, c) for i, c in enumerate(TEXT)] + \
        [("m%d" % i, "$%s$" % s) for i, s in enumerate(MATH)]
print("\n%-26s %8s %8s %8s   %s" % ("sample", "top/em", "deep/em", "ink/em", "per size (top,deep)"))
for tag, sample in items:
    vals = []
    for size in (10, 11, 12):
        got = readings[size]
        if tag not in got:
            vals = []
            break
        ht, dp, _wd = got[tag]
        vals.append((ht / size, dp / size))
    if not vals:
        print("%-26s  (no reading)" % sample)
        continue
    top, deep = vals[1]
    spread = " ".join("(%.3f,%.3f)" % v for v in vals)
    print("%-26s %8.4f %8.4f %8.4f   %s" % (sample, top, deep, top + deep, spread))
