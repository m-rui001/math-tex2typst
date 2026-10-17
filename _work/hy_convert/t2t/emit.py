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

from . import cetz
from . import mathconv
from . import prep

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
        self.anchors = set()
        self.anchor = None
        self.bibnumbers = {}
        self.aux = {key: {"kind": "aux", "shown": number, "name": ""}
                    for key, number in preamble.aux_labels.items() if number}

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
        entry = {"kind": kind, "shown": shown, "name": name or kind}
        # the counter is stepped whether or not this node carries the name, so a float
        # wrapped in a Div still leaves its number for that wrapper to claim
        self.anchor = entry
        if label:
            self.labels[label] = entry

    def anchor_label(self, label):
        r"""A \label pandoc detached from its block takes the counter TeX was on.

        \phantomsection\label{...} and a second \label on one environment reach us as an
        empty Span. In LaTeX such a label numbers itself from the last stepped counter,
        which is the one that registered most recently, or the section it sits in.
        """
        entry = self.anchor
        if entry is None and self.sec[0]:
            entry = {"kind": "sec", "shown": self.section_number(), "name": "Section"}
        if entry is not None:
            self.labels[label] = dict(entry)

    def anchor_target(self, label):
        r"""Bind a name that carries no number, the way \hypertarget does in LaTeX.

        The catalogue pages place a target at each subject heading and link to it from
        the table of contents. Such a name is a place, not a count, so it gets a table
        entry of its own: a reference to a name that was never placed still reads as
        dangling, instead of linking quietly to nothing.
        """
        if label and label not in self.labels:
            self.labels[label] = {"kind": "anchor", "shown": "", "name": ""}
            self.anchors.add(label)

    def ref_text(self, label, literal, named=True, before=""):
        """Baked reference text, LaTeX-style."""
        parts = [p.strip() for p in re.split(r"[,;]", label) if p.strip()] if label else []
        if len(parts) > 1:
            # \ref{a,b} names several targets; LaTeX prints every number
            return ", ".join(self.ref_text(p, "") for p in parts)
        entry = self.labels.get(label) or self.aux.get(label)
        if entry is None:
            self.stats.note("dangling_ref", label or literal[:40])
            # an unresolved name has to read as unresolved: pandoc leaves its own bracket here,
            # and a page showing `\[fig:chords\]` is leftover TeX rather than a broken reference
            if literal.strip() in ("", "[%s]" % label, esc("[%s]" % label)):
                return "[??]"
            return literal
        kind, shown, name = entry["kind"], entry["shown"], entry["name"]
        if kind == "anchor":
            # the name is a place to jump to, so the link's own words stand and no number appears
            return "#link(<%s>)[%s]" % (label, literal.strip())
        if kind == "eq":
            maths = mathconv.tag_maths(shown)
            if maths:
                # pdflatex answers \eqref of a tagged display with the tag itself, parentheses and
                # all, and here the tag is a formula: it stays maths rather than quoted TeX
                return "$(%s)$" % maths
            shown = str(shown)
            for tex, glyph in mathconv.TAG_SYMBOL.items():
                shown = shown.replace(tex, glyph)
            shown = shown.replace("$", "")
            # a \label inside \[ \] has no number to quote even in LaTeX, which prints ?? for
            # it; the bracketed name pandoc left behind is not something a reader can use
            if shown:
                return esc("(%s)" % shown)
            self.stats.note("dangling_ref", "%s (no-number)" % label)
            return "[??]"
        bare = literal.strip() in ("[%s]" % label, esc("[%s]" % label), "")
        if not bare and literal.strip():
            return literal.strip()
        if name or shown:
            # the counter's own word is added only when nothing in front of the reference names it:
            # LaTeX's \ref answers with the number alone, and 'Section~' is the author's own text
            if name and named and not names_counter(before, name):
                return "%s %s" % (name, shown)
            return shown or "[??]"
        # the target is in the book but carries nothing to print, which reads on the page exactly
        # like an unresolved name; the ledger has to be able to tell the two apart
        self.stats.note("dangling_ref", "%s (no-number)" % label)
        return "[??]"

    def bare_ref(self, label):
        r"""A reference written inside a picture: LaTeX's \ref answers with the number alone.

        The word in front of it -- 'Section~\ref{sec:a}' -- is the author's own and already sits in
        the node text, so a name from the counter would reach the page twice.
        """
        return self.ref_text(label, "", named=False)

    def page_ref(self, label):
        r"""Resolve a \\pageref the only way it can be resolved here: by Typst, at compile time.

        LaTeX printed the page a label fell on, but our pages are broken by Typst and no
        number survives from the TeX run, so the reading is left to the renderer: this asks
        the page counter for the page carrying that tag. Typst rejects a reference to a
        name no block was tagged with, so an entry baked from a .aux file, which counts
        TeX's pages, and a name that was never placed cannot be answered and read as
        dangling.
        """
        if label in self.labels:
            return "#context counter(page).at(<%s>).first()" % label
        self.stats.note("dangling_ref", label)
        return ""

    def math_refs(self):
        """label -> (number, name) for every reference a formula might quote."""
        got = {k: (v["shown"], v["name"]) for k, v in self.aux.items()}
        got.update({k: (v["shown"], v["name"]) for k, v in self.labels.items()})
        got.update({k: (n, "") for k, n in self.bibnumbers.items()})
        return got


