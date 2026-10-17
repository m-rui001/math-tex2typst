"""Preamble parsing + LaTeX dialect fixes applied before handing text to pandoc."""

import re

from . import macros
from .texutil import find_group, scan_command_name, skip_spaces, split_top

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
        self.documentclass = "article"
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
        p.documentclass = m.group(2).strip()
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
    # The title block is converted as a snippet of its own, so it never meets the preamble
    # the body's macros were expanded against; without this a \newcommand in a title reaches
    # the page as \$\RCD\$, dollars and all.
    for _attr in ("title", "author", "date"):
        got = getattr(p, _attr)
        if got:
            setattr(p, _attr, macros.expand(got, p.macros))
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
    # pandoc deletes \\hfill, which fuses the two halves of the line into one word; a space keeps
    # the text readable. Typst code cannot be written here: pandoc reads it back as its own text.
    (re.compile(r"\\hfill\b"), " "),
    # a drawn rule is a typesetting object, not text: pandoc deletes \\hrule and leaves its
    # measurements in the running prose as "height 0.35pt". The hairline goes with them.
    (re.compile(r"\\hrule\b(?:\s*(?:height|width|depth)\s*=?\s*[\d.]+(?:pt|mm|cm|bp|in)){0,3}"), " "),
    # pandoc deletes \pageref, which would drop the page number out of the running text; as an
    # \href it reaches the AST as a Link and the emitter turns its scheme into a page reference.
    # Text cannot carry it: every character that marks the target is Typst markup.
    (re.compile(r"\\pageref\s*\*?\s*\{([^{}]*)\}"), r"\\href{pageref:\1}{}"),
    (re.compile(r"\\(?:allowdisplaybreaks|raggedbottom|flushbottom|frenchspacing|nonfrenchspacing|emergencystretch\s*=\s*2em|theoremstyle\{[^}]*\}|setlist(?:\[newcommand\])?\{[^}]*\}|setlistdepth\{[^}]*\}|renewcommand\{[^}]*\}(?:\[[^\]]*\])?\{[^}]*\}|maketitle)\b"), ""),
    (re.compile(r"\\numberwithin\{equation\}(?:\{section\})?\s*"), ""),
    (re.compile(r"\\(?:pagestyle|thispagestyle)\{[^}]*\}"), ""),
    (re.compile(r"\\(?:hypersetup|pdfinfo|pdftrailerid|pdfsuppressptexinfo|pdfinfoomitdate)[^\n]*"), ""),
    (re.compile(r"\\(?:centering|raggedright|raggedbottom|justifying)\b"), ""),
    # a hand-written "break the page if fewer than n lines are left" block measures
    # the page in dimens; Typst breaks its own pages and none of this reaches the text
    (re.compile(r"(?:\\par\s*)?\\begingroup\s*\\dimen\d+\s*=\s*\\pagegoal.*?\\fi\s*\\endgroup", re.S), " "),
    (re.compile(r"(?:\\par\s*)?\\ifdim\\dimexpr\\pagegoal\s*-\s*\\pagetotal(?:(?!\\fi).)*\\fi", re.S), " "),
]


INLINE_ARRAY = re.compile(r"\\\(\s*\\begin\{array\}\{((?:[^{}]|\{[^{}]*\})*)\}(.*?)\\end\{array\}\s*\\\)", re.S)
TABLE_FLOAT = re.compile(r"\\begin\{table\*?\}.*?\\end\{table\*?\}", re.S)
# a nested environment brings its own row breaks, which are not the float's rows
NESTED = re.compile(r"\\begin\{(?:matrix|pmatrix|bmatrix|vmatrix|Vmatrix|smallmatrix|"
                    r"subarray|aligned|array|cases|rcases)\b")
ROW_RULE = re.compile(r"^\s*((?:\\(?:hline|toprule|midrule|bottomrule)\s*)+)")


# The environments a `\caption` may belong to as a float's own. `figure` and `table` are the two
# pandoc reads; `longtable` is a table pandoc reads natively too, so its caption must not be lifted
# out of it. Only the first two are ever split by `_split_floats`, which re-emits `\begin{name}` --
# a `longtable`'s own `{spec}` argument would not survive that rewrite.
FLOAT_REGION = re.compile(r"\\begin\{(figure|table|longtable)\*?\}.*?\\end\{\1\*?\}", re.S)
CAPTION_AT = re.compile(r"\\caption\b")
LABEL_AT = re.compile(r"\s*\\label\s*\{([^{}]*)\}")
FLOAT_HEAD = re.compile(r"\\begin\{(figure|table)(\*?)\}")
FLOAT_END = re.compile(r"\\end\{(?:figure|table|longtable)\*?\}")


