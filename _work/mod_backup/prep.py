"""Preamble parsing + LaTeX dialect fixes applied before handing text to pandoc."""

import re

from . import macros
from .texutil import find_group, scan_command_name, skip_spaces

# pdfTeX/font packages that carry no content.
DROP_PACKAGES = {
    "fontenc", "inputenc", "lmodern", "microtype", "hyperref", "geometry",
    "amsthm", "mathtools", "bm", "mathrsfs", "dsfont", "wasysym", "stmaryrd",
    "esint", "xcolor", "color", "url", "hyperref", "placeins", "float",
    "needspace", "setspace", "scrextend", "kvoptions", "etoolbox", "tikz",
    "caption", "subcaption", "longtable", "booktabs", "array", "tabularx",
    "enumitem", "natbib", "cleveref", "graphicx", "epsfig", "ulem", "soul",
    "multirow", "colortbl", "arydshln", "bigstrut", "numprint", "siunitx",
    "textcomp", "ae", "aecompl", "cmap", "pdfscreen", "pstricks", "pst-all",
    "tikzlibrary", "verbatim", "framed", "mdframed", "tcolorbox", "floatrow",
    "footmisc", "authblk", "babel", "fancyhdr", "titlesec", "titling",
    "abstract", "abstractbibliography", "sectsty", "fncychap", "tgpagella",
    "mathpazo", "times", "helvet", "courier", "newtxtext", "newtxmath",
    "txfonts", "mathptmx", "eucal", "euscript", "latexsym", "amssymb",
    "amsmath", "amsfonts", "amstext", "amsopn", "upgreek", "cancel",
    "slashed", "extarrows", "mathtime", "unicode-math", "cmll", "bussproofs",
    "proof", "diagrams", "xypic", "xy", "tikz-cd", "cd", "phantombox",
}
DROP_SHORTCOMMANDS = (
    "\\allowdisplaybreaks", "\\raggedbottom", "\\flushbottom", "\\sloppy",
    "\\frenchspacing", "\\nonfrenchspacing", "\\overfullrule=0pt",
    "\\emergencystretch=2em", "\\pagestyle{empty}", "\\pagestyle{plain}",
    "\\thispagestyle{empty}", "\\linespread{1}", "\\setlength{\\parindent}",
    "\\setlength{\\parskip}", "\\setlength{\\abovedisplayskip}",
    "\\numberwithin{equation}{section}", "\\numberwithin{equation}",
)
NAMED_COLORS = {
    "red", "blue", "green", "darkgreen", "orange", "violet", "purple",
    "teal", "cyan", "magenta", "yellow", "brown", "lime", "olive", "navy",
    "black", "white", "gray", "darkgray", "lightgray", "gray!30", "blue!20",
}


class Preamble:
    def __init__(self):
        self.theorem = {}        # env -> dict(name, within, shared, style)
        self.packages = []
        self.unsupported = []
        self.fontsize = "11pt"
        self.margins = None
        self.title = self.author = self.date = None
        self.numberwithin_eq = False
        self.numberwithin_fig = False
        self.bibliographystyle = None
        self.colors = {}
        self.macros = {}
        self.skipped_defs = []
        self.geometry = {}
        # set by convert.py: thebibliography list vs a .bib file
        self.baked_bib = False


def _groups(s):
    return re.findall(r"\{([^{}]*)\}", s)


def _read_arg(text, i):
    i = skip_spaces(text, i)
    if text[i:i + 1] != "{":
        return None, i
    end = find_group(text, i)
    return text[i + 1:end - 1], end


def split_document(text):
    m = re.search(r"^\s*\\begin\{document\}", text, re.M)
    if not m:
        return "", text
    return text[:m.start()], text[m.end():]


