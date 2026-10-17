"""Drive one paper: flat LaTeX -> pandoc AST -> Typst source, then compile."""

import json
import os
import re
import subprocess
import sys
import shutil
from pathlib import Path

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from t2t import cetz as cetzmod  # noqa: E402
from t2t import emit, macros, mathconv, prep  # noqa: E402
from t2t.texutil import find_group, skip_spaces  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
MANIFEST = {e['paper']: e for e in json.loads(Path(ROOT, '_work', 'manifest.json').read_text(encoding='utf-8'))}
NEWLABEL_RX = re.compile(r"\\newlabel\{([^{}]*)\}\{\{([^{}]*)\}")
FIGURE_FLOAT = re.compile(r"\\begin\{figure\*?\}.*?\\end\{figure\*?\}", re.S)
CD_BLOCK = re.compile(r"\\begin\{(?:tikzcd|CD)\}.*?\\end\{(?:tikzcd|CD)\}", re.S)
# The one pattern for a picture held whole out of a body: `picture_scopes` walks its matches and
# convert_paper substitutes them, so the two cannot disagree about where a drawing starts.
TIKZ_SPAN = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
# A display equation, in the two shapes the corpus writes it: `\[ … \]` and the amsmath environments.
# The line anchor on `\[` is not decoration -- `\[0,1\]` is an interval, and an unanchored opener calls
# every picture below the first interval in a paper "inside maths".
MATH_TOKEN = re.compile(r"(?m)^[ \t]*\\\[|\\\]|"
                        r"\\(?:begin|end)\{(?:equation|eqnarray|align|alignat|gather|multline|flalign)\*?\}")


def display_math_spans(body):
    r"""The (start, end) of every display equation in `body`, outermost only."""
    stack, spans = [], []
    for m in MATH_TOKEN.finditer(body):
        token = m.group(0).lstrip()
        if token == "\\[":
            stack.append(m.end() - 2)
        elif token.startswith("\\begin"):
            stack.append(m.start())
        elif stack and (token == "\\]" or token.startswith("\\end")):
            start = stack.pop()
            if not stack:
                spans.append((start, m.end()))
    return spans


HSPACE_ARG = re.compile(r"\\hspace\s*\{([^{}]*)\}")


def bake_math_hspace(body):
    r"""A display equation's `\hspace{<len>}` -> the token `mathconv.tex_space_values` restores.

    `prep.PROSE_DIALECT` folds `\hspace{<len>}` away, and its trailing `\b` lands on the closing
    `}` -- so it only fires when the gap is followed by a word character, i.e. exactly the sites
    where a display equation writes `&\hspace{29mm}85,`.  That runs over the whole body, before
    `mathconv.clean()` can read the length, so the author's alignment gap is deleted.  Baking the
    display-maths sites here keeps them out of PROSE_DIALECT's way; the prose sites are still left
    to it, which is what turns them into a space instead of letting pandoc fuse the two words.
    """
    out, last = [], 0
    for s, e in display_math_spans(body):
        out.append(body[last:s])
        out.append(HSPACE_ARG.sub(lambda m: mathconv.hspace_token(m.group(1)), body[s:e]))
        last = e
    out.append(body[last:])
    return "".join(out)


def lifted_pictures(body):
    r"""The pictures the body gives up to the marker pass, in document order.

    A drawing the author put inside a display equation is held back, and it is held back in one place:
    the lifted picture comes back as a string replace on the emitted Typst, but pandoc reads `\[ … \]`
    as a single `Math` node, the maths converter spells the marker as spaced letters
    (`$Z Q T 2 T T I K Z 0$`, measured), the replace finds nothing, and the page keeps the marker where
    the figure was.  Left in the maths string the picture reaches `emit.math_text`, which already asks
    CeTz for a drawing found inside a display -- the road `tikzcd` has used since #30.
    """
    spans = display_math_spans(body)
    return [m for m in TIKZ_SPAN.finditer(body)
            if not any(s <= m.start() < e for s, e in spans)]
# A figure's own style and colour table -- statements that draw nothing, so they can travel with
# the picture they set up, where the emitter already folds them in.
STYLE_DECL = re.compile(r"\\(?:tikzset|colorlet|definecolor)(?![A-Za-z])")