def _lift_captions(text):
    r"""Every \caption in `text` becomes a float of its own, in place."""
    out, pos = [], 0
    while pos < len(text):
        m = CAPTION_AT.search(text, pos)
        if not m:
            out.append(text[pos:])
            break
        out.append(text[pos:m.start()])
        short = ""
        i = skip_spaces(text, m.end())
        if text[i:i + 1] == "[":
            # the short caption form \caption[running head]{...}: its bracket is read by hand,
            # since find_group only knows braces
            close = text.find("]", i)
            if close < 0:
                out.append(text[m.start():i + 1])
                pos = i + 1
                continue
            short = text[i:close + 1]
            i = skip_spaces(text, close + 1)
        if text[i:i + 1] != "{":
            # a \caption we cannot read stays as written; dropping it would cost the author words
            out.append(text[m.start():i + 1])
            pos = i + 1
            continue
        end = find_group(text, i)
        caption = text[i:end]
        label, after = "", end
        lab = LABEL_AT.match(text, end)
        if lab:
            label, after = "\\label{%s}" % lab.group(1), lab.end()
        env = "table" if label[7:].startswith("tab") else "figure"
        out.append("\n\\begin{%s}\\caption%s%s%s\\mbox{}\n\\end{%s}\n"
                   % (env, short, caption, label, env))
        pos = after
    return "".join(out)


def _caption_group(text, i):
    r"""One caption read from the word itself: where its text ends, and the \labels under it.

    Returns (None, []) for a caption that cannot be read, so a caller keeps the boundary it had.
    LaTeX numbers every \label written under one caption from that caption -- measured with pdflatex
    on a figure carrying two labels and on a table carrying two tabulars and two captions, the aux
    answers 1 and 1 for the pair under one caption, and 1 and 2 for the two captions -- so a chain of
    labels names one float, and a caption's own block stands on whichever side the float put it.
    """
    pos = skip_spaces(text, i)
    if text[pos:pos + 1] == "[":
        close = text.find("]", pos)
        if close < 0:
            return None, []
        pos = skip_spaces(text, close + 1)
    if text[pos:pos + 1] != "{":
        return None, []
    end = find_group(text, pos)
    labels = []
    while True:
        lab = LABEL_AT.match(text, end)
        if lab is None:
            return end, labels
        labels.append((lab.start(), lab.end(), lab.group(1)))
        end = lab.end()


def _split_floats(region):
    r"""A float written with more than one caption becomes one float per caption.

    pandoc numbers a float from its single caption, so in a table that stacks three tabulars the
    second and third caption lose their number along with their words, and every \ref to them
    dangles. The float is closed and reopened at each boundary rather than the extras being
    discarded, and a boundary falls where this float's own layout puts a caption's block.
    """
    caps = list(CAPTION_AT.finditer(region))
    if len(caps) < 2:
        return region
    head = FLOAT_HEAD.match(region)
    name, star = head.group(1), head.group(2)
    # the float's own \begin{table} stands before every caption, so the test is whether a nested
    # block opens after that header and above the first caption -- a tabular or picture the caption
    # sits under. When it does the float is material-first: each caption names the block above it,
    # and the cut goes after the caption and the label chain under it; cutting at the caption there
    # hands every tabular to the caption before it, which is how apptr:endpoint-table came to name
    # the table it does not belong to. A float that opens with its caption is caption-first, so the
    # block trails the caption and the cut belongs at the caption itself -- there a trailing caption
    # with nothing after it keeps its own float and is given a stand-in body below.
    if "\\begin{" in region[head.end():caps[0].start()]:
        groups = [_caption_group(region, m.end()) for m in caps[:-1]]
        if all(end is not None for end, _ in groups):
            cuts = [labels[-1][1] if labels else end for end, labels in groups]
        else:
            cuts = [m.start() for m in caps][1:]
    else:
        cuts = [m.start() for m in caps][1:]
    parts, pos = [], 0
    for cut in cuts:
        parts.append(region[pos:cut])
        pos = cut
    tail = region[pos:]
    end = FLOAT_END.search(tail)
    parts.append(tail[:end.start()] if end else tail)
    # the segment the float opened with is closed at the first cut
    out = ["%s\n\\end{%s%s}" % (parts[0].rstrip(), name, star)]
    for piece in parts[1:]:
        body = piece.strip()
        if "\\begin{" not in body:
            # a float that opens with its caption can end with one and no block after it, and pandoc
            # reads a bodyless table float as nothing, so the caption and its number leave no trace.
            # The stand-in goes before the caption, where such a float's material sits, and a table
            # needs tabular material: measured in _work/probe_captions_five.py, a bare \mbox{} puts
            # the words back for a figure and still loses them for a table
            standin = ("\\begin{tabular}{l}\\mbox{}\\end{tabular}" if name == "table"
                       else "\\mbox{}")
            body = "%s\n%s" % (standin, body)
        out.append("\\begin{%s%s}\n%s\n\\end{%s%s}"
                   % (name, star, body, name, star))
    return "\n\n".join(out)


