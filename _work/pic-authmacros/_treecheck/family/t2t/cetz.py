"""Translate the TikZ subset used by these papers into CeTz canvases.

Returns None for pictures outside the supported subset so callers keep their
existing fallback instead of emitting a broken canvas.
"""

import math
import pathlib
import re

from . import mathconv
from .texutil import skip_spaces, split_top

HEADER = '#import "@preview/cetz:0.5.0"\n' \
         '#let page_rotate = rotate\n'

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
    r"\\(foreach|pgfplotsset|addplot|legend|axis|shade|"
    r"pattern|clip|useasboundingbox|def|newcommand|let|parabola|grid)\b")

# a TikZ transform: the scope's matrix (ma, mb, mc, md) with x' = ma*x + mb*y and y' = mc*x + md*y,
# the three axis unit vectors (xx, xy), (yx, yy), (zx, zy) as the author wrote them, and the scope's
# origin (dx, dy), all in cm. Measured against pdflatex (_work/probe_3d_basis.py,
# _work/probe_3d_order.py): an axis is a vector of the canvas, which the matrix then stretches, so
# `rotate=90,x={(2cm,0cm)}` lands on (0, 2cm) and a nested `x=1cm` inside a 3D basis still lands one
# centimetre along the page; an axis a scope does not rewrite carries over from the enclosing one,
# and the unset third axis is pgf's own (-0.385cm, -0.385cm), which `scale=` stretches like the rest.
IDENT = (1.0, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, -0.385, -0.385, 0.0, 0.0)


def _basis(xf):
    """The page images of the scope's x and y units, as a matrix: x'=a*x+b*y, y'=c*x+d*y."""
    ma, mb, mc, md = xf[:4]
    return (ma * xf[4] + mb * xf[5], ma * xf[6] + mb * xf[7],
            mc * xf[4] + md * xf[5], mc * xf[6] + md * xf[7])


def _zcol(xf):
    """The page image of one user unit along the scope's z axis."""
    ma, mb, mc, md = xf[:4]
    return (ma * xf[8] + mb * xf[9], mc * xf[8] + md * xf[9])


def _apply(xf, x, y, z=0.0):
    """A point of the scope's own space -> cm on the page; a two-part point has z=0."""
    a, b, c, d = _basis(xf)
    e, f = _zcol(xf)
    return (a * x + b * y + e * z + xf[10], c * x + d * y + f * z + xf[11])


def _delta(xf, x, y, z=0.0):
    """A direction and distance of the scope's own space -> the same on the page, unmoved."""
    a, b, c, d = _basis(xf)
    e, f = _zcol(xf)
    return (a * x + b * y + e * z, c * x + d * y + f * z)


def _ux(xf):
    """The length one user unit measures along the scope's x axis."""
    a, _b, c, _d = _basis(xf)
    return math.hypot(a, c)


def _uy(xf):
    """The length one user unit measures along the scope's y axis."""
    _a, b, _c, d = _basis(xf)
    return math.hypot(b, d)


def _origin(xf):
    return (xf[10], xf[11])


def _unmap(xf, at):
    """cm on the page -> the scope's own coordinates; None when the axes have collapsed.

    A page point of a tilted scope has a line of preimages once z counts, and this answers with the
    one in the scope's z=0 plane, which is where a grid or a rectangle is drawn.
    """
    a, b, c, d = _basis(xf)
    det = a * d - b * c
    if abs(det) < 1e-9:
        return None
    x, y = at[0] - xf[10], at[1] - xf[11]
    return ((d * x - b * y) / det, (a * y - c * x) / det)


def _turns(xf):
    """True when the plane is turned: a rectangle's two corners are then not its corners."""
    _a, b, c, _d = _basis(xf)
    return bool(b or c)


def _spins(xf):
    """True when the turn is a rotation with a uniform scale, the only tilt an arc survives."""
    a, b, c, d = _basis(xf)
    return abs(a - d) < 1e-12 and abs(b + c) < 1e-12


def _slant(xf):
    """The page angle the scope's x axis makes, in degrees; 0.0 when nothing is tilted.

    Typst measures rotate() in page space, where a positive turn is clockwise, while TikZ and
    CeTz both count counter-clockwise from the x axis -- so this is the angle a node's text has
    to be turned by, negated, and the angle an arc's start and stop shift by.
    """
    a, b, c, _d = _basis(xf)
    if not (b or c):
        return 0.0
    return math.degrees(math.atan2(c, a))

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


def _mix(spec, pal=None):
    """A TikZ colour expression -> an rgb triple, or None when we do not know what it is.

    'name!percent' is that share of the color mixed with white, and 'red!75!black' is that share
    mixed with the color after the percent; a chain mixes its left side with each next colour.
    Names come from the picture's own declarations first.
    """
    parts = [p.strip() for p in spec.strip().split("!")]
    out = (pal or {}).get(parts[0]) or RGB.get(parts[0])
    if out is None:
        return None
    for i in range(1, len(parts), 2):
        if not re.fullmatch(r"\d+(?:\.\d+)?", parts[i]):
            return None
        share = float(parts[i]) / 100.0
        second = RGB.get("white") if i + 1 == len(parts) else \
            (pal or {}).get(parts[i + 1]) or RGB.get(parts[i + 1])
        if second is None:
            return None
        out = tuple(round(a * share + b * (1 - share)) for a, b in zip(out, second))
    return out


def color(spec, pal=None):
    """A TikZ color -> a Typst color, or None when we do not know what it is."""
    out = _mix(spec, pal)
    return None if out is None else _rgb(out)


def opts(text):
    """A TikZ option list -> a dictionary, split only between groups.

    A style definition is one option whose value is a brace group full of commas, so the
    depth-aware split is what keeps 'phase/.style={draw, text width=2.8cm}' a single key.
    """
    out = {}
    for part in split_top(text or "", ","):
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

# 'right=of a' separates the two boxes by \node distance, whose TikZ default is 1cm;
# 'inner sep' defaults to 0.3333em, which is a tenth of a centimetre at the sizes a
# figure uses. Both only ever add to a box the author already fixed in centimetres.
NODE_DISTANCE = 1.0
INNER_SEP = 0.1
DIRECTION = {"right": (1, 0), "left": (-1, 0), "above": (0, 1), "below": (0, -1),
             "above right": (1, 1), "above left": (-1, 1),
             "below right": (1, -1), "below left": (-1, -1)}
OF_TARGET = re.compile(r"^(?:(?:([-+\d.]+(?:\s*(?:cm|mm|pt|em|ex|in))?)"
                       r"(?:\s+and\s+([-+\d.]+(?:\s*(?:cm|mm|pt|em|ex|in))?))?)?"
                       r"\s*of\s+)?([-\w]+)(?:\s*\.\s*(north|south|east|west|"
                       r"north east|north west|south east|south west))?$")


def _length(text, xf):
    """A TikZ length -> cm in the picture's own scales, or None."""
    got = _size(text) if isinstance(text, str) else None
    if got is None:
        return None
    val, user = got
    return val * _ux(xf) if user else val


def picture_styles(head):
    """The '/.style' table a picture's option list declares: name -> its options.

    A flowchart writes `box/.style={draw,rounded corners}` in the picture's own brackets and then
    `\node[box]`, so a bare option key has to be read back to its definition before the box the
    author fixed is known.
    """
    out = {}
    for key, val in (head or {}).items():
        if key.endswith("/.style") and isinstance(val, str):
            out[key[:-len("/.style")]] = opts(val.strip("{} "))
    return out


def resolve_opts(o, styles, as_node=True):
    """A statement's own options, with every style it invokes merged in.

    A flowchart declares 'phase/.style={text width=2.8cm,minimum height=1.25cm}' once and writes
    '\\node[phase, right=of reset]'; the box the author fixed is inside that style, so the name has
    to be read back to its definition before the size is known. A '\\draw[flow]' with
    'flow/.style={->,draw=black!65}' is the same problem one verb over: the arrow head and its ink
    live in the style, so a path that never resolves its names draws a bare line.

    'every node/.style={draw,fill=white}' is a declaration with no name to invoke, and TikZ applies
    it to nodes only -- so it is merged for a node, where a flowchart would otherwise lose every
    frame, and not for a path, where it would fill the connecting lines white.
    """
    got = dict((styles.get("every node") or {}) if as_node else {})
    got.update(o)
    for _ in range(4):  # a style may itself invoke another
        added = False
        for key, val in list(got.items()):
            if val is True and key in styles:
                for k, v in styles[key].items():
                    if k not in got:
                        got[k] = v
                        added = True
        if not added:
            break
    if as_node:
        for k, v in (styles.get("every node") or {}).items():
            if k not in got:
                got[k] = v
    return got


def node_size(o, xf):
    """(half-width, half-height) in cm when the author fixed the box, else (None, None).

    TikZ measures the text to size the node; we only know the extent it was given, which is
    what a row of flowchart boxes is aligned by.
    """
    w = h = None
    sep = _length(o.get("inner sep"), xf)
    sep = INNER_SEP if sep is None else sep
    for key in ("text width", "minimum width", "minimum size"):
        got = _length(o.get(key), xf)
        if got is not None:
            w = max(w or 0.0, got + (2 * sep if key == "text width" else 0))
    for key in ("minimum height", "text height", "minimum size"):
        got = _length(o.get(key), xf)
        if got is not None:
            h = max(h or 0.0, got)
    return (None if w is None else w / 2.0, None if h is None else h / 2.0)


def box_visible(o):
    """Whether the author asked to see this node's frame.

    TikZ sizes a node from 'text width' even when it draws nothing around it, and a bare colour on a
    node inks its *text*, not a border: `\\node[blue!65!black] at (1,2) {primary pieces};` stands on
    the page with no rectangle. Only 'draw' or 'fill' asks for one, so a stroke-thickness or dash
    written without either colours a frame that is never drawn and invents nothing.
    """
    if o.get("draw") == "none":
        return False
    fill = o.get("fill")
    return "draw" in o or (fill is not None and fill != "none")


def placed_at(key, val, names, xf, size):
    """'right=0.35cm of reset' -> the centre that sets this node beside that one, or None.

    TikZ separates the two boxes by the gap measured edge to edge, and we know a box only when
    the author fixed its size. Where it was left to the text we take the node for a point: the
    distance is then centre to centre, which is what the older 'right of=a' spelling meant and
    what keeps a flowchart readable when a box is a little closer than the paper drew it.
    """
    if key not in DIRECTION or not isinstance(val, str):
        return None
    m = OF_TARGET.match(val.strip())
    if not m:
        return None
    ref = (names or {}).get(m.group(3))
    if ref is None:
        return None
    half_w, half_h = size
    rx, ry = ref[0], ref[1]
    rw = ref[2] if len(ref) > 2 and ref[2] is not None else 0.0
    rh = ref[3] if len(ref) > 3 and ref[3] is not None else 0.0
    # 'of a.south' names the reference's own anchor; a box the author never fixed leaves that
    # anchor at the centre, which is the same reading a named point in a coordinate gets
    ax = DIRECTION.get(m.group(4) or "")
    if ax:
        rx, ry = rx + ax[0] * rw, ry + ax[1] * rh
    gap = _length(m.group(1), xf) if m.group(1) else NODE_DISTANCE
    if gap is None:
        return None
    # 'below left=1cm and 2cm of a' names the two axes in the order the direction word does,
    # measured with pdflatex: the first number moved the vertical of 'below left', the second
    # the horizontal, and 'right=1cm and 2cm' would swap them
    gx = gy = gap
    if m.group(2):
        other = _length(m.group(2), xf)
        if other is None:
            return None
        gx, gy = (gap, other) if key.startswith(("right", "left")) else (other, gap)
    dx, dy = DIRECTION[key]
    return (rx + dx * (rw + gx + (half_w or 0.0)),
            ry + dy * (rh + gy + (half_h or 0.0)))


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
    if inner.startswith("$"):
        close = inner.rfind("$")
        # the calc library reads `$(A)!.25!(B)$` as one coordinate, so a `...$` group is
        # resolved on its own; a relative `$...$` would mix two coordinate spaces on one token
        if close <= 0 or relative or inner[close + 1:].strip():
            return None
        return _calc_point(inner[1:close], names, xf)
    parts = split_top(inner, ",")
    got = None
    if len(parts) == 2:
        x, y = expr(parts[0]), expr(parts[1])
        if x is not None and y is not None:
            got = (x, y)
    elif len(parts) == 3:
        # a three-part point is a place in the author's own 3D space: measured against pdflatex,
        # pgf reads `(x,y,z)` as x*xvec + y*yvec + z*zvec, so the third component is no special
        # case of the reader, only a third term the scope's z column is multiplied by
        three = [expr(part) for part in parts]
        if None not in three:
            got = tuple(three)
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
            # a name carries its box as well, which a later 'right=of' node needs
            return names[m2.group(1)][:2]
        polar = split_top(one, ":")
        if len(polar) == 2:
            deg, r = expr(polar[0]), expr(polar[1])
            if deg is not None and r is not None:
                a = math.radians(deg)
                got = (r * math.cos(a), r * math.sin(a))
    if got is None:
        return None
    if relative:
        if cursor is None:
            return None
        vx, vy = _delta(xf, *got)
        return (cursor[0] + vx, cursor[1] + vy)
    return _apply(xf, *got)


