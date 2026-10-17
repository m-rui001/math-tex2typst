"""Batch-convert LaTeX fragments to Typst through pandoc (one call per batch)."""

import os
import re
import subprocess
import tempfile

BATCH_PREAMBLE = (
    "\\documentclass{article}\n"
    "\\usepackage{amsmath,amssymb,mathtools,bm,amsfonts,mathrsfs,amsthm,"
    "natbib,cleveref,hyperref,booktabs,longtable,enumitem,graphicx,xcolor}\n"
    "\\begin{document}\n"
)
BATCH_EPILOG = "\n\\end{document}\n"
MARK = "ZQFX"
SENTINEL_RX = re.compile(MARK + r"\d{6}")
PANDOC_BIN = os.environ.get("PANDOC", "pandoc")

# pandoc's Typst writer predates a symbol rename, so `\triangleleft` reaches us as `lt.tri` and
# `\models` as `tack.r.double` -- names Typst still prints but complains about on every page they touch
# (`_work/probe_typst_warnings.py` found 113 of them, `_work/probe_deprecated_symbols.py` counted 284
# occurrences in 37 papers once the whole corpus was asked). Each pair below prints the SAME glyph,
# measured by compiling both spellings and reading the codepoint back with fitz
# (`_work/measure_symbol_glyphs.py`): U+22B2, U+22B4, U+22B3, U+22B5, U+22A8, U+2AE4. Typst's own hint
# names only the BASE symbol -- "use `lt.closed` instead" -- and following it literally on a decorated
# name would print ⊲ where the author wrote ⊴, which is why the decorated spellings are listed too.
# The lookarounds make a bare `lt.tri` skip over `lt.tri.eq` and over `lt.triangle` in prose. An
# underscore is NOT part of a name here -- in Typst maths it opens a subscript, so `lt.tri.eq_o`
# (pandoc's `$N\trianglelefteq_o\Gamma$`) is the closed triangle with an `o` under it, and refusing
# to rename it left six deprecated spellings on the page in one paper.
SYMBOL_RENAMES = (
    ("lt.tri.eq", "lt.closed.eq"), ("gt.tri.eq", "gt.closed.eq"),
    ("lt.tri", "lt.closed"), ("gt.tri", "gt.closed"),
    ("tack.r.double", "tack.rr"), ("tack.l.double", "tack.ll"),
)


def modern_symbols(text):
    """pandoc's deprecated symbol names, replaced by the ones Typst asks for."""
    for old, new in SYMBOL_RENAMES:
        text = re.sub(r"(?<![A-Za-z0-9.])%s(?![A-Za-z0-9.])" % re.escape(old), new, text)
    return text


# pandoc's Typst writer prices TeX's `\!` at a whole em. In TeX the four spacing commands are
# measured in mu with 18mu = 1 quad: `\,` 3mu, `\:` 4mu, `\;` 5mu, `\!` -3mu, and the quad is 2 em,
# so `\!` is -1/6 em. Measured on the page at 11pt (`_work/probe83_space_values.py`, reading the two
# glyphs' ink boxes): pdflatex `A\!B` puts B 1.822pt LEFT of A's right edge, pandoc's `#h(-1em)` puts
# it 11.0pt left -- B sits on top of A -- and `#h(-0.16667em)` gives 1.834pt. The two spellings pandoc
# gets right are left alone: `\,` -> `thin` (1.833) and `\:` -> `med` (2.444) against TeX's 1.822/2.422.
# `#h(-1em)`'s other producer is `\hspace{-1em}`, which HSPACE_BACK below puts back *after* this
# table has run, so at this choke point the token is still `\!` alone.
# pandoc prices the five mu-based spacing commands at a whole em or at nothing, so the two that
# carry a value are corrected here. `\;` is 5mu = 5/18em (measured on the page: pdflatex +3.033pt
# at 11pt). `\enspace` (0.5em) shares that one token -- measured over the corpus, the maths channel
# carries `\;` 217 times against `\enspace` 3, and all 3 sit in one paper, so the two spellings are
# read at the `\;` price rather than split apart for three occurrences.
SPACE_VALUES = (("#h(-1em)", "#h(-0.16667em)"), ("#h(0em)", "#h(0.27778em)"))

# `\hspace{12mm}` carries a length, and pandoc's writer throws every length away -- it answers
# `#h(0em)` for any `\hspace`, whatever the argument. The length is read in clean() and carried
# across pandoc in a `\text{}` token (the round trip CITE_TOKEN already uses), then put back here
# as a Typst length. mm/cm/in/em are the same length on both sides; TeX's `pt` is 1/72.27in against
# Typst's 1/72in, so a `pt` argument is scaled, and pc/sp follow it.
HSPACE_TOKEN = "ZQHSP"
HSPACE_BACK = re.compile(r'upright\("([^"]*)"\)')
HSPACE_IN = re.compile(r"%s([-\d.]+[a-z]{2})" % HSPACE_TOKEN)
LEN_UNITS = {"mm": 1.0, "cm": 1.0, "in": 1.0, "em": 1.0, "bp": 1.0,
             "pt": 72.0 / 72.27, "pc": 12.0 * 72.0 / 72.27, "sp": 1.0 / 65536.0}