def picture_scopes(body, table):
    r"""One (macros, declarations) pair per picture of `body`, in the order the pictures stand.

    A preprint draws with macros its own figure defines, in the `\begingroup` wrapped around the
    picture -- after `\begin{document}`, where `prep.parse_preamble`, which stops at that word,
    never reads them. `\FiniteSquare`, `\pinsgroup` and `\geometryrow` therefore never reach the
    table a picture is expanded against, the statement parser meets a verb it does not know, and
    the drawing is quoted as LaTeX. The body between two pictures is read in document order, so a
    later figure's redefinition of the same name cannot answer the drawing above it.

    The block that defines the macros usually also declares the styles and colours the picture
    draws with. Those are not prose, so they travel into the picture, where `cetz.expand_tikzset`
    and `cetz._colors` already fold a declaration table into what a statement reads: left behind,
    a figure that separates two families by ink draws both of them in black. A `\definecolor` stands
    at the document's top level, not in a group, so TeX keeps it in force for the rest of the paper
    -- a figure that opens with the colour table and follows with three pictures (panel (a), (b),
    (c) of one drawing, `Canonical-conformal-limits-o` p99, whose later panels came out as black
    slabs because `cetz.translate_path` falls back to black for an ink it cannot resolve) needs the
    table in every one of them. The declarations therefore accumulate forward; a later picture's own
    redefinition still wins inside it, since `cetz._colors` reads the picture after the table. A `\tikzset` that sets
    a whole-picture default instead of a `/.style` table travels too, because that is the one place
    the emitter already refuses one -- `cetz.build` answers None for a drawing carrying
    `\tikzset{line width=2pt}`, measured directly -- while a statement dropped here would let the
    same figure convert in an ink the author overrode. Nothing in the corpus hangs on the choice
    today: across the 932 pictures of the 532 flat papers that hold one, no block between two
    pictures sets a default rather than a style table.
    """
    out, scope, pos, seen = [], dict(table), 0, []
    for pic in lifted_pictures(body):
        region, pos = body[pos:pic.start()], pic.end()
        extra, _skipped = macros.parse_definitions(region)
        scope.update(extra)
        decls = []
        for m in STYLE_DECL.finditer(region):
            start = skip_spaces(region, m.end())
            if region[start:start + 1] != "{":
                continue
            try:
                close = find_group(region, start)
            except ValueError:
                continue
            end = close
            # \definecolor{name}{rgb}{0,0,1} is a statement of two groups, \colorlet of one
            while region[end:end + 1] == "{":
                try:
                    end = find_group(region, end)
                except ValueError:
                    break
            if m.group(0) == "\\tikzset" and region[end:end + 1] == ";":
                end += 1
            decls.append(region[m.start():end])
        seen.extend(decls)
        out.append((scope, "\n".join(seen)))
    return out


def with_declarations(pic, decls):
    r"""A picture with its figure's own declarations as the statements that open it.

    They stand before `\begin{tikzpicture}` in the paper, so TeX has them in force when it reads
    the drawing, and a declaration the picture writes for itself still overrides them later, as it
    does there.
    """
    head = re.match(r"\\begin\{tikzpicture\}", pic)
    body = pic[head.end():]
    _opts, pos = cetzmod._opts_at(body, skip_spaces(body, 0))
    if _opts is None:
        return pic
    return pic[:head.end() + pos] + "\n" + decls + "\n" + body[pos:]



def float_pictures(body, preserve):
    r"""Hide a commutative diagram that stands as a float's content behind a token.

    pandoc reads \begin{figure} as a block and drops an environment it does not know, so a
    tikzcd drawing there leaves the float with nothing to hold. A diagram set inside $ $ or
    \[ \] stays where it is: there it is maths, and the maths path turns it into a canvas that
    cannot sit inside a formula.
    """
    def one(match):
        text = match.group(0)
        out, pos = [], 0
        for pic in CD_BLOCK.finditer(text):
            before = text[:pic.start()]
            if before.count("$") % 2 or "\\[" in before or "\\(" in before:
                continue
            out.append(text[pos:pic.start()])
            out.append(preserve(pic))
            pos = pic.end()
        out.append(text[pos:])
        return "".join(out)

    return FIGURE_FLOAT.sub(one, body)