def _shifted_point(one, cursor, names, xf):
    """``([yshift=2pt]a.west)``: a coordinate carrying its own absolute shift."""
    inner, end = bracketed(one, 0)
    if inner is None or end >= len(one):
        return None
    t = _transform(opts(inner), xf)
    if t is None or t[:4] != (1.0, 0.0, 0.0, 1.0):
        return None
    rest = one[end:].strip()
    at = point(rest if rest.startswith("(") else "(" + rest + ")", cursor, names, xf)
    if at is None:
        return None
    return (at[0] + t[10], at[1] + t[11])


CALC_SPAN = re.compile(r"^(.*)!\s*([^!:]+?)\s*!\s*(.*)$")


def _calc_point(body, names, xf):
    r"""A TikZ calc coordinate -> cm, or None when it is a form we would draw wrong.

    Two forms are worth reading: `$(A)!.25!(B)$`, a point a fraction of the way from A to B,
    and `$(A)+(-.76,.06)$`, a named point with an offset. A fraction carrying a unit (`!2cm!`)
    is a *distance* along the span rather than a ratio, and an operand after a second `!` is a
    chained or angled construction, so both are refused.
    """
    body = body.strip()
    m = CALC_SPAN.match(body)
    if m:
        left, factor, right = m.group(1).strip(), m.group(2).strip(), m.group(3).strip()
        if re.search(r"[A-Za-z]", factor):
            return None
        f = expr(factor)
        a, b = _calc_term(left, names, xf), _calc_term(right, names, xf)
        if f is None or a is None or b is None:
            return None
        return (a[0] + (b[0] - a[0]) * f, a[1] + (b[1] - a[1]) * f)
    if "!" in body:
        return None
    return _calc_term(body, names, xf)


def _calc_term(text, names, xf):
    """One calc operand: a coordinate, optionally followed by a signed `+(dx, dy)`."""
    text = text.strip()
    if not text.startswith("("):
        return None
    end = paren_span(text, 0)
    if end is None:
        return None
    at = point(text[:end], None, names, xf)
    rest = text[end:].strip()
    if not rest:
        return at
    m = re.match(r"([+-])\s*(?=\()", rest)
    if at is None or m is None or paren_span(rest, m.end()) != len(rest):
        return None
    off = point(rest[m.end():], None, {}, IDENT)
    if off is None:
        return None
    sign = 1.0 if m.group(1) == "+" else -1.0
    # `at` already carries the enclosing axes while a written delta is in user units,
    # so only the scales apply to it
    vx, vy = _delta(xf, off[0], off[1])
    return (at[0] + sign * vx, at[1] + sign * vy)


def register(stmt, names, xf=IDENT, styles=None):
    """Remember the named points a statement defines, together with the box around them."""
    m = NODE_DEF.match(stmt)
    if not m:
        return
    o, pos = _opts_at(stmt, m.end())
    if o is None:
        return
    if styles:
        o = resolve_opts(o, styles)
    head = _node_at(stmt[pos:], names, xf, o)
    if head and head[0]:
        names[head[0]] = tuple(head[1]) + node_size(o, xf)


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
    r"\quad": " ", r"\qquad": " ",
    # the labels a node loses most often, with the spelling the installed typst accepts;
    # each is looked up as a whole control word, so no entry has to precede another
    r"\vdots": "dots.v", r"\ell": "ell", r"\longrightarrow": "arrow.r.long",
    r"\Longrightarrow": "arrow.r.double.long",
    r"\subseteq": "subset.eq", r"\subset": "subset", r"\varnothing": "nothing",
    r"\neq": "!=", r"\ne": "!=", r"\ll": "<<", r"\in": "in",
    r"\circ": "compose", r"\oplus": "plus.o", r"\vdash": "tack.r", r"\dashv": "tack.l",
    r"\partial": "partial", r"\log": "log",
    r"\Gamma": "Gamma", r"\Phi": "Phi", r"\Lambda": "Lambda",
    r"\Theta": "Theta", r"\Pi": "Pi", r"\Sigma": "Sigma", r"\Chi": "Chi",
    r"\Nu": "Nu", r"\Eta": "Eta", r"\Upsilon": "Upsilon",
    r"\zeta": "zeta", r"\iota": "iota", r"\psi": "psi", r"\xi": "xi",
    r"\nu": "nu", r"\upsilon": "upsilon", r"\vartheta": "theta",
    # each spelling below is the one the installed typst accepts, measured by compiling it alone
    # (`_work/probe_symbol_spellings2.py`); a command with no entry reaches the page as its own name
    r"\Downarrow": "arrow.b.double", r"\Uparrow": "arrow.t.double",
    r"\cup": "union", r"\setminus": "without", r"\mapsto": "arrow.r.bar",
    r"\twoheadrightarrow": "arrow.r.twohead", r"\curvearrowleft": "arrow.l.curve",
    r"\rightrightarrows": "arrow.r.double.bar", r"\Vdash": "tack.r.double",
    r"\ddagger": "dagger.double", r"\i": "i.dot",
    r"\displaystyle": " ",
}


# A word may stay bare in Typst maths only when it is a symbol's own name, so the mark below is
# what tells the spelling we injected from the author's prose: `arrow.l.curve` has to survive
# unquoted, while the 'curve' left behind by `\mathrm{curve}` has to be quoted -- Typst reads an
# unquoted word as a variable and fails the compile.
SYMBOL_MARK = re.compile(r"(\x01[^\x01\x02]*\x02)")
ALLOWED_WORDS = {"infinity"}


def quote_words(tex):
    """Quote every letter run that is prose, leaving a marked symbol spelling alone."""
    return "".join(p[1:-1] if p[:1] == "\x01" else _quote_run(p)
                   for p in SYMBOL_MARK.split(tex))


def _quote_run(tex):
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


MATH_WORD = re.compile(r"\\([a-zA-Z]+)\s*(\{((?:[^{}]|\{[^{}]*\})*)\})?")
# a thin space is not a control word, so it cannot go through the lookup
MATH_SPACING = {r"\,": " ", r"\;": " ", r"\!": ""}


def _math_body(tex):
    r"""One '$...$' span -> Typst math, or quoted text when the mapping is unsafe.

    A control word is matched whole, because a substring rewrite once read `\xrightarrow` as a
    deleted `x` fused with `arrow.r` and turned `\zeta \in` into `zetain`; every replacement
    also leaves a space for whatever follows it. A word with no spelling is remembered, and when
    nothing else survives the words themselves become the label: an empty one deletes the node
    that carries it, and a visible-but-imperfect label is the better failure.
    """
    unknown = []

    def one(m):
        got = MATH_SYMBOLS.get("\\" + m.group(1))
        if got is None:
            unknown.append(m.group(1))
            # the command's name goes and its argument stays, but Typst prints the braces the name
            # came off: `\underline{\mathbb{Q}}` reached the page as `{ {Q}}`. The argument is
            # walked the same way, since re.sub does not rescan a replacement.
            return " %s " % (unwrap(m.group(3)) if m.group(3) is not None else "")
        # spaces on both sides: the match swallows whatever spacing followed the command,
        # so 'h\longrightarrow 0' with only a trailing space reads 'harrow.r.long' and
        # quote_words then quotes the fused pair as one name
        return " \x01%s\x02 %s " % (got, unwrap(m.group(3)) if m.group(3) is not None else "")

    def unwrap(arg):
        return MATH_WORD.sub(one, arg)

    tex = MATH_WORD.sub(one, tex)
    for src, dst in MATH_SPACING.items():
        tex = tex.replace(src, dst)
    tex = tex.replace("{}", "").replace('"', "")
    # a brace survives only as the group a sub/superscript takes, or as an escaped `\{` the author
    # meant as a character: Typst has no grouping braces in maths and prints the ones it is handed,
    # so `\frac{K}{K_0}`'s second argument came out as `{K_0}`
    while True:
        stripped = re.sub(r"(?<![\^_\\])\{([^{}]*)\}", r"\1", tex)
        if stripped == tex:
            break
        tex = stripped
    while tex[:1] in ("_", "^"):
        tex = tex[1:]
    while tex[-1:] in ("_", "^"):
        tex = tex[:-1]
    if not tex.strip():
        tex = " ".join(unknown)
    # a symbol's replacement arrives with spaces on both sides, so `\alpha_r` reads 'alpha _r' here
    # and Typst takes a spaced underscore for a subscript with no base; the space is ours, not the
    # author's maths
    tex = re.sub(r"\s+([_^])", r"\1", tex)
    # Typst prints the braces a grouped script carries: measured on one page, `$a_{0}$` reaches it
    # as `a_{0}` while `$a_0$` and `$a_12$` set clean subscripts. Only a single atom is unwrapped --
    # a compound group would attach its first atom alone and leave the rest on the line.
    tex = re.sub(r"([\^_])\{([A-Za-z0-9]+)\}", r"\1\2", tex)
    tex = quote_words(tex.strip())
    if math_safe(tex):
        return tex
    return '"%s"' % re.sub(r"[\"$\\]", "", tex.strip())


LINEBREAK = re.compile(r"\\\\\s*(?:\[[^\]]*\])?")
TEXTCOLOR = re.compile(r"\\textcolor\s*\{([^{}]*)\}\s*(\{(?:[^{}]|\{[^{}]*\})*\})")


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


def node_text(inner, pal=None):
    r"""A TikZ node body -> Typst markup: '$...$' stays math, '\\' breaks the line.

    A colour written on the text itself is read the way a stroke colour is, because the
    markup pass below deletes command names and would leave the specification standing on
    the page as words; a colour it cannot model refuses the body rather than mis-inking it.
    """
    marks, keep = [], re.sub(r"\$\$", "$ ", inner)
    while True:
        m = TEXTCOLOR.search(keep)
        if not m:
            break
        keep = keep[:m.start()] + chr(1) + str(len(marks)) + chr(2) + keep[m.end():]
        marks.append(m.groups())
    if re.search(r"\\textcolor", keep):
        return None
    out, pos = [], 0
    for m in re.finditer(r"\$([^$]*)\$", keep):
        out.append(_prose(keep[pos:m.start()]))
        body = _math_body(m.group(1))
        out.append("$" + body + "$" if body else "")
        pos = m.end()
    out.append(_prose(keep[pos:]))
    text = re.sub(r"\s+", " ", "".join(out)).strip()
    for i, (spec, payload) in enumerate(marks):
        c = color(spec, pal)
        inner_text = node_text(payload[1:-1], pal) if c is not None else None
        if inner_text is None:
            return None
        text = text.replace(chr(1) + str(i) + chr(2),
                            "#text(fill: %s)[%s]" % (c, inner_text))
    return text