LEN_RX = re.compile(r"^([-+]?(?:\d+\.?\d*|\.\d+))\s*(mm|cm|in|em|bp|pt|pc|sp)$")


def hspace_value(arg):
    r"""`12mm` -> `12mm` (the Typst spelling), or None when the argument carries no length."""
    m = LEN_RX.match(arg.strip())
    if m is None:
        return None
    value = float(m.group(1)) * LEN_UNITS[m.group(2)]
    shown = ("%d" % value) if value == int(value) else ("%.4f" % value).rstrip("0").rstrip(".")
    return "%s%s" % (shown, m.group(2))


def hspace_token(arg):
    r"""`12mm` -> the `\text{ZQHSP12mm}` a formula carries its length with, or `\,` when unreadable."""
    value = hspace_value(arg)
    return ("\\text{%s%s}" % (HSPACE_TOKEN, value)) if value else r"\,"


def _hspace_back(m):
    r"""`upright("xZQHSP2mmy")` -> `upright("x")#h(2mm) upright("y")`.

    A `\hspace` written inside a `\text{}` run arrives flattened into that run's own string --
    flatten_text joins nested `\text{}` before pandoc sees the formula -- so the token is looked
    for wherever it sits in the string, not only at its start. The corpus writes no such `\hspace`
    (0 of 310), but a leaked token would print the sentinel.
    """
    body = m.group(1)
    if HSPACE_TOKEN not in body:
        return m.group(0)
    out, k = [], 0
    for t in HSPACE_IN.finditer(body):
        if t.start() > k:
            out.append('upright("%s")' % body[k:t.start()])
        out.append("#h(%s) " % t.group(1))
        k = t.end()
    if k < len(body):
        out.append('upright("%s")' % body[k:])
    return "".join(out)


def tex_space_values(text):
    """pandoc's em prices for TeX's mu-based spacing commands, corrected to the mu value.

    A `\\hspace` length, which pandoc drops, is restored from the token clean() baked. The token
    is put back last so the `#h(0em)` row above cannot read a `\\hspace{0em}` as a `\\;`.
    """
    for old, new in SPACE_VALUES:
        text = text.replace(old, new)
    return HSPACE_BACK.sub(_hspace_back, text)


def run_pandoc(tex_source, fmt_in="latex", fmt_out="typst"):
    """Run pandoc on a complete LaTeX source, return (text, stderr)."""
    with tempfile.NamedTemporaryFile("w", suffix=".tex", delete=False,
                                     encoding="utf-8") as fh:
        fh.write(tex_source)
        src = fh.name
    dst = src[:-4] + ".out"
    try:
        proc = subprocess.run([PANDOC_BIN, src, "-f", fmt_in, "-t", fmt_out,
                               "-o", dst, "--wrap=none"],
                              capture_output=True, text=True, encoding="utf-8",
                              timeout=900)
        out = ""
        if os.path.exists(dst):
            with open(dst, encoding="utf-8") as fh:
                out = fh.read()
        return modern_symbols(tex_space_values(out)), proc.stderr or ""
    finally:
        for p in (src, dst):
            try:
                os.remove(p)
            except OSError:
                pass


ACCENTED = re.compile(
    r"\\(overline|underline|overrightarrow|overleftarrow|widehat|widetilde"
    r"|hat|tilde|check|breve|bar|vec|dot|ddot|mathbb|mathbf|mathit|mathsf"
    r"|mathtt|mathrm|mathcal|mathfrak|mathscr|bm|boldsymbol|operatorname|text)"
    r"(?![a-zA-Z])\s*(\\(?:[a-zA-Z]+)\s*(?:\{[^{}]*\}|[A-Za-z0-9])|[A-Za-z0-9])")

# one unbraced TeX argument: a control word with its group, a control sequence, or a
# single character. A brace opening a group is not an argument we need to re-brace.
RELARG = r"(?:\\[a-zA-Z]+\s*\{[^{}]*\}|\\[A-Za-z]+|\\.|[^{\\])"
# \overset\mathrm{law}=tX_1 binds \mathrm{law} and the '=' as its two arguments;
# texmath accepts only the braced pair
UNBRACED_REL = re.compile(r"\\(overset|underset)(?![a-zA-Z])\s*(" + RELARG +
                          r")\s*(" + RELARG + ")")

PDF_MATH = re.compile(r"\\(?:begingroup|endgroup|qedhere|displaystyle|textstyle"
                      r"|scriptstyle|limits|nolimits|nobreak|allowbreak"
                      r"|mathstrut|strut)\b"
                      r"|\\(?:setlength|hphantom|vphantom|phantom)"
                      r"\s*\{[^{}]*\}(?:\s*\{[^{}]*\})?")

# TeX ends a control word at the first non-letter, so '\rangleI' means '\rangle I'
# to TeX but is one unknown token to pandoc's reader.
GLUED_DELIM = re.compile(r"\\(?:langle|rangle|lVert|rVert|lvert|rvert|Vert|vert"
                         r"|llcorner|lrcorner|lfloor|rfloor)(?=[A-Za-z])")