def parse_preamble(pre):
    p = Preamble()
    p.macros, p.skipped_defs = macros.parse_definitions(pre)

    for m in re.finditer(r"\\documentclass(?:\[([^\]]*)\])?\{([^}]*)\}", pre):
        opts = (m.group(1) or "").split(",")
        for o in opts:
            if re.fullmatch(r"1[0-4]pt", o.strip()):
                p.fontsize = o.strip()

    for m in re.finditer(r"\\usepackage(?:\[([^\]]*)\])?\{([^}]*)\}", pre):
        for pkg in m.group(2).split(","):
            pkg = pkg.strip()
            p.packages.append(pkg)
            if pkg not in DROP_PACKAGES:
                p.unsupported.append(pkg)
        if "geometry" in [x.strip() for x in m.group(2).split(",")]:
            p.margins = m.group(1) or ""

    for m in re.finditer(r"\\newtheorem\{([^}]*)\}(?:\[([^\]]*)\])?\{([^}]*)\}(?:\[([^\]]*)\])?", pre):
        env, shared, name, within = m.groups()
        p.theorem[env] = {"name": name, "shared": shared, "within": within,
                          "style": "theorem"}

    style = "theorem"
    for line in pre.split("\n"):
        ms = re.search(r"\\theoremstyle\{([^}]*)\}", line)
        if ms:
            style = ms.group(1)
        mt = re.search(r"\\newtheorem\{([^}]*)\}", line)
        if mt and mt.group(1) in p.theorem:
            p.theorem[mt.group(1)]["style"] = style

    p.numberwithin_eq = "\\numberwithin{equation}{section}" in pre
    p.numberwithin_fig = ("\\numberwithin{figure}{section}" in pre
                         or "\\numberwithin{figure}{subsection}" in pre)

    mt = re.search(r"\\title\{", pre)
    if mt:
        p.title, _ = _read_arg(pre, mt.end() - 1)
    ma = re.search(r"\\author\{", pre)
    if ma:
        p.author, _ = _read_arg(pre, ma.end() - 1)
    md = re.search(r"\\date\{", pre)
    if md:
        p.date, _ = _read_arg(pre, md.end() - 1)
    for key in ["left", "right", "top", "bottom", "margin"]:
        mm = re.search(r"\b%s\s*=\s*([0-9.]+\s*(?:in|cm|mm|pt))" % key, p.margins or "")
        if mm:
            p.geometry[key] = mm.group(1).strip()

    for m in re.finditer(r"\\definecolor\{([^}]*)\}\{([^}]*)\}\{([^}]*)\}", pre):
        p.colors[m.group(1)] = (m.group(2), m.group(3))

    mb = re.search(r"\\bibliographystyle\{([^}]*)\}", pre)
    if mb:
        p.bibliographystyle = mb.group(1)
    return p


MATH_DIALECT = [
    (re.compile(r"\\(?:rm|bf|it|sf|tt|sc|mit)\s+"), "\\mathrm "),  # rare switch form
    (re.compile(r"\\rm\b"), "\\mathrm"),
    (re.compile(r"\\bf\b"), "\\mathbf"),
    (re.compile(r"\\it\b"), "\\mathit"),
    (re.compile(r"\\operatorname\s*\*?\s*\{"), "\\operatorname{"),
    (re.compile(r"\\(?:displaystyle|textstyle|scriptstyle|limits)\b"), ""),
    (re.compile(r"\\hbox\s*\{"), "\\text{"),
    (re.compile(r"\\texorpdfstring\s*\{"), ""),
    (re.compile(r"\\!"), "\\negmedspace"),
    (re.compile(r"\\,"), "\\thinspace"),
    (re.compile(r"\\[:;]"), "\\medspace"),
    (re.compile(r"\\quad\b"), "\\quad"),
    (re.compile(r"\\qquad\b"), "\\qquad"),
    (re.compile(r"\\d?frac\s*\{\s*\\left"), "\\frac{\\left"),
]

PROSE_DIALECT = [
    (re.compile(r"\\(?:newpage|clearpage|pagebreak|cleardoublepage|vspace\s*\*?\s*\{[^}]*\}|hspace\s*\{[^}]*\}|null|linebreak|nolinebreak|noindent|medskip|bigskip|smallskip)\b"), " "),
    (re.compile(r"\\hfill\b"), "#h(1fr) "),
    (re.compile(r"\\(?:allowdisplaybreaks|raggedbottom|flushbottom|frenchspacing|nonfrenchspacing|emergencystretch\s*=\s*2em|theoremstyle\{[^}]*\}|setlist(?:\[newcommand\])?\{[^}]*\}|setlistdepth\{[^}]*\}|renewcommand\{[^}]*\}(?:\[[^\]]*\])?\{[^}]*\}|maketitle)\b"), ""),
    (re.compile(r"\\numberwithin\{equation\}(?:\{section\})?\s*"), ""),
    (re.compile(r"\\(?:pagestyle|thispagestyle)\{[^}]*\}"), ""),
    (re.compile(r"\\(?:hypersetup|pdfinfo|pdftrailerid|pdfsuppressptexinfo|pdfinfoomitdate)[^\n]*"), ""),
    (re.compile(r"\\(?:centering|raggedright|raggedbottom|justifying)\b"), ""),
]


def fix_dialect_prose(text):
    for rx, rep in PROSE_DIALECT:
        text = rx.sub(rep, text)
    return text


def fix_dialect_math(text):
    # {\rm word} -> \mathrm{word}; \hbox{...} -> \text{...}
    for tag, target in (("rm", "\\mathrm"), ("bf", "\\mathbf"), ("it", "\\mathit"),
                        ("cal", "\\mathcal"), ("bb", "\\mathbb"), ("mathbb", "\\mathbb"),
                        ("mathcal", "\\mathcal"), ("bold", "\\boldsymbol")):
        text = re.sub(r"\{\\%s\s+([^{}]*?)\}" % re.escape(tag),
                      lambda m, t=target: "%s{%s}" % (t, m.group(1)), text)
    for rx, rep in MATH_DIALECT:
        text = rx.sub(lambda m, replacement=rep: replacement, text)
    return text