BIB_FIELD_RX = re.compile(r'(?im)(?:^|,)\s*(\w+)\s*=\s*\{')
BIB_LINK_KEYS = ('doi', 'url', 'eprint', 'isbn', 'issn', 'file')
# `~` is on the list because a field's TeX hard space is markup too: the plain writer answers it
# with U+00A0, which `bib_plain`'s whitespace collapse turns into the space the author asked for,
# while a `~` inside `\url{…}`/`\href{…}` comes back as the URL's own character. Read fields carry
# no bare URL (0 tildes over the whole corpus, `_work/probe_bib_bare_url.py`), so widening the
# trigger cannot break a link -- and 88 tildes in 52 papers' `booktitle = {…, Vol.~II}` were
# printing the tilde because nothing read the field at all (`_work/probe_bib_tilde_face.py`).
BIB_MARKUP_RX = re.compile(r'[$\\^_~]')
BIB_UNWRITTEN_SCRIPT_RX = re.compile(r'[\^_]\(((?:[^()]|\([^()]*\))*)\)')
BIB_ECHOED_RX = re.compile(r'\$([^$]*)\$')
# A `.bib` field has no height to stack in, so the shapes that need it are the ones the plain
# writer answers by echoing their TeX back. Measured over the 28 echoed groups that survived the
# first pass (`_work/probe_bib_echoes.py`): `\frac`/`\tfrac` 13, `\overline`/`\bar` 7, `\sqrt` 5,
# `\widetilde` 1 -- and nothing else that is not a plain symbol a second pass already knows.
BIB_ARG = r'(?:\{((?:[^{}]|\{[^{}]*\})*)\}|\\([a-zA-Z]+)|([^\s\\]))'
BIB_FRAC_RX = re.compile(r'\\[dt]?frac\s*' + BIB_ARG + r'\s*' + BIB_ARG)
BIB_SQRT_RX = re.compile(r'\\sqrt\s*(?:\[[^\]]*\])?' + BIB_ARG)
BIB_RULE_RX = re.compile(r'\\(overline|bar|widetilde|tilde|widehat|hat)\s*' + BIB_ARG)
MACRON, TILDE, HAT, SQRT = '\u0304', '\u0303', '\u0302', '\u221a'


def bib_arg(m, i):
    """BIB_ARG's i-th argument: a braced group's contents, a control word with its backslash, or
    a single letter. The backslash stays because the pass this text is re-fed to reads TeX again."""
    if m.group(i) is not None:
        return ' '.join(m.group(i).split())
    if m.group(i + 1) is not None:
        return '\\' + m.group(i + 1)
    return m.group(i + 2)


def bib_struct_text(group):
    r"""Write a echoed math group so that a one-line field can carry it.

    The plain writer renders a symbol it has Unicode for and hands back the TeX for a shape that
    needs a second line -- a fraction, a root, a rule over letters. Laid out in one line those
    shapes have honest spellings: `(A)/(B)`, the radical `√(X)`, and the base letter with its
    combining mark (U+0304 macron, U+0303 tilde, U+0302 hat), which is the same ink Typst's own
    maths sets for `\bar a`. Rewritten, the group goes back to the very pass that read the rest of
    the field, so every symbol still inside it keeps converting to Unicode.
    """
    out = BIB_FRAC_RX.sub(lambda m: '(%s)/(%s)' % (bib_arg(m, 1), bib_arg(m, 4)), group)
    out = BIB_SQRT_RX.sub(lambda m: SQRT + '(' + bib_arg(m, 1) + ')', out)

    def rule(m):
        mark = {'tilde': TILDE, 'hat': HAT}.get(m.group(1).replace('wide', ''), MACRON)
        return bib_arg(m, 2) + mark

    return BIB_RULE_RX.sub(rule, out)


def bib_plain(text, value):
    """One converted field, spelled so that Typst's bibliography can read it.

    pandoc's plain writer has no Unicode for every script it meets and answers with
    `C^(∞)`; the caret would print. Unwritten scripts lose their marker and keep
    their letter, because `C∞ maps` is the ink the author asked for and `C^(∞)` is
    the ink our converter failed at. An empty answer would delete content, so that
    field keeps the source spelling.
    """
    out = BIB_UNWRITTEN_SCRIPT_RX.sub(r'\1', text)
    out = ' '.join(out.split())
    if not out:
        return value
    if out.count('{') != out.count('}'):
        out = out.replace('{', '').replace('}', '')
    return out