# one braced argument that nests twice, as \tag{\(\ast_{\mathrm{adj}}\)} does
ARG = r"\{(?:[^{}]|\{(?:[^{}]|\{[^{}]*\})*\})*\}"

# TeX ends a row with two backslashes, and '\substack{a,b\\(a,b)=1}' puts a parenthesis
# straight after them. A rule that strips a backslash must not take the second one.
NOTROW = r"(?<!\\)"

# \vrule takes its dimensions in any order and glues them without spaces: '\vrule height 1.4ex
# depth -.3ex width .07ex\vrule height .07ex depth 0ex width .7ex' is one rule per segment, and
# a negative depth is how the rule is lifted above the baseline.
VRULE = r"\\vrule\s*(?:[a-z]+\s*[-+]?\d*\.?\d+\s*(?:ex|pt|em|mu|bp|in|cm)\s*)+"

MATH_REF = re.compile(r"\\(eq|t|C|c|aut)?ref(?![a-zA-Z])\s*\*?\s*\{([^{}]*)\}")
# a tag can label a row with a symbol instead of a number, and the asterisk forms are
# what authors write; Typst has one glyph for each
TAG_SYMBOL = {r"\ast": "∗", r"\star": "⋆", r"\dagger": "†"}
MATH_CITE = re.compile(r"\\(?:cite[pt]|cite|nocite|autocite|parencite|textcite"
                       r"|citeauthor|citeyear|citetitle)(?![a-zA-Z])"
                       r"\s*((?:\[[^\]]*\])*)\s*\{([^{}]*)\}")
# an external bibliography numbers its entries only when Typst compiles the page, so a formula
# that cites one carries a token across pandoc and gives it back here, where the answer is
# Typst markup again. Keys are `[A-Za-z0-9_.:+-]` in every refs.bib of the corpus (measured over
# 12914 of them), so a key can never collide with the token's own delimiters.
CITE_TOKEN = "ZQMCITE"
CITE_BACK = re.compile(r'upright\("\[%s([^\]"]*)\]([^"]*)"\)' % CITE_TOKEN)


def cite_token(key):
    """The `\\text{...}` payload a formula quotes an external entry with."""
    return "%s%s" % (CITE_TOKEN, key)


def unbake_cites(text):
    r"""`upright("[ZQMCITEkey] note")` -> `#cite(label("key"))upright(" note")`.

    Measured on one page: `#cite` is legal inside `$ ... $` (it answers `[1]` there), and the
    note follows the citation as plain text, which is how the prose channel of the same paper
    writes `\citep[Corollary~1.4]{K}`. The note stays inside `upright`, where it already was:
    spliced into the formula bare, Typst reads `Lemma 2.9` as two variables and fails the compile.
    """
    def one(m):
        note = m.group(2).strip()
        got = '#cite(label("%s"))' % m.group(1)
        return got + ('upright("%s")' % (" " + note) if note else "")

    return CITE_BACK.sub(one, text)


def _shown(refs, key, style):
    entry = refs.get(key)
    if entry is None:
        return "??"
    shown, name = entry
    if not shown:
        return "??"
    if style == "eq":
        return "(%s)" % shown
    if style and name:
        return (name if style == "Name" else name.lower()) + " " + str(shown)
    return str(shown)


def _keys(where):
    return [k.strip() for k in where.split(",") if k.strip()]


def tag_text(tag, refs):
    r"""An equation tag as the text it prints, outside any formula.

    \tag{\ref{eq:x}} borrows another equation's number and \tag{\(\ast\)} labels a row
    with a symbol; both arrive as TeX the emitter writes into markup, where \text{...}
    and math delimiters would read back as leftover source.
    """
    got = MATH_REF.sub(lambda m: "".join(
        _shown(refs, k, "") for k in _keys(m.group(2))), tag)
    got = re.sub(r"\\[\[\]()]", "", got)
    for tex, glyph in TAG_SYMBOL.items():
        got = got.replace(tex, glyph)
    got = got.strip()
    if "\\" in got:
        # the tag still carries a formula of its own, so it goes through the converter the
        # equations use: `\tag{\(\ast_{\mathrm{adj}}\)}` is a number the paper prints as maths
        fresh = (convert_formulas(["$%s$" % got], refs)[0].get(0) or "").strip()
        # a tag we cannot render is a number we cannot print -- an empty answer leaves the
        # reference reading as unresolved rather than putting TeX on the page
        return fresh if fresh.startswith("$") and fresh.endswith("$") else ""
    return got


def tag_maths(num):
    r"""The formula inside an equation number that is really a \tag carrying maths, else None.

    `tag_text` hands back `$ ... $` for such a tag, and the two places a number reaches the page want
    it in their own mode: inside a display's `$ ... $` the delimiters would close the formula, while a
    reference sits in text and needs them.
    """
    text = str(num)
    if text.startswith("$") and text.endswith("$"):
        return text[1:-1].strip() or None
    return None


