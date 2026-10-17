"""Translate the TikZ subset used by these papers into CeTz canvases.

Returns None for pictures outside the supported subset so callers keep their
existing fallback instead of emitting a broken canvas.
"""

import math
import pathlib
import re

HEADER = '#import "@preview/cetz:0.5.0"\n'

RGB = {
    "black": (0, 0, 0), "white": (255, 255, 255), "red": (255, 0, 0),
    "green": (0, 128, 0), "blue": (0, 0, 255), "gray": (128, 128, 128),
    "grey": (128, 128, 128), "yellow": (255, 255, 0), "orange": (255, 165, 0),
    "purple": (128, 0, 128), "brown": (165, 42, 42), "pink": (255, 192, 203),
    "cyan": (0, 255, 255), "magenta": (255, 0, 255),
    "lightgray": (192, 192, 192), "lightgrey": (192, 192, 192),
    "darkgray": (64, 64, 64), "darkgrey": (64, 64, 64),
}

UNSUPPORTED = re.compile(
    r"\\(foreach|pgfmathsetmacro|pgfmathtruncatemacro|pgfplotsset|addplot|legend|axis|shade|"
    r"pattern|clip|useasboundingbox|def|newcommand|let|plot|parabola|grid)\b")

# a TikZ transform: (x scale, y scale, x shift, y shift); axis-aligned only
IDENT = (1.0, 1.0, 0.0, 0.0)

UNITS = {"cm": 1.0, "mm": 0.1, "in": 2.54, "pt": 1 / 28.3465, "bp": 1 / 72 * 2.54}
CONSTS = dict(UNITS, pi=math.pi, e=math.e)
FUNCS = {
    "cos": lambda d: math.cos(math.radians(d)), "sin": lambda d: math.sin(math.radians(d)),
    "tan": lambda d: math.tan(math.radians(d)), "cot": lambda d: 1 / math.tan(math.radians(d)),
    "asin": lambda x: math.degrees(math.asin(x)), "acos": lambda x: math.degrees(math.acos(x)),
    "atan": lambda x: math.degrees(math.atan(x)), "atan2": lambda y, x: math.degrees(math.atan2(y, x)),
    "sqrt": math.sqrt, "abs": abs, "exp": math.exp, "ln": math.log, "log10": math.log10,
    "round": lambda x: float(round(x)), "int": lambda x: float(int(x)),
    "min": min, "max": max, "pow": lambda a, b: a ** b, "mod": lambda a, b: a % b,
}
TOKEN_RX = re.compile(r"\s*(?:(\d+\.?\d*|\.\d+)|([A-Za-z]+)|([-+*/^,()]))")


def _tokenize(text):
    """pgfmath-ish tokens, or None on anything we cannot account for."""
    out, i = [], 0
    while i < len(text):
        if text[i] in "{} \t\n":
            i += 1
            continue
        m = TOKEN_RX.match(text, i)
        if not m:
            return None
        num, name, op = m.groups()
        out.append(("num", float(num)) if num else ("name", name) if name else ("op", op))
        i = m.end()
    return out


def _add(toks, i):
    val, i = _mul(toks, i)
    while i < len(toks) and toks[i][0] == "op" and toks[i][1] in "+-":
        op = toks[i][1]
        rhs, i = _mul(toks, i + 1)
        val = val + rhs if op == "+" else val - rhs
    return val, i


def _mul(toks, i):
    val, i = _unary(toks, i)
    while i < len(toks) and toks[i][0] == "op" and toks[i][1] in "*/":
        op = toks[i][1]
        rhs, i = _unary(toks, i + 1)
        if op == "/" and rhs == 0:
            raise ZeroDivisionError
        val = val * rhs if op == "*" else val / rhs
    return val, i


def _unary(toks, i):
    if i < len(toks) and toks[i][0] == "op" and toks[i][1] in "+-":
        op = toks[i][1]
        val, i = _unary(toks, i + 1)
        return (-val if op == "-" else val), i
    return _pow(toks, i)


def _pow(toks, i):
    base, i = _atom(toks, i)
    if i < len(toks) and toks[i] == ("op", "^"):
        exp, i = _unary(toks, i + 1)
        return base ** exp, i
    return base, i


def _atom(toks, i):
    if i >= len(toks):
        raise ValueError("end of expression")
    kind, val = toks[i]
    if kind == "op" and val == "(":
        out, i = _add(toks, i + 1)
        if i >= len(toks) or toks[i] != ("op", ")"):
            raise ValueError("unclosed (")
        return out, i + 1
    if kind == "num":
        # TikZ dimensions write the unit directly after the number ("2cm", "1.5pt")
        if i + 1 < len(toks) and toks[i + 1][0] == "name" and toks[i + 1][1] in UNITS:
            return val * UNITS[toks[i + 1][1]], i + 2
        return val, i + 1
    if kind == "name":
        if i + 1 < len(toks) and toks[i + 1] == ("op", "("):
            fn = FUNCS.get(val)
            if fn is None:
                raise ValueError("unknown function " + val)
            args, i = [], i + 2
            while True:
                arg, i = _add(toks, i)
                args.append(arg)
                if i < len(toks) and toks[i] == ("op", ","):
                    i += 1
                    continue
                break
            if i >= len(toks) or toks[i] != ("op", ")"):
                raise ValueError("unclosed call")
            return float(fn(*args)), i + 1
        if val in CONSTS:
            return CONSTS[val], i + 1
        raise ValueError("unknown name " + val)
    raise ValueError("unexpected " + val)