def label_aliases(body):
    r"""Every name a float loses to pandoc, pointing at the name pandoc keeps.

    Measured with pandoc on ``\caption{...}\label{a}\label{b}``, the float's ident comes out as the
    last name written anywhere in it and the earlier ones leave the AST altogether. The TeX aux for
    the same float answers one number for every name in it -- measured on a `longtable` whose caption
    carries `\label{tab}` and whose six rows carry `\phantomsection\label{...}` of their own, all
    seven answer 4, because the only counter a float steps is its caption's and a row's `\label`
    merely records where it stands. So a `\ref` to a lost name has the float's own number to print,
    and this map is what hands it that number.
    """
    out = {}
    for region in FLOAT_REGION.finditer(body):
        text = region.group(0)
        caps = list(CAPTION_AT.finditer(text))
        # a float that lifts out with two captions of its own is one figure to pandoc, and the number
        # to print for a name under the earlier caption is not measured, so only a lone caption -- the
        # shape `_split_floats` leaves behind and the one the probe read out of a preprint's figure --
        # hands its names over.
        if len(caps) != 1:
            continue
        names = [m.group(1) for m in LABEL_AT.finditer(text)]
        for name in names[:-1]:
            out[name] = names[-1]
    return out


CUSTOM_ENV = re.compile(r"\\newenvironment\{([A-Za-z][A-Za-z0-9]*)\}")


def custom_float_envs(pre_text):
    r"""A paper's own `\newenvironment` floats -> the standard float each one stands for.

    A `fixedfigure`/`chordfigure` is a minipage carrying `\def\@captype{figure}`: the `\caption`
    inside it is a figure's, but pandoc never learns the environment is a float, so
    `lift_captions` pulls the caption out and leaves the drawing behind. The definition names its
    own type, so that is what the uses are renamed to. An environment whose definition names no
    `\@captype` is left alone -- it may not be a float at all.
    """
    out = {}
    for m in CUSTOM_ENV.finditer(pre_text or ""):
        body = m.group(0)
        i = skip_spaces(pre_text, m.end())
        if pre_text[i:i + 1] == "[":  # \newenvironment{X}[n]{...}{...}
            close = pre_text.find("]", i)
            i = close + 1 if close >= 0 else i
        for _ in range(2):  # the definition's own begin/end groups
            arg, i = _read_arg(pre_text, i)
            if arg is None:
                break
            body += arg
        if re.search(r"\\@captype\s*\{\s*table\s*\}", body):
            out[m.group(1)] = "table"
        elif re.search(r"\\@captype\s*\{\s*figure\s*\}", body):
            out[m.group(1)] = "figure"
    return out


def promote_custom_floats(pre_text, body):
    r"""Rename a paper's own float environments to `figure`/`table` so pandoc reads them as floats.

    Only the *uses* are renamed: the `\newenvironment` definition stays in the preamble, unused
    once no `\begin{}` invokes it. The rename has to happen before `lift_captions`, which otherwise
    reads the caption inside such an environment as one with no float around it and lifts it away
    from the drawing it belongs to.
    """
    kinds = custom_float_envs(pre_text)
    if not kinds:
        return body
    return re.sub(r"\\(begin|end)\{([A-Za-z][A-Za-z0-9]*)\}",
                  lambda m: "\\%s{%s}" % (m.group(1), kinds[m.group(2)])
                  if m.group(2) in kinds else m.group(0), body)