def _cite_text(m, refs):
    """A citation as the text it prints: `[number]`, plus the author's own note after it.

    natbib's brackets hold the note (`\\citep[Lemma~2.9]{K}`), and TeX prints it inside the
    reference; here it follows the number, which is what the prose channel of the same paper does.
    """
    keys = ", ".join(_shown(refs, k, "") for k in _keys(m.group(2)))
    notes = ", ".join(t.strip().replace("~", " ") for t in re.findall(r"\[([^\]]*)\]", m.group(1)))
    return "[%s]%s" % (keys, (" " + notes) if notes else "")


def bake_refs(f, refs):
    r"""Bake cross-references and citations into plain text.

    texmath knows no \eqref, \ref or \citep, so one reference costs the whole
    equation; the resolved number as \text{...} lets the rest of it convert.
    """
    style = {"eq": "eq", "C": "Name", "c": "name", "aut": "name"}
    f = MATH_REF.sub(lambda m: "\\text{%s}" % "".join(
        _shown(refs, k, style.get(m.group(1) or "", "")) for k in _keys(m.group(2))), f)
    return MATH_CITE.sub(lambda m: "\\text{%s}" % _cite_text(m, refs), f)


def _group_end(s, start):
    """Index just past the balanced brace group that opens at s[start], else -1."""
    if s[start:start + 1] != "{":
        return -1
    depth = 0
    for i in range(start, len(s)):
        if s[i] == "{":
            depth += 1
        elif s[i] == "}":
            depth -= 1
            if depth == 0:
                return i + 1
    return -1


def take_group(s, i):
    """(contents, index past the group) for the brace group starting at i, or (None, i)."""
    end = _group_end(s, i)
    if end == -1:
        return None, i
    return s[i + 1:end - 1], end


def skip_space(s, i):
    while i < len(s) and s[i] in " \t\n":
        i += 1
    return i


def mathchoice(f):
    r"""Resolve \\mathchoice to its display-style branch.

    The four branches are the same maths drawn at the four math sizes, so keeping
    the first keeps the meaning; what they usually add is PDF-only box measuring.
    """
    cmd = "\\mathchoice"
    while True:
        i = f.find(cmd)
        if i == -1:
            return f
        j, branches = i + len(cmd), []
        while len(branches) < 4:
            j = skip_space(f, j)
            arg, j = take_group(f, j)
            if arg is None:
                # unbraced / malformed: keep the branches, lose only the command
                f = f[:i] + f[i + len(cmd):]
                break
            branches.append(arg)
        else:
            f = f[:i] + branches[0] + f[j:]


# A command moved out of a text run carries its own arguments with it: one bracketed
# note and up to two braced keys (\citep[Cor.~1.4]{A,B}); a bare '\alpha' takes neither.
TEXT_INNER = re.compile(r"\$([^$]*)\$|\\\((.*?)\\\)|\\(?!text\b)[A-Za-z@]+"
                        r"(?:\[[^\]]*\])?(?:\{[^{}]*\}){0,2}")
TEXT_HEAD = re.compile(r"\\text\s*\{")


def text_math_out(f):
    r"""Move maths out of \\text{...}: \\text{for $\\nu$-a.e.} -> \\text{for }\\nu\\text{-a.e.}.

    TeX re-enters math mode inside a text argument, so authors write symbols there
    with $...$ or \\(...\\); pandoc's reader stops at the backslash and refuses the
    whole formula. The prose survives in upright text, the symbol as real maths.
    """
    out, i = [], 0
    while True:
        j = f.find("\\text{", i)
        if j == -1:
            out.append(f[i:])
            return "".join(out)
        body, end = take_group(f, j + len("\\text"))
        if body is None:
            out.append(f[i:])
            return "".join(out)
        out.append(f[i:j])
        pieces, k = [], 0
        for m in TEXT_INNER.finditer(body):
            prose = body[k:m.start()]
            if prose:
                pieces.append("\\text{%s}" % prose)
            # a delimited span contributes its contents; a control sequence itself
            pieces.append(next(g for g in (m.group(1), m.group(2), m.group(0))
                               if g is not None))
            k = m.end()
        prose = body[k:]
        if prose:
            pieces.append("\\text{%s}" % prose)
        joined = "".join(pieces) or "\\text{}"
        # \quad\text{$f$-nef} hands back "f..." where \text{ used to stand, and TeX's
        # control word \quad would swallow the f; a space keeps the two tokens apart
        if joined[:1].isalpha() and re.search(r"[A-Za-z]$", f[i:j]):
            joined = " " + joined
        out.append(joined)
        i = end


def flatten_text(f, inside=False):
    r"""A \\text run inside another one is the same upright text: keep its words, drop the run.

    Authors write \\text{in Case \\text{(i)}}, and text_math_out leaves the inner run in the
    prose it re-wraps; texmath reads a nested \\text as a backslash in the middle of a string.
    """
    out, i = [], 0
    while True:
        m = TEXT_HEAD.search(f, i)
        if not m:
            out.append(f[i:])
            return "".join(out)
        body, end = take_group(f, m.end() - 1)
        if body is None:
            out.append(f[i:])
            return "".join(out)
        inner = flatten_text(body, True)
        out.append(f[i:m.start()] + (inner if inside else "\\text{" + inner + "}"))
        i = end