def expr(text):
    """Evaluate a pgfmath expression in cm; None when it is not pure arithmetic."""
    toks = _tokenize(text)
    if not toks:
        return None
    try:
        val, i = _add(toks, 0)
    except (ValueError, ZeroDivisionError, OverflowError, TypeError):
        return None
    if i != len(toks) or val is None:
        return None
    return val


def split_top(text, sep):
    """Split on `sep` outside braces and parens."""
    out, buf, depth, i = [], [], 0, 0
    while i < len(text):
        c = text[i]
        if c in "{[(":
            depth += 1
        elif c in "}])":
            depth -= 1
        if c == sep and depth == 0:
            out.append("".join(buf))
            buf = []
        else:
            buf.append(c)
        i += 1
    out.append("".join(buf))
    return out


def paren_span(text, i):
    """Index just past the ')' matching the '(' at i, or None."""
    depth, j = 0, i
    while j < len(text):
        c = text[j]
        if c == "\\" and text[j:j + 2] in ("\\(", "\\)"):
            j += 2
            continue
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0:
                return j + 1
        elif c == "{":
            j = bracketed(text, j)[1]
            continue
        j += 1
    return None


def fmt(x, y):
    return "(%.4g, %.4g)" % (x, y)


def _rgb(triple):
    return 'rgb("#%02x%02x%02x")' % triple


def color(spec, pal=None):
    """A TikZ color -> a Typst color, or None when we do not know what it is.

    'name!percent' is that share of the color mixed with white; names come from
    the picture's own \\definecolor declarations first.
    """
    base, _, pct = spec.strip().partition("!")
    triple = (pal or {}).get(base) or RGB.get(base)
    if triple is None:
        return None
    if not pct:
        return _rgb(triple)
    if not re.fullmatch(r"\d+", pct):
        return None
    share = int(pct) / 100.0
    return _rgb(tuple(round(c * share + 255 * (1 - share)) for c in triple))


def opts(text):
    out = {}
    for part in re.split(r",(?![^(){}]*\))", text or ""):
        part = part.strip()
        if not part:
            continue
        key, _, val = part.partition("=")
        out[key.strip()] = val.strip() if _ else True
    return out


def color_option(o, pal, keys=("color", "draw"), bare=True):
    r"""The colour an option group selects, however the paper wrote it.

    TikZ accepts a colour as a value ('draw=red') and as a bare key ('[red]').
    A bare key colours the statement's own action -- it is the fill of a 'fill'
    and the stroke of a '\draw', never both -- so 'bare' says which of the two
    spellings this lookup is for.
    """
    for key in keys:
        val = o.get(key)
        if isinstance(val, str):
            return color(val, pal)
    if not bare:
        return None
    for key, val in o.items():
        if val is True:
            c = color(key, pal)
            if c:
                return c
    return None


def stroke_args(o, pal=None, bare=True):
    """One CeTz 'stroke:' argument for a TikZ option group.

    Paint, thickness and dash share a single dictionary: Typst rejects a call
    that names the same argument twice.
    """
    paint = color_option(o, pal, bare=bare)
    thickness = None
    width = o.get("line width")
    if isinstance(width, str):
        m = re.fullmatch(r"([\d.]+)\s*(pt|mm|cm)", width)
        if m:
            thickness = "%spt" % (float(m.group(1))
                                  * {"pt": 1, "mm": 2.8346, "cm": 28.346}[m.group(2)])
    dash = "dashed" if o.get("dashed") is True else (
        "dotted" if o.get("dotted") is True else None)
    parts = []
    if paint:
        parts.append("paint: " + paint)
    if thickness is not None:
        parts.append("thickness: " + thickness)
    if dash:
        parts.append('dash: "%s"' % dash)
    return ["stroke: (%s)" % ", ".join(parts)] if parts else []


ANCHORED = re.compile(r"([-\w]+)(?:\s*\.\s*[-\w ]+)?")
NODE_DEF = re.compile(r"\\(?:node|coordinate)\b\s*")
# positioning-library syntax: 'below=2cm of a', 'below of=a'
POSITIONED = re.compile(r"\bof\b\s*=?\s*[-\w]")
# (a -| b): the x of b with the y of a; (a |- b): the x of a with the y of b
INTERSECT = re.compile(r"^(.+?)\s*(-\||\|-)\s*(.+)$", re.S)


def point(token, cursor, names=None, xf=IDENT):
    """Resolve a TikZ coordinate token to an (x, y) tuple in cm, or None.

    names maps a node/coordinate name to an (x, y) tuple; an anchor suffix such
    as ``.north east`` resolves to that point, since node sizes are unknown.
    xf is the enclosing transform: it scales and shifts literal and polar
    coordinates, while named points already carry it and relative deltas take
    only its scales.
    """
    token = token.strip()
    m = re.match(r"\+\+?\s*(?=\()", token)
    relative = bool(m)
    if relative:
        token = token[m.end():].lstrip()
    if not token.startswith("("):
        return None
    end = paren_span(token, 0)
    if end is None or token[end:].strip():
        return None
    inner = token[1:end - 1]
    parts = split_top(inner, ",")
    got = None
    if len(parts) == 2:
        x, y = expr(parts[0]), expr(parts[1])
        if x is not None and y is not None:
            got = (x, y)
    elif len(parts) == 1:
        one = inner.strip()
        both = INTERSECT.match(one)
        if both:
            a = point("(" + both.group(1).strip() + ")", cursor, names, xf)
            b = point("(" + both.group(3).strip() + ")", cursor, names, xf)
            if a is None or b is None:
                return None
            # both sides already carry xf, so the pair is an absolute point
            return (b[0], a[1]) if both.group(2) == "-|" else (a[0], b[1])
        if one.startswith("["):
            return _shifted_point(one, cursor, names, xf)
        m2 = ANCHORED.fullmatch(one)
        if m2 and names and m2.group(1) in names:
            return names[m2.group(1)]
        polar = split_top(one, ":")
        if len(polar) == 2:
            deg, r = expr(polar[0]), expr(polar[1])
            if deg is not None and r is not None:
                a = math.radians(deg)
                got = (r * math.cos(a), r * math.sin(a))
    if got is None:
        return None
    sx, sy, dx, dy = xf
    if relative:
        if cursor is None:
            return None
        return (cursor[0] + got[0] * sx, cursor[1] + got[1] * sy)
    return (got[0] * sx + dx, got[1] * sy + dy)


