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
        return out, proc.stderr or ""
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

PDF_MATH = re.compile(r"\\(?:begingroup|endgroup|qedhere|displaystyle|textstyle"
                      r"|scriptstyle|limits|nolimits|nobreak|allowbreak"
                      r"|mathstrut|strut)\b"
                      r"|\\(?:setlength|hphantom|vphantom|phantom)"
                      r"\s*\{[^{}]*\}(?:\s*\{[^{}]*\})?")

# TeX ends a control word at the first non-letter, so '\rangleI' means '\rangle I'
# to TeX but is one unknown token to pandoc's reader.
GLUED_DELIM = re.compile(r"\\(?:langle|rangle|lVert|rVert|lvert|rvert|Vert|vert"
                         r"|llcorner|lrcorner|lfloor|rfloor)(?=[A-Za-z])")


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


TEXT_INNER = re.compile(r"\$([^$]*)\$|\\(?!text\b)[A-Za-z@]+(?:\{[^{}]*\})?")


def text_math_out(f):
    r"""Move maths out of \\text{...}: \\text{for $\\nu$-a.e.} -> \\text{for }\\nu\\text{-a.e.}.

    TeX re-enters math mode inside a text argument, so authors put symbols there
    with or without $; pandoc's reader stops at the backslash and refuses the whole
    formula. The prose survives in upright text, the symbol as real maths.
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
            # a $…$ span contributes its contents; a control sequence contributes itself
            pieces.append(m.group(1) if m.group(1) is not None else m.group(0))
            k = m.end()
        prose = body[k:]
        if prose:
            pieces.append("\\text{%s}" % prose)
        out.append("".join(pieces) or "\\text{}")
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
# an unbraced TeX argument: a control sequence with its own braced argument, a
# control symbol such as '\,', or one plain character
FRACTOKEN = re.compile(r"\\[A-Za-z@]+(?:\{[^{}]*\})?|\\.|.")


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
            else:
                tok = FRACTOKEN.match(f, j)
                arg = tok.group(0) if tok and j < len(f) else None
                j = tok.end() if arg else j
            if not arg:
                break
            args.append(arg)
        if len(args) < 2:
            out.append(m.group(0))
            i = m.end()
            continue
        out.append("%s{%s}{%s}" % (m.group(0), args[0], args[1]))
        i = j


def clean(f):
    r"""One LaTeX formula -> the shape pandoc's typst writer accepts.

    The display wrapper, its label and the PDF-only spacing carry no maths, so
    what emit() falls back to quoting is the equation, not its \begin{} envelope.
    """
    f = re.sub(r'\\lhook\s*\\joinrel\s*\\longrightarrow', lambda m: r'\hookrightarrow', f)
    f = re.sub(r'\\(?:hspace\s*\{[^{}]*\}|hfill)', lambda m: r'\,', f)
    f = re.sub(r'\\begin\{psmallmatrix\}', r'\\begin{smallmatrix}', f)
    f = re.sub(r'\\end\{psmallmatrix\}', r'\\end{smallmatrix}', f)
    f = re.sub(r'\\begin\{array\}\s*(?:\[[^\]]*\])?\s*\{((?:[^{}]|\{[^{}]*\})*)\}',
               lambda m: '\\begin{array}{%s}'
                         % re.sub(r"[pmdb]\s*\{[^{}]*\}", "l",
                                  re.sub(r"@\s*\{[^{}]*\}", "", m.group(1))), f)
    f = PDF_MATH.sub("", f)
    # an explicit inter-row skip is page layout; the row break itself is the maths
    f = re.sub(r'\\\\\s*\[[^\]]*\]', lambda m: "\\\\", f)
    # booktabs rules are layout, not maths; texmath has no name for them
    f = re.sub(r'\\(?:toprule|midrule|bottomrule|cmidrule(?:\([^)]*\))?)\b', '', f)
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
    f = brace_args(f)
    f = frac_args(f)
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
    f = re.sub(r"\\(?:label|tag)\*?\{[^}]*\}", "", f)
    f = re.sub(r"\\(?:begin|end)\{(?:equation|align|alignat|gather|multline|flalign|eqnarray|displaymath)\*?\}(?:\{\d+\})?", "", f)
    f = re.sub(r"\\(?:notag|nonumber)\b", "", f)
    return f


def build_batch(formulas):
    """formulas: list of latex strings -> (batch tex source, skipped indexes)."""
    chunks, skipped = [], []
    for i, f in enumerate(clean(x) for x in formulas):
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
            got[int(tok[len(MARK):])] = value
    return got


def convert_formulas(formulas):
    """Return (index -> typst math, indexes pandoc refused, stderr text).

    One pandoc call per paper; formulas that vanish because a neighbour broke
    the parse are retried in isolated halves so cascade damage stays local.
    """
    result = {}
    err = ""

    def attempt(idxs, depth):
        nonlocal err
        if not idxs:
            return
        batch, skipped = build_batch([formulas[i] for i in idxs])
        out, e = run_pandoc(batch)
        err = err or e
        got = _parse_spans(out)
        missing = [idxs[j] for j in range(len(idxs))
                   if j not in got and j not in skipped]
        for local, value in got.items():
            result[idxs[local]] = value
        if not missing or len(idxs) == 1 or depth >= 7:
            return
        mid = len(missing) // 2
        attempt(missing[:mid], depth + 1)
        attempt(missing[mid:], depth + 1)

    attempt(list(range(len(formulas))), 0)
    fallback = {i: formulas[i] for i in range(len(formulas)) if i not in result}
    return result, fallback, err


def prose_to_typst(latex):
    """Convert a LaTeX prose fragment (kept short: one call)."""
    out, _err = run_pandoc(BATCH_PREAMBLE + latex + BATCH_EPILOG)
    lines = [l for l in out.split("\n") if not l.startswith("%")]
    return "\n".join(lines).strip()


def convert_prose_batch(items):
    """Convert many prose fragments in one call: index -> typst text."""
    chunks = ["%s%06d\n\n%s\n" % (MARK, i, text) for i, text in enumerate(items)]
    chunks.append("%sEND" % MARK)
    out, _err = run_pandoc(BATCH_PREAMBLE + "\n".join(chunks) + BATCH_EPILOG)
    spans = [(m.group(0), m.start(), m.end()) for m in SENTINEL_RX.finditer(out)]
    end_marker = out.find(MARK + "END")
    result = {}
    for i, (tok, _s0, e0) in enumerate(spans):
        stop = spans[i + 1][1] if i + 1 < len(spans) else (
            end_marker if end_marker >= 0 else len(out))
        result[int(tok[len(MARK):])] = out[e0:stop].strip()
    return result