def brace_args(f):
    r"""Give accents and font macros the braced argument texmath demands.

    pandoc's TeX math reader refuses '\overline\mathbb D' but accepts
    '\overline{\mathbb{D}}', and TeX itself reads the unbraced form exactly
    that way -- the accent binds the whole next token. Repeated because one
    pass only unwraps the outer level.
    """
    for _ in range(3):
        new = ACCENTED.sub(lambda m: "\\%s{%s}" % (m.group(1), m.group(2)), f)
        if new == f:
            break
        f = new
    return f


FRAC = re.compile(r"\\(?:frac|dfrac|tfrac|cfrac|binom|dbinom|tbinom)(?![a-zA-Z])")
# An unbraced TeX argument is one token -- but a control word that needs its own
# argument keeps it, so '\frac1\mathrm{i}' has a whole denominator while
# '\frac \tau{\log\tau}' has the group as the *second* argument, not as \tau's.
FRACTOKEN = re.compile(
    r"\\(?:mathrm|mathbf|mathit|mathbb|mathcal|mathsf|mathtt|mathfrak|mathscr|bm"
    r"|boldsymbol|operatorname|text|textbf|textit|overline|underline|widehat"
    r"|widetilde|hat|tilde|check|breve|bar|vec|dot|ddot)\s*\{[^{}]*\}"
    r"|\\[A-Za-z@]+|\\.|.")


def frac_args(f):
    r"""Brace both arguments of \\frac and \\binom.

    TeX reads an unbraced argument as one token, so '\\frac12' and
    '\\frac1\\mathrm{i}' are valid TeX but texmath only accepts two groups -- the
    second slot holding a control sequence is what makes the formula refuse.
    """
    out, i = [], 0
    while True:
        m = FRAC.search(f, i)
        if m is None:
            out.append(f[i:])
            return "".join(out)
        out.append(f[i:m.start()])
        j, args = m.end(), []
        while len(args) < 2:
            j = skip_space(f, j)
            if f[j:j + 1] == "{":
                arg, j = take_group(f, j)
            elif j < len(f):
                tok = FRACTOKEN.match(f, j)
                arg, j = tok.group(0), tok.end()
            else:
                arg = None
            if arg is None:
                break
            args.append(arg)
        if len(args) < 2:
            out.append(m.group(0))
            i = m.end()
            continue
        num, den = args
        # an empty denominator (a stripped spacing command, or a template) leaves
        # only the numerator as maths, which is what TeX's output means
        i = j
        if not den.strip():
            out.append(num)
        elif not num.strip():
            out.append(den)
        else:
            out.append("%s{%s}{%s}" % (m.group(0), num, den))