def _shifted_point(one, cursor, names, xf):
    """``([yshift=2pt]a.west)``: a coordinate carrying its own absolute shift."""
    inner, end = bracketed(one, 0)
    if inner is None or end >= len(one):
        return None
    t = _transform(opts(inner), xf)
    if t is None or (t[0], t[1]) != (1.0, 1.0):
        return None
    rest = one[end:].strip()
    at = point(rest if rest.startswith("(") else "(" + rest + ")", cursor, names, xf)
    if at is None:
        return None
    return (at[0] + t[2], at[1] + t[3])


def register(stmt, names, xf=IDENT):
    """Remember the named points a statement defines, for later references."""
    m = NODE_DEF.match(stmt)
    if not m:
        return
    o, pos = _opts_at(stmt, m.end())
    if o is None:
        return
    head = _node_at(stmt[pos:], names, xf, o)
    if head and head[0]:
        names[head[0]] = head[1]


def split_statements(body):
    out, depth, cur = [], 0, []
    for ch in body:
        if ch in "{[(":
            depth += 1
        elif ch in "}])":
            depth -= 1
        if ch == ";" and depth == 0:
            out.append("".join(cur).strip())
            cur = []
        else:
            cur.append(ch)
    tail = "".join(cur).strip()
    if tail:
        out.append(tail)
    return [s for s in out if s and not s.startswith("%")]


def bracketed(text, start):
    """Return (inner, end_index) for the {...} or [...] group opening at start."""
    opener = text[start]
    closer = "}" if opener == "{" else "]"
    depth = 0
    for i in range(start, len(text)):
        if text[i] == opener:
            depth += 1
        elif text[i] == closer:
            depth -= 1
            if depth == 0:
                return text[start + 1:i], i + 1
    return None, start + 1


MATH_SYMBOLS = {
    r"\cdots": "dots.h", r"\ldots": "dots.h", r"\dots": "dots.h",
    r"\to": "arrow.r", r"\rightarrow": "arrow.r", r"\leftarrow": "arrow.l",
    r"\leq": "lt.eq", r"\le": "lt.eq", r"\geq": "gt.eq", r"\ge": "gt.eq",
    r"\times": "times", r"\cdot": "dot.op", r"\infty": "infinity",
    r"\alpha": "alpha", r"\beta": "beta", r"\gamma": "gamma",
    r"\lambda": "lambda", r"\mu": "mu", r"\sigma": "sigma",
    r"\varepsilon": "epsilon", r"\epsilon": "epsilon", r"\delta": "delta",
    r"\Delta": "Delta", r"\Omega": "Omega", r"\omega": "omega",
    r"\pi": "pi", r"\tau": "tau", r"\theta": "theta", r"\phi": "phi",
    r"\varphi": "phi", r"\rho": "rho", r"\eta": "eta", r"\kappa": "kappa",
    r"\quad": " ", r"\qquad": " ", r"\,": " ", r"\;": " ", r"\!": "",
}


ALLOWED_WORDS = {"infinity"}
for _v in MATH_SYMBOLS.values():
    ALLOWED_WORDS.update(_v.split("."))


def quote_words(tex):
    def rep(m):
        w = m.group(0)
        # Typst reads 'eq0' or 'kappakappa' as one identifier, so a name may only
        # stay bare when nothing alphanumeric touches it.
        around = tex[m.start() - 1:m.start()] + tex[m.end():m.end() + 1]
        if w in ALLOWED_WORDS and not re.search(r"[A-Za-z0-9]", around):
            return w
        return '"%s"' % w
    return re.sub(r"[A-Za-z]{2,}", rep, tex)


def math_safe(tex):
    """True when a Typst math string cannot trip the parser.

    Typst rejects a '#' in math, a nested '$', and a '_' or '^' with no base to
    attach to -- which is what a stripped LaTeX macro leaves behind. '/*' and
    '//' are comments and a letter fused to a digit is an unknown identifier.
    """
    if "#" in tex or "$" in tex:
        return False
    if re.search(r"(?:^|[^A-Za-z0-9\"}\)\]])[\^_]", tex):
        return False
    if re.search(r"[\^_](?:[\^_]|$)", tex):
        return False
    if re.search(r"\*/|/\*|//|[A-Za-z][0-9]", tex):
        return False
    return tex[:1] != "/" and tex[-1:] != "/"