def bib_field_spans(bib):
    r"""The value of every field that carries markup, as (start, stop, text), read left to right.

    An entry is a comma-separated list and an author may write two fields on one line, so a field
    begins at a line start OR after a comma: anchored at the line alone, the scanner never saw
    `author={Noga Alon and Vitali D. Milman},title={{$\lambda_1$}, Isoperimetric Inequalities…}`
    and the page printed `\lambda_1` (88 such fields across the corpus, with 0 quoted values and 0
    unbalanced ones to trip the wider reading -- `_work/probe_bib_field_spans.py`). Each value is
    skipped whole, so a `key = {` inside a field's own text stays that field's ink and is not read
    a second time as a field of the entry.
    """
    spans, i = [], 0
    while True:
        m = BIB_FIELD_RX.search(bib, i)
        if m is None:
            return spans
        stop = find_group(bib, m.end() - 1) - 1
        value = bib[m.end():stop]
        if m.group(1).lower() not in BIB_LINK_KEYS and BIB_MARKUP_RX.search(value):
            spans.append((m.end(), stop, value))
        i = stop


def flatten_bib_fields(bib):
    r"""Replace the TeX inside bibliography fields with the Unicode text it means.

    A `.bib` field never reaches the formula converter: hayagriva reads it as plain
    content, so `$\mathbb Z_+^N$`, `\href{https://a}{arXiv:2410.18372}`, `\v{c}ech`
    and `n\times n` arrive on the page as that exact string (measured: 879 lines /
    247 papers carry a literal control word, `_work/probe_page_syntax_tokens.py`;
    5,272 fields across 446 bib files carry TeX, `_work/probe_bib_tex.py`). The link
    fields are left alone -- a DOI or URL has to keep its literal slashes.
    """
    spans = bib_field_spans(bib)
    if not spans:
        return bib
    plain = mathconv.convert_plain_batch([s[2] for s in spans])
    pending, seen = [], set()
    for text in plain.values():
        for group in BIB_ECHOED_RX.findall(text):
            if group not in seen:
                seen.add(group)
                pending.append(group)
    ink = {}
    if pending:
        second = mathconv.convert_plain_batch(
            ['$%s$' % bib_struct_text(group) for group in pending])
        for i, group in enumerate(pending):
            text = second.get(i)
            if text is not None and not BIB_ECHOED_RX.search(text):
                ink[group] = ' '.join(text.split())
    out, at = [], 0
    for pos, (start, stop, value) in enumerate(spans):
        text = plain.get(pos)
        if text is None:
            continue
        for group in BIB_ECHOED_RX.findall(text):
            written = ink.get(group)
            if written is None:
                text = None
                break
            text = text.replace('$' + group + '$', written, 1)
        if text is None:
            continue
        out.append(bib[at:start])
        out.append(bib_plain(text, value))
        at = stop
    out.append(bib[at:])
    return ''.join(out)