def clean(f, refs=None):
    r"""One LaTeX formula -> the shape pandoc's typst writer accepts.

    The display wrapper, its label and the PDF-only spacing carry no maths, so
    what emit() falls back to quoting is the equation, not its \begin{} envelope.
    """
    # an accsupp accessibility wrapper names the glyphs TeX already drew: it holds
    # either a hex code point and then the maths, or the maths alone. The hex is a run of
    # UTF-16 code units, so pairs of hex digits, and a maths argument never is -- that is
    # what tells the two shapes apart, where a length bound cannot (one underbrace label
    # is 84 digits long).
    f = re.sub(NOTROW + r'\\[A-Za-z]*ActualText(?![a-zA-Z])\s*\{(?:[0-9A-Fa-f]{2})+\}(' + ARG + ')',
               lambda m: m.group(1), f)
    f = re.sub(NOTROW + r'\\[A-Za-z]*ActualText(?![a-zA-Z])\s*(' + ARG + ')',
               lambda m: m.group(1), f)
    f = re.sub(r'\\lhook\s*\\joinrel\s*\\longrightarrow', lambda m: r'\hookrightarrow', f)
    f = re.sub(r'\\hspace\s*\{([^{}]*)\}', lambda m: hspace_token(m.group(1)), f)
    # `\hfill` is an elastic space with no length to read, so it keeps the old bounded guess
    f = re.sub(r'\\hfill', r'\,', f)
    f = re.sub(r'\\begin\{psmallmatrix\}', r'\\begin{smallmatrix}', f)
    f = re.sub(r'\\end\{psmallmatrix\}', r'\\end{smallmatrix}', f)
    # split is an aligned block with one extra centreing rule amsmath owns and texmath does not.
    # \operatorname is deliberately NOT renamed to \mathrm: texmath knows that command, while
    # \mathrm makes it set the name one letter at a time -- 'upright(d i v)' in 717 papers.
    f = re.sub(r'\\begin\{split\}', r'\\begin{aligned}', f)
    f = re.sub(r'\\end\{split\}', r'\\end{aligned}', f)
    # \text{\rm unit} and \text{\mathrm{unit}} say the same thing twice: the outer \text already
    # leaves math mode, so the inner font switch is a no-op that texmath's reader trips on.
    f = re.sub(NOTROW + r'\\(?:text|textrm|mbox)\s*\{\s*\\(?:rm|mathrm|mathbf|mathit|text)\s*'
               r'\{?([^{}]*?)\}?(\s*\\\\)?\s*\}', lambda m: "\\text{%s}" % m.group(1), f)
    # \noalign{\vskip 3pt} is a hand-written row gap, and \hline is a rule: both say how the
    # array is drawn on the page, exactly like the booktabs lines below that this follows.
    # No NOTROW guard here: they follow a row break ('\\\hline'), and only the rule is removed,
    # never one of the two backslashes that made the break.
    f = re.sub(r'\\noalign\s*\{[^{}]*\}', '', f)
    f = re.sub(r'\\hline(?![a-zA-Z])', '', f)
    # \colorbox and \fcolorbox paint a cell, and the paint has nowhere to go: pandoc's math reader
    # has no colour node -- \textcolor converts but comes back identical to the uncoloured cell --
    # so the box is dropped with its colour and only the cell's content stays as the maths.
    f = re.sub(r'\\fcolorbox\s*' + ARG + ARG + '(' + ARG + ')', lambda m: m.group(1), f)
    f = re.sub(r'\\colorbox\s*' + ARG + '(' + ARG + ')', lambda m: m.group(1), f)
    # The current restriction C ⌞ E is hand-drawn as rules: one tall and thin, one short and
    # wide on the baseline. texmath has no \vrule, so the group that only drew an operator is
    # replaced by that operator; a \vrule outside such a group carries geometry we cannot read.
    f = re.sub(r'\\mathbin\s*\{(?:' + VRULE + r')+\s*\}', lambda m: "\u231e", f)
    f = re.sub(r'\\begin\{array\}\s*(?:\[[^\]]*\])?\s*\{((?:[^{}]|\{[^{}]*\})*)\}',
               lambda m: '\\begin{array}{%s}'
                         % re.sub(r"[pmdb]\s*\{[^{}]*\}", "l",
                                  re.sub(r"@\s*\{[^{}]*\}", "", m.group(1))), f)
    f = PDF_MATH.sub("", f)
    # an explicit inter-row skip is page layout; the row break itself is the maths
    f = re.sub(r'\\\\\s*\[[^\]]*\]', lambda m: "\\\\", f)
    # booktabs rules are layout, not maths; texmath has no name for them
    f = re.sub(NOTROW + r'\\(?:toprule|midrule|bottomrule|cmidrule(?:\([^)]*\))?)\b', '', f)
    # an array cell that spans n columns is one cell of content and n-1 empty ones:
    # texmath's array parser accepts only & and \\ between cells, never \multicolumn
    f = re.sub(NOTROW + r'\\multicolumn\{\d+\}' + ARG + '(' + ARG + ')',
               lambda m: m.group(1)[1:-1] + " &", f)
    # \intertext breaks the alignment to print a line of prose, which is what \text does
    f = re.sub(NOTROW + r'\\intertext(' + ARG + ')', lambda m: r'\\ \text' + m.group(1) + r' \\', f)
    # \tbinom and \dbinom are \binom at a fixed size; the size is not the maths
    f = re.sub(NOTROW + r'\\[td](binom|frac|dfrac|tfrac)(?![a-zA-Z])', r'\\\1', f)
    f = re.sub(NOTROW + r'\\cr(?![a-zA-Z])', r'\\\\', f)
    # \rule{0pt}{13pt} is a hand-written strut: it carries row height and no ink,
    # exactly like the \strut and \vphantom PDF_MATH already drops
    f = re.sub(NOTROW + r'\\rule\s*\{0+(?:\.0+)?\s*(?:pt|em|ex|mu|bp|sp|mm|cm|in|pc)?\s*\}' + ARG, '', f)
    # \displaybreak only says a page may break here
    f = re.sub(NOTROW + r'\\displaybreak(?:\[\d\])?(?![a-zA-Z])', '', f)
    # mathtools' labelled arrows are an overset relation
    f = re.sub(NOTROW + r'\\x(Rightarrow|Leftarrow|rightarrow|leftarrow|leftrightarrow|mapsto)(' + ARG + ')',
               lambda m: r'\overset' + m.group(2) + '{\\' + m.group(1) + '}', f)
    # \noalign inserts material between table rows; the rows are the maths
    f = re.sub(NOTROW + r'\\noalign' + ARG, '', f)
    f = mathchoice(f)
    # operator limits written with \mathop are the operator itself
    f = re.sub(r'\\mathop\s*\{((?:[^{}]|\{[^{}]*\})*)\}', r'\1', f)
    # box building is PDF plumbing -- the payload is what carries the maths
    f = re.sub(r'\\setbox\d+\s*=\s*\\[a-z]*\s*\{(?:[^{}]|\{[^{}]*\})*\}', '', f)
    # \mathllap / \mathrlap overlap into the margin; the content itself is the maths
    f = re.sub(r'\\(?:vcenter|vtop|math(?:l|c|r)lap)\s*\{((?:[^{}]|\{[^{}]*\})*)\}', r'\1', f)
    f = re.sub(r'\\(?:mkern|kern|mspace)\s*(?:[-+]?\s*(?:\d+\.?\d*|\.\d+)\s*(?:mu|th|sk|em|ex|pt|bp|sp)'
               r'|[-+]?\s*(?:\d+\.?\d*|\.\d+)\s*\\(?:wd|ht|dp)\d*'
               r'|[-+]?\s*(?:\d+\.?\d*|\.\d+))', '', f)
    f = GLUED_DELIM.sub(lambda m: m.group(0) + " ", f)
    # \sqrt2 is a single-token argument in TeX; texmath wants it braced
    f = re.sub(r'\\sqrt\s*([A-Za-z0-9])', lambda m: '\\sqrt{' + m.group(1) + '}', f)
    f = re.sub(r'\\hbox\s*\{', lambda m: r'\text{', f)
    f = re.sub(r'\\textup\s*\{', lambda m: r'\text{', f)
    # texmath knows \text, \textit and \textbf but not these spellings of the same
    # style; \textcolor in a formula is colour on the page, its payload is the maths
    f = re.sub(r'\\text(?:normal|md|sc)\s*\{', lambda m: r'\text{', f)
    f = re.sub(r'\\textsl\s*\{', lambda m: r'\textit{', f)
    f = re.sub(r'\\textcolor\s*\{[^{}]*\}\s*\{((?:[^{}]|\{[^{}]*\})*)\}', r'\1', f)
    f = re.sub(r'\\ensuremath\{([^{}]*)\}', r'\1', f)
    for old, new in [('rm', 'mathrm'), ('bf', 'mathbf'), ('it', 'mathit'), ('sf', 'mathsf'), ('tt', 'mathtt'), ('cal', 'mathcal')]:
        f = re.sub(r'\{\s*\\' + old + r'(?![a-zA-Z])\s*([^{}]*)\}', lambda m, new=new: '\\' + new + '{' + m.group(1) + '}', f)
        # '\rm in' inside a subscript switches font for the rest of the group; TeX
        # reads that as one word, texmath only knows the braced form
        f = re.sub(r'\\' + old + r'(?![a-zA-Z])\s+([A-Za-z0-9]+)',
                   lambda m, new=new: '\\' + new + '{' + m.group(1) + '}', f)
    # a size command only stretches the delimiter after it; texmath reads that one
    f = re.sub(r'\\(?:bigg?|Bigg?)[lmn]?(?![a-zA-Z])\s*(?=[|\\])', '', f)
    f = text_math_out(f)
    f = flatten_text(f)
    # after the text run is split, so a reference inside \text{} becomes its own
    # \text{(2.3)} instead of nesting one text command inside another
    f = bake_refs(f, refs or {})
    f = brace_args(f)
    f = frac_args(f)
    f = UNBRACED_REL.sub(lambda m: "\\%s{%s}{%s}" % (m.group(1), m.group(2), m.group(3)), f)
    # accsupp accessibility specials are PDF noise pandoc cannot parse
    f = re.sub(r'\\OriginalText\{([^}]*)\}', r'\1', f)
    f = re.sub(r'\\BeginAccSupp\{[^}]*\}', '', f)
    f = re.sub(r'\\EndAccSupp\b', '', f)
    f = re.sub(r'\\varprojlim(?![a-zA-Z])', r'\\operatorname{proj\\,lim}', f)
    f = re.sub(r'\\varinjlim(?![a-zA-Z])', r'\\operatorname{inj\\,lim}', f)
    f = re.sub(r'\\begin\{(?:align|alignat|flalign|eqnarray|gather|multline)\*?\}(?:\{\d+\})?', lambda m: r'\begin{aligned}', f)
    f = re.sub(r'\\end\{(?:align|alignat|flalign|eqnarray|gather|multline)\*?\}', lambda m: r'\end{aligned}', f)
    # pandoc only braces \mathbb{Q}; unbraced \mathbb Q loses its backslash and
    # Typst math then spaces the bare letters apart
    f = re.sub(r'\\(mathbb|mathbf|mathit|mathsf|mathtt|mathcal|mathfrak|mathscr|mathrm|bm|boldsymbol)\s+([A-Za-z0-9])',
               lambda m: '\\' + m.group(1) + '{' + m.group(2) + '}', f)
    # a Math node's own delimiters are already stripped, so any $ left is nested
    # inline math (e.g. inside \text{}); pandoc chokes on it, drop the delimiters
    f = re.sub(r"\$([^$]*)\$", r"\1", f)
    # \( \) and \[ \] open maths the same way; inside a Math node they are stray tokens
    f = re.sub(NOTROW + r"\\[\[\]()]", "", f)
    f = re.sub(NOTROW + r"\\(?:label|tag)\*?\s*" + ARG, "", f)
    f = re.sub(NOTROW + r"\\(?:begin|end)\{(?:equation|align|alignat|gather|multline|flalign|eqnarray|displaymath)\*?\}(?:\{\d+\})?", "", f)
    f = re.sub(NOTROW + r"\\(?:notag|nonumber)\b", "", f)
    return f


