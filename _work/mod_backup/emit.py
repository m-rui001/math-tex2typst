"""Walk pandoc's LaTeX AST and emit Typst markup with LaTeX's own numbering.

Every cross-reference number (section, theorem, equation, figure, table) is
resolved here and written as literal text, so the converted document reads the
way the LaTeX original does and can be diffed against its PDF.  The document is
walked twice: the numbering pass assigns numbers and registers labels (so
forward references resolve), the emitting pass writes markup.
"""

import re
import json
import copy

from . import mathconv

MARKUP_ESCAPE = '#$@%<>_*"\\&{}[]|`'
NUMBERED_ENVS = ("equation", "align", "alignat", "gather", "multline",
                 "flalign", "eqnarray")
BIBITEM_RX = re.compile(r"\\bibitem(?:\[[^\]]*\])?\{([^}]*)\}")
THEBIB_RX = re.compile(r"\\begin\{thebibliography\}(?:\[[^\]]*\])?\{[^}]*\}(.*)", re.S)


def esc(text):
    out = []
    for ch in text:
        out.append("\\" + ch if ch in MARKUP_ESCAPE else ch)
    return "".join(out)


class Stats:
    def __init__(self):
        self.counts = {}
        self.samples = {}

    def note(self, kind, sample=""):
        self.counts[kind] = self.counts.get(kind, 0) + 1
        if sample and kind not in self.samples:
            self.samples[kind] = " ".join(str(sample).split())[:160]

    def merged(self, other):
        for k, v in other.counts.items():
            self.counts[k] = self.counts.get(k, 0) + v
            if k not in self.samples and k in other.samples:
                self.samples[k] = other.samples[k]


class Book:
    """Numbering state and label registry for one paper."""

    def __init__(self, preamble, stats):
        self.pre = preamble
        self.stats = stats
        self.sec = [0] * 8
        self.appendix = False
        self.eq = 0
        self.fig = 0
        self.tab = 0
        self.thm = {}
        self.labels = {}
        self.bibnumbers = {}

    def section_number(self):
        if self.appendix and self.sec[0]:
            head = chr(ord("A") + max(self.sec[1], 1) - 1)
            rest = "".join("." + str(v) for v in self.sec[2:] if v)
            return head + rest
        return ".".join(str(v) for v in self.sec if v)

    def step_section(self, level):
        self.sec[level - 1] += 1
        for i in range(level, 8):
            self.sec[i] = 0
        if level == 1:
            if self.pre.numberwithin_eq:
                self.eq = 0
            for env in self.pre.theorem:
                base, within = self._thm_base(env)
                if within == 'section':
                    self.thm[base] = 0

    def _thm_base(self, env):
        table = self.pre.theorem
        base = table.get(env, {}).get("shared") or env
        owner, seen = base, set()
        while table.get(owner, {}).get("shared") and owner not in seen:
            seen.add(owner)
            owner = table[owner]["shared"]
        return base, table.get(owner, {}).get("within")

    def theorem_number(self, env):
        base, within = self._thm_base(env)
        self.thm[base] = self.thm.get(base, 0) + 1
        n = self.thm[base]
        if within == "section" and self.sec[0]:
            return "%s.%d" % (self.sec[0], n)
        return str(n)

    def equation_number(self):
        self.eq += 1
        if self.pre.numberwithin_eq and self.sec[0]:
            return "%s.%d" % (self.sec[0], self.eq)
        return str(self.eq)

    def register(self, label, kind, shown, name=None):
        if label:
            self.labels[label] = {"kind": kind, "shown": shown, "name": name or kind}

    def ref_text(self, label, literal):
        """Baked reference text, LaTeX-style."""
        entry = self.labels.get(label)
        if entry is None:
            self.stats.note("dangling_ref", label or literal[:40])
            return literal or "[??]"
        kind, shown, name = entry["kind"], entry["shown"], entry["name"]
        if kind == "eq":
            shown = str(shown).replace(r'\ast', '∗').replace(r'\star', '⋆').replace(r'\dagger', '†').replace('$', '')
            return esc("(%s)" % shown) if shown else literal
        bare = literal.strip() in ("[%s]" % label, esc("[%s]" % label), "")
        if not bare and literal.strip():
            return literal.strip()
        return "%s %s" % (name, shown) if name else (shown or literal)


def _snake(name):
    return re.sub(r"(?<!^)(?=[A-Z])", "_", name).lower()