def _math_body(tex):
    r"""One '$...$' span -> Typst math, or quoted text when the mapping is unsafe.

    Falling back to a string keeps the label readable; the alternative is losing
    the whole picture at the compile gate.
    """
    for src, dst in MATH_SYMBOLS.items():
        tex = tex.replace(src, dst)
    tex = re.sub(r"\\[a-zA-Z]+", "", tex)
    tex = tex.replace("{}", "").replace('"', "")
    while tex[:1] in ("_", "^"):
        tex = tex[1:]
    while tex[-1:] in ("_", "^"):
        tex = tex[:-1]
    tex = quote_words(tex.strip())
    if math_safe(tex):
        return tex
    return '"%s"' % re.sub(r"[\"$\\]", "", tex.strip())


LINEBREAK = re.compile(r"\\\\\s*(?:\[[^\]]*\])?")


def _markup_text(chunk):
    r"""TikZ prose -> Typst markup: commands go, every markup special is escaped.

    Typst reads '_', '*', '()', '<x>', '%' and '//' as syntax inside '[...]',
    so node text that merely looks like maths has to escape all of them.
    """
    chunk = re.sub(r"\\[a-zA-Z]+|[{}\\]", "", chunk).replace("//", "\\//")
    return re.sub(r"([*_`@#()\[\]<>%$])", r"\\\1", chunk)


def _prose(chunk):
    r"""Prose between two math spans, with TikZ's '\\' as a forced line break."""
    pieces, pos = [], 0
    for m in LINEBREAK.finditer(chunk):
        pieces.append(_markup_text(chunk[pos:m.start()]))
        pos = m.end()
    pieces.append(_markup_text(chunk[pos:]))
    return "#linebreak()".join(pieces)


def node_text(inner):
    r"""A TikZ node body -> Typst markup: '$...$' stays math, '\\' breaks the line."""
    inner = re.sub(r"\$\$", "$ ", inner)
    out, pos = [], 0
    for m in re.finditer(r"\$([^$]*)\$", inner):
        out.append(_prose(inner[pos:m.start()]))
        body = _math_body(m.group(1))
        out.append("$" + body + "$" if body else "")
        pos = m.end()
    out.append(_prose(inner[pos:]))
    return re.sub(r"\s+", " ", "".join(out)).strip()

FOREACH = re.compile(r"\\foreach\s+(\\[\w]+(?:\s*/\s*\\[\w]+)*)\s*(\[[^\]]*\])?\s+in\s+")


def _count_option(text):
    """[count=\\i from 0] -> (name, first); False when the option needs pgfmath."""
    if not text:
        return None
    inner = text[1:-1]
    if re.search(r"\b(?:evaluate|remember)\b", inner):
        return False
    m = re.search(r"count\s*=\s*\\([\w]+)\s*(?:from\s*(-?\d+))?", inner)
    return (m.group(1), int(m.group(2) or 1)) if m else None


def _foreach_items(spec):
    """A foreach value list -> items, with 'a...b' split into 'a', '...', 'b'."""
    items = []
    for raw in split_top(spec, ","):
        raw = raw.strip()
        if not raw:
            continue
        if "..." in raw and raw != "...":
            head, _, tail = raw.partition("...")
            items.extend(p.strip() for p in (head, "...", tail) if p.strip())
        else:
            items.append(raw)
    return items


def _range_values(items):
    """'a,...,b' or 'a,c,...,b' -> (values, items consumed), or (None, 0)."""
    dot = items.index("...")
    if dot not in (1, 2) or dot + 1 >= len(items):
        return None, 0
    lo, hi = expr(items[0]), expr(items[dot + 1])
    step = expr(items[1]) if dot == 2 else None
    if lo is None or hi is None or (dot == 2 and step is None):
        return None, 0
    if step is not None:
        step -= lo
    else:
        step = 1.0 if lo == int(lo) and hi == int(hi) else 0.5
    if step == 0:
        return None, 0
    out, v = [], lo
    while (v <= hi + 1e-9) if step > 0 else (v >= hi - 1e-9):
        out.append("%d" % v if v == int(v) else "%.6g" % v)
        v += step
        if len(out) > 500:
            return None, 0
    return out, dot + 2


def _loop_values(spec, nvars):
    """A foreach value list -> one tuple of literal values per iteration."""
    items, out = _foreach_items(spec), []
    while items:
        if "..." in items:
            vals, used = _range_values(items)
            if vals is None or nvars != 1:
                return None
            out.extend((v,) for v in vals)
            items = items[used:]
            continue
        parts = [p.strip() for p in split_top(items[0], "/")]
        if len(parts) != nvars:
            return None
        out.append(tuple(parts))
        items = items[1:]
    return out or None


def expand_foreach(body):
    """Unroll \\foreach loops; None when a form needs pgfmath we do not have."""
    for _ in range(64):
        m = FOREACH.search(body)
        if not m:
            return body
        vars_ = [v.strip() for v in m.group(1).split("/")]
        count = _count_option(m.group(2))
        if count is False:
            return None
        pos = m.end()
        if body[pos:pos + 1] != "{":
            return None
        spec, pos = bracketed(body, pos)
        if spec is None:
            return None
        gap = body[pos:].lstrip()
        pos += len(body[pos:]) - len(gap)
        if gap[:1] == "{":
            loop, pos = bracketed(body, pos)
            if loop is None:
                return None
        else:
            semi = body.find(";", pos)
            if semi < 0:
                return None
            loop, pos = body[pos:semi + 1], semi + 1
        values = _loop_values(spec, len(vars_))
        if values is None:
            return None
        chunks = []
        for n, vals in enumerate(values):
            piece = loop
            for var, val in zip(vars_, vals):
                piece = re.sub(r"\\%s(?!\w)" % var[1:], lambda _m, v=val: v, piece)
            if count:
                piece = re.sub(r"\\%s(?!\w)" % count[0], str(count[1] + n), piece)
            chunks.append(piece)
        body = body[:m.start()] + "".join(chunks) + body[pos:]
    return None