def strip_dropped(text):
    for cmd in DROP_SHORTCOMMANDS:
        text = text.replace(cmd, " ")
    return text


def expand_macros(text, table):
    """Expand user macros outside raw tikz blocks."""
    parts = re.split(r"(\\begin\{tikzpicture\}.*?\\end\{tikzpicture\})", text, flags=re.S)
    for idx in range(0, len(parts), 2):
        parts[idx] = macros.expand(parts[idx], table)
    return "".join(parts)


NOISE_DEFS = ("\\newcommand", "\\renewcommand", "\\providecommand",
              "\\DeclareRobustCommand", "\\def", "\\edef", "\\gdef", "\\xdef",
              "\\let", "\\newenvironment", "\\renewenvironment")
NOISE_BODY = re.compile(r"\\(?:pdfliteral|BeginAccSupp|EndAccSupp|csname|expandafter"
                        r"|begingroup|ActualText|special|pdfstringdef|protect)\b")
NOISE_REFS = re.compile(r"\\[A-Za-z@]+")


def _name_token(text, i):
    """Read one definable name ({\\foo}, \\foo or \\csname foo\\endcsname)."""
    j = skip_spaces(text, i)
    if text.startswith("\\csname", j):
        end = text.find("\\endcsname", j)
        if end < 0:
            return None, i
        return "\\" + text[j + 7:end].strip(), end + len("\\endcsname")
    if text[j:j + 1] == "{":
        end = find_group(text, j)
        return text[j + 1:end - 1].strip(), end
    if text[j:j + 1] == "\\":
        name, after = scan_command_name(text, j)
        if not name:
            return None, i
        while after < len(text) and (text[after].isalnum() or text[after] == "@"):
            after += 1
        return "\\" + name if not name[0].isalpha() else text[j:after], after
    return None, i


def _bracket_end(text, i):
    depth = 0
    while i < len(text):
        if text[i] == "[":
            depth += 1
        elif text[i] == "]":
            depth -= 1
            if depth == 0:
                return i + 1
        i += 1
    return len(text)


def _def_span(text, i):
    """Span of the definition statement at i: (end, defined-name, body)."""
    name, after = scan_command_name(text, i)
    cmd = "\\" + name
    j = skip_spaces(text, after)
    if text[j:j + 1] == "*":
        j = skip_spaces(text, j + 1)
    target, j = _name_token(text, j)
    if not target:
        return None
    if cmd == "\\let":
        j = skip_spaces(text, j)
        if text[j:j + 1] == "=":
            j = skip_spaces(text, j + 1)
        source, j = _name_token(text, j)
        return j, target, source or ""
    for _ in range(2):
        k = skip_spaces(text, j)
        if text[k:k + 1] != "[":
            break
        j = _bracket_end(text, k)
    k = skip_spaces(text, j)
    if text[k:k + 1] != "{":
        eol = text.find("\n", k)
        eol = len(text) if eol < 0 else eol
        return eol, target, text[k:eol]
    end = find_group(text, k)
    if cmd.endswith("environment"):
        k = skip_spaces(text, end)
        if text[k:k + 1] == "{":
            end = find_group(text, k)
    return end, target, text[k + 1:end - 1]


def strip_pdf_noise(text):
    """Delete definitions that install PDF plumbing.

    arXiv sources redefine real commands (\\mapsto, \\label, \\to) as accsupp
    accessibility wrappers.  Pandoc expands the preamble itself, so the wrapper
    body ends up inside formulas it then refuses to parse; removing the
    definition hands the builtin back.
    """
    dropped = set()
    for _ in range(6):
        spans, i = [], 0
        while i < len(text):
            if text[i] != "\\":
                i += 1
                continue
            name, after = scan_command_name(text, i)
            if "\\" + name not in NOISE_DEFS:
                i = max(after, i + 1)
                continue
            span = _def_span(text, i)
            if span is None:
                i = max(after, i + 1)
                continue
            lead = re.search(r"(?:\\(?:expandafter|global|protect|noexpand)\s*)+$", text[:i])
            spans.append(((lead.start() if lead else i),) + span)
            i = span[0]
        pieces, pos, changed = [], 0, False
        for start, end, target, body in spans:
            refs = NOISE_REFS.findall(body)
            if ("@" in target or NOISE_BODY.search(text[start:end])
                    or any("@" in r or r in dropped for r in refs)):
                dropped.add(target)
                changed = True
                body_out = " "
            else:
                body_out = text[start:end]
            pieces.append(text[pos:start])
            pieces.append(body_out)
            pos = end
        pieces.append(text[pos:])
        text = "".join(pieces)
        if not changed:
            break
    return text