def _display_env(latex):
    m = re.search(r"\\begin\{([a-zA-Z*]+)\}", latex)
    if m:
        return m.group(1)
    return "displaymath" if latex.strip().startswith("\\[") else "math"


def _label_of(latex):
    m = re.search(r"\\label\{([^}]*)\}", latex)
    return m.group(1) if m else ""


def _tag_of(latex):
    m = re.search(r"\\tag\{([^}]*)\}", latex)
    return m.group(1) if m else ""


def _strip_trailing_label(math_text):
    return re.sub(r"\s*<[A-Za-z0-9_:.\-]+>\s*$", "", math_text).strip()


def _typst_str(text):
    return json.dumps(text, ensure_ascii=False)


def _content(text):
    return text.replace("[", "\\[").replace("]", "\\]")


def _basename(path):
    return path.replace("\\", "/").split("/")[-1]


def _one_line(s):
    return " ".join(str(s).split())[:60].replace('"', "'")


def _number_style(style, delim, start):
    name = style["t"] if isinstance(style, dict) else str(style)
    unit = {"Example1": "1", "Example2": "1", "ExampleParens": "1",
            "Decimal": "1", "LowerAlpha": "a", "UpperAlpha": "A",
            "LowerRoman": "i", "UpperRoman": "I"}.get(name, "1")
    dt = delim["t"] if isinstance(delim, dict) else str(delim)
    if dt == "OneParen":
        return "%s)" % unit
    if dt in ("ExampleParens", "Parens"):
        return "(%s)" % unit
    return "%s." % unit


def _pop_note_arg(inlines):
    """`\\begin{theorem}[Note]` leaves its note in the first paragraph's text."""
    txt = "".join(x["c"] for x in inlines[:2] if x["t"] == "Str")
    m = re.match(r"\s*\[([^\]]*)\]", txt)
    if not m:
        return ""
    lead_len = len(txt[:m.end()])
    removed = 0
    for i, node in enumerate(inlines):
        if node["t"] != "Str":
            continue
        if removed + len(node["c"]) <= lead_len:
            removed += len(node["c"])
            inlines[i] = {"t": "Str", "c": ""}
        else:
            inlines[i] = {"t": "Str", "c": node["c"][removed:]}
            break
    while inlines and inlines[0] == {"t": "Str", "c": ""}:
        inlines.pop(0)
    while inlines and inlines[0]["t"] == "Space":
        inlines.pop(0)
    return m.group(1)