def prepare_assets(name, out_dir):
    base_name = name.split('-alternate-')[0]
    entry = MANIFEST.get(base_name)
    if not entry:
        return
    origin = Path(ROOT, 'preprints', base_name)
    out = Path(out_dir)
    out.mkdir(parents=True, exist_ok=True)
    source_tex = Path(ROOT, '_work', 'flat', name + '.tex').read_text(encoding='utf-8')
    names = {Path(s.strip()).stem for match in re.findall(r'\\bibliography\{([^}]*)\}', source_tex) for s in match.split(',')}
    sources = [p for p in origin.rglob('*.bib') if p.stem in names]
    if not sources and entry.get('bib'):
        sources = [origin / entry['bib']]
    if sources:
        seen, chunks = set(), []
        for source in sources:
            data = source.read_text(encoding='utf-8', errors='replace')
            for match in re.finditer(r'@\w+\s*\{\s*([^,{}\s]+)', data):
                key = match.group(1)
                if key in seen:
                    continue
                seen.add(key)
                start = data.index('{', match.start())
                chunk = data[match.start():find_group(data, start)]
                month = re.search(r'\bmonth\s*=\s*\{([^}]*)\}\s*,?', chunk)
                if month and not re.fullmatch(r'\d{1,2}', month.group(1).strip()):
                    value = month.group(1)
                    month_names = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
                    number = next((i for i, word in enumerate(month_names, 1) if word in value.lower()), None)
                    if number:
                        chunk = chunk[:month.start()] + 'month = {' + str(number) + '},' + chunk[month.end():]
                        day = re.match(r'(\d+)\s', value)
                        if day:
                            chunk = chunk.rstrip()[:-1].rstrip().rstrip(',') + ',\n day = {' + day.group(1) + '}\n}'
                    else:
                        chunk = chunk[:month.start()] + chunk[month.end():]
                page_match = re.search(r'\bpages\s*=\s*\{([^}]*)\}', chunk)
                if page_match and ':' in page_match.group(1):
                    original_pages = page_match.group(1)
                    safe_pages = re.sub(r'\d+:(\d+)', r'\1', original_pages)
                    chunk = chunk[:page_match.start(1)] + safe_pages + chunk[page_match.end(1):]
                    note = re.search(r'\bnote\s*=\s*\{', chunk)
                    if note:
                        chunk = chunk[:note.end()] + 'Original page locator: ' + original_pages + '. ' + chunk[note.end():]
                    else:
                        chunk = chunk.rstrip()[:-1].rstrip().rstrip(',') + ',\n note = {Original page locator: ' + original_pages + '}\n}'
                chunks.append(chunk)
        bib = '\n\n'.join(chunks)
        (out / 'refs.original.bib').write_text(bib, encoding='utf-8')
        bib = re.sub(r'(?im)^\s*year\s*=\s*\{([^}]*)\}\s*,?',
                     lambda m: m.group(0) if re.fullmatch(r'\d{4}', m.group(1).strip()) else ' note = {Year: ' + m.group(1) + '},', bib)
        bib = flatten_bib_fields(bib)
        (out / 'refs.bib').write_text(bib, encoding='utf-8')
    fig = out / 'fig'
    fig.mkdir(exist_ok=True)
    referenced = {Path(m.replace('\\', '/')).name for m in re.findall(r'\\(?:includegraphics(?:\[[^\]]*\])?|includepdf(?:\[[^\]]*\])?)\{([^}]*)\}', source_tex)}
    copied = set()
    for source in origin.rglob('*'):
        if source.name not in referenced and source.stem not in referenced:
            continue
        if source.suffix.lower() in ('.png', '.jpg', '.jpeg', '.svg', '.pdf'):
            if source.name in copied:
                continue
            dest = fig / source.name
            try:
                if source.suffix.lower() == '.pdf':
                    import pymupdf
                    png_dest = Path(str(dest) + '.png')
                    if png_dest.exists():
                        copied.add(source.name)
                        continue
                    with pymupdf.open(source) as doc:
                        if len(doc):
                            doc[0].get_pixmap(matrix=pymupdf.Matrix(2, 2)).save(str(png_dest))
                else:
                    if dest.exists() and dest.stat().st_size == source.stat().st_size:
                        copied.add(source.name)
                        continue
                    shutil.copy2(source, dest)
                copied.add(source.name)
            except (PermissionError, OSError):
                # File locked by another process (antivirus/indexer); skip, asset is optional
                continue

PRELUDE = """#set page(paper: "us-letter", margin: %(margins)s, numbering: "1")
#set text(lang: "en", size: %(fontsize)s)
#set par(justify: true, first-line-indent: (amount: %(indent)s, all: %(indent_all)s), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: %(head_sub)s)
#show heading.where(level: 1): set text(size: %(head_top)s)
#show link: set text(fill: blue)
#show figure.where(kind: table): set block(breakable: true)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]
"""

# heading sizes as ratios of the paper's own body size: at the 11pt default they come out exactly
# 11.5pt and 13pt, and a 12pt paper no longer gets subsection headings smaller than its own text
HEAD_SUB, HEAD_TOP = 11.5 / 11, 13 / 11

def _prelude(p):
    # article leaves the paragraph a heading introduces flush left and indents the next one, while
    # amsart indents every paragraph at 12pt -- both read off pdflatex, not off a style sheet
    ams = p.documentclass.startswith("ams")
    body = float(p.fontsize[:-2])
    return PRELUDE % {
        "margins": typst_margins(p),
        "fontsize": p.fontsize,
        "indent": "12pt" if ams else "1.5em",
        "indent_all": str(ams).lower(),
        "head_sub": "%gpt" % round(body * HEAD_SUB, 2),
        "head_top": "%gpt" % round(body * HEAD_TOP, 2),
    }

TITLE_BLOCK = """#align(center)[#text(size: 16pt, weight: "bold")[{title}]]
#align(center)[{author}]
#align(center)[{date}]
"""