FOREACH = re.compile(r"\\foreach\s+(\\[\w]+(?:\s*/\s*\\[\w]+)*)\s*(\[[^\]]*\])?\s+in\s+")


FOREACH_EVAL = re.compile(r"evaluate\s*=\s*(\\[\w]+)\s+as\s+(\\[\w]+)\s+using\s+"
                          r"(\{(?:[^{}]|\{[^{}]*\})*\}|[^\s,\]]+)")


def _count_option(text):
    """[count=\\i from 0] -> (name, first); False when the option needs pgfmath."""
    if not text:
        return None
    inner = text[1:-1]
    if re.search(r"\b(?:remember)\b", inner):
        return False
    m = re.search(r"count\s*=\s*\\([\w]+)\s*(?:from\s*(-?\d+))?", inner)
    return (m.group(1), int(m.group(2) or 1)) if m else None


def _evaluate_option(text):
    """[evaluate=\\j as \\i using int(\\j-1)] -> (source, target, expression).

    pgf evaluates the expression once per iteration with the loop's own values written into it,
    which is the same arithmetic the coordinate reader already does; an evaluate clause we cannot
    read still refuses the picture rather than unrolling it with a stale number.
    """
    if not text:
        return None
    inner = text[1:-1]
    if "evaluate" not in inner:
        return None
    m = FOREACH_EVAL.search(inner)
    return (m.group(1), m.group(2), m.group(3)) if m else False


def _pgf_num(value):
    """A number the way pgf writes one: 2 rather than 2.0, because names are made of these."""
    return str(int(value)) if float(value).is_integer() else "%g" % value


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
        # measured against pdflatex (`_work/foreach_multi_probe.pdf`): an item carrying more
        # components than the loop has variables drops the extras, and one carrying fewer repeats
        # its last component into the rest -- `\foreach \a/\b in {p}` binds both names to p.
        if len(parts) < nvars:
            parts += [parts[-1]] * (nvars - len(parts))
        out.append(tuple(parts[:nvars]))
        items = items[1:]
    return out or None


PGFMATH_DEF = re.compile(r"\\pgfmath(set|truncate)macro\*?\s*\{\s*(\\[a-zA-Z]+)\s*\}\s*")


def _values_of(text, values):
    """Write the numbers a picture already computed back into an expression."""
    for name, val in values.items():
        text = re.sub(re.escape(name) + r"(?![a-zA-Z])", val, text)
    return text


DEF_NUMERIC = re.compile(r"\\def\\([a-zA-Z]+|.)\s*\{([-+]?[0-9]*\.?[0-9]+)\}")


def expand_numeric_defs(body):
    r"""\def\name{0.866} for a plain number folded away, everything else left in place.

    A drawing that spells out a constant by hand is arithmetic we already do, and its name is
    then a number the coordinate reader parses. A \def with parameters or a text body stays
    exactly where it was, for UNSUPPORTED to refuse as it did before this function existed.
    """
    for _ in range(16):
        m = DEF_NUMERIC.search(body)
        if not m:
            return body
        body = body[:m.start()] + body[m.end():]
        body = re.sub(r"\\" + re.escape(m.group(1)) + r"(?![a-zA-Z])", m.group(2), body)
    return body


def expand_pgfmath(body):
    r"""\pgfmathsetmacro{\a}{expr} and \pgfmathtruncatemacro evaluated and folded away.

    pgfmath is the arithmetic TikZ drawings do by hand, and its expressions are the same ones the
    coordinate reader already parses. A definition whose expression still names something unknown
    refuses the picture, as it did while these two commands sat in UNSUPPORTED.
    """
    values = {}
    for _ in range(64):
        m = PGFMATH_DEF.search(body)
        if not m:
            for name, val in values.items():
                body = re.sub(re.escape(name) + r"(?![a-zA-Z])", val, body)
            return body
        pos = m.end()
        if body[pos:pos + 1] != "{":
            return None
        text, pos = bracketed(body, pos)
        if text is None:
            return None
        val = expr(_values_of(text, values))
        if val is None:
            return None
        if m.group(1) == "truncate":
            values[m.group(2)] = "%d" % int(round(val))
        else:
            values[m.group(2)] = "%.5g" % val
        if body[pos:pos + 1] == ";":
            pos += 1
        body = body[:m.start()] + body[pos:]
    return None


IFNUM = re.compile(r"\\ifnum\s*")
TERM_END = set(" \t\n=<>{}/\\")
COND_TOKEN = re.compile(r"\\if[a-zA-Z]*|\\fi\b|\\else\b|\\or\b")


def _int_term(text, i):
    """One integer operand of \\ifnum -> (value, index after it); None when it is not arithmetic."""
    j = i
    while j < len(text) and text[j] not in TERM_END:
        j += 1
    val = expr(text[i:j])
    return (None, i) if val is None else (val, j)


def _cmp(op, a, b):
    return a < b if op == "<" else a > b if op == ">" else a == b


DEF_PATH = re.compile(r"\\def\\([A-Za-z]+)\s*(\{((?:[^{}]|\{[^{}]*\})*)\})")


def _substitute_cs(text, name, value):
    r"""Write a control sequence as its expansion, reading the name the way TeX does.

    A control word stops at the first non-letter, so `\i2` is `\i` followed by `2` rather than a longer
    name, and the blanks that delimited the word are swallowed on the way out: a loop body that writes
    `(\tag v1)` with \tag = a names the node `av1`, which is the name the author's later
    `\draw (av1)` uses. Measured with pdflatex -- `_work/space_after_macro_probe.log` compiles clean,
    and an undefined-coordinate warning there is the only way this rule could be wrong.
    """
    return re.sub(r"\\%s(?![A-Za-z])[ \t]*" % re.escape(name), lambda _m, v=value: v, text)


def expand_def(body):
    r"""Write a picture's own parameter-free macros back as the text they stand for.

    `\def\wall{(4,0)--(4,1)--cycle}` and then `\fill[black!14] \wall;` is the author's own path, and
    TeX expands the name before pgf ever reads the statement, so substituting it draws what was meant.
    Numeric constants go through `expand_numeric_defs` first: a name holding `0.866` is arithmetic the
    coordinate reader can do, and it is the same fold with a shorter pattern.
    A macro that takes `#1` needs an argument list we would have to guess, and a guess draws lines the
    author never had, so those definitions and their uses are left for the refusal path.
    """
    body = expand_numeric_defs(body)
    plain = {m.group(1): m.group(3) for m in DEF_PATH.finditer(body) if "#" not in m.group(3)}
    if not plain:
        return body
    body = DEF_PATH.sub(lambda m: "" if m.group(1) in plain else m.group(0), body)
    for name, val in plain.items():
        body = _substitute_cs(body, name, val)
    return body


def expand_ifnum(body):
    r"""Resolve the \ifnum conditionals a picture has settled into plain numbers.

    A comparison inside a \foreach becomes decidable once expand_foreach has written
    the loop variables back as digits: the branch the paper drew is then a fact, so we
    keep it and drop the shell. An operand we cannot turn into a number is a branch we
    would have to guess, and a guess draws lines the author never had, so the whole
    picture is refused instead.
    """
    for _ in range(64):
        m = IFNUM.search(body)
        if not m:
            return body
        lhs, i = _int_term(body, m.end())
        while i < len(body) and body[i] in " \t\n":
            i += 1
        if lhs is None or i >= len(body) or body[i] not in "=<>":
            return None
        op, i = body[i], i + 1
        rhs, i = _int_term(body, i)
        if rhs is None:
            return None
        while i < len(body) and body[i] in " \t\n":
            i += 1
        if body.startswith("\\relax", i) and not body[i + 6:i + 7].isalpha():
            i += 6
        depth, else_at, j = 1, -1, i
        while j < len(body):
            tok = COND_TOKEN.search(body, j)
            if tok is None or tok.group(0) == "\\or":
                return None
            if tok.group(0).startswith("\\if"):
                depth += 1
            elif tok.group(0) == "\\fi":
                depth -= 1
                if depth == 0:
                    break
            elif tok.group(0) == "\\else" and depth == 1 and else_at < 0:
                else_at = tok.start()
            j = tok.end()
        if depth != 0:
            return None
        then_to = else_at if else_at >= 0 else tok.start()
        taken = body[i:then_to] if _cmp(op, lhs, rhs) else (
            body[else_at + 5:tok.start()] if else_at >= 0 else "")
        body = body[:m.start()] + taken + body[tok.end():]
    return None


CLIP_STMT = re.compile(r"\\clip\b(?:\s*\[[^\]]*\])?\s*[^;]*;")


TIKZSET = re.compile(r"\\tikzset\s*")


def expand_tikzset(body):
    r"""Fold a `/.style` table declared inside the picture and drop the statement.

    A flowchart whose styles only matter mid-body writes
    `\tikzset{bit/.style={circle,draw,minimum size=5pt}, every node/.style={font=...}}`. The
    statement draws nothing, so once its table is read it leaves the body -- where an unknown verb
    refused the whole picture and left the reader a block of quoted LaTeX.

    Only a statement that is *nothing but* style declarations is folded: a `\tikzset{line width=2pt}`
    also sets a picture-wide default we cannot honour, and dropping it would draw the figure in the
    wrong ink, so it stays and refuses as it always did.
    """
    out = {}
    i = 0
    while True:
        m = TIKZSET.search(body, i)
        if not m:
            return out, body
        j = skip_spaces(body, m.end())
        if body[j:j + 1] != "{":
            return out, body
        inner, end = bracketed(body, j)
        if inner is None:
            return out, body
        spec = opts(inner)
        if not spec or not all(key.endswith("/.style") for key in spec):
            i = end
            continue
        out.update(picture_styles(spec))
        if body[end:end + 1] == ";":
            end += 1
        body = body[:m.start()] + body[end:]
        i = m.start()


PAGE_SHARE = re.compile(r"([-+]?\d*\.?\d*)\s*\\(?:linewidth|textwidth|columnwidth)")
PAGE_MACRO = re.compile(r"\\(?:linewidth|textwidth|columnwidth)")


def expand_linewidth(text, line_cm):
    r"""Fold a fraction of the text column into one dimension: `.98\linewidth` -> `15.4733cm`.

    A picture whose axes read `x=.98\linewidth` sizes the drawing to the column the paper ships, and that
    column is ours to know: we emit the page it lands on. Until it is a number a dimension carrying a
    macro is unreadable, which refused the whole picture -- axes and every `text width=` in its nodes.
    """
    if line_cm is None:
        return text

    def one(m):
        num = m.group(1)
        share = float(num) if num not in ("", "+", "-") else 1.0
        return "%.4fcm" % (share * line_cm)

    return PAGE_MACRO.sub("%.4fcm" % line_cm, PAGE_SHARE.sub(one, text))


def drop_clips(body):
    r"""Remove the \\clip statements so the rest of the picture gets to draw.

    A clip path draws nothing in TikZ; its whole job is to cut what comes after it, and no CeTz
    canvas can be cut once it is placed. Dropping the statement leaves an author's figure intact
    but uncropped, where refusing it left the reader a block of quoted LaTeX instead.
    """
    return CLIP_STMT.sub("", body)


def _top_semicolon(text, start):
    """Where the statement opening at `start` ends: the first `;` at brace depth 0.

    TikZ lets a loop body be one statement instead of a brace group, and that statement may itself
    be a `\foreach` with its own `{...;...}`.  Stopping at the first `;` found would cut that inner
    group in half and leave the unrolled body with an unclosed brace.
    """
    depth = 0
    for i in range(start, len(text)):
        char = text[i]
        if char == "{":
            depth += 1
        elif char == "}":
            if depth == 0:
                return -1
            depth -= 1
        elif char == ";" and depth == 0:
            return i
    return -1