FBOX = re.compile(r"\\fbox\b(?=\s*\{)")
# a `\fbox` whose entire argument is one minipage environment
FBOX_MINIPAGE = re.compile(
    r"\\fbox\s*\{\s*\\begin\{minipage\}(?:\[[^\]]*\])?\{(?P<w>[^{}]*)\}(?P<x>.*?)\\end\{minipage\}\s*\}",
    re.S)
AT_CAPTYPE = re.compile(r"\\@captype\s*\{\s*(figure|table)\s*\}")
MINIPAGE_TOKEN = re.compile(r"\\(begin|end)\{minipage\}")


def unwrap_fbox(body):
    r"""Drop the `\fbox` wrapper, keeping the group it encloses.

    pandoc's LaTeX reader knows no `\fbox` and discards the command together with its braced
    argument: measured with `pandoc -f latex -t native`, ``Text before \fbox{hello world} after.``
    answers ``Text before after.``, and a table cell written ``\fbox{\begin{tabular}...`` loses the
    whole tabular. The box is a rule the Typst page never draws anyway, so removing the command and
    leaving its `{...}` recovers the words. `\fboxsep`/`\fboxrule` are other commands and are not
    touched: `\b` does not fall between `fbox` and a following letter.

    A boxed *minipage* is the one case where the group is not enough. Inside a `tabular` cell,
    `{\begin{minipage}[c]{.36\linewidth}...}` makes pandoc abandon the whole environment: on
    A-spectral-gap's figure 1 the array preamble and the `&` separators then print as page text
    (`_work/probe_parbox_page.py`). `\fbox{}` kept is no better -- it reaches pandoc as a table with
    every cell emptied, 0 of 5 headings anywhere (`_work/probe_fbox_cell_content.py`). The one
    spelling that gets both the table and its words is `\parbox{W}{X}`, which is the same box with the
    same width and no environment inside a cell (`_work/probe_tabular_env_out.py`: Table 1, 5 of 5).
    """
    body = FBOX_MINIPAGE.sub(lambda m: "\\parbox{%s}{%s}" % (m.group("w"), m.group("x")), body)
    return FBOX.sub("", body)


STACKED = re.compile(r"\\(?:shortstack|makecell)\s*\*?\s*(?:\[[^\]]*\])?\s*\{")
STACK_BREAK = re.compile(r"\\\\\s*(?:\[[^\]]*\])?")


def unstack_cells(body):
    r"""Turn `\shortstack{A\\B}` / `\makecell{A\\B}` into one cell whose lines break.

    pandoc's LaTeX reader knows neither command and discards it together with its braced argument:
    a cell written `\shortstack{Alpha text\\ $x+1$}` reaches the AST with neither the words nor the
    math, while the same content spelled `Alpha text\newline $x+1$` keeps both
    (`_work/probe_multiline_cell_spellings.py`; `\shortstack` 34 uses / 11 papers, `\makecell` counted
    by the same probe). A nested `tabular` also survives, but it makes a table inside a table for what
    is one box of text. `\newline` is what Typst's cell content wants, and the optional `[l]`/`[c]`
    alignment and `\\[2pt]` spacing it drops are glue the page never had anyway.
    """
    out, i = [], 0
    while True:
        m = STACKED.search(body, i)
        if not m:
            out.append(body[i:])
            return "".join(out)
        end = find_group(body, m.end() - 1)
        out.append(body[i:m.start()])
        out.append(STACK_BREAK.sub(r"\\newline ", body[m.end():end - 1]))
        i = end


def _top_minipage_spans(text):
    r"""Spans of the outermost `\begin{minipage}...\end{minipage}` blocks, one per top-level pair.

    A float's own layout nests minipages, so only the outermost pair is a candidate for promotion;
    a depth counter keeps an inner `\end{minipage}` from closing the outer block early.
    """
    stack, spans = [], []
    for m in MINIPAGE_TOKEN.finditer(text):
        if m.group(1) == "begin":
            stack.append(m)
        elif stack:
            begin = stack.pop()
            if not stack:
                spans.append((begin, m))
    return spans