def emit_node(at, inner, o, pal=None):
    """A TikZ node -> the CeTz lines that draw it."""
    kw = []
    c = color_option(o, pal, ("fill",), bare=False)
    if c:
        kw.append("fill: " + c)
    text = node_text(inner)
    if not text:
        if kw:
            return ["circle(%s, radius: 0.05, %s)" % (at, ", ".join(kw))]
        return []
    args = [at, "[%s]" % text]
    return ["content(%s%s)" % (", ".join(args), (", " + ", ".join(kw)) if kw else "")]


def arrow_mark(o):
    if "<->" in o or "<-." in o or ".->" in o and "<-" in o:
        return 'mark: (start: "<", end: ">")'
    if "->" in o or ".->" in o:
        return 'mark: (end: ">")'
    if "<-" in o or "<-." in o:
        return 'mark: (start: "<")'
    return None


def _size(text):
    """A TikZ length -> (value in cm, is it in user units), or None.

    TikZ multiplies a unit-less length by the axis scales but keeps an explicit
    dimension ('2cm', '1.5pt') absolute; measured against pdflatex.
    """
    val = expr(text)
    return None if val is None else (val, not re.search(r"\d\s*(cm|mm|in|pt|bp)\b", text))


def _apply_size(spec, xf):
    """A (rx, ry, user-units) triple -> radii in cm under the transform xf."""
    rx, ry, user = spec
    return (rx * xf[0], ry * xf[1]) if user else (rx, ry)


def _radius(text, i):
    """A circle/ellipse size spec -> ((rx, ry, user-units), index after it)."""
    while i < len(text) and text[i] in " \t\n":
        i += 1
    if text[i:i + 1] == "(":
        end = paren_span(text, i)
        if end is None:
            return None, i
        inner = text[i + 1:end - 1]
        m = re.fullmatch(r"\s*(.+?)\s+and\s+(.+?)\s*", inner)
        parts = (m.groups() if m else (inner, inner))
    elif text[i:i + 1] == "[":
        inner, end = bracketed(text, i)
        if inner is None:
            return None, i
        spec = opts(inner)
        parts = (str(spec.get("x radius", spec.get("radius", ""))),
                 str(spec.get("y radius", spec.get("radius", spec.get("x radius", "")))))
    else:
        return None, i
    rx, ry = _size(parts[0]), _size(parts[1])
    if rx is None or ry is None or rx[1] != ry[1]:
        return None, i
    return (rx[0], ry[0], rx[1]), end


def _radius_arg(rx, ry):
    """A CeTz radius: one number, or an (x, y) pair for an ellipse."""
    return "%.4g" % rx if abs(rx - ry) < 1e-9 else "(%.4g, %.4g)" % (rx, ry)


def _arc_spec(text, i):
    """TikZ arc spec -> (start, stop, rx, ry, user-units, index after it)."""
    while i < len(text) and text[i] in " \t\n":
        i += 1
    if text[i:i + 1] == "(":
        end = paren_span(text, i)
        if end is None:
            return None
        parts = split_top(text[i + 1:end - 1], ":")
        if len(parts) != 3:
            return None
        a, b, r = expr(parts[0]), expr(parts[1]), _size(parts[2])
        if a is None or b is None or r is None:
            return None
        return a, b, r[0], r[0], r[1], end
    if text[i:i + 1] == "[":
        inner, end = bracketed(text, i)
        if inner is None:
            return None
        spec = opts(inner)
        rx = _size(str(spec.get("x radius", spec.get("radius", ""))))
        ry = _size(str(spec.get("y radius", spec.get("radius", spec.get("x radius", "")))))
        if rx is None or ry is None or rx[1] != ry[1]:
            return None
        a = expr(str(spec["start angle"])) if "start angle" in spec else None
        b = expr(str(spec["end angle"])) if "end angle" in spec else None
        if a is None and b is not None and "delta angle" in spec:
            a = b - expr(str(spec["delta angle"]))
        if b is None and a is not None and "delta angle" in spec:
            b = a + expr(str(spec["delta angle"]))
        if a is None or b is None:
            return None
        return a, b, rx[0], ry[0], rx[1], end
    return None


def _coord_at(text, i, names=None, xf=IDENT, cursor=None):
    """The coordinate token starting at/near i -> ((x, y), index after it)."""
    while i < len(text) and text[i] in " \t\n":
        i += 1
    m = re.match(r"(\+\+?)?\s*\(", text[i:])
    if not m:
        return None, i
    open_at = i + m.end() - 1
    end = paren_span(text, open_at)
    if end is None:
        return None, i
    return point((m.group(1) or "") + text[open_at:end], cursor, names, xf), end


def _opts_at(text, i):
    """A leading [...] option group -> (options, index after it); ({}, i) when absent."""
    if text[i:i + 1] != "[":
        return {}, i
    inner, end = bracketed(text, i)
    if inner is None:
        return None, i
    return opts(inner), end