def _statement(text, start):
    """The one TikZ statement beginning at `start`, as (text, index after it).

    A loop body can be a single statement instead of a brace group, and that statement can itself
    be a `\foreach` chain.  Reading such a body to the next `;` runs past the loop that owns it,
    because a nested chain's own `;` sits inside its group: it then swallows the sibling loops that
    follow in the picture and substitutes this loop's values into their headers.
    """
    gap = text[start:].lstrip()
    pos = start + len(text[start:]) - len(gap)
    if gap[:1] == "{":
        return bracketed(text, pos)
    m = FOREACH.match(text, pos)
    if m:
        pos = m.end()
        if text[pos:pos + 1] == "{":
            _, pos = bracketed(text, pos)
        else:
            brace = text.find("{", pos)
            if brace < 0:
                return None, start
            pos = brace
        inner, pos = _statement(text, pos)
        if inner is None:
            return None, start
        rest = text[pos:].lstrip()
        if rest[:1] == ";":
            pos += len(text[pos:]) - len(rest) + 1
        return text[start:pos], pos
    semi = _top_semicolon(text, pos)
    if semi < 0:
        return None, start
    return text[pos:semi + 1], semi + 1


def expand_foreach(body):
    """Unroll \\foreach loops; None when a form needs pgfmath we do not have."""
    for _ in range(64):
        m = FOREACH.search(body)
        if not m:
            return body
        # leftmost, i.e. outermost, first: a nested list can name the outer loop's own variable
        # (`\foreach \column in {1,...,\width}`), which only becomes readable once the outer loop
        # has substituted \width.
        vars_ = [v.strip() for v in m.group(1).split("/")]
        count = _count_option(m.group(2))
        if count is False:
            return None
        ev = _evaluate_option(m.group(2))
        if ev is False:
            return None
        pos = m.end()
        if body[pos:pos + 1] == "{":
            spec, pos = bracketed(body, pos)
            if spec is None:
                return None
        else:
            # `\foreach \i in \list {...}`: TeX expands \list to its replacement text, which
            # carries no braces of its own, so the list runs up to the loop body's opening brace.
            brace = body.find("{", pos)
            semi = _top_semicolon(body, pos)
            if brace < 0 or (0 <= semi < brace):
                return None
            spec, pos = body[pos:brace].strip(), brace
        loop, pos = _statement(body, pos)
        if loop is None:
            return None
        values = _loop_values(spec, len(vars_))
        if values is None:
            return None
        chunks = []
        for n, vals in enumerate(values):
            piece = loop
            for var, val in zip(vars_, vals):
                piece = _substitute_cs(piece, var[1:], val)
            if ev:
                src = ev[2].strip("{}")
                for var, val in zip(vars_, vals):
                    src = _substitute_cs(src, var[1:], val)
                num = expr(src)
                if num is None:
                    return None
                piece = _substitute_cs(piece, ev[1][1:], _pgf_num(num))
            if count:
                piece = _substitute_cs(piece, count[0], str(count[1] + n))
            chunks.append(piece)
        body = body[:m.start()] + "".join(chunks) + body[pos:]
    return None


# CeTz names its border anchors with hyphens (`north-west`, anchor.typ's named-border-anchors) where
# TikZ writes the corners with a space, so every name below is in the spelling we emit.
TIKZ_ANCHORS = {"north", "south", "east", "west", "center", "north-east", "north-west",
                "south-east", "south-west"}
# a bare direction word says which side of the point the node stands on, which is the opposite
# corner of the box pinned there: `above` puts the box's south point on the coordinate
SIDE_ANCHOR = {"above": "south", "below": "north", "right": "west", "left": "east",
               "above right": "south-west", "above left": "south-east",
               "below right": "north-west", "below left": "north-east"}


def _node_anchor(o):
    """Which point of the node TikZ pins to its coordinate -> CeTz's `anchor` argument.

    Only a node sized by its own text has an unambiguous answer: a framed node whose range the author
    wrote down is already placed by that range, and one whose frame hugs the text cannot be moved by
    half a height we never measure.
    """
    fixed = o.get("anchor")
    if fixed is not None and fixed is not True:
        name = str(fixed).strip().replace(" ", "-")
        return 'anchor: "%s"' % name if name in TIKZ_ANCHORS else None
    for word, name in SIDE_ANCHOR.items():
        if o.get(word) is True:
            return 'anchor: "%s"' % name
    return None


def box_args(o, pal):
    """The Typst `box` arguments that carry a node's frame: padding, corners, stroke.
    A frame the author asked for but did not size is drawn by Typst, which knows the text's box;
    only the look of the border is ours to translate."""
    framed = ["inset: 0.3333em"]
    rc = o.get("rounded corners")
    if rc is True:
        framed.append("radius: 4pt")  # pgf's default corner, written in pt like the inset
    elif rc is not None:
        cm = _length(str(rc), IDENT)
        if cm is not None:
            framed.append("radius: %.4gpt" % (cm * 28.346))
    framed += (stroke_args(o, pal, bare=True)
               or ["stroke: (thickness: 0.4pt)"])
    return framed


def grown_box(box, text, args):
    """A sized range re-emitted with Typst measuring its height.

    Returns None unless the range reads as four plain numbers, so a coordinate we cannot
    evaluate keeps the caller's fixed-rectangle spelling.
    """
    m = re.fullmatch(r"\(\s*([^,()]+?),\s*([^,()]+?)\s*\)\s*,\s*"
                     r"\(\s*([^,()]+?),\s*([^,()]+?)\s*\)", box.strip())
    if m is None:
        return None
    try:
        x1, y1, x2, y2 = (float(v) for v in m.groups())
    except ValueError:
        return None
    return ("content((%.4g, %.4g), [#box(width: %.4gcm, %s, "
            "[#set text(hyphenate: false); #align(center)[%s]])])"
            % ((x1 + x2) / 2, (y1 + y2) / 2, abs(x2 - x1), ", ".join(args), text))


def emit_node(at, inner, o, pal=None, box=None, angle=0.0):
    """A TikZ node -> the CeTz lines that draw it.

    `box` is the '(x1, y1), (x2, y2)' pair of a node whose size the author wrote down; with it the
    rectangle the node really is gets drawn, where an unknown size leaves the text at its centre.
    """
    kw = []
    c = color_option(o, pal, ("fill",), bare=False)
    if c:
        kw.append("fill: " + c)
    text = node_text(inner, pal)
    if text is None:
        return None
    if text and angle:
        # Typst measures rotate() clockwise on the page, TikZ and CeTz counter-clockwise. The name
        # has to come from outside the canvas: `import cetz.draw: *` shadows Typst's rotate with
        # CeTz's coordinate rotate, and a call the canvas cannot resolve prints its own source.
        text = "#page_rotate(%.4gdeg)[%s]" % (-angle, text)
    if not text:
        if kw:
            return ["circle(%s, radius: 0.05, %s)" % (at, ", ".join(kw))]
        return []
    if box:
        shape = "circle" if o.get("circle") is True else "rect"
        if shape == "rect" and "#linebreak()" in text:
            # A size the author wrote down is a MINIMUM in TikZ: `minimum height=1cm` grows around a
            # two-line label, while CeTz's `content(range, ..., frame:)` paints exactly that range and
            # the second line walks out through its own bottom border. Typst does know the text's
            # height, so the frame is given the declared width and left free vertically. TikZ centres
            # a node's lines and `box` has no `align:` argument, so the centring is a call; where the
            # width does force a break TeX takes it at a space, so Typst's hyphenation is off.
            grown = grown_box(box, text, box_args(o, pal) + kw)
            if grown:
                return [grown]
        framed = ["frame: \"%s\"" % shape] + kw + stroke_args(o, pal, bare=True)
        return ["content(%s, [%s]%s)" % (box, text, ", " + ", ".join(framed))]
    if box_visible(o):
        # The author fixed a frame but left the size to the text, and we cannot measure glyphs:
        # Typst's `box` strokes the layout box of its own content, so the frame comes back hugging
        # what the node says.
        return ["content(%s, [#box(%s, [%s])])"
                % (at, ", ".join(box_args(o, pal) + kw), text)]
    ink = color_option(o, pal, bare=True)
    if ink:
        # a colour written bare on an unframed node inks its text; on a framed one it strokes the
        # frame, which is the branch above, and TikZ reads the same option group that way
        text = "#text(fill: %s)[%s]" % (ink, text)
    args = [at, "[%s]" % text]
    side = _node_anchor(o)
    if side:
        kw.append(side)
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
    return (rx * _ux(xf), ry * _uy(xf)) if user else (rx, ry)


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


def _rel_pair(text, i, names, xf):
    """A `+(dx,dy)` control offset -> (the offset in page cm, index after it), or (None, i).

    Measured by `_work/measure_relcontrols.py` under `x=1cm, y=2cm`: a unit-less pair is read along
    the scope's own axes and one written with units is absolute — which is what `point` already does
    for a coordinate, so the offset is that point taken away from the origin it was mapped through.
    """
    while i < len(text) and text[i] in " \t\n":
        i += 1
    if text[i:i + 1] != "+":
        return None, i
    end = paren_span(text, i + 1)
    if end is None:
        return None, i
    p = point(text[i + 1:end], None, names, xf)
    if p is None:
        return None, i
    ox, oy = _origin(xf)
    return ("rel", p[0] - ox, p[1] - oy), end


def _controls_at(text, i, names, xf):
    """One entry of `.. controls ..`: a relative offset, or the absolute coordinate."""
    off, j = _rel_pair(text, i, names, xf)
    return (off, j) if off is not None else _coord_at(text, i, names, xf)


def _control(base, c):
    """The point a control entry names, taken off `base` when it was written relative."""
    return base if c is None else ((base[0] + c[1], base[1] + c[2]) if c[0] == "rel" else c)


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
        # 'right=of reset' is a placement, not a missing coordinate: the two boxes and the
        # gap between them are all numbers the author wrote down
        size = node_size(o or {}, xf)
        for key, val in (o or {}).items():
            got = placed_at(key, val, names, xf, size)
            if got is not None:
                return name, got, rest
        if POSITIONED.search(" ; ".join("%s=%s" % (k, v) for k, v in (o or {}).items())):
            return None
        return name, _origin(xf), rest
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


def _tangent_controls(a, b, angles, loose=1.0):
    """Control points for TikZ `to[out=α,in=β]`, both 0.39 of the chord along the tangent.

    Measured out of a pdflatex render (`_work/measure_tangent_table.py`,
    `_work/measure_tangent_dir.py`): the factor is 0.39, and the angle a missing key stands for is
    an absolute page direction, 45 at the start and 135 at the end, the same whatever the chord's
    own direction is. So `to[out=30]` still curves at the far end instead of arriving straight.
    `looseness` scales that length and nothing else (`_work/measure_looseness.py` reads 0.39·L at
    the control points for L=0.5, 2 and 5), so the two endpoints move together along their tangents.
    """
    dx, dy = b[0] - a[0], b[1] - a[1]
    length = math.hypot(dx, dy)
    if length == 0:
        return None
    off = length * 0.39 * loose
    out = []
    for at, ang, fallback in ((a, angles[0], 45.0), (b, angles[1], 135.0)):
        rad = math.radians(fallback if ang is None else ang)
        out.append((at[0] + math.cos(rad) * off, at[1] + math.sin(rad) * off))
    return tuple(out)


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


GRID_LIMIT = 120


def _grid_step(o, key, xf):
    r"""One spacing of a grid, in cm.

    Measured against pdflatex: the initial step is 1cm however the axes are scaled, a
    step with a unit keeps that length, and a bare number ('step=1') counts units of its
    own axis, so 'x=.52cm, step=1' spaces the lines .52cm apart.
    """
    val = o.get(key, o.get("step"))
    if val is None:
        return 1.0
    got = _size(str(val))
    if got is None:
        return None
    scale = _uy(xf) if key == "ystep" else _ux(xf)
    return got[0] * scale if got[1] else got[0]