def promote_minipage_floats(body):
    r"""A minipage that names its own float type -> the standard float it stands for.

    The shape ``\noindent\begin{minipage}{\linewidth}\def\@captype{figure}...\caption{...}
    \end{minipage}`` is a figure set in a minipage: the caption is a figure's, but pandoc sees only
    a minipage, so `lift_captions` pulls the caption out and leaves the drawing behind as a bare
    block -- measured on the half-path figure of the IID-threshold paper, where the caption floated
    onto the next page away from its picture. Renaming the outermost minipage and its matching
    `\end` to the named float makes pandoc read the block, its caption and its label as one float.
    Inner minipages are left alone: they are the float's own layout. The minipage's own arguments
    (`[t]`, `{width}`) do not carry over to a float and are dropped with the `\begin` token.
    """
    edits = []
    for begin, end in _top_minipage_spans(body):
        kind = AT_CAPTYPE.search(body[begin.end():end.start()])
        if not kind:
            continue
        j = skip_spaces(body, begin.end())
        if body[j:j + 1] == "[":  # \begin{minipage}[t]{width}
            close = body.find("]", j)
            j = skip_spaces(body, close + 1) if close >= 0 else j
        if body[j:j + 1] == "{":
            j = find_group(body, j)
        edits.append((begin.start(), j, "\\begin{%s}" % kind.group(1)))
        edits.append((end.start(), end.end(), "\\end{%s}" % kind.group(1)))
    for start, stop, repl in sorted(edits, reverse=True):
        body = body[:start] + repl + body[stop:]
    return body


MINIPAGE_WIDTH = re.compile(r"\\begin\{minipage\}(?:\[[^\]]*\])?\s*\{([0-9.]*)\\(?:linewidth|textwidth)\}")
PICTURE = re.compile(r"(\\begin\{tikzpicture\})(.*?)(\\end\{tikzpicture\})", re.S)
LINEWIDTH_COEF = re.compile(r"([0-9.]*)\\linewidth")


def _fold_share(text, share):
    if share == 1.0:
        return text

    def dim(m):
        coef = float(m.group(1)) if m.group(1) else 1.0
        return "%.4f\\linewidth" % (coef * share)

    return PICTURE.sub(lambda m: m.group(1) + LINEWIDTH_COEF.sub(dim, m.group(2)) + m.group(3),
                       text)


def scale_linewidth_in_minipages(text, share=1.0):
    r"""Fold a subfigure's own column width into the pictures it holds.

    TeX redefines `\linewidth` inside a minipage, and a picture's `\linewidth` is one we resolve
    ourselves -- `cetz.expand_linewidth` turns `x=.205\linewidth` into centimetres of the *page*
    column. A drawing sized for a `0.48\linewidth` subfigure therefore came out twice as large as
    the paper ships it and pushed its float past the bottom of the page. The share is multiplied
    into the coefficient here, while the minipage wrapper is still in the text and before the
    pictures are lifted out; a nested minipage multiplies in its own share.
    """
    out, pos = [], 0
    for begin, end in _top_minipage_spans(text):
        head = MINIPAGE_WIDTH.match(text, begin.start())
        inner = share * float(head.group(1)) if head and head.group(1) else share
        out.append(_fold_share(text[pos:begin.end()], share))
        out.append(scale_linewidth_in_minipages(text[begin.end():end.start()], inner))
        out.append(text[end.start():end.end()])
        pos = end.end()
    out.append(_fold_share(text[pos:], share))
    return "".join(out)


MINIPAGE_SHARE = re.compile(r"\s*([0-9.]*)\\(?:linewidth|textwidth)\s*$")


def encode_minipage_widths(body):
    r"""Move each minipage's declared share into its environment name.

    pandoc reads `\begin{minipage}` as a `Div` with class `minipage` and discards the
    `{0.48\linewidth}` argument, so by the time the emitter meets a float's two sibling minipages
    (a LaTeX side-by-side subfigure pair) the widths are gone and a plain block sequence stacks
    them. Renaming each pair to `minipagew<permille>` (`0.48` -> `minipagew480`) puts the share in
    the class the reader keeps; a minipage with no fractional width keeps the plain name. `begin`
    and `end` are renamed together through a depth stack, because pandoc pairs environments by
    name and refuses a mismatched `\end`.
    """
    out, pos, stack = [], 0, []
    for m in MINIPAGE_TOKEN.finditer(body):
        out.append(body[pos:m.start()])
        if m.group(1) == "begin":
            j = skip_spaces(body, m.end())
            if body[j:j + 1] == "[":
                close = body.find("]", j)
                j = skip_spaces(body, close + 1) if close >= 0 else j
            tag = "minipage"
            if body[j:j + 1] == "{":
                end = find_group(body, j)
                share = MINIPAGE_SHARE.match(body[j + 1:end - 1])
                if share and share.group(1):
                    tag = "minipagew%d" % round(float(share.group(1)) * 1000)
                out.append("\\begin{%s}" % tag)
                stack.append(tag)
                pos = end
                continue
            out.append("\\begin{%s}" % tag)
            stack.append(tag)
            pos = m.end()
            continue
        tag = stack.pop() if stack else "minipage"
        out.append("\\end{%s}" % tag)
        pos = m.end()
    out.append(body[pos:])
    return "".join(out)