def _node_at(rest, names, xf=IDENT, o=None):
    """'(name) at (x, y)' -> (name, (x, y), text after the coordinate), or None.

    A node with no coordinate sits at the current point, which TikZ resets to the
    scope origin for every statement. A node placed relative to a named node would
    need that node's size, which we never know, so it is refused rather than
    stacked on the origin with its neighbours.
    """
    rest = rest.lstrip()
    name = None
    m = re.match(r"\(([-\w]+)\)\s*", rest)
    if m:
        name, rest = m.group(1), rest[m.end():].lstrip()
    if not rest.startswith("at"):
        if POSITIONED.search(" ; ".join("%s=%s" % (k, v) for k, v in (o or {}).items())):
            return None
        return name, (xf[2], xf[3]), rest
    rest = rest[2:].lstrip()
    at, end = _coord_at(rest, 0, names, xf)
    if at is None:
        return None
    return name, at, rest[end:]


def _bend_control(a, b, bend):
    """Control point for TikZ `to[bend left=deg]`: circular-arc approximation."""
    sign, deg = bend
    dx, dy = b[0] - a[0], b[1] - a[1]
    length = math.hypot(dx, dy)
    if length == 0:
        return None
    off = length * math.tan(math.radians(deg) / 4) * sign
    ux, uy = dx / length, dy / length
    return ((a[0] + b[0]) / 2 - uy * off, (a[1] + b[1]) / 2 + ux * off)


def _render(seg, closed, mark, sa, fill):
    kind, data = seg
    if kind == "poly":
        args = [fmt(*p) for p in data]
        if closed:
            args.append("close: true")
        fn = "line"
    elif kind == "bezier":
        args = [fmt(*p) for p in data]
        fn = "bezier"
    else:
        center, a, b, radius = data
        args = [fmt(*center), "start: %.4gdeg" % a, "stop: %.4gdeg" % b,
                "radius: %s" % radius]
        fn = "arc"
    if fill:
        args.append("fill: " + fill)
    args += sa
    if mark:
        args.append(mark)
    return "%s(%s)" % (fn, ", ".join(args))


def _style(fill, sa):
    """The trailing fill/stroke arguments of a shape call, at most one of each."""
    parts = (["fill: " + fill] if fill else []) + list(sa)
    return (", " + ", ".join(parts)) if parts else ""


def translate_path(rest, verb, o, names, xf=IDENT, pal=None):
    """One \\draw/\\fill/\\path statement -> CeTz draw calls, or None."""
    rest = rest.strip()
    extra, end = _opts_at(rest, 0)
    if extra is None:
        return None
    o = {**o, **extra}
    rest = rest[end:].strip()
    mark = arrow_mark(o)
    painted = verb in ("fill", "filldraw")
    sa = stroke_args(o, pal, bare=verb != "fill")
    fill = color_option(o, pal, ("fill",), bare=painted)
    if fill is None and painted:
        fill = "black"
    items, poly, cursor = [], [], None
    closed = rect_from = ctrl = bend = None
    join = "--"
    pos = 0

    def flush():
        if len(poly) >= 2:
            items.append(("poly", list(poly)))
        del poly[:]

    while pos < len(rest):
        chunk = rest[pos:]
        m = re.match(r"\s*node\s*(\[[^\]]*\])?\s*(\[[^\]]*\])?\s*\{", chunk)
        if m:
            inner, end = bracketed(rest, pos + m.end() - 1)
            if inner is None:
                return None
            anchor = poly[-1] if poly else cursor
            if anchor is not None:
                for line in emit_node(fmt(*anchor), inner,
                                      opts(m.group(1)[1:-1]) if m.group(1) else {}, pal):
                    items.append(("raw", line))
            pos = end
            continue
        m = re.match(r"\s*(?:circle|ellipse)\s*(?=[\[(])", chunk)
        if m:
            spec, end = _radius(rest, pos + m.end())
            center = cursor if cursor is not None else (poly[-1] if poly else None)
            if spec is None or center is None:
                return None
            rx, ry = _apply_size(spec, xf)
            tail = _style(fill, sa)
            items.append(("raw", "circle(%s, radius: %s%s)"
                          % (fmt(*center), _radius_arg(rx, ry), tail)))
            flush()
            cursor = None
            pos = end
            continue
        m = re.match(r"\s*rectangle\s*", chunk)
        if m:
            rect_from = cursor if cursor is not None else (poly[-1] if poly else None)
            if rect_from is None:
                return None
            flush()
            pos += m.end()
            continue
        m = re.match(r"\s*arc\s*(?=[\[(])", chunk)
        if m:
            spec = _arc_spec(rest, pos + m.end())
            start = cursor if cursor is not None else (poly[-1] if poly else None)
            if spec is None or start is None:
                return None
            a, b, srx, sry, user, end = spec
            rx, ry = _apply_size((srx, sry, user), xf)
            rad = math.radians(a)
            center = (start[0] - rx * math.cos(rad), start[1] - ry * math.sin(rad))
            stop = math.radians(b)
            cursor = (center[0] + rx * math.cos(stop), center[1] + ry * math.sin(stop))
            flush()
            items.append(("arc", (start, a, b, _radius_arg(rx, ry))))
            pos = end
            continue
        m = re.match(r"\s*\.\.\s*controls\s*", chunk)
        if m:
            c1, i = _coord_at(rest, pos + m.end(), names, xf)
            m2 = re.match(r"\s*and\s*", rest[i:])
            if c1 is None or not m2:
                return None
            c2, i = _coord_at(rest, i + m2.end(), names, xf)
            m3 = re.match(r"\s*\.\.\s*", rest[i:])
            if c2 is None or not m3:
                return None
            ctrl = (c1, c2)
            pos = i + m3.end()
            continue
        m = re.match(r"\s*(--|-!-|\|-|-\||\.\.)\s*(\[([^\]]*)\])?", chunk)
        if m:
            join = "--" if m.group(1) in ("--", "-!-", "..") else m.group(1)
            pos += m.end()
            continue
        m = re.match(r"\s*(?:to|edge)\s*(?=[\[(]|\+\+?)", chunk)
        if m:
            join, bend, pos = "--", None, pos + m.end()
            if rest[pos:pos + 1] == "[":
                inner, end = bracketed(rest, pos)
                spec = opts(inner or "")
                for key, val in spec.items():
                    got = re.fullmatch(r"bend\s+(left|right)\s*(?:=\s*(-?[\d.]+))?",
                                       key.strip() + ("" if val is True else "=" + str(val)))
                    if got:
                        bend = (-1 if got.group(1) == "left" else 1,
                                float(got.group(2) or 30))
                pos = end
            continue
        m = re.match(r"\s*cycle\b", chunk)
        if m:
            closed = True
            pos += m.end()
            continue
        stripped = chunk.lstrip()
        if re.match(r"(?:\+\+?)?\s*\(", stripped):
            p, end = _coord_at(rest, pos + (len(chunk) - len(stripped)), names, xf, cursor)
            if p is None:
                return None
            start = cursor if cursor is not None else (poly[-1] if poly else None)
            if rect_from is not None:
                tail = _style(fill, sa)
                items.append(("raw", "rect(%s, %s%s)" % (fmt(*rect_from), fmt(*p), tail)))
                rect_from = None
            elif ctrl is not None or bend is not None:
                if start is None:
                    return None
                curve = ctrl or ((_bend_control(start, p, bend),) * 2 if bend else None)
                if curve is None or curve[0] is None:
                    return None
                flush()
                items.append(("bezier", (start, p) + tuple(curve)))
                ctrl = bend = None
            elif join in ("-|", "|-") and start is not None:
                poly.append((p[0], start[1]) if join == "-|" else (start[0], p[1]))
                poly.append(p)
            else:
                if not poly and start is not None:
                    poly.append(start)
                poly.append(p)
            cursor = p
            pos = end
            continue
        if re.match(r"\s*\[", chunk):
            extra, end = _opts_at(rest, pos + chunk.index("["))
            if extra is None:
                return None
            o = {**o, **extra}
            sa = stroke_args(o, pal, bare=verb != "fill")
            pos = end
            continue
        return None
    flush()
    segs = [i for i, it in enumerate(items) if it[0] != "raw"]
    if not segs:
        return [it[1] for it in items if it[0] == "raw"] or None
    if fill and len(segs) > 1:
        # one filled outline spanning straight and curved pieces
        body = "; ".join(_render(items[i], False, None, [], None) for i in segs)
        merged = "merge-path({%s}, close: %s, fill: %s%s)" % (
            body, "true" if closed else "false", fill,
            (", " + ", ".join(sa)) if sa else "")
        return [merged] + [it[1] for it in items if it[0] == "raw"]
    out = []
    for i, it in enumerate(items):
        if it[0] == "raw":
            out.append(it[1])
            continue
        last = i == segs[-1]
        out.append(_render(it, bool(closed) and last, mark if last else None, sa,
                           fill if last or len(segs) == 1 else None))
    return out or None