def grid_lines(a, b, o, xf, sa):
    r"""'(0,0) grid (7,-7)' -> one line per step, placed as TikZ places them.

    The lattice is anchored to the coordinate system's origin, not to the corners, so a
    grid running from (.3,.2) still draws at 1, 2 and 3; a spacing that would need more
    than GRID_LIMIT strokes is a texture, and we refuse it rather than hand over a
    picture of three hundred lines. The net is laid out in the scope's own coordinates and
    each stroke is then carried through the transform, so a tilted frame gives a turned
    lattice instead of a refusal.
    """
    lo_corner, hi_corner = _unmap(xf, a), _unmap(xf, b)
    if lo_corner is None or hi_corner is None:
        return None
    ux, uy = _ux(xf), _uy(xf)
    if not ux or not uy:
        return None
    sx, sy = _grid_step(o, "xstep", xf), _grid_step(o, "ystep", xf)
    if not sx or not sy:
        return None
    # _grid_step answers in cm on the page; the lattice counts the scope's own units
    x0, x1 = sorted((lo_corner[0], hi_corner[0]))
    y0, y1 = sorted((lo_corner[1], hi_corner[1]))
    out = []
    for step, scale, lo, hi, other, axis in ((sx, ux, x0, x1, (y0, y1), 0),
                                             (sy, uy, y0, y1, (x0, x1), 1)):
        step = step / scale
        if hi - lo > step * GRID_LIMIT:
            return None
        k = math.ceil(lo / step - 1e-9)
        while k * step <= hi + 1e-9:
            pos = k * step
            seg = ((pos, other[0]), (pos, other[1])) if axis == 0 \
                else ((other[0], pos), (other[1], pos))
            out.append(_render(("poly", [_apply(xf, x, y) for x, y in seg]),
                               False, None, sa, None))
            k += 1
    return out


PLOT_SMOOTH_MIN = 8


def _plot_operand(rest, pos):
    """The expression(s) after plot[...] -> ((x expr, y expr) or (None, y expr), end)."""
    head = rest[pos:pos + 1]
    if head == "{":
        inner, end = bracketed(rest, pos)
        return None if inner is None else ((None, inner.strip()), end)
    if head == "(":
        end = paren_span(rest, pos)
        if end is None:
            return None
        parts = [p.strip().strip("{}").strip() for p in split_top(rest[pos + 1:end - 1], ",")]
        if not parts or len(parts) > 2:
            return None
        return ((parts[0], parts[1]) if len(parts) == 2 else (None, parts[0])), end
    return None


def plot_points(rest, pos, names, xf, scope):
    r"""`plot` -> its points and the text after it; None when we would draw it wrong.

    Two operands are worth drawing: a written-out `coordinates { (0,0) (1,2) ... }` list, and a
    function or parametric pair over `domain=` with `samples=`. pgf joins dense samples with
    straight pieces, so `smooth` on a sample plot is the same polyline; on a handful of written
    points it is a spline, and that is not what a polyline gives, so it refuses.

    `scope` is the statement's own option list: papers write `domain=` and `samples=` on the
    `\draw` far more often than on the `plot`, and pgf reads them from either.
    """
    m = re.match(r"\s*plot\s*(\[[^\]]*\])?\s*", rest[pos:])
    if not m:
        return None
    po = {**scope, **opts(m.group(1)[1:-1])} if m.group(1) else dict(scope)
    keys = {str(k).strip() for k in po}
    if keys & {"only marks", "each", "mesh", "surfaces"} or any(
            k.startswith("mark") for k in keys):
        return None
    smooth = "smooth" in keys
    start = pos + m.end()
    lit = re.match(r"\s*coordinates\s*", rest[start:])
    if lit:
        inner, end = bracketed(rest, start + lit.end())
        if inner is None:
            return None
        pts = []
        for token in re.findall(r"\((?:[^()]|\([^()]*\))*\)", inner):
            p = point(token, None, names, xf)
            if p is None:
                return None
            pts.append(p)
        return None if len(pts) < (PLOT_SMOOTH_MIN if smooth else 2) else (pts, end)
    operand, end = _plot_operand(rest, start) or (None, None)
    var = str(po.get("variable") or "\\x").strip()
    dom = re.split(r"\s*:\s*", str(po.get("domain") or "").strip())
    if operand is None or len(dom) != 2 or not var.startswith("\\"):
        return None
    # a domain end may be a written expression (`1:sqrt(3)`), so read it the way the y-values are
    # read; a variable inside it would be a domain that depends on itself, which pgf does not do
    lo = expr(dom[0].replace(" ", ""))
    hi = expr(dom[1].replace(" ", ""))
    if lo is None or hi is None:
        return None
    n = max(2, int(float(po.get("samples") or 25)))
    if smooth and n < PLOT_SMOOTH_MIN:
        return None
    pts = []
    for i in range(n):
        t = lo + (hi - lo) * i / (n - 1)

        def value(src, _t="%.10g" % t):
            return expr(re.sub(re.escape(var) + r"(?![a-zA-Z])", _t, src))
        y = value(operand[1])
        x = t if operand[0] is None else value(operand[0])
        if x is None or y is None:
            return None
        pts.append(_apply(xf, x, y))
    return pts, end


def _along(a, b, t):
    return (a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t)


def _cubic_at(a, c1, c2, b, t):
    u = 1 - t
    return tuple(u * u * u * a[i] + 3 * u * u * t * c1[i] + 3 * u * t * t * c2[i]
                 + t * t * t * b[i] for i in range(2))


def _node_along(prev, p, t, seg):
    """The point an in-path node sits on: `t` of the way along the segment drawn between them."""
    if seg is None:
        return _along(prev, p, t)
    if seg[0] == "arc":
        _, center, rx, ry, a, b = seg
        rad = math.radians(a + (b - a) * t)
        return (center[0] + rx * math.cos(rad), center[1] + ry * math.sin(rad))
    _, start, c1, c2 = seg
    return _cubic_at(start, c1, c2, p, t)


PATH_POS = re.compile(r"^pos\s*=\s*(.+)$")


def _path_pos(no):
    """Where along its segment an in-path node goes; None when the author named no place.

    Measured against pdflatex (`_work/node_place_probe.pdf`): a node written at the end of a path
    sits on the last point drawn, and one written between two coordinates sits in the middle of the
    segment it introduces (`-- node {x} (B)`, the arrow-label idiom). A node written *before* its
    operator (`(A) node {x} -- (B)`) was measured on the point before it, which is not yet
    distinguished here -- the callers below read a None as their own default.
    """
    for key, val in no.items():
        flat = key.strip()
        if flat == "midway":
            return 0.5
        if flat == "near start":
            return 0.25
        if flat == "near end":
            return 0.75
        if flat == "at start":
            return 0.0
        if flat == "at end":
            return 1.0
        if flat == "pos":
            num = expr(str(val)) if val is not True else None
            return None if num is None else min(1.0, max(0.0, num))
        got = PATH_POS.match(flat)
        if got:
            num = expr(got.group(1))
            return None if num is None else min(1.0, max(0.0, num))
    return None