def build_batch(formulas, refs=None):
    """formulas: list of latex strings -> (batch tex source, skipped indexes)."""
    chunks, skipped = [], []
    for i, f in enumerate(clean(x, refs) for x in formulas):
        if "$" in f:
            skipped.append(i)
            continue
        chunks.append("%s%06d $ %s $ %s%06d" % (MARK, i, f, MARK, i))
    return BATCH_PREAMBLE + "\n\n".join(chunks) + BATCH_EPILOG, skipped


def _parse_spans(out):
    """Return {local_index: typst math} from a pandoc batch output."""
    spans = [(m.group(0), m.start(), m.end()) for m in SENTINEL_RX.finditer(out)]
    got = {}
    for (tok, _s0, e0), (_tok2, s1, _e1) in zip(spans[0::2], spans[1::2]):
        value = out[e0:s1].strip()
        if value.startswith('$') and value.endswith('$'):
            value = re.sub(r"\bsect\b", "∩", value).replace("times.circle", "⊗").replace("∩.big", "⋂").replace("⊗.big", "⨂").replace("dot.circle", "⊙").replace("minus.circle", "⊖").replace("cal()", "")
            # texmath sets \mathrm{div} one letter at a time, and pandoc keeps each letter as its own
            # identifier: upright(d i v). Roman in math means a name, not a product of variables, so
            # the letters are rejoined and quoted.
            value = re.sub(r"upright\(([A-Za-z](?: [A-Za-z])+)\)",
                           lambda m: 'upright("%s")' % m.group(1).replace(" ", ""), value)
            got[int(tok[len(MARK):])] = value
    return got


