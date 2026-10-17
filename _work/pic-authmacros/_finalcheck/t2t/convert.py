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
# A figure's own style and colour table -- statements that draw nothing, so they can travel with
# the picture they set up, where the emitter already folds them in.
STYLE_DECL = re.compile(r"\\(?:tikzset|colorlet|definecolor)(?![A-Za-z])")


def picture_scopes(body, table):
    r"""One (macros, declarations) pair per picture of `body`, in the order the pictures stand.

    A preprint draws with macros its own figure defines, in the `\begingroup` wrapped around the
    picture -- after `\begin{document}`, where `prep.parse_preamble`, which stops at that word,
    never reads them. `\FiniteSquare`, `\pinsgroup` and `\geometryrow` therefore never reach the
    table a picture is expanded against, the statement parser meets a verb it does not know, and
    the drawing is quoted as LaTeX. The body between two pictures is read in document order and
    every table stops at the picture it serves, so a later figure's redefinition of the same name
    cannot answer the drawing above it.

    The block that defines the macros usually also declares the styles and colours the picture
    draws with. Those are not prose, so they travel into the picture, where `cetz.expand_tikzset`
    and `cetz._colors` already fold a declaration table into what a statement reads: left behind,
    a figure that separates two families by ink draws both of them in black. A `\tikzset` that sets
    a whole-picture default instead of a `/.style` table travels too, because that is the one place
    the emitter already refuses one -- `cetz.build` answers None for a drawing carrying
    `\tikzset{line width=2pt}`, measured directly -- while a statement dropped here would let the
    same figure convert in an ink the author overrode. Nothing in the corpus hangs on the choice
    today: across the 932 pictures of the 532 flat papers that hold one, no block between two
    pictures sets a default rather than a style table.
    """
    out, scope, pos = [], dict(table), 0
    for pic in TIKZ_SPAN.finditer(body):
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
        out.append((scope, "\n".join(decls)))
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

PRELUDE = """#set page(paper: "us-letter", margin: {margins}, numbering: "1")
#set text(lang: "en", size: {fontsize})
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]
""".replace("{", "{{").replace("}", "}}").replace("{{margins}}", "{margins}").replace("{{fontsize}}", "{fontsize}")

def _prelude(p):
    return PRELUDE.format(margins=typst_margins(p), fontsize=p.fontsize)

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
        return 'ZQT2TTIKZ%d' % (len(tikz) - 1)
    body = TIKZ_SPAN.sub(preserve_tikz, body)
    body = float_pictures(body, preserve_tikz)
    body = body.replace('\\/', '')
    body = prep.expand_macros(body, p.macros)
    body = prep.fix_dialect_prose(body)
    body = prep.strip_dropped(body)
    body = prep.array_floats(body)
    body = prep.lift_captions(body)
    body = prep.fix_multicolumn_specs(body)
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