def translate_path(rest, verb, o, names, xf=IDENT, pal=None, styles=None):
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
    closed = rect_from = ctrl = bend = tangent = None
    grid_from = None
    # a node written between two coordinates belongs on the segment they join, and that segment's
    # far end is not parsed yet: hold the node here until it is, then draw it last so the text
    # sits over the line the way TikZ paints it
    pending = None
    done = None
    nodes = []
    join = "--"
    pos = 0

    # an `edge`'s own options -- `every edge/.style={draw,->,thick}` or the brackets written after
    # the word -- belong to the sub-path it starts, so they wait here for that segment to be built
    edge_style, edge_pending = {}, [None]

    def add(item):
        if edge_pending[0] is not None:
            edge_style[len(items)] = edge_pending[0]
            edge_pending[0] = None
        items.append(item)

    def flush():
        if len(poly) >= 2:
            add(("poly", list(poly)))
        del poly[:]

    while pos < len(rest):
        chunk = rest[pos:]
        seg = None
        m = re.match(r"\s*node\s*(\[[^\]]*\])?\s*(\[[^\]]*\])?\s*(?:\(([^()]*)\)\s*)?\{", chunk)
        if m:
            inner, end = bracketed(rest, pos + m.end() - 1)
            if inner is None:
                return None
            no = opts(m.group(1)[1:-1]) if m.group(1) else {}
            tilt = _node_tilt(no)
            off = _node_shift(no, xf)
            t = _path_pos(no)
            if tilt is None or off is None:
                return None
            prev = poly[-1] if poly else cursor
            if prev is not None:
                pending = (prev, t, no, inner, tilt, off, (m.group(3) or "").strip())
            pos = end
            continue
        m = re.match(r"\s*coordinate\s*(\[[^\]]*\])?\s*\(([^()]*)\)", chunk)
        if m:
            # an in-path `\coordinate` names a point on the segment just walked: `\path (A) -- (B)
            # coordinate[midway] (m)` has no node text, so nothing is drawn and only the name is
            # kept. A coordinate written before its segment exists cannot be placed -- the far end
            # is not parsed yet -- so that one is refused rather than guessed at.
            no = opts(m.group(1)[1:-1]) if m.group(1) else {}
            t = _path_pos(no) if no else 0.5
            if t is None or len(poly) < 2 or not m.group(2).strip():
                return None
            a, b = poly[-2], poly[-1]
            names[m.group(2).strip()] = (a[0] + t * (b[0] - a[0]),
                                         a[1] + t * (b[1] - a[1])) + node_size(no, xf)
            pos += m.end()
            continue
        m = re.match(r"\s*(?:circle|ellipse)\s*(?=[\[(])", chunk)
        if m:
            spec, end = _radius(rest, pos + m.end())
            center = cursor if cursor is not None else (poly[-1] if poly else None)
            if spec is None or center is None:
                return None
            rx, ry = _apply_size(spec, xf)
            if _turns(xf) and ry is not None and abs(rx - ry) > 1e-12:
                return None  # an ellipse has no turned form to emit
            tail = _style(fill, sa)
            items.append(("raw", "circle(%s, radius: %s%s)"
                          % (fmt(*center), _radius_arg(rx, ry), tail)))
            flush()
            # the path continues from the circle's centre, as TikZ carries it on: a node written
            # after `circle (...)` hangs there, and clearing the point dropped every dot label
            # of the form `\fill (x) circle (1.2pt) node[above left] {$M$};`
            cursor = center
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
        m = re.match(r"\s*grid\b\s*(?=[\[(])", chunk)
        if m:
            grid_from = cursor if cursor is not None else (poly[-1] if poly else None)
            if grid_from is None:
                return None
            flush()
            pos += m.end()
            continue
        m = re.match(r"\s*plot\s*(?=\[|\{|\()", chunk)
        if m:
            got = plot_points(rest, pos, names, xf, o)
            if got is None:
                return None
            # plot continues the path it sits on, so its points join the running polyline
            poly.extend(got[0])
            cursor, pos = None, got[1]
            continue
        m = re.match(r"\s*arc\s*(?=[\[(])", chunk)
        if m:
            spec = _arc_spec(rest, pos + m.end())
            start = cursor if cursor is not None else (poly[-1] if poly else None)
            if spec is None or start is None:
                return None
            a, b, srx, sry, user, end = spec
            if _turns(xf) and not _spins(xf):
                return None
            a, b = a + _slant(xf), b + _slant(xf)
            rx, ry = _apply_size((srx, sry, user), xf)
            rad = math.radians(a)
            center = (start[0] - rx * math.cos(rad), start[1] - ry * math.sin(rad))
            stop = math.radians(b)
            cursor = (center[0] + rx * math.cos(stop), center[1] + ry * math.sin(stop))
            flush()
            add(("arc", (start, a, b, _radius_arg(rx, ry))))
            seg = ("arc", center, rx, ry, a, b)
            pos = end
            continue
        m = re.match(r"\s*\.\.\s*controls\s*", chunk)
        if m:
            c1, i = _controls_at(rest, pos + m.end(), names, xf)
            m2 = re.match(r"\s*and\s*", rest[i:])
            if c1 is None or not m2:
                return None
            c2, i = _controls_at(rest, i + m2.end(), names, xf)
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
        # an `edge` carries its label as a node written before the target: `\path (A) edge node {x} (B)`
        m = re.match(r"\s*(?:to|edge)\s*(?=[\[(]|\+\+?|node\b)", chunk)
        if m:
            join, bend, tangent, pos = "--", None, None, pos + m.end()
            spec = {}
            if rest[pos:pos + 1] == "[":
                inner, end = bracketed(rest, pos)
                spec = opts(inner or "")
                angles = [None, None]
                loose = 1.0
                for key, val in spec.items():
                    flat = key.strip() + ("" if val is True else "=" + str(val))
                    got = re.fullmatch(r"bend\s+(left|right)\s*(?:=\s*(-?[\d.]+))?", flat)
                    if got:
                        bend = (-1 if got.group(1) == "left" else 1,
                                float(got.group(2) or 30))
                        continue
                    got = re.fullmatch(r"(out|in)\s*=\s*([-+]?\d*\.?\d+)", flat)
                    if got:
                        angles[0 if got.group(1) == "out" else 1] = float(got.group(2))
                        continue
                    got = re.fullmatch(r"looseness\s*=\s*([-+]?\d*\.?\d+)", flat)
                    if got:
                        loose = float(got.group(1))
                if any(a is not None for a in angles):
                    tangent = (tuple(angles), loose)
                pos = end
            # TikZ applies `every edge`/`every to` to each such sub-path, so a head or an ink declared
            # there belongs to this segment alone: a mixed `(a) -- (b) (c) edge (d)` must not head the
            # plain one, and the statement's own options stay the fallback for every other segment.
            name = "every edge" if m.group(0).strip().startswith("edge") else "every to"
            eo = {**((styles or {}).get(name) or {}), **spec}
            got = (arrow_mark(eo), stroke_args(eo, pal, bare=verb != "fill"))
            edge_pending[0] = got if got[0] or got[1] else None
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
            if grid_from is not None:
                strokes = grid_lines(grid_from, p, o, xf, sa)
                if strokes is None:
                    return None
                items.extend(("raw", s) for s in strokes)
                grid_from = None
            elif rect_from is not None:
                tail = _style(fill, sa)
                if _turns(xf):
                    lo, hi = _unmap(xf, rect_from), _unmap(xf, p)
                    if lo is None or hi is None:
                        return None
                    corners = [_apply(xf, x, y) for x, y in
                               ((lo[0], lo[1]), (hi[0], lo[1]),
                                (hi[0], hi[1]), (lo[0], hi[1]))]
                    items.append(("raw", "line(%s, close: true%s)"
                                  % (", ".join(fmt(*c) for c in corners), tail)))
                else:
                    items.append(("raw", "rect(%s, %s%s)"
                                  % (fmt(*rect_from), fmt(*p), tail)))
                rect_from = None
            elif ctrl is not None or bend is not None or tangent is not None:
                if start is None:
                    return None
                if ctrl is not None:
                    curve = (_control(start, ctrl[0]), _control(p, ctrl[1]))
                elif tangent is not None:
                    curve = _tangent_controls(start, p, *tangent)
                else:
                    curve = (_bend_control(start, p, bend),) * 2
                if curve is None or curve[0] is None:
                    return None
                flush()
                add(("bezier", (start, p) + tuple(curve)))
                seg = ("cubic", start, curve[0], curve[1])
                ctrl = bend = tangent = None
            elif join in ("-|", "|-") and start is not None:
                poly.append((p[0], start[1]) if join == "-|" else (start[0], p[1]))
                poly.append(p)
            else:
                if not poly and start is not None:
                    poly.append(start)
                poly.append(p)
            # the segment just walked, which is the one a node written at the end of the path sits on
            done = (start if start is not None else p, p, seg)
            if pending is not None:
                prev, t, no, inner, tilt, off, nm = pending
                base = _node_along(prev, p, 0.5 if t is None else t, seg)
                if nm:
                    names[nm] = (base[0] + off[0], base[1] + off[1]) + node_size(no, xf)
                for line in emit_node(fmt(base[0] + off[0], base[1] + off[1]), inner, no,
                                      pal, angle=_slant(xf) + tilt):
                    nodes.append(line)
                pending = None
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
    if pending is not None:
        # with no position key the node hangs off the last point drawn; `midway` and `pos=` place it
        # along the segment just walked -- both measured in _work/node_place_probe.pdf
        prev, t, no, inner, tilt, off, nm = pending
        if t is None:
            base = prev
        elif done is None:
            return None
        else:
            base = _node_along(done[0], done[1], t, done[2])
        if nm:
            names[nm] = (base[0] + off[0], base[1] + off[1]) + node_size(no, xf)
        for line in emit_node(fmt(base[0] + off[0], base[1] + off[1]), inner, no, pal,
                              angle=_slant(xf) + tilt):
            nodes.append(line)
    segs = [i for i, it in enumerate(items) if it[0] != "raw"]
    if not segs:
        return [it[1] for it in items if it[0] == "raw"] + nodes or None
    if fill and len(segs) > 1:
        # one filled outline spanning straight and curved pieces
        body = "; ".join(_render(items[i], False, None, [], None) for i in segs)
        merged = "merge-path({%s}, close: %s, fill: %s%s)" % (
            body, "true" if closed else "false", fill,
            (", " + ", ".join(sa)) if sa else "")
        return [merged] + [it[1] for it in items if it[0] == "raw"] + nodes
    out = []
    for i, it in enumerate(items):
        if it[0] == "raw":
            out.append(it[1])
            continue
        last = i == segs[-1]
        mk, sa_i = edge_style.get(i, (mark if last else None, sa))
        out.append(_render(it, bool(closed) and last, mk, sa_i,
                           fill if last or len(segs) == 1 else None))
    out.extend(nodes)
    return out or None


def translate_statement(stmt, names, xf=IDENT, pal=None, styles=None):
    m = re.match(r"\\(draw|filldraw|fill|path|node|coordinate)\b\s*", stmt)
    if not m:
        return None
    verb = m.group(1)
    o, pos = _opts_at(stmt, m.end())
    if o is None:
        return None
    if verb == "coordinate":
        return []
    if styles:
        o = resolve_opts(o, styles, verb == "node")
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
        tilt = _node_tilt(o)
        off = _node_shift(o, xf)
        if tilt is None or off is None:
            return None
        at = (at[0] + off[0], at[1] + off[1])
        size = node_size(o, xf)
        if name:
            names[name] = tuple(at) + size
        box = None
        if box_visible(o) and None not in size:
            box = "%s, %s" % (fmt(at[0] - size[0], at[1] - size[1]),
                              fmt(at[0] + size[0], at[1] + size[1]))
        # a node's own rotate= turns its contents about the anchor, leaving the placement alone
        return emit_node(fmt(*at), inner, o, pal, box, _slant(xf) + tilt)
    return translate_path(stmt[pos:], verb, o, names, xf, pal, styles)


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
        if stripped.count("$") % 2:
            return False
        # inside $ $ an interval is written [0,1) and a pair (s,t) on purpose, so a bracket
        # left open there is the paper's maths, not broken markup; only the Typst around the
        # maths has to balance
        plain = re.sub(r"\$[^$]*\$", "", stripped)
        if plain.count("[") != plain.count("]"):
            return False
        if plain.count("(") != plain.count(")"):
            return False
    return True


SCOPE = re.compile(r"\\(begin|end)\{scope\}")
AXES = ("x", "y", "z")
SCALES = ("scale", "xscale", "yscale")
MOVES = ("xshift", "yshift")


def _dim_cm(text):
    """A TikZ dimension in cm; a bare number is points, as pdflatex reads it."""
    got = _size(text)
    return None if got is None else (got[0] * UNITS["pt"] if got[1] else got[0])


ROTATE = re.compile(r"^\s*\{?\s*(-?[\d.]+)\s*(?:deg)?\s*"
                    r"(?:[:(=]\s*\(?\s*(-?[\d.]+)\s*,\s*(-?[\d.]+)\s*\)?\s*)?\}?\s*$")


def _basis_pair(val):
    """An axis option -> the (x, y) cm image of its unit, a scalar standing on that axis."""
    inside = val.strip().strip("{}")
    if inside.startswith("(") and inside.endswith(")"):
        parts = split_top(inside[1:-1], ",")
        if len(parts) != 2:
            return None
        got = [_dim_cm(p) for p in parts]
        return None if None in got else tuple(got)
    d = _dim_cm(inside)
    return None if d is None else (d,)


def _rotate_spec(val):
    """rotate=45 or rotate around={45:(1,2)} -> (degrees, centre or None); None if unreadable."""
    m = ROTATE.match(val.strip())
    if not m:
        return None
    ang = expr(m.group(1))
    if ang is None:
        return None
    if m.group(2) is None:
        return (ang, None)
    centre = point("(%s, %s)" % (m.group(2), m.group(3)), None)
    return None if centre is None else (ang, centre)


def _node_tilt(o):
    """The degrees a node's own options turn its text through; None if one cannot be read.

    TikZ turns a node's contents about its own anchor, so this is a text angle and never a
    placement. 'rotate around' also moves the node, which we have not measured, so it refuses.
    """
    angle = 0.0
    for key, val in o.items():
        if key.strip() not in ("rotate", "rotate around"):
            continue
        spec = _rotate_spec(val) if isinstance(val, str) else None
        if spec is None or spec[1] is not None:
            return None
        angle += spec[0]
    return angle


def _node_shift(o, xf):
    """The offset a node's own shift options give it, read the way a scope's shift is read.

    TikZ places the node where its coordinates say and then moves it, so this is a placement
    change only: it neither turns nor stretches the contents the way a scope's transform does.
    """
    moves = {k.strip(): v for k, v in o.items()
             if k.strip() in MOVES or k.strip() == "shift"}
    if not moves:
        return (0.0, 0.0)
    got = _transform(moves, xf)
    return None if got is None else (got[10], got[11])


def _axis_vector(pair, along):
    """One axis option -> its canvas vector; a bare dimension stands `along` that axis.

    Measured against pdflatex: `x=1.3cm` is (1.3, 0) and `y=1.3cm` (0, 1.3), but pgf writes a bare
    `z=1.3cm` into both components, (1.3, 1.3), which is not the direction of the default z.
    """
    return pair if len(pair) == 2 else (along[0] * pair[0], along[1] * pair[0])


def _transform(o, outer=IDENT):
    """Options that move the coordinate system -> a scope's matrix, axes and origin; None if unreadable.

    Measured against pdflatex (_work/probe_3d_basis.py, _work/probe_3d_order.py): 'shift' counts user
    units of the *enclosing* axes (so it is taken through outer's matrix), while 'xshift' and the axis
    lengths are absolute dimensions and 'scale' a factor. A scale or a 'rotate' turns the whole
    canvas, so it stretches all three axes whichever order the options come in and whether or not
    this scope mentions them; 'x={(a,b)}' and 'z={(0cm,1.5cm)}' write one axis as a vector of the
    canvas the page is measured in, and an axis the scope leaves out carries over from outer. A slant
    or a bare 'cm=' is a matrix we do not read and refuses. 'transform shape' only says nodes inherit
    the tilt, which is drawn by rotating the text.
    """
    ma = md = 1.0
    mb = mc = 0.0
    dx = dy = 0.0
    xx, xy, yx, yy, zx, zy = outer[4:10]
    for key, val in o.items():
        key = key.strip()
        if key == "transform shape":
            continue
        if key in ("xslant", "yslant", "cm"):
            return None
        if not isinstance(val, str):
            continue
        if key == "shift":
            got = point(val.strip().strip("{}"), None)
            if got is None:
                return None
            vx, vy = _delta(outer, got[0], got[1])
            dx, dy = dx + vx, dy + vy
        elif key in ("rotate", "rotate around"):
            spec = _rotate_spec(val)
            if spec is None:
                return None
            ang, centre = spec
            rad = math.radians(ang)
            ca, sa = math.cos(rad), math.sin(rad)
            ma, mb, mc, md = (ca * ma - sa * mc, ca * mb - sa * md,
                              sa * ma + ca * mc, sa * mb + ca * md)
            if centre is not None:
                px, py = _apply(outer, centre[0], centre[1])
                qx, qy = _apply(outer, centre[0] * ca - centre[1] * sa,
                                centre[0] * sa + centre[1] * ca)
                dx, dy = dx + px - qx, dy + py - qy
        elif key in SCALES or key in MOVES:
            d = expr(val) if key in SCALES else _dim_cm(val)
            if d is None:
                return None
            if key == "scale":
                ma, mb, mc, md = d * ma, d * mb, d * mc, d * md
            elif key == "xscale":
                ma, mc = d * ma, d * mc
            elif key == "yscale":
                mb, md = d * mb, d * md
            elif key == "xshift":
                dx += d
            else:
                dy += d
        elif key in AXES:
            pair = _basis_pair(val)
            if pair is None:
                return None
            if key == "x":
                xx, xy = _axis_vector(pair, (1.0, 0.0))
            elif key == "y":
                yx, yy = _axis_vector(pair, (0.0, 1.0))
            else:
                zx, zy = _axis_vector(pair, (1.0, 1.0))
    return (ma, mb, mc, md, xx, xy, yx, yy, zx, zy, dx, dy)