def _bisect(idxs, isolate, result, depth=0):
    """Hand pandoc the batch for these indexes, then retry in halves what it dropped.

    isolate(subset) returns ({position: value}, positions to leave alone). Damage
    from one unreadable item is confined to the items that shared its pandoc call.
    The depth bound only stops a paper whose every formula is unreadable; a normal
    batch reaches a converted subset in one call and never splits.
    """
    got, claimed = isolate(idxs)
    for pos, value in got.items():
        result[idxs[pos]] = value
    missing = [idxs[pos] for pos in range(len(idxs))
               if pos not in got and pos not in claimed]
    if not missing or len(idxs) == 1 or depth >= 13:
        return
    mid = len(missing) // 2
    _bisect(missing[:mid], isolate, result, depth + 1)
    _bisect(missing[mid:], isolate, result, depth + 1)


def convert_formulas(formulas, refs=None):
    """Return (index -> typst math, indexes pandoc refused, stderr text).

    One pandoc call per paper, split only where the parse demands it.
    """
    result = {}
    err = ""

    def isolate(idxs):
        nonlocal err
        batch, skipped = build_batch([formulas[i] for i in idxs], refs)
        out, e = run_pandoc(batch)
        err = err or e
        return _parse_spans(out), skipped

    _bisect(list(range(len(formulas))), isolate, result)
    for i, text in result.items():
        result[i] = unbake_cites(text)
    fallback = {i: formulas[i] for i in range(len(formulas)) if i not in result}
    return result, fallback, err


def prose_to_typst(latex):
    """Convert a LaTeX prose fragment (kept short: one call)."""
    out, _err = run_pandoc(BATCH_PREAMBLE + latex + BATCH_EPILOG)
    lines = [l for l in out.split("\n") if not l.startswith("%")]
    return "\n".join(lines).strip()


def _parse_prose(out):
    """{position: typst text} from a prose batch, where each sentinel runs to the next."""
    spans = [(m.group(0), m.start(), m.end()) for m in SENTINEL_RX.finditer(out)]
    end_marker = out.find(MARK + "END")
    got = {}
    for pos, (tok, _s0, e0) in enumerate(spans):
        stop = spans[pos + 1][1] if pos + 1 < len(spans) else (
            end_marker if end_marker >= 0 else len(out))
        got[int(tok[len(MARK):])] = out[e0:stop].strip()
    return got


def convert_prose_batch(items):
    """Convert many prose fragments in one call: index -> typst text.

    A single item of unbalanced LaTeX makes pandoc abandon the whole document, so
    an unfinished batch is retried in halves until each survivor stands alone.
    """
    result = {}

    def isolate(idxs):
        chunks = ["%s%06d\n\n%s\n" % (MARK, pos, items[i]) for pos, i in enumerate(idxs)]
        chunks.append("%sEND" % MARK)
        out, _err = run_pandoc(BATCH_PREAMBLE + "\n".join(chunks) + BATCH_EPILOG)
        return _parse_prose(out), set()

    _bisect(list(range(len(items))), isolate, result)
    return result


def convert_plain_batch(items):
    """Convert many fragments to Unicode plain text in one call: index -> text.

    A bibliography field is read by Typst as INK, not as markup: a test compile
    (2026-10-13) put `$\\mathbb Z_+^N$`, `\\href{u}{t}`, `\\v c` and `x^2` in a
    refs.bib title and the page printed each of them character for character. The
    plain writer is the same pandoc reader the prose pass uses, so the markup is
    answered with the text it means -- $n\\times n$ becomes n × n, \\v c becomes č --
    instead of with a second table of spellings kept by hand.
    """
    result = {}

    def isolate(idxs):
        chunks = ["%s%06d\n\n%s\n" % (MARK, pos, items[i]) for pos, i in enumerate(idxs)]
        chunks.append("%sEND" % MARK)
        out, _err = run_pandoc(BATCH_PREAMBLE + "\n".join(chunks) + BATCH_EPILOG,
                               fmt_out="plain")
        return _parse_prose(out), set()

    _bisect(list(range(len(items))), isolate, result)
    return result