def translate_statement(stmt, names, xf=IDENT, pal=None):
    m = re.match(r"\\(draw|filldraw|fill|path|node|coordinate)\b\s*", stmt)
    if not m:
        return None
    verb = m.group(1)
    o, pos = _opts_at(stmt, m.end())
    if o is None:
        return None
    if verb == "coordinate":
        return []
    if verb == "node":
        head = _node_at(stmt[pos:], names, xf, o)
        if head is None:
            return None
        name, at, rest = head
        brace = rest.find("{")
        if brace < 0:
            return None
        inner, _end = bracketed(rest, brace)
        if inner is None:
            return None
        if name:
            names[name] = at
        return emit_node(fmt(*at), inner, o, pal)
    return translate_path(stmt[pos:], verb, o, names, xf, pal)


COMPILE_CACHE = {}


def compiles(canvas):
    """Gate on a real typst compile: a broken canvas must never reach a paper."""
    key = hash(canvas)
    if key in COMPILE_CACHE:
        return COMPILE_CACHE[key]
    import subprocess
    import tempfile
    with tempfile.TemporaryDirectory() as tmp:
        src = pathlib.Path(tmp) / "t.typ"
        src.write_text(HEADER + "#set page(width: 300pt, height: 300pt)\n" + canvas, encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(src), str(pathlib.Path(tmp) / "t.pdf")],
                           capture_output=True)
    ok = r.returncode == 0
    COMPILE_CACHE[key] = ok
    return ok


def sane(canvas):
    """Reject canvases whose markup is structurally broken, so callers fall back."""
    for line in canvas.splitlines()[2:-1]:
        stripped = re.sub(r"\\.", "", line)
        if stripped.count("[") != stripped.count("]"):
            return False
        if stripped.count("$") % 2:
            return False
        if stripped.count("(") != stripped.count(")"):
            return False
    return True


SCOPE = re.compile(r"\\(begin|end)\{scope\}")
AXES = ("x", "y")
SCALES = ("scale", "xscale", "yscale")
MOVES = ("xshift", "yshift")
TILTS = ("rotate", "rotate around", "xslant", "yslant", "transform shape", "cm")