def _compose(outer, inner):
    """Combine two transforms: the matrices multiply, the inner scope's own axes carry on.

    TikZ reads an 'xshift' as a real length regardless of the enclosing axis scales (measured
    against pdflatex), so a scope's own shift arrives already in cm and is not transformed again.
    The axes stay out of the product for the same reason: a nested `x=1cm` lands one centimetre of
    page away even inside a 3D basis, and the matrix the scope is entered by still stretches it
    (_work/probe_3d_basis.py, _work/probe_3d_order.py).
    """
    oa, ob, oc, od = outer[:4]
    ia, ib, ic, id_ = inner[:4]
    return (oa * ia + ob * ic, oa * ib + ob * id_,
            oc * ia + od * ic, oc * ib + od * id_,
            inner[4], inner[5], inner[6], inner[7], inner[8], inner[9],
            inner[10] + outer[10], inner[11] + outer[11])


def _walk_scopes(body, xf, out):
    """Collect (statement, transform) pairs; False on a scope we cannot read."""
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


CD_ENV = re.compile(r"\\begin\{tikzcd\}(\[[^\]]*\])?(.*?)\\end\{tikzcd\}", re.S)
CD_ARROW = re.compile(r"\\(?:arrow|ar)(?![a-zA-Z])\s*"
                      # an option list may hold a bracket of its own inside a quoted label,
                      # as in \arrow[d,"{[f/\phi]^*}"], so one level of nesting is allowed
                      r"(?:\[((?:[^\[\]]|\[[^\]]*\])*)\])?\s*'?")
CD_LABEL = re.compile(r'"((?:[^"\\]|\\.)*)"')
# a brace group written right after a quoted label holds that label's own keys, as in
# \arrow[r,"text"{yshift=3pt}] or \arrow[dr,"f"{swap}]: it belongs to the label, not to the
# arrow, and a measurement inside it would be read as an arrow option we cannot place.
CD_LABEL_KEY = re.compile(r'("(?:[^"\\]|\\.)*")\s*\{([^{}]*)\}')
# one step per letter, added together: 'r' is a neighbour, 'rr' two across, 'rd' one
# diagonal; rows grow downwards, as they do on the page and in Typst's coordinates
CD_STEP = {"r": (1, 0), "l": (-1, 0), "u": (0, -1), "d": (0, 1)}
CD_HEAD = {"leftarrow": "start", "gets": "start", "to": "end", "rightarrow": "end"}
CD_SIZE = {"tiny": 1.4, "small": 2.0, "large": 3.2}
# marks we have not drawn against the compiler, and paths we cannot place on a grid.
# 'two heads' is drawn: the compile gate takes ">>" for the double tip at a line's end.
CD_REFUSE = re.compile(r"\b(?:tail|curve|shorten|shift|circle|"
                       r"triple|arrows|no arrows)\b")
CD_BEND = re.compile(r"bend\s+(?:left|right)(?:\s*=\s*\d+)?")
# texmath grows \bigl( and \bigr) with a #scale call; a canvas line cannot host a
# markup escape, so the delimiter keeps its shape and the sizing is dropped
CD_SCALE = re.compile(r"#scale\([^)]*\)\[((?:[^\[\]]|\[[^\]]*\])*)\]")


def cd_gap(head, key, default):
    """A named tikzcd separation in cm; an unknown dimension keeps the default."""
    m = re.search(key + r"\s*=\s*(\w+)", head)
    return CD_SIZE.get(m.group(1), default) if m else default


def cd_arrow(spec):
    """A tikzcd \\arrow option list -> a drawing recipe, or None if we cannot place it.

    A hook gets a straight barb at its tail and a bend a two-segment detour, because
    those are the shapes CeTz draws from lines we have compiled; anything needing a
    curve primitive or an unverified mark is refused instead of drawn wrong.
    """
    labels = CD_LABEL.findall(spec)
    if len(labels) > 2:
        return None
    # the label's keys join the option list only when they name a side we can set; a shift
    # or a colour is dropped with its braces rather than refused, since the label still reads
    spec = CD_LABEL_KEY.sub(lambda m: m.group(1) + (",swap"
                             if re.search(r"\bswap\b", m.group(2)) else ""), spec)
    rest = CD_LABEL.sub("", spec)
    got = {"step": None, "mark": "end", "dash": False, "skip": False, "side": 1,
           "hook": 0, "equal": False, "bend": 0, "double": False, "labels": labels}
    for opt in (p.strip() for p in split_top(rest, ",")):
        if not opt:
            continue
        if CD_REFUSE.search(opt):
            return None
        if opt and set(opt) <= set("rlud"):
            got["step"] = tuple(sum(CD_STEP[ch][ax] for ch in opt) for ax in (0, 1))
        elif opt in CD_HEAD:
            got["mark"] = CD_HEAD[opt]
        elif opt == "two heads":
            got["double"] = True  # tikzcd's >> tip on the end the arrow already has
        elif opt == "no head":
            got["mark"] = None
        elif opt in ("dashed", "dash"):
            got["dash"] = True
        elif opt == "phantom":
            got["skip"] = True
        elif opt == "swap" or opt in ("'", '"'):
            got["side"] = -got["side"]  # tikzcd's shorthand for the far side
        elif opt.startswith("hook"):
            got["hook"] = -1 if "right" in opt else 1
        elif opt == "equal":
            got["equal"], got["mark"] = True, None  # '=' is two lines, headless
        elif CD_BEND.fullmatch(opt):
            got["bend"] = -1 if "right" in opt else 1
        elif opt in ("above", "right"):
            got["side"] = 1
        elif opt in ("below", "left"):
            got["side"] = -1
        elif "=" in opt:
            return None
    if got["step"] is None and not got["skip"]:
        return None
    if got["step"] and not any(got["step"]):
        return None  # 'rl' cancels out; there is nowhere to draw the arrow
    return got


def cd_mark(arrow):
    """The trailing CeTz arguments that put one arrowhead on a line.

    A double tip is a second '>' on the same end: the compile gate takes ">>" and rejects
    the TikZ spellings '>->>' and '>->', so the glyph count is what carries the meaning.
    """
    extra = []
    if arrow["dash"]:
        extra.append('stroke: (dash: "dashed")')
    mark = arrow["mark"]
    if mark:
        tip = ">" if mark == "end" else "<"
        extra.append('mark: (%s: "%s")' % (mark, tip * 2 if arrow["double"] else tip))
    return (", " + ", ".join(extra)) if extra else ""


def cd_width(text):
    """Rough centimetre width of a cell - enough to keep arrows out of its maths."""
    body = re.sub(r"\\[a-zA-Z@]+\*?", " ", text)
    body = re.sub(r"[{}\\$]", "", body)
    return 0.55 + 0.17 * len(body.strip())


def cd_columns(grid, colsep):
    """The x of each column: the widest cell in it, with a clear lane between columns."""
    ncols = max((len(row) for row in grid), default=0)
    wide = [max([cd_width(grid[r][c][0]) for r in range(len(grid))
                 if c < len(grid[r])], default=0.0) for c in range(ncols)]
    xs = [0.0]
    for c in range(1, ncols):
        xs.append(xs[-1] + max(colsep, (wide[c - 1] + wide[c]) / 2 + 0.9))
    return xs


XY_CD = re.compile(r"\\begin\{CD\}(.*?)\\end\{CD\}", re.S)
# a CD label is up to three brace levels deep: @V{c^{\mathrm{seq}}_{V,W}(Q)}VV
XY_ARG = r"\{(?:[^{}]|\{(?:[^{}]|\{[^{}]*\})*\})*\}"
XY_TOKEN = re.compile(r"@[" + "<>=VA|." + r"]*(?:" + XY_ARG + r"[" + "<>=VA|." + r"]*)*")
XY_GROUP = re.compile(XY_ARG)
XY_DIR = {">": "r", "<": "l", "V": "d", "A": "u"}


def xy_arrow(token, leads_cell):
    r"""One Xy-pic arrow, @>{f}>>, as (the tikzcd \arrow that draws it, whether it steps a column).

    A token that opens its cell joins it to the cell above; Xy's @= reads that way too.
    A bare @. steps a column and draws nothing, which is how the author keeps a grid slot
    empty while the rows around it stay aligned.
    """
    labels = [label.strip() for label in XY_GROUP.findall(token)]
    if len(labels) > 2 or any('"' in label for label in labels):
        return None
    # the letters outside the labels are the arrow itself; a label such as _{V,W}
    # mentions the same characters and must not be read as a direction
    skeleton = XY_GROUP.sub("", token)[1:]
    dotted = "." in skeleton
    letters = [ch for ch in skeleton if ch in "<>VA=|"]
    if "|" in skeleton or (letters and len(set(letters)) != 1):
        return None  # barbed tails and mixed directions need marks CeTz has not compiled
    if not letters:
        return ("", True) if not labels else None
    if letters == ["="]:
        spec = ("d" if leads_cell else "r") + ",equal"
    elif len(letters) < 2:
        return None
    else:
        spec = XY_DIR[letters[0]] + (",dashed" if dotted else "")
    arrow = "\\arrow[%s%s]" % (spec, "".join(',"%s"' % label for label in labels))
    return (arrow, spec[0] in "rl")


CD_ROW = re.compile(r"\\\\")


def merge_arrow_rows(body):
    r"""Fold Xy's arrow-only rows into the row above, where tikzcd hangs its \arrow.

    Xy-cd draws a vertical map on a row of its own, between the two objects it joins;
    tikzcd writes \arrow[d] in the upper cell. Left as they are, those arrows start in
    the empty middle row and reach only half way down the diagram.
    """
    out = []
    for cells in CD_ROW.split(body):
        parts = split_top(cells, "&")
        if out and any(CD_ARROW.search(p) for p in parts) \
                and not any(CD_ARROW.sub(" ", p).strip() for p in parts):
            upper = split_top(out[-1], "&")
            for c, part in enumerate(parts):
                if c < len(upper):
                    upper[c] = upper[c] + " " + part.strip()
                else:
                    upper.append(part.strip())
            out[-1] = " & ".join(upper)
        else:
            out.append(cells)
    return r" \\ ".join(out)