def lift_captions(body):
    r"""A \caption that is not a float's own becomes a float, keeping its words and its number.

    pandoc keeps one caption per figure/table float and discards the rest, so a \caption written
    inside a minipage or a user float environment leaves no trace: the reader loses the caption and
    every \ref to it dangles. Wrapping it where it stands puts both back beside the drawing, and a
    float that carries several captions is read as the several floats it really is.
    """
    out, pos = [], 0
    for m in FLOAT_REGION.finditer(body):
        out.append(_lift_captions(body[pos:m.start()]))
        region = m.group(0)
        # a `longtable` is a float to skip, but not one `_split_floats` can rewrite
        out.append(_split_floats(region) if FLOAT_HEAD.match(region) else region)
        pos = m.end()
    out.append(_lift_captions(body[pos:]))
    return "".join(out)


def array_floats(body):
    r"""A table float built from a math array -> the same float with a tabular.

    pandoc reads \begin{table} as a float only where it finds tabular material, so a body of
    \( \begin{array}…\end{array} \) is one inline formula, and the caption and the label of the
    float go with its envelope: the table loses its number and every reference to it dangles.
    An array is a tabular set in maths, so the rows carry over and each cell returns inside $ $,
    where ^ and _ still mean what the author wrote.
    """
    def row_of(text):
        lead = ROW_RULE.match(text)
        head = lead.group(0) if lead else ""
        cells = split_top(text[len(head):], "&")
        return head + " & ".join(
            cell if not cell.strip() or cell.strip().startswith("$")
            else "$%s$" % cell.strip() for cell in cells)

    def to_tabular(m):
        content = m.group(2)
        if NESTED.search(content):
            return m.group(0)  # whose rows are whose is not decidable here; keep the maths
        rows = [r for r in (row_of(piece) for piece in split_top(content, "\\\\"))
                if r.strip()]
        return "\\begin{tabular}{%s}\n%s\n\\end{tabular}" % (m.group(1), "\\\\\n".join(rows))

    return TABLE_FLOAT.sub(
        lambda m: INLINE_ARRAY.sub(to_tabular, m.group(0)), body)


# longtable defines two head blocks -- the first-page head (`\endfirsthead`) and the continuation
# head (`\endhead`) -- and prints only one per page. pandoc has no notion of the page, so it reads
# both as rows of one header and the table shows its column titles twice.
LONGTABLE_SECOND_HEAD = re.compile(r"\\endfirsthead.*?\\endhead", re.S)


def dedupe_longtable_heads(body):
    r"""Drop a longtable's continuation head, keeping its first-page head.

    Measured on the barrier-coefficient table of the Complex-Matrix paper: pandoc turns the two
    head blocks into a two-row header, and the printed table repeats `i j a_{ij}` above its body.
    The first head is the one to keep -- it carries the table's own caption, where the continuation
    head carries a `(continued)` stand-in meant for later pages.
    """
    return LONGTABLE_SECOND_HEAD.sub(r"\\endfirsthead", body)


# \multicolumn{2}{@{}l}{...} is legal LaTeX that suppresses the intercolumn glue, but pandoc's
# reader gives up on a tabular whose \multicolumn spec holds an @-expression: it drops the whole
# table and re-emits the environment as running text, column preamble included. The @-expression
# only says how much space to leave, so removing it keeps the table and loses no content.
MULTICOLUMN = re.compile(r"\\multicolumn\s*\{\s*(\d+)\s*\}\s*\{((?:[^{}]|\{[^{}]*\})*)\}")
AT_SPEC = re.compile(r"@\{[^{}]*\}")