def _dim_cm(text):
    """A TikZ dimension in cm; a bare number is points, as pdflatex reads it."""
    got = _size(text)
    return None if got is None else (got[0] * UNITS["pt"] if got[1] else got[0])


def _transform(o, outer=IDENT):
    """Options that move the coordinate system -> (sx, sy, dx, dy); None if one tilts it.

    Measured against pdflatex: 'shift' counts user units of the *enclosing* axes
    (so it is scaled by 'outer'), while 'xshift' and the axis lengths are absolute
    dimensions and 'scale' a factor. Options with no geometric effect on our output
    (fonts, node sizes, styles) are ignored.
    """
    sx = sy = 1.0
    dx = dy = 0.0
    for key, val in o.items():
        key = key.strip()
        if key in TILTS:
            return None
        if not isinstance(val, str):
            continue
        if key == "shift":
            got = point(val.strip().strip("{}"), None)
            if got is None:
                return None
            dx, dy = dx + got[0] * outer[0], dy + got[1] * outer[1]
        elif key in SCALES or key in AXES or key in MOVES:
            d = expr(val) if key in SCALES else _dim_cm(val)
            if d is None:
                return None
            if key == "x":
                sx = d
            elif key == "y":
                sy = d
            elif key == "scale":
                sx, sy = d * sx, d * sy
            elif key == "xscale":
                sx *= d
            elif key == "yscale":
                sy *= d
            elif key == "xshift":
                dx += d
            else:
                dy += d
    return sx, sy, dx, dy


def _compose(outer, inner):
    """Combine two transforms: scales multiply, translations add.

    TikZ reads an 'xshift' as a real length regardless of the enclosing axis
    scales (measured against pdflatex), so a scope's shift is already absolute.
    """
    sx1, sy1, dx1, dy1 = outer
    sx2, sy2, dx2, dy2 = inner
    return (sx1 * sx2, sy1 * sy2, dx1 + dx2, dy1 + dy2)


def _walk_scopes(body, xf, out):
    """Collect (statement, transform) pairs; False if a scope tilts the plane."""
    pos = 0
    while True:
        m = SCOPE.search(body, pos)
        if not m:
            out.extend((s, xf) for s in split_statements(body[pos:]))
            return True
        if m.group(1) == "end":
            return False
        out.extend((s, xf) for s in split_statements(body[pos:m.start()]))
        o, start = _opts_at(body, m.end())
        inner = _transform(o, xf) if o is not None else None
        if inner is None:
            return False
        depth, i = 1, start
        while depth:
            n = SCOPE.search(body, i)
            if not n:
                return False
            depth += 1 if n.group(1) == "begin" else -1
            i = n.end()
        if not _walk_scopes(body[start:n.start()], _compose(xf, inner), out):
            return False
        pos = i


def scoped(body, xf=IDENT):
    """Statements paired with their enclosing transform; None to refuse."""
    out = []
    return out if _walk_scopes(body, xf, out) else None


def convert(tikz):
    canvas = build(tikz)
    if canvas is None or not sane(canvas) or not compiles(canvas):
        return None
    return canvas


DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")


def _byte(n):
    return min(255, max(0, int(round(n))))


def _color_model(model, spec):
    """A definecolor model and spec -> an rgb triple, or None if we cannot model it."""
    spec = spec.strip()
    try:
        if model == "HTML":
            if not re.fullmatch(r"[0-9a-fA-F]{6}", spec):
                return None
            return tuple(int(spec[i:i + 2], 16) for i in (0, 2, 4))
        nums = [float(p) for p in spec.split(",")]
    except ValueError:
        return None
    if len(nums) == 1 and model == "gray":
        return (_byte(nums[0] * 255),) * 3
    if len(nums) != 3:
        return None
    factor = 255.0 if model == "rgb" else 1.0
    return tuple(_byte(n * factor) for n in nums)


def _colors(body):
    """-> ({name: rgb triple}, body with the declarations removed), or None.

    Guessing an unmodellable colour would draw the figure in the wrong ink, so the
    whole picture is refused instead.
    """
    pal, out, pos = {}, [], 0
    for m in DEFINECOLOR.finditer(body):
        got = _color_model(m.group(2), m.group(3))
        if got is None:
            return None
        pal[m.group(1)] = got
        out.append(body[pos:m.start()])
        pos = m.end()
    out.append(body[pos:])
    return pal, "".join(out)


def build(tikz):
    """The CeTz canvas for a TikZ picture, or None if it needs more than we draw.

    The compile gate is deliberately not run here, so callers can read a canvas
    without paying typst for it.
    """
    m = re.match(r"\\begin\{tikzpicture\}", tikz)
    if not m:
        return None
    body = tikz[m.end():].lstrip()
    head, pos = _opts_at(body, 0)
    if head is None:
        return None
    base = _transform(head)
    if base is None:
        return None
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    body = body[:end] if end >= 0 else body
    body = expand_foreach(body)
    if body is None:
        return None
    cols = _colors(body)
    if cols is None or UNSUPPORTED.search(cols[1]):
        return None
    pal, body = cols
    placed = scoped(body, base)
    if placed is None:
        return None
    names = {}
    for stmt, xf in placed:
        register(stmt, names, xf)
    lines = []
    for stmt, xf in placed:
        got = translate_statement(stmt, names, xf, pal)
        if got is None:
            return None
        lines.extend(got)
    if not lines:
        return None
    return "#cetz.canvas({\n  import cetz.draw: *\n" + "\n".join("  " + l for l in lines) + "\n})"