def xy_to_tikzcd(src):
    """A CD environment in the syntax build_cd already lays out, or None."""
    m = XY_CD.search(src)
    if not m:
        return src
    body = m.group(1)

    def replace(token):
        # an arrow leads its cell when only the cell break stands in front of it
        before = body[:token.start()]
        amp, row = before.rfind("&"), before.rfind("\\\\")
        cut = amp + 1 if amp > row else (row + 2 if row >= 0 else 0)
        cell = before[cut:]
        got = xy_arrow(token.group(0), not XY_TOKEN.sub("", cell).strip())
        if got is None:
            return "\x00"
        arrow, steps = got
        # the arrow token is also Xy's column break: a horizontal one opens the cell it
        # points into, a vertical one belongs to the cell that follows it
        if steps:
            return arrow + " &"
        return ("& " if cell.strip() else "") + arrow

    drawn = XY_TOKEN.sub(replace, body)
    if "\x00" in drawn:
        return None
    return "\\begin{tikzcd}[column sep=large,row sep=large]%s\\end{tikzcd}" % merge_arrow_rows(drawn)


def build_cd(src):
    r"""A tikzcd commutative diagram -> a CeTz canvas, or None for what we cannot draw.

    Cells sit on a lattice and every \arrow names a neighbour, so the grid gives the
    positions without TikZ's measurement machinery. A diagram is drawn whole or not
    at all: a bend, hook or double head needs a mark we have not compiled, and maths
    outside the environment would be silently dropped.
    """
    src = xy_to_tikzcd(src)
    if src is None:
        return None
    m = CD_ENV.search(src)
    if not m:
        return None
    rest = (src[:m.start()] + src[m.end():])
    rest = re.sub(r"\\(?:begin|end)\{(?:gathered|aligned|array|matrix)\}", "", rest)
    if re.search(r"[^\s{}$\\]", rest):
        return None
    head, body = m.group(1) or "", m.group(2)
    if re.search(r"ampersand replacement\s*=\s*\\&", head):
        body = body.replace("\\&", "&")
    colsep = cd_gap(head, "column sep", 2.6)
    rowsep = cd_gap(head, "row sep", 1.7)
    rows = [split_top(line, "&") for line in LINEBREAK.split(body)]
    grid, arrows = [], []
    for r, cells in enumerate(rows):
        row = []
        for c, cell in enumerate(cells):
            parsed = []
            for spec in CD_ARROW.findall(cell):
                got = cd_arrow(spec or "")
                if got is None:
                    return None
                got["row"], got["col"] = r, c
                parsed.append(got)
            row.append((CD_ARROW.sub(" ", cell).strip(), parsed))
            arrows += parsed
        grid.append(row)
    xs = cd_columns(grid, colsep)
    lines, maths = [], []

    def slot(tex):
        """Reserve a place for one cell or label; the diagram converts its own maths.

        tikzcd puts every cell in math mode, so a cell is just a formula, and pandoc
        maps it far better than the hand-written symbol table TikZ nodes use.
        """
        maths.append(tex)
        return "ZQCDM%03d" % (len(maths) - 1)

    def pos(r, c):
        return (xs[c] if c < len(xs) else xs[-1] + colsep, r * rowsep)

    def edge(r, c, ux, uy):
        """How far a cell's box reaches along the direction an arrow leaves it."""
        text = grid[r][c][0] if r < len(grid) and c < len(grid[r]) else ""
        return max(abs(ux) * (cd_width(text) / 2 + 0.15), abs(uy) * 0.4) if text else 0.5

    for r, row in enumerate(grid):
        for c, (text, _parsed) in enumerate(row):
            if text:
                lines.append("content(%s, [$%s$])" % (fmt(*pos(r, c)), slot(text)))
    for arrow in arrows:
        if arrow["skip"]:
            continue
        step = arrow["step"]
        p1 = pos(arrow["row"], arrow["col"])
        p2 = pos(arrow["row"] + step[1], arrow["col"] + step[0])
        vx, vy = p2[0] - p1[0], p2[1] - p1[1]
        norm = math.hypot(vx, vy)
        if not norm:
            # the step names a cell that is not on the grid, so the arrow has no target:
            # a diagram is drawn whole or not at all, never with a head pointing nowhere
            return None
        ux, uy = vx / norm, vy / norm
        px, py = uy, -ux  # the left of the direction of travel, on a y-down page
        a = (p1[0] + ux * edge(arrow["row"], arrow["col"], ux, uy),
             p1[1] + uy * edge(arrow["row"], arrow["col"], ux, uy))
        b = (p2[0] - ux * edge(arrow["row"] + step[1], arrow["col"] + step[0], ux, uy),
             p2[1] - uy * edge(arrow["row"] + step[1], arrow["col"] + step[0], ux, uy))
        mid = ((a[0] + b[0]) / 2 + px * 0.9 * arrow["bend"],
               (a[1] + b[1]) / 2 + py * 0.9 * arrow["bend"])
        args = cd_mark(arrow)
        if arrow["equal"]:
            for off in (0.11, -0.11):
                lines.append("line(%s, %s%s)" % (fmt(a[0] + px * off, a[1] + py * off),
                                                 fmt(b[0] + px * off, b[1] + py * off), args))
        elif arrow["bend"]:
            lines.append("line(%s, %s)" % (fmt(*a), fmt(*mid)))
            lines.append("line(%s, %s%s)" % (fmt(*mid), fmt(*b), args))
        else:
            lines.append("line(%s, %s%s)" % (fmt(*a), fmt(*b), args))
        if arrow["hook"]:
            lines.append("line(%s, %s)" % (fmt(*a), fmt(a[0] + px * 0.3 * arrow["hook"],
                                                        a[1] + py * 0.3 * arrow["hook"])))
        for i, label in enumerate(arrow["labels"]):
            # two labels mean both sides of the arrow, tikzcd's own convention
            off = 0.45 * (arrow["side"] if i == 0 else -arrow["side"])
            lines.append("content(%s, [$%s$])" % (fmt(mid[0] + px * off, mid[1] + py * off),
                                                  slot(label)))
    if len(lines) < 2:
        return None
    canvas = ("#cetz.canvas({\n  import cetz.draw: *\n"
              + "\n".join("  " + l for l in lines) + "\n})")
    got, _missing, _err = mathconv.convert_formulas(maths)
    for i, tex in enumerate(maths):
        body = got.get(i) or "$ " + _math_body(tex) + " $"
        if body.startswith("$") and body.endswith("$"):
            body = body[1:-1].strip()
        body = CD_SCALE.sub(r"\1", body)
        # a canvas is one drawing command per line, so a multi-line formula span
        # from pandoc has to lose its line breaks before it is spliced in
        canvas = canvas.replace("ZQCDM%03d" % i, " ".join(body.split()))
    return canvas


PICTURE = re.compile(r"\\begin\{(?:tikzpicture|tikzcd|CD)\}")
# A display equation around a picture only carries numbering, which the emitter reads
# from the source itself, so the picture parser looks past the envelope. The two bracket
# delimiters must not follow another backslash: a node's text ends its line with \\ and
# opens the spacing that follows it, \\[3pt], and eating the second backslash there leaves
# an unbalanced ] that re-cuts the whole picture into one mangled box.
MATH_ENVELOPE = re.compile(r"\\(?:begin|end)\{(?:equation|gather|multline|align|displaymath)"
                           r"\*?\}|\\label\{[^{}]*\}|\\tag\{[^{}]*\}"
                           r"|(?<!\\)\\\[|(?<!\\)\\\]")


def convert(src, colors=None, line_cm=None, refs=None):
    """A TikZ picture or a tikzcd diagram -> a CeTz canvas that compiles, else None."""
    core = expand_linewidth(MATH_ENVELOPE.sub("", src), line_cm)
    core = expand_refs(core, refs)
    canvas = build(core, colors) or build_cd(core)
    if canvas is None or not sane(canvas) or not compiles(canvas):
        return None
    return canvas


def expand_refs(source, refs):
    r"""Answer a `\ref` written inside a picture, so node text stops printing its own label.

    The prose pass deletes command names, which leaves a reference's *name* standing on the page
    as words -- a reader sees 'Section sec:proof'. The resolver the running text already uses
    answers it, and \text{} carries the number through both the prose and the maths path.
    An answer that is Typst markup rather than words (a link to a hypertarget anchor) has no
    place to sit inside a node, so that reference is left exactly as it was.
    """
    if refs is None:
        return source

    def one(m):
        baked = refs(m.group(2))
        return "\\text{%s}" % baked if baked and not re.search(r"[#<>]", baked) else m.group(0)

    return mathconv.MATH_REF.sub(one, source)



PICTURE_ENV = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)


def split(src, refs=None):
    r"""A display that holds a picture and other maths -> (canvas, the maths beside it).

    A canvas is a block, so the diagram and the line next to it cannot share one $ $;
    drawing them one under the other keeps both, where refusing the pair left the whole
    display quoted as LaTeX. The picture still has to draw on its own.
    """
    core = MATH_ENVELOPE.sub("", src)
    m = PICTURE_ENV.search(core)
    if not m:
        return None
    # a gathered/aligned wrapper only holds the pair together; they are two lines now
    rest = re.sub(r"\\(?:begin|end)\{(?:gathered|aligned)\*?\}", "",
                  (core[:m.start()] + core[m.end():])).strip()
    # the row break that set the diagram apart from its equations has no line to
    # break from any more, but one still between two equations is a two-line display
    rest = re.sub(r"^(?:\\\\\s*)+|(?:\s*\\\\)+$", "", rest)
    if re.search(r"\\\\|&", rest):
        rest = r"\begin{aligned}%s\end{aligned}" % rest
    if not re.search(r"[^\s{}$\\]", rest):
        return None
    canvas = convert(m.group(0), refs=refs)
    return None if canvas is None else (canvas, rest)


DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
COLORLET = re.compile(r"\\colorlet\{([-\w]+)\}\{([^{}]*)\}")


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


def _colors(body, preamble=None):
    """-> ({name: rgb triple}, body with the declarations removed), or None.

    Colours the paper declared in its preamble seed the palette, and one we cannot model is left
    out rather than refused: the author may never use it, and dropping every picture over a colour
    table it does not reference would lose drawings that draw today. Inside the picture is the
    author's own use, so there an unmodellable colour still refuses.

    Guessing a colour used in the picture would draw the figure in the wrong ink.
    """
    pal, out, pos = {}, [], 0
    for name, (model, spec) in (preamble or {}).items():
        got = _color_model(model, spec)
        if got is not None:
            pal[name] = got
    # one positional pass over both spellings: a `\colorlet` may name a colour the picture defined
    # above it, and two loops would each re-emit the text between their own matches
    decls = sorted(list(DEFINECOLOR.finditer(body)) + list(COLORLET.finditer(body)),
                   key=lambda m: m.start())
    for m in decls:
        got = _mix(m.group(2), pal) if m.re is COLORLET else _color_model(m.group(2), m.group(3))
        if got is None:
            return None
        pal[m.group(1)] = got
        out.append(body[pos:m.start()])
        pos = m.end()
    out.append(body[pos:])
    return pal, "".join(out)


def build(tikz, colors=None, line_cm=None):
    """The CeTz canvas for a TikZ picture, or None if it needs more than we draw.

    The compile gate is deliberately not run here, so callers can read a canvas
    without paying typst for it.
    """
    tikz = expand_linewidth(tikz, line_cm)
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
    if end < 0:
        # a fragment cut out of a picture still starts with \begin, and the statements it kept
        # would draw as a confident partial figure; only a whole picture is a drawing
        return None
    body = body[:end]
    body = expand_def(body)
    body = expand_foreach(body)
    if body is None:
        return None
    body = expand_def(body)
    body = expand_pgfmath(body)
    if body is None:
        return None
    body = expand_ifnum(body)
    if body is None:
        return None
    body = drop_clips(body)
    extra, body = expand_tikzset(body)
    cols = _colors(body, colors)
    if cols is None or UNSUPPORTED.search(cols[1]):
        return None
    pal, body = cols
    placed = scoped(body, base)
    if placed is None:
        return None
    styles = picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        register(stmt, names, xf, styles)
    lines = []
    for stmt, xf in placed:
        got = translate_statement(stmt, names, xf, pal, styles)
        if got is None:
            return None
        lines.extend(got)
    if not lines:
        return None
    return "#cetz.canvas({\n  import cetz.draw: *\n" + "\n".join("  " + l for l in lines) + "\n})"