def names_counter(before, name):
    """True when the words already written carry the counter's own name, plural or not."""
    # '(Section ' names the counter just as much as 'Section ' does, so the word is read off the
    # end of the text rather than split out of it
    m = re.search(r"[A-Za-z]+$", before.rstrip())
    if not m:
        return False
    stem = lambda w: re.sub(r"s$", "", w.lower())
    return stem(m.group(0)) == stem(name)


def _snake(name):
    return re.sub(r"(?<!^)(?=[A-Z])", "_", name).lower()


def _display_env(latex):
    m = re.search(r"\\begin\{([a-zA-Z*]+)\}", latex)
    if m:
        return m.group(1)
    return "displaymath" if latex.strip().startswith("\\[") else "math"


def _labels_of(latex):
    return re.findall(r"\\label\{([^}]*)\}", latex)


def _tag_of(latex):
    m = re.search(r"\\tag(?![a-zA-Z])\s*", latex)
    if not m or latex[m.end():m.end() + 1] != "{":
        return ""
    # the tag is read by brace matching, not by a pattern with a fixed nesting depth: a tag that
    # carries its own maths, `\tag{\(\ast_{\mathrm{adj}}\)}`, has two levels and is exactly the
    # case LaTeX answers an \eqref with
    inner, _end = cetz.bracketed(latex, m.end())
    return inner or ""


# a matrix's own `\\` rows are not rows of the enclosing align
NESTED_MATH = re.compile(r"\\begin\{(matrix|pmatrix|bmatrix|vmatrix|Vmatrix|smallmatrix|"
                         r"array|aligned|gathered|cases|rcases|subarray)\}.*?\\end\{\1\}", re.S)
ROW_TAG = re.compile(r"\\(?:notag|nonumber)\b")


def _all_rows_tagged(latex):
    r"""Whether a display suppresses its number: `\notag` cancels its own row, not the display.

    pdflatex on a three-row `align` numbered every case where one row was left untagged, and set
    the number on the first untagged row; only an `align` with `\notag` on every row printed no
    number at all. So the display is unnumbered exactly when each of its rows is tagged.
    """
    rows = [r for r in re.split(r"\\\\", NESTED_MATH.sub("", latex)) if r.strip()]
    return bool(rows) and all(ROW_TAG.search(r) for r in rows)


def _strip_trailing_label(math_text):
    return re.sub(r"\s*<[A-Za-z0-9_:.\-]+>\s*$", "", math_text).strip()


def _typst_str(text):
    return json.dumps(text, ensure_ascii=False)