def typst_margins(p):
    def conv(v):
        num, unit = re.match(r"([0-9.]+)\s*(in|cm|mm|pt)", v).groups()
        base = {"in": 72.27, "cm": 28.346, "mm": 2.8346, "pt": 1.0}[unit]
        return "%.1fpt" % (float(num) * base)
    g = p.geometry
    if "margin" in g:
        m = conv(g["margin"])
        return "(x: %s, y: %s)" % (m, m)
    parts = []
    for side in ("left", "right", "top", "bottom"):
        if side in g:
            parts.append("%s: %s" % (side, conv(g[side])))
    if len(parts) == 4:
        return "(%s)" % ", ".join(parts)
    return "(x: 1in, y: 1in)"


def line_cm(p):
    r"""The width a `\linewidth` in the author's own TikZ measures, in cm.

    The page is ours: PRELUDE puts every paper on us-letter (612pt) with the margins typst_margins just
    read off the source's geometry, so the text column -- what TeX's \linewidth, \textwidth and
    \columnwidth all stand for here -- is that width minus the two side margins.
    """
    m = typst_margins(p)
    x = re.search(r"\bx: ([0-9.]+)pt", m)
    if x:
        left = right = float(x.group(1))
    else:
        sides = re.findall(r"(?:left|right): ([0-9.]+)pt", m)
        left, right = (float(sides[0]), float(sides[1])) if len(sides) == 2 else (72.3, 72.3)
    return (612.0 - left - right) * 2.54 / 72.0


def collect_formulas(node, into):
    if isinstance(node, list):
        for child in node:
            collect_formulas(child, into)
        return into
    if not isinstance(node, dict):
        return into
    t = node.get("t")
    if t == "Math":
        into.add(node["c"][1])
        return into
    for v in node.values():
        collect_formulas(v, into)
    return into


def formula_list(ast):
    seen = set()
    for b in ast["blocks"]:
        collect_formulas(b, seen)
    return sorted(seen)


def plain_text(s):
    return re.sub(r"\s+", " ", s or "").strip()


def title_of(p, fallback):
    src = p.title or fallback
    out = mathconv.prose_to_typst(src)
    return out.replace("\n", " ").strip() or esc_title(fallback)


def esc_title(s):
    return emit.esc(plain_text(s))


