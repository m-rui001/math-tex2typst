import io

P = "tools/t2t/mathconv.py"
lines = io.open(P, encoding="utf-8", newline="").read().split("\n")

assert lines[72].startswith("def build_batch(formulas):"), lines[72]
assert lines[112].startswith("    return BATCH_PREAMBLE"), lines[112]

NEW = r'''def clean(f):
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
                         % re.sub(r"@\s*\{[^{}]*\}", "", m.group(1)), f)
    f = PDF_MATH.sub("", f)
    f = re.sub(r'\\hbox\s*\{', lambda m: r'\text{', f)
    f = re.sub(r'\\textup\s*\{', lambda m: r'\text{', f)
    f = re.sub(r'\\ensuremath\{([^{}]*)\}', r'\1', f)
    for old, new in [('rm', 'mathrm'), ('bf', 'mathbf'), ('it', 'mathit'), ('sf', 'mathsf'), ('tt', 'mathtt'), ('cal', 'mathcal')]:
        f = re.sub(r'\{\\' + old + r'(?![a-zA-Z])\s*([^{}]*)\}', lambda m, new=new: '\\' + new + '{' + m.group(1) + '}', f)
    f = brace_args(f)
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
    return BATCH_PREAMBLE + "\n\n".join(chunks) + BATCH_EPILOG, skipped'''

lines[72:113] = NEW.split("\n")
io.open(P, "w", encoding="utf-8", newline="\n").write("\n".join(lines))
print("patched mathconv")