class Emitter:
    def __init__(self, book, formulas):
        self.book = book
        self.formulas = formulas
        self.out = []
        self.dry = False
        self.cache = {}

    # ------------------------------------------------------------------ api
    def emit_document(self, blocks):
        for node in blocks:
            self.out.extend(self.block(node, 0))
        return self.out

    def block(self, node, indent):
        method = getattr(self, "b_" + _snake(node["t"]), None)
        if method is None:
            self.book.stats.note("unhandled_block:" + node["t"],
                                 str(node.get("c"))[:80])
            return []
        return method(node, indent) or []

    def blocks(self, items, indent):
        out = []
        for node in items:
            out.extend(self.block(node, indent))
        return out

    def _num(self, node, kind, compute):
        key = (node if isinstance(node, tuple) else id(node), kind)
        if self.dry:
            value = compute()
            self.cache[key] = value
            return value
        cached = self.cache.get(key)
        if cached is not None:
            return cached
        value = compute()
        self.cache[key] = value
        return value

    def _wrap(self, name, inner, ident=""):
        body = ["  " + l for l in inner if l != ""]
        tag = (" <%s>" % ident) if ident else ""
        return ["#%s[" % name, *body, "]" + tag, ""]

    # ---------------------------------------------------------------- blocks
    def b_header(self, node, indent):
        level, (ident, classes, _attrs), inlines = node["c"]
        unnumbered = "unnumbered" in classes or level == 0
        num = self._num(node, "sec", lambda: self._section(level, unnumbered))
        title = self.inlines(inlines)
        if not unnumbered and ident:
            self.book.register(ident, "sec", num, name="Section")
        line = "%s %s%s" % ("=" * (level + 1), (num + " ") if num else "", title)
        if ident:
            line += " <%s>" % ident
        return [line, ""]

    def _section(self, level, unnumbered):
        if unnumbered:
            return ""
        self.book.step_section(level)
        return self.book.section_number()

    def b_para(self, node, indent):
        return self._flow(node["c"], indent)

    def b_plain(self, node, indent):
        return self._flow(node["c"], indent)

    def _flow(self, inlines, indent):
        lines = []
        for kind, payload in self.inline_parts(inlines):
            if kind == "display":
                lines.extend(self.display_equation(payload[1], indent, identity=payload[0]))
            else:
                lines.extend([payload, ""])
        return lines

    def b_line_block(self, node, indent):
        rows = [self.inlines(item) for item in node["c"]]
        return ["#stack(spacing: 0.2em, below: 0.8em)[\n  " + "\n  ".join(rows) + "\n]", ""]

    def b_block_quote(self, node, indent):
        inner = ["  " + l for l in self.blocks(node["c"], indent + 1) if l]
        return ["#quote(block: true)[", *inner, "]", ""]

    def b_bullet_list(self, node, indent):
        out = []
        for item in node["c"]:
            body = [l for l in self.blocks(item, indent + 1) if l != ""]
            if not body:
                continue
            out.append("- " + body[0])
            out.extend("  " + l for l in body[1:])
        return [*out, ""]

    def b_ordered_list(self, node, indent):
        (start, style, delim), items = node["c"]
        numbering = _number_style(style, delim, start)
        out = []
        for item in items:
            body = [l for l in self.blocks(item, indent + 1) if l != ""]
            if not body:
                continue
            out.append("+ " + body[0])
            out.extend("  " + l for l in body[1:])
        if numbering == "1.":
            return [*out, ""]
        return ["#{ set enum(numbering: %s); [\n  %s\n] }"
                % (_typst_str(numbering), "\n  ".join(out)), ""]

    def b_div(self, node, indent):
        (ident, classes, _attrs), body = node["c"]
        cls = classes[0] if classes else ""
        if cls in self.book.pre.theorem:
            return self.theorem_block(node, cls, ident, body)
        if cls == "proof":
            return self._wrap("proof", self.blocks(self.strip_generated_head(body, 'Proof'), indent + 1), ident)
        if cls == "abstract":
            return self._wrap("paperabstract", self.blocks(body, indent + 1), ident)
        if cls in ("center", "flushleft", "flushright", "quote", "",
                   "longtable", "landscape", "label"):
            return self.blocks(body, indent)
        if cls and any(k.startswith("tabular") for k in classes):
            return self.blocks(body, indent)
        if cls:
            self.book.stats.note("unhandled_div_class:" + cls, ident)
        return self.blocks(body, indent)

    def b_raw_block(self, node, indent):
        _fmt, text = node["c"]
        stripped = text.strip()
        if re.match(r"^\\appendix\b", stripped):
            self.book.appendix = True
            return []
        if "\\tableofcontents" in stripped:
            return ["#outline()", ""]
        if "\\listoffigures" in stripped or "\\listoftables" in stripped:
            return []
        if THEBIB_RX.search(stripped):
            return self.bibliography_block(stripped)
        if "\\bibliography{" in stripped:
            return []
        self.book.stats.note("unhandled_rawblock", stripped[:100])
        return ["#raw(block: true, lang: \"latex\", %s)" % _typst_str(stripped), ""]

    def b_code_block(self, node, indent):
        (_id, _cls, attrs), text = node["c"]
        lang = dict(attrs).get("caption", "") or dict(attrs).get("language", "")
        return ['#raw(block: true, lang: %s, %s)'
                % (_typst_str(lang), _typst_str(text.replace('"', "'"))), ""]

    def b_horiz_rule(self, node, indent):
        return ["#line(length: 100%, stroke: 0.6pt)", ""]

    def b_figure(self, node, indent):
        parts = node["c"]
        # Handle different pandoc versions: some produce 3-tuple, some 4-tuple
        if len(parts) == 4:
            (ident, _cls, _attrs), caption, body, _attr = parts
        elif len(parts) == 3:
            (ident, _cls, _attrs), caption, body = parts
        else:
            self.book.stats.note("figure_unexpected_structure", str(len(parts)))
            return ["#unconverted([figure])", ""]
        num = self._num(node, "fig", lambda: self._next_fig())
        if ident:
            self.book.register(ident, "fig", num, name="Figure")
        cap = " ".join(self.blocks(caption[1], indent)) if caption and caption[1] else ""
        content = self.figure_content(body, indent)
        lines = ["#figure(", "  " + content + ","]
        if cap:
            lines.append("  caption: [%s: %s]," % (self._fig_label(num), cap))
        lines.append(")" + (" <%s>" % ident if ident else ""))
        return [*lines, ""]

    def _next_fig(self):
        self.book.fig += 1
        return str(self.book.fig)

    def _fig_label(self, num):
        if self.book.pre.numberwithin_fig and self.book.sec[0]:
            return "Figure %s.%s" % (self.book.section_number(), num)
        return "Figure %s" % num

    def b_table(self, node, indent):
        (_id, _cls, _at), caption, cols, head, rows, foot = node["c"]
        num = self._num(node, "tab", lambda: self._next_tab())
        if _id:
            self.book.register(_id, "tab", num, name="Table")
        cap = " ".join(self.blocks(caption[1], indent)) if caption and caption[1] else ""
        grid = self.tabular(cols, head, foot, rows, indent)
        if not cap:
            return [grid, ""]
        return ["#figure(", "  " + grid + ",",
                "  caption: [Table %s: %s]," % (num, cap), ")", ""]

    def _next_tab(self):
        self.book.tab += 1
        return str(self.book.tab)

    # ---------------------------------------------------------------- pieces
    def strip_generated_head(self, body, prefix):
        blocks = list(body)
        if blocks and blocks[0]['t'] in ('Para', 'Plain'):
            first = dict(blocks[0])
            items = list(first['c'])
            first['c'] = items
            if items and items[0]['t'] in ('Strong', 'Emph'):
                text = ''.join(x.get('c', '') for x in items[0]['c'] if x['t'] == 'Str')
                if text.startswith(prefix):
                    items.pop(0)
                    if items and items[0]['t'] == 'Str' and items[0]['c'] == '.':
                        items.pop(0)
                    while items and items[0]['t'] in ('Space', 'SoftBreak'):
                        items.pop(0)
                    blocks[0] = first
        return blocks

    def theorem_block(self, node, env, ident, body):
        info = self.book.pre.theorem.get(env, {"name": env.capitalize(),
                                               "style": "theorem"})
        blocks = self.strip_generated_head(body, info['name'])
        if blocks and blocks[0]["t"] in ("Para", "Plain"):
            blocks[0] = dict(blocks[0])
            blocks[0]['c'] = list(blocks[0]['c'])
        extra = ""
        if blocks and blocks[0]["t"] in ("Para", "Plain"):
            extra = _pop_note_arg(blocks[0]["c"])
        shown = self._num(node, "thm", lambda: self.book.theorem_number(env))
        if ident:
            kind = ident.split(":")[0] if ":" in ident else env
            self.book.register(ident, kind, shown, name=info["name"])
        head = "%s %s%s." % (info["name"], shown,
                             (" (%s)" % extra) if extra else "")
        fn = "thm" if info["style"] == "theorem" else "prodef"
        inner = ["  " + l for l in self.blocks(blocks, 0) if l != ""]
        tag = (" <%s>" % ident) if ident else ""
        # Use positional args: #thm([head])[body]
        head_block = "#%s([%s])[" % (fn, _content(head))
        if inner:
            return [head_block, inner[0], *inner[1:], "]" + tag, ""]
        return [head_block + "]" + tag, ""]

    def display_equation(self, latex, indent, identity=None):
        env = _display_env(latex)
        label = _label_of(latex)
        tag = _tag_of(latex)
        numbered = (env in NUMBERED_ENVS and "*" not in env
                    and not tag and "\\notag" not in latex
                    and "\\nonumber" not in latex)
        raw_math = self.math_text(latex)
        # math_text() returns "$ content $" - strip the delimiters for embedding
        body_content = raw_math.strip()
        if body_content.startswith("$") and body_content.endswith("$"):
            body_content = body_content[1:-1].strip()
        body = _strip_trailing_label(body_content)
        holder = ("latex", identity if identity is not None else latex)
        num = self._num(holder, "eq",
                        lambda: self.book.equation_number() if numbered else (tag or ""))
        if label:
            self.book.register(label, "eq", num, name="Equation")
        suffix = (" <%s>" % label) if label else ""
        # In Typst, use $ ... $ directly; numbering is handled globally or baked as text
        if num:
            # Bake the number as literal text before the equation
            return ["$ %s quad %s $%s" % (_typst_str('(' + str(num) + ')'), body, suffix), ""]
        return ["$ %s $%s" % (body, suffix), ""]

    def math_text(self, latex):
        got = self.formulas.get(latex)
        if not got:
            self.book.stats.note("math_unconverted", latex[:100])
            # Quote the same cleaned LaTeX that was handed to pandoc, so the
            # residue shows the equation rather than its \begin{} envelope.
            return '$ ' + _typst_str(mathconv.clean(latex)) + ' $'
        if "$" not in got:
            got = "$ " + got + " $"
        return got

    def figure_content(self, body, indent):
        parts = []
        for node in body:
            t = node["t"]
            if t == "RawBlock":
                txt = node["c"][1].strip()
                self.book.stats.note("figure_content_unhandled", txt[:80])
                parts.append("#unconverted(%s)" % _typst_str(_one_line(txt)))
            elif t in ("Para", "Plain"):
                parts.append(self.inlines(node["c"]))
            elif t == "Figure":
                parts.append(self.figure_content(node["c"][2], indent))
            else:
                parts.extend(l for l in self.block(node, indent) if l)
        return "[" + "\n  ".join(p for p in parts if p) + "]"

    def tabular(self, cols, head, foot, rows, indent):
        header = [self.row_cells(r) for r in head[1]]
        body = []
        for attrs, rowheads, intermediate, content in rows:
            body.extend(self.row_cells(r) for r in intermediate + content)
        body.extend(self.row_cells(r) for r in foot[1])
        ncol = max(len(cols), 1)
        lines = ["table(", "  columns: %d," % ncol, "  inset: 4pt,"]
        if header:
            lines.append("  table.header(%s)," % ", ".join(c for r in header for c in r))
        for row in body:
            lines.append("  " + ", ".join(row) + ",")
        lines.append(")")
        return "\n".join(lines)

    def row_cells(self, row):
        out = []
        for attrs, align, rowspan, colspan, content in row[1]:
            txt = "\n".join(self.blocks(content, 0))
            out.append("table.cell(rowspan: %d, colspan: %d)[%s]" % (rowspan, colspan, txt))
        return out

    # ---------------------------------------------------------------- inline
    def inlines(self, items):
        return "".join(self.inline_parts_text(items))

    def inline_parts_text(self, items):
        out = []
        for node in items:
            t = node["t"]
            if t == "Str":
                out.append(esc(node["c"]))
            elif t in ("Space", "SoftBreak", "LineBreak"):
                out.append(" ")
            else:
                out.append(self.inline(node))
        return out

    def inline_parts(self, items):
        """Split block inlines into ('text'|'display', payload) parts."""
        buf, parts = [], []
        for node in items:
            if node["t"] == "Math" and node["c"][0]["t"] == "DisplayMath":
                if "".join(buf).strip():
                    parts.append(("text", "".join(buf).strip()))
                buf = []
                parts.append(("display", (id(node), node["c"][1])))
            else:
                buf.append(self.inline(node))
        if "".join(buf).strip():
            parts.append(("text", "".join(buf).strip()))
        return parts

    def inline(self, node):
        t = node["t"]
        c = node.get("c")
        if t == "Str":
            return esc(c)
        if t in ("Space", "SoftBreak", "LineBreak"):
            return " "
        simple = {"Emph": "emph", "Strong": "strong", "Strikeout": "strike",
                  "Superscript": "super", "Subscript": "sub",
                  "SmallCaps": "smallcaps", "Underline": "underline"}
        if t in simple:
            return "#%s[%s]" % (simple[t], self.inlines(c))
        if t == "Note":
            return "#footnote[%s]" % self.inlines(c)
        if t == "Quoted":
            kind, inner = c
            o, cl = ("‘", "’") if kind["t"] == "SingleQuote" else ("“", "”")
            return o + self.inlines(inner) + cl
        if t == "Cite":
            return self.cite(c)
        if t == "Link":
            (_id, _cls, attrs), inner, (url, _title) = c
            text = self.inlines(inner)
            ref = dict(attrs).get("reference")
            if url.startswith("#") or ref:
                return self.book.ref_text(ref or url[1:], text)
            if not text.strip():
                return "#link(%s)" % _typst_str(url)
            return '#link(%s)[%s]' % (_typst_str(url), text)
        if t == "Image":
            (_id, _cls, attrs), inner, (path, _title) = c
            alt = self.inlines(inner)
            width = dict(attrs).get("width")
            if width and ('linewidth' in width or 'textwidth' in width):
                match = re.match(r'([0-9.]+)', width)
                width = '%s%%' % (float(match.group(1)) * 100 if match else 100)
            extra = ", width: %s" % width if width else ", width: 90%"
            return '#image("fig/%s"%s%s)' % (_basename(path), extra,
                                            (", alt: [%s]" % alt) if alt else "")
        if t == "Math":
            kind, latex = c
            if kind['t'] == 'DisplayMath':
                return '\n' + '\n'.join(self.display_equation(latex, 0, identity=id(node))) + '\n'
            return self.math_text(latex)
        if t == "RawInline":
            return self.raw_inline(c[1])
        if t == "Span":
            (ident, classes, attrs), inner = c
            body = self.inlines(inner)
            style = dict(attrs)
            if "color" in style:
                return '#text(fill: %s)[%s]' % (style["color"], body)
            if classes and classes[0] in ("underline", "ul", "u"):
                return "#underline[%s]" % body
            return body
        self.book.stats.note("unhandled_inline:" + t, str(c)[:60])
        return ""

    def raw_inline(self, text):
        t = text.strip()
        if t in ("\\%", "\\&", "\\_", "\\#", "\\{", "\\}", "\\$"):
            return "\\" + t[1]
        m = re.match(r"\\textcolor\{([^}]*)\}\{(.*)\}$", t, re.S)
        if m:
            return "#text(fill: %s)[%s]" % (_color(m.group(1)), _content(esc(m.group(2))))
        if re.fullmatch(r"\\[a-zA-Z*]+", t):
            self.book.stats.note("unhandled_rawinline", t)
            return esc(t)
        self.book.stats.note("unhandled_rawinline", t[:60])
        return esc(t)

    def cite(self, c):
        cites, _inlines = c
        keys = [x["citationId"] for x in cites]
        suffix = ""
        if cites[0]["citationSuffix"]:
            suffix = " " + self.inlines(cites[0]["citationSuffix"])
        if self.book.pre.baked_bib:
            nums = [self.book.bibnumbers.get(k) for k in keys]
            if None in nums:
                self.book.stats.note("missing_bibkey", keys[0])
                return esc('[' + ', '.join(keys) + ']') + suffix
            return "[%s]" % ",".join(str(n) for n in nums) + suffix
        form = ', form: "prose"' if cites[0]["citationMode"]["t"] == "AuthorInText" else ''
        output = []
        for key in keys:
            if key not in getattr(self.book.pre, 'bib_keys', set()):
                self.book.stats.note('missing_bibkey', key)
                output.append(esc('[' + key + ']'))
            else:
                output.append('#cite(label(%s)%s)' % (_typst_str(key), form))
        return ' '.join(output) + suffix

    def bibliography_block(self, latex):
        m = THEBIB_RX.search(latex)
        body = m.group(1)
        body = body[:body.rindex("\\end{thebibliography}")] \
            if "\\end{thebibliography}" in body else body
        items = []
        for bm in BIBITEM_RX.finditer(body):
            start = bm.end()
            nxt = body.find("\\bibitem", start)
            items.append((bm.group(1), body[start:nxt if nxt > 0 else len(body)]))
        converted = mathconv.convert_prose_batch([x[1] for x in items])
        for n, (key, _src) in enumerate(items, start=1):
            self.book.bibnumbers[key] = n
        if self.dry:
            return []
        lines = []
        for n, (key, src) in enumerate(items, start=1):
            text = converted.get(n - 1, esc(src)).strip()
            lines.append("#bibitem([%d])[%s]" % (n, text))
        lines.append("")
        return lines

    def lookup(self, label):
        return self.book.labels.get(label)


def _color(name):
    named = {"red": "ff0000", "blue": "0000ff", "green": "008000",
             "orange": "ffa500", "violet": "ee82ee", "purple": "800080",
             "teal": "008080", "cyan": "00ffff", "magenta": "ff00ff",
             "yellow": "ffff00", "brown": "a52a2a", "lime": "00ff00",
             "olive": "808000", "black": "000000", "white": "ffffff",
             "gray": "808080", "darkgray": "404040", "lightgray": "d3d3d3",
             "navy": "000080"}
    return "rgb(\"%s\")" % named.get(name.strip().lower(), "000000")