def convert_paper(flat_path, out_dir, paper_name, keep_work=False):
    """Return a report dict for one paper."""
    stats = emit.Stats()
    prepare_assets(paper_name, out_dir)
    with open(flat_path, encoding="utf-8", errors="replace") as fh:
        src = fh.read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    pre_text = re.sub(r'\\begingroup[^\n]*\\catcode[^\n]*\\endgroup', '', pre_text)
    pre_text = prep.strip_pdf_noise(pre_text)
    quotes = []
    def preserve_quote(match):
        quotes.append(match.group(2))
        return '\n\nZQT2TQUOTE%d\n\n' % (len(quotes) - 1)
    body = re.sub(r'\\begin\{(PromptQuote|CoTQuote)\}(.*?)\\end\{\1\}', preserve_quote, body, flags=re.S)
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    tikz = []
    scopes = picture_scopes(body, p.macros)

    def preserve_tikz(match):
        # a drawing is lifted out of the body before the body's own macro pass runs, so it
        # has to carry its expansions with it: a node label's maths is read by cetz's symbol
        # table, which knows no paper macros and would drop \Spec from $\Spec R$ outright
        text = match.group(0)
        if len(tikz) < len(scopes):
            table, decls = scopes[len(tikz)]
            if decls:
                text = with_declarations(text, decls)
        else:
            # a commutative diagram held back by float_pictures: the preamble is all the
            # macro scope it was ever drawn with, and a tikzcd float declares nothing of its own
            table = p.macros
        tikz.append(prep.expand_macros(text, table))
        # padded on both sides: the token lands in the middle of the author's text, and a
        # picture written tight against a control word (`\centering\begin{tikzpicture}`) would
        # otherwise be read by TeX -- and by pandoc -- as ONE command name, `\centeringZQT2TTIKZ1`.
        # The token then never appears in the parsed body, the restore below finds nothing, and the
        # figure keeps its caption over a printed `2TTIKZ1`. Three pictures in Cylinder-amplitudes.
        return ' ZQT2TTIKZ%d ' % (len(tikz) - 1)
    parts, last = [], 0
    for m in lifted_pictures(body):
        parts.append(body[last:m.start()])
        parts.append(preserve_tikz(m))
        last = m.end()
    body = "".join(parts) + body[last:]
    body = float_pictures(body, preserve_tikz)
    body = body.replace('\\/', '')
    body = prep.expand_macros(body, p.macros)
    body = bake_math_hspace(body)
    body = prep.fix_dialect_prose(body)
    body = prep.strip_dropped(body)
    body = prep.array_floats(body)
    body = prep.promote_custom_floats(pre_text, body)
    body = prep.promote_minipage_floats(body)
    body = prep.unwrap_fbox(body)
    body = prep.unstack_cells(body)
    body = prep.lift_captions(body)
    body = prep.encode_minipage_widths(body)
    body = prep.dedupe_longtable_heads(body)
    body = prep.fix_multicolumn_specs(body)
    body = prep.grow_matrix_delims(body)
    body = re.sub(r'\\label\[[^\]]*\]', r'\\label', body)
    baked_bibs = re.findall(r'\\begin\{thebibliography\}(?:\[[^\]]*\])?\{[^}]*\}.*?\\end\{thebibliography\}', body, re.S)
    for i, bib in enumerate(baked_bibs):
        body = body.replace(bib, '\n\nZQT2TBIB%d\n\n' % i, 1)

    has_bib = os.path.exists(os.path.join(out_dir, "refs.bib"))
    p.baked_bib = not has_bib
    # A preprint keeps the \newlabel lines of its own aux pass, and those carry the numbers
    # of labels it imports from another draft: key -> number. The aux dump sits in the
    # preamble, above \begin{document}, so both halves have to be read.
    p.aux_labels = dict(NEWLABEL_RX.findall(pre_text) + NEWLABEL_RX.findall(body))
    # a caption's chain of \labels reaches pandoc as its last name alone, and the rest have to keep
    # the float's number: measured with pdflatex, every name under one caption numbers from that caption
    p.label_aliases = prep.label_aliases(body)
    p.bib_keys = set(re.findall(r'@\w+\s*\{\s*([^,{}\s]+)', Path(out_dir, 'refs.bib').read_text(encoding='utf-8'))) if has_bib else set()
    work = os.path.join(os.path.dirname(flat_path), "_work_tex")
    os.makedirs(work, exist_ok=True)
    fixed_tex = os.path.join(work, os.path.basename(flat_path))
    with open(fixed_tex, "w", encoding="utf-8") as fh:
        fh.write(pre_text + "\\begin{document}\n" + body)

    json_path = fixed_tex[:-4] + ".json"
    proc = subprocess.run(
        [os.environ.get("PANDOC", "pandoc"), fixed_tex, "-f", "latex", "-t", "json",
         "-o", json_path],
        capture_output=True, text=True, encoding="utf-8", timeout=900)
    if not os.path.exists(json_path):
        return {"paper": paper_name, "ok": False, "stage": "pandoc-json",
                "error": (proc.stderr or "").strip()[:300]}
    with open(json_path, encoding="utf-8") as fh:
        ast = json.load(fh)

    formulas = formula_list(ast)
    stats.note("formulas", len(formulas))

    book = emit.Book(p, stats)
    for bib in baked_bibs:
        for n, match in enumerate(emit.BIBITEM_RX.finditer(bib), 1):
            book.bibnumbers[match.group(1)] = n
    latex_map = {}
    em = emit.Emitter(book, latex_map)
    # Number the document before converting its maths: an \eqref is only resolvable
    # once the numbering pass has registered the label it points at.
    book.stats = emit.Stats()
    em.dry = True
    em.emit_document(ast["blocks"])
    em.out = []
    em.dry = False

    converted, refused, math_err = mathconv.convert_formulas(formulas, book.math_refs())
    for idx, tex in enumerate(formulas):
        latex_map[tex] = converted.get(idx)
        # a diagram inside $ $ is held back by the maths converter because it is a drawing,
        # and the emitter asks CeTz for it next; only a formula with no canvas behind it is lost
        if latex_map[tex] is None and not cetzmod.PICTURE.search(tex):
            stats.note("math_unconverted", tex[:100])
    book.stats = stats
    lines = em.emit_document(ast["blocks"])

    head = _prelude(p)
    title = plain_text(p.title or paper_name)
    if title:
        metadata = mathconv.convert_prose_batch([p.title or paper_name, p.author or '', p.date or ''])
        head += "\n" + TITLE_BLOCK.format(title=metadata.get(0, esc_title(p.title or paper_name)),
                                          author=metadata.get(1, esc_title(p.author or '')),
                                          date=metadata.get(2, esc_title(p.date or '')))
    text = head + "\n" + "\n".join(lines) + "\n"
    for i, bib in enumerate(baked_bibs):
        text = text.replace('ZQT2TBIB%d' % i, '#heading(level: 1)[References]\n' + '\n'.join(em.bibliography_block(bib)))
    for i, quote in enumerate(quotes):
        text = text.replace('ZQT2TQUOTE%d' % i, '#raw(block: true, %s)' % emit._typst_str(quote))
    text = re.sub(r'(#?image\("fig/[^"\n]+\.pdf)(")', r'\1.png\2', text)
    text = text.replace('](', '] (')
    for i, chunk in enumerate(tikz):
        done = cetzmod.convert(chunk, p.colors, line_cm(p), refs=book.bare_ref)
        if done:
            stats.note("cetz_converted", 1)
        else:
            # a picture the gate refuses would otherwise leave a caption over a blank box:
            # quoted, its content stays in the paper and the refusal is countable
            stats.note("cetz_refused", chunk[:120])
            done = emit.quoted_source(chunk)
        text = text.replace('ZQT2TTIKZ%d' % i, done)
    if '#cetz.canvas(' in text:
        text = cetzmod.HEADER + text
    if has_bib:
        text += ('\n#bibliography("refs.bib", style: "ieee", title: [References])\n')

    wrapper_pages = 0
    if '\\includepdf' in src and paper_name in MANIFEST:
        import pymupdf
        origin = Path(ROOT, 'preprints', paper_name)
        pages = []
        for target in re.findall(r'\\includepdf(?:\[[^\]]*\])?\{([^}]*)\}', src):
            pdf_source = next(origin.rglob(Path(target).name), None)
            if pdf_source is None:
                stats.note('missing_included_pdf', target)
                continue
            with pymupdf.open(pdf_source) as doc:
                for page in doc:
                    filename = 'included-%04d.png' % wrapper_pages
                    page.get_pixmap(matrix=pymupdf.Matrix(2, 2)).save(str(Path(out_dir, 'fig', filename)))
                    pages.append('#set page(width: %spt, height: %spt, margin: 0pt)\n#image("fig/%s", width: 100%%, height: 100%%, fit: "contain")' % (page.rect.width, page.rect.height, filename))
                    wrapper_pages += 1
        if pages:
            text = '#set par(spacing: 0pt)\n' + '\n#pagebreak()\n'.join(pages)

    os.makedirs(out_dir, exist_ok=True)
    typ_path = os.path.join(out_dir, "main.typ")
    with open(typ_path, "w", encoding="utf-8") as fh:
        fh.write(text)

    report = {"paper": paper_name, "ok": True, "typ_lines": text.count("\n"),
              "included_pdf_pages": wrapper_pages,
              "formulas": len(formulas), "math_failed": len([v for v in latex_map.values() if v is None]),
              "labels": len(book.labels), "equations": book.eq,
              "theorems": sum(book.thm.values()), "figures": book.fig,
              "tables": book.tab, "stats": dict(stats.counts),
              "samples": stats.samples, "pandoc_json_warn": (proc.stderr or "")[:200],
              "packages_unsupported": p.unsupported,
              "macros_skipped": [s[0] for s in p.skipped_defs]}

    pdf = os.path.join(out_dir, "main.pdf")
    comp = subprocess.run(["typst", "compile", typ_path, pdf],
                          capture_output=True, text=True, encoding="utf-8",
                          errors="replace", timeout=900)
    report["compile_ok"] = comp.returncode == 0
    report["compile_err_full"] = (comp.stderr or "")[:4000]
    errs = re.findall(r"^error: (.*)$", comp.stderr or "", re.M)
    report["compile_errors"] = len(errs)
    report["error_kinds"] = {}
    for e in errs:
        key = e.split(":")[0][:60]
        report["error_kinds"][key] = report["error_kinds"].get(key, 0) + 1
    warns = re.findall(r"^warning: (.*)$", comp.stderr or "", re.M)
    report["compile_warnings"] = len(warns)
    if not keep_work and os.path.exists(json_path):
        os.remove(json_path)
    return report


if __name__ == "__main__":
    flat = sys.argv[1]
    out = sys.argv[2]
    print(json.dumps(convert_paper(flat, out, os.path.basename(out)), indent=1)[:2000])