def fix_multicolumn_specs(body):
    def one(m):
        spec = m.group(2)
        if "@{" not in spec:
            return m.group(0)
        return "\\multicolumn{%s}{%s}" % (m.group(1), AT_SPEC.sub("", spec))

    return MULTICOLUMN.sub(one, body)


# A matrix reaches Typst as a matrix only when pandoc can see its delimiters: `pmatrix` carries
# them, and `\left( \begin{array}…\end{array} \right)` names them. A size-specified delimiter --
# `\bigl( \begin{smallmatrix}…\end{smallmatrix} \bigr)` -- is read as a scaled glyph plus loose
# text, and the text's `&` and row break are inert inside a `cases` branch: the Quasi-Riemann page
# printed `(10u_01)` for a 2x2 matrix and Typst warned "linebreaks are ignored in branches"
# (`_work/measure_left_right_matrix.py`: `\bigl`, `\Bigl`, a plain `(` and even an invisible
# `\left.` all come out loose, `\left(` is the one spelling that yields `mat(`). 16 in 5 papers,
# 2 of them inside a cases. `\left…\right` is also what the author meant: a delimiter sized to its
# content, which is what Typst's `mat(delim:)` does with it.
SIZED_DELIM = r"(?:\\[A-Za-z]+|\\[{}]|[.\[\]()|])"
SIZED_MATRIX = re.compile(
    r"\\[bB]igg?[lrm]?\s*(?P<open>" + SIZED_DELIM + r")\s*"
    r"\\begin\{(?P<env>matrix|smallmatrix|array)\}(?P<spec>\{[^{}]*\})?"
    r"(?P<body>(?:(?!\\begin\{(?P=env)\}).)*?)"
    r"\\end\{(?P=env)\}\s*\\[bB]igg?[lrm]?\s*(?P<close>" + SIZED_DELIM + r")", re.S)


def grow_matrix_delims(body):
    # each side keeps the glyph the author wrote, so a mismatched pair stays mismatched
    return SIZED_MATRIX.sub(
        lambda m: "\\left%s\\begin{%s}%s%s\\end{%s}\\right%s"
        % (m.group("open"), m.group("env"), m.group("spec") or "", m.group("body"),
           m.group("env"), m.group("close")), body)


# the commands that scale a box around their last argument
BOX_CMD = re.compile(r"\\(?:resizebox|scalebox|adjustbox|rotatebox|reflectbox)\b")
BOXED_PICTURE = re.compile(r"\\begin\{(?:tikzpicture|tikzcd|CD)\}")


def unwrap_boxes(text):
    r"""A picture boxed for TeX's page -> the same picture without the scaling.

    \resizebox{\textwidth}{!}{ \begin{tikzpicture}…\end{tikzpicture} } is how a preprint fits a
    drawing into its column. pandoc does not read the command and discards its argument, so the
    float loses the drawing entirely; Typst fits a figure to the page on its own, so what is
    dropped here is the scaling and not the content. Only a box that holds a picture is opened:
    an argument we do not recognise leaves the command exactly as the author wrote it.
    """
    out, i = [], 0
    while True:
        m = BOX_CMD.search(text, i)
        if not m:
            out.append(text[i:])
            return "".join(out)
        out.append(text[i:m.start()])
        pos, kept = skip_spaces(text, m.end()), None
        while pos < len(text) and text[pos] in "[{" and kept is None:
            if text[pos] == "[":
                end = text.find("]", pos)
                if end < 0:
                    break
                pos = skip_spaces(text, end + 1)
                continue
            try:
                end = find_group(text, pos)
            except ValueError:
                break
            inner = text[pos + 1:end - 1]
            if BOXED_PICTURE.search(inner):
                kept = inner
            pos = skip_spaces(text, end)
        if kept is None:
            # nothing inside was a picture: the command stays for the fallback to quote
            out.append(text[m.start():m.end()])
            i = m.end()
            continue
        out.append(kept)
        i = pos


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
    r"""Expand user macros, with no region excepted.

    A picture is held out of the body before this runs over the text, and is expanded at the
    moment it is held; a node label's maths is read by cetz's own symbol table, which knows no
    paper macros, so `\node {$\Spec R$}` with the name left unexpanded loses its operator.
    """
    return macros.expand(text, table)


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