def quoted_source(tex):
    r"""LaTeX we cannot carry over, written out rather than dropped.

    A block pandoc handed us raw, or a picture the CeTz gate refused, still holds content the
    paper claims; the same fallback keeps it readable and counts it as residue instead of
    leaving the reader an empty figure.
    """
    return '#raw(block: true, lang: "latex", %s)' % _typst_str(tex.strip())


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

    def b_definition_list(self, node, indent):
        r"""A description list: the term set bold, its body kept under it.

        pandoc reads `\begin{description}` as a DefinitionList, and an item's body can hold a whole
        display equation. With no handler the list and its equations left the page together, and a
        `\ref` into one of them had nothing to point at.
        """
        out = []
        for term, groups in node["c"]:
            head = self.inlines(term).strip()
            body = [l for blocks in groups for l in self.blocks(blocks, indent + 1)
                    if l != ""]
            if head:
                head = "*%s*" % head
            if body:
                out.append((head + " " + body[0]) if head else body[0])
                out.extend("  " + l for l in body[1:])
            elif head:
                out.append(head)
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
        if ident and not cls and not body:
            self.book.anchor_target(ident)
            if ident not in self.book.anchors:
                # the name already numbers a block elsewhere; that block's own tag is the target
                return []
            return [] if self.dry else ['#label("%s")' % ident, ""]
        if cls in self.book.pre.theorem:
            return self.theorem_block(node, cls, ident, body)
        if cls == "proof":
            return self._wrap("proof", self.blocks(self.strip_generated_head(body, 'Proof'), indent + 1), ident)
        if cls == "abstract":
            return self._wrap("paperabstract", self.blocks(body, indent + 1), ident)
        if cls in ("center", "flushleft", "flushright", "quote", "",
                   "longtable", "landscape", "label"):
            return self.carried_label(ident, body, indent)
        if cls and any(k.startswith("tabular") for k in classes):
            return self.carried_label(ident, body, indent)
        if cls:
            self.book.stats.note("unhandled_div_class:" + cls, ident)
        return self.carried_label(ident, body, indent)

    def carried_label(self, ident, body, indent):
        r"""Bind a name pandoc put on the wrapper rather than on the float it holds.

        \caption{...}\label{tab:x} leaves the Table anonymous and labels the enclosing Div,
        so the number belongs to the child but the key to the parent: emit the child, then
        give this Div's ident whatever entry it registered.
        """
        before = self.book.anchor
        out, got = [], None
        for node in body:
            out.extend(self.block(node, indent))
            # the float's own number is the first one its contents step to; a display
            # later in the same wrapper has already moved on
            if got is None and self.book.anchor is not before:
                got = self.book.anchor
        if ident and got is not None:
            self.book.anchor_label(ident)
        return out

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
        return [quoted_source(stripped), ""]

    def b_code_block(self, node, indent):
        (_id, _cls, attrs), text = node["c"]
        lang = dict(attrs).get("caption", "") or dict(attrs).get("language", "")
        return ['#raw(block: true, lang: %s, %s)'
                % (_typst_str(lang), _typst_str(text.replace('"', "'"))), ""]

    def b_horizontal_rule(self, node, indent):
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
        labels = _labels_of(latex)
        label = labels[0] if labels else ""
        # \tag{\ref{eq:x}} borrows another equation's number, written here as text
        tag = mathconv.tag_text(_tag_of(latex), self.book.math_refs())
        numbered = (env in NUMBERED_ENVS and "*" not in env
                    and not tag and not _all_rows_tagged(latex))
        raw_math = self.math_text(latex)
        # math_text() returns "$ content $" - strip the delimiters for embedding
        body_content = raw_math.strip()
        if body_content.startswith("$") and body_content.endswith("$"):
            body_content = body_content[1:-1].strip()
        body = _strip_trailing_label(body_content)
        holder = ("latex", identity if identity is not None else latex)
        num = self._num(holder, "eq",
                        lambda: self.book.equation_number() if numbered else (tag or ""))
        for name in labels:
            # an align line keeps its own \label; every one of them numbers from this display
            self.book.register(name, "eq", num, name="Equation")
        suffix = (" <%s>" % label) if label else ""
        if body.startswith("#cetz.canvas"):
            # a drawing is markup, not math: the number is plain text on the line above
            return ([_content("(%s)" % num)] if num else []) + [body, ""]
        # In Typst, use $ ... $ directly; numbering is handled globally or baked as text
        if num:
            # The number belongs to the right of the equation, as LaTeX sets it: the body
            # first, then the baked number, so the line reads equation ... (12). A tag that is a
            # formula stays maths -- inside this `$ ... $` its own delimiters would close it.
            maths = mathconv.tag_maths(num)
            shown = "(%s)" % maths if maths else _typst_str("(%s)" % num)
            return ["$ %s quad %s $%s" % (body, shown, suffix), ""]
        return ["$ %s $%s" % (body, suffix), ""]

    def math_text(self, latex):
        if self.dry:
            # the numbering pass needs labels and counters only; converting a body
            # here would cost a TikZ compile per formula for output nobody reads
            return ""
        got = self.formulas.get(latex)
        # a picture is a drawing, not a formula: the batch conversion has already turned
        # it into a quoted string, so a canvas is tried even when that one succeeded
        if cetz.PICTURE.search(latex):
            canvas = cetz.convert(latex, refs=self.book.bare_ref)
            if canvas:
                self.book.stats.note("cetz_converted", 1)
                return canvas
            # the display carries an equation next to the diagram: draw the picture,
            # then the rest, instead of quoting the whole pair as LaTeX
            got_split = cetz.split(latex, self.book.bare_ref)
            if got_split:
                self.book.stats.note("cetz_split", 1)
                canvas, other = got_split
                return canvas + "\n" + self.math_text(other)
        if got:
            return got if "$" in got else "$ " + got + " $"
        # a formula the batch never carried gets its own pandoc call before we fall
        # back to quoting LaTeX, so one held-back item does not decide its own shape
        fresh = mathconv.convert_formulas([latex], self.book.math_refs())[0].get(0)
        if fresh:
            return fresh if "$" in fresh else "$ " + fresh + " $"
        self.book.stats.note("math_unconverted", latex[:100])
        # Quote the same cleaned LaTeX that was handed to pandoc, so the
        # residue shows the equation rather than its \begin{} envelope.
        return '$ ' + _typst_str(mathconv.clean(latex, self.book.math_refs())) + ' $'

    def figure_content(self, body, indent):
        parts = []
        for node in body:
            t = node["t"]
            if t == "RawBlock":
                txt = node["c"][1].strip()
                self.book.stats.note("figure_content_unhandled", txt[:80])
                parts.append(quoted_source(txt))
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
                out.append(self.inline(node, "".join(out)))
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
                buf.append(self.inline(node, "".join(buf)))
        if "".join(buf).strip():
            parts.append(("text", "".join(buf).strip()))
        return parts

    def inline(self, node, before=""):
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
            if url.startswith("pageref:"):
                return self.book.page_ref(url[len("pageref:"):])
            if url.startswith("#") or ref:
                return self.book.ref_text(ref or url[1:], text, before=before)
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
            if style.get("label"):
                self.book.anchor_label(style["label"])
                return body
            if "color" in style:
                return '#text(fill: %s)[%s]' % (style["color"], body)
            if classes and classes[0] in ("underline", "ul", "u"):
                return "#underline[%s]" % body
            return body
        if t == "Code":
            # \verb|x+1| arrives as (attributes, text); a string literal keeps its markup inert
            return "#raw(%s)" % _typst_str(c[1])
        if t in ("Para", "Plain"):
            # a whole paragraph inside a table cell or a caption: keep its text
            return self.inlines(c)
        self.book.stats.note("unhandled_inline:" + t, str(c)[:60])
        return ""

    def raw_inline(self, text):
        # pandoc expands a macro we refused as unsafe, so its TeX can reach us here rather
        # than through the body; the same dialect pass clears page plumbing out of it
        t = prep.fix_dialect_prose(text).strip()
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
            # a key the bibliography never defines prints as ? the way LaTeX does it, and only
            # that key: the others keep the numbers they were given
            nums = [self.book.bibnumbers.get(k) for k in keys]
            for key, n in zip(keys, nums):
                if n is None:
                    self.book.stats.note("missing_bibkey", key)
            return "[%s]" % ",".join("?" if n is None else str(n) for n in nums) + suffix
        form = ', form: "prose"' if cites[0]["citationMode"]["t"] == "AuthorInText" else ''
        output = []
        for key in keys:
            if key not in getattr(self.book.pre, 'bib_keys', set()):
                self.book.stats.note('missing_bibkey', key)
                output.append(esc('[?]'))
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
