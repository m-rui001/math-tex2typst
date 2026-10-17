"""Translate the TikZ subset used by these papers into CeTz canvases.

Returns None for pictures outside the supported subset so callers keep their
existing fallback instead of emitting a broken canvas.
"""

import math
import pathlib
import re
import unicodedata

from . import mathconv
from .texutil import find_group, skip_spaces, split_top, top_level_find

HEADER = '#import "@preview/cetz:0.5.0"\n'

RGB = {
    "black": (0, 0, 0), "white": (255, 255, 255), "red": (255, 0, 0),
    "green": (0, 128, 0), "blue": (0, 0, 255), "gray": (128, 128, 128),
    "grey": (128, 128, 128), "yellow": (255, 255, 0), "orange": (255, 128, 0),
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
    # pgfmath's `tanh` is sinh/cosh over the raw argument (pgfmathfunctions.misc.code.tex:113), so
    # unlike `tan` it takes no angle: `\pgfmathparse{tanh(-2.97)}` writes -0.99475 and `tanh(1)`
    # 0.7615 (`_work/pic-plot/meas/m_tanh.tex`), which is math.tanh to the five digits pgf keeps.
    "tanh": math.tanh,
    "round": lambda x: float(round(x)), "int": lambda x: float(int(x)),
    # floor/ceil walk out to the neighbouring integer while int() truncates toward zero -- TeX
    # writes floor(-0.6) = -1 and int(-0.6) = 0, measured in _work/pic-pgfmath/meas_pgfmath.tex
    "floor": lambda x: float(math.floor(x)), "ceil": lambda x: float(math.ceil(x)),
    "min": min, "max": max, "pow": lambda a, b: a ** b, "mod": lambda a, b: a % b,
}
# One comparison level, looser than + - * / and left-associative: TeX reads `2==1<1` as
# (2==1)<1 = 1, so a chain mixes `<` and `==` freely and both spellings sit at the same level.
CMPS = {"<": lambda a, b: a < b, "<=": lambda a, b: a <= b, ">": lambda a, b: a > b,
        ">=": lambda a, b: a >= b, "==": lambda a, b: a == b, "=": lambda a, b: a == b,
        "!=": lambda a, b: a != b}
COMPARE_OPS = ("<=", ">=", "==", "!=", "<", ">")
TOKEN_RX = re.compile(r"\s*(?:(\d+\.?\d*|\.\d+)|([A-Za-z]+)|(<=|>=|==|!=|[-+*/^,()<>]))")


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


def _relation(toks, i):
    """pgfmath's comparison level: every operator returns 1 or 0, and the chain runs left to right."""
    val, i = _add(toks, i)
    while i < len(toks) and toks[i][0] == "op" and toks[i][1] in COMPARE_OPS:
        op = toks[i][1]
        rhs, i = _add(toks, i + 1)
        val = 1.0 if CMPS[op](val, rhs) else 0.0
    return val, i


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
        out, i = _relation(toks, i + 1)
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
    r"""Evaluate a pgfmath expression in cm; None when it is not pure arithmetic.

    A comparison is arithmetic: pgfmath hands back 1 or 0 for it, which is exactly the number a
    `\ifnum` then branches on, so `1+2<=10` is a value and not a refusal.
    """
    toks = _tokenize(text)
    if not toks:
        return None
    try:
        val, i = _relation(toks, 0)
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
    The `=` is found the same way: `-{Stealth[length=2mm]}` carries its only `=` inside a
    bracket group, so it stays one bare key instead of breaking in half.
    """
    out = {}
    for part in split_top(text or "", ","):
        part = part.strip()
        if not part:
            continue
        i = top_level_find(part, "=")
        if i < 0:
            out[part] = True
            continue
        key, val = part[:i].strip(), part[i + 1:].strip()
        if key == "label":
            # a node can hang several labels on itself and TeX draws every one, so this key is a
            # placement that accumulates, not a setting the next one overrides
            out.setdefault("label", []).append(val)
        else:
            out[key] = val
    return out


def color_option(o, pal, keys=("color", "draw"), bare=True):
    r"""The colour an option group selects, however the paper wrote it.

    TikZ accepts a colour as a value ('draw=red') and as a bare key ('[red]').  What a bare key
    colours depends on what the group belongs to: on a STATEMENT it is the action's own paint --
    the fill of a 'fill', the stroke of a '\draw', never both -- while on a NODE it is the picture's
    general colour for that node, which inks the words and is only the border's paint where a
    valueless 'draw' asks for a border at all.  Both readings are measured, for nodes against
    '_work/measure_bare_color_node.py'; 'bare' says which of the two spellings this lookup is for.
    """
    for key in keys:
        val = o.get(key)
        if isinstance(val, str) and val:
            return color(val, pal)
    if not bare:
        return None
    for key, val in o.items():
        if val is True:
            c = color(key, pal)
            if c:
                return c
    return None


# What pgf's own pen weighs when nothing said otherwise: pdflatex reads a bare `\draw (0,0)--(2,0);`
# as a 0.398pt rule (`_work/measure_path_mode.py`).  Typst answers 1pt for the same silence
# (`_work/measure_fill_stroke_default.py`), so a converter that leaves the weight out draws every line
# of every figure two and a half times too thick -- and names only a paint is the same silence.
DEFAULT_RULE_PT = "0.4pt"

# pgf sells six pens by name, and the page prices them as 0.4pt times a step of a quarter:
# `_work/measure91_pen_widths.py` (one case per page, fitz's own `width` on a rule pdflatex drew) reads
# ultra thin .100, thin .398, semithick .598, thick .797, very thick 1.196, ultra thick 1.594 pt.
# `thin` is the default, so the names that change a figure's weight are the other five.
PGF_PEN_PT = {"ultra thin": 0.1, "thin": 0.4, "semithick": 0.6, "thick": 0.8,
              "very thick": 1.2, "ultra thick": 1.6}


def pen_width_pt(o):
    r"""What a statement's pen weighs on the page, in pt, or None when it writes no pen.

    Two spellings price a rule: `line width=<length>` and a bare pgf name.  The corpus writes only
    lengths in pt and only the six names -- 932 pictures counted out of the option tables the emitter
    reads (`_work/probe129_pen_width_spellings.py`: 473 `line width=…pt` and 882 `[thick]` on a
    statement's own brackets, 19 lengths and 7 names on the picture head, and the same names again
    inside `/.style` tables) -- so no other unit and no `\pgflinewidth` arithmetic is mapped here,
    because none of them has a face to map onto.  A NAME is read before a LENGTH because the picture
    head's weight is handed to this reader as a length (`build` folds it through the same name table),
    and a statement's own name must therefore overrule its brackets exactly as it overrules every
    other scope default.
    """
    for name in PGF_PEN_PT:
        if o.get(name) is True:
            return PGF_PEN_PT[name]
    width = o.get("line width")
    if isinstance(width, str):
        m = re.fullmatch(r"([\d.]+)\s*(pt|mm|cm)", width)
        if m:
            return float(m.group(1)) * {"pt": 1.0, "mm": 2.8346, "cm": 28.346}[m.group(2)]
    return None


# A path's ends and corners are spelled differently by the two engines, and the whole difference is
# measured on one ruler (`_work/measure90_cap_join.py`, 600 dpi page points, pen 12pt on both sides):
#   cap -- `butt` leaves 0.160pt of ink past the endpoint, `round` and `rect` both put the tip 6.040
#        (= pen/2) past it, with the square face reaching 12.000 against a round tip's 6.360; Typst
#        draws the same three at 0.040 / 6.040 / 6.040, so pgf's `rect` is Typst's `square`.
#   join -- a miter's tip stands (pen/2)/sin(alpha/2) off the vertex, a round join stands pen/2 off it
#        whatever the angle (measured far/half = 0.997), and a bevel is engine-identical.
#   the carry limit -- pgf bevels a miter once the ratio passes 10, which on the page starts at
#        alpha=11.4deg, while Typst gives up at 4, i.e. from alpha=28.5deg: every corner between the
#        two points on the TeX page and is beveled on the product page until the limit is said out
#        loud.  Saying `miter-limit: 10` makes Typst answer angle for angle (32deg -> 3.597,
#        12deg -> 9.477, bevel at 11.4).
CAP_NAME = {"butt": "butt", "round": "round", "rect": "square"}
JOIN_NAME = {"miter": "miter", "round": "round", "bevel": "bevel"}
PGF_MITER_LIMIT = "10"

# pgf sells a dash by name too, and the page prices each one (`_work/probe102a_dash_pgf.py`: one 8cm
# rule per name at two pens, the PDF's own dash array read back; the definitions are
# tikz.code.tex:1583-1601).  Two laws come out of that table: a `dashed` family's ON length is
# absolute (3pt, with the gap 3/2/6pt for plain/densely/loosely) while a `dotted` family's ON length
# IS the pen (`on \pgflinewidth`: 0.3985pt at `thin`, 1.594 at `ultra thick`, gap 2/1/4pt).
# Typst answers the same arrays under its own names at the same two pens, and its dotted names follow
# the pen the same way (`_work/probe102b_typst_dash.py`), so a name needs no arithmetic at all.
PGF_DASH_NAME = {"dashed": '"dashed"', "densely dashed": '"densely-dashed"',
                 "loosely dashed": '"loosely-dashed"', "dotted": '"dotted"',
                 "densely dotted": '"densely-dotted"', "loosely dotted": '"loosely-dotted"'}
# The compound names put a dot INSIDE the pattern, so the pen has to be said as a number:
# `dash dot` is `on 3pt off 2pt on \pgflinewidth off 2pt` (tikz.code.tex:1591).
PGF_DASH_LIST = {"dash dot": ("3pt", "2pt", None, "2pt")}
DASH_ONOFF = re.compile(r"(?:on|off)\s+([\d.]+)\s*(pt|mm|cm)\b")


def dash_argument(o, thickness):
    r"""The `dash:` a TikZ option group asks Typst for, or None when the rule is solid.

    A statement of this corpus never carries two dash spellings at once
    (`_work/probe102c_dash_emit_face.txt`: 0 of 671), so the table order is not a precedence law and
    no layer order had to be measured.  `solid` needs no entry: it is `dash pattern=` with nothing in
    it, and a pattern that cannot be read in full prices no dash -- the same answer, by a different
    route, which is why it is not special-cased.
    """
    for name, value in PGF_DASH_NAME.items():
        if o.get(name) is True:
            return value
    for name, items in PGF_DASH_LIST.items():
        if o.get(name) is True:
            return "(%s)" % ", ".join(thickness if it is None else it for it in items)
    pattern = o.get("dash pattern")
    if isinstance(pattern, str):
        items = DASH_ONOFF.findall(pattern)
        # one element short would shift every later pair onto the wrong side of the rule, so a
        # pattern with a length we cannot price (a `bp`, an `\pgflinewidth`) goes out solid.
        if items and len(items) == len(re.findall(r"\b(?:on|off)\b", pattern)):
            return "(%s)" % ", ".join(n + unit for n, unit in items)
    return None


def stroke_args(o, pal=None):
    """One CeTz 'stroke:' argument for a TikZ option group, at pgf's weight unless told otherwise.

    Paint, thickness, the ends and corners, and the dash share a single dictionary: Typst rejects a
    call that names the same argument twice.  The thickness is never left out, because it is Typst's
    own 1pt that a partial `stroke:` inherits, and that number belongs to no TikZ figure -- and
    neither is the miter limit, because the two engines bevel at different ratios.
    """
    paint = color_option(o, pal)
    want = pen_width_pt(o)
    thickness = None if want is None else "%spt" % want
    dash = dash_argument(o, thickness or DEFAULT_RULE_PT)
    parts = []
    if paint:
        parts.append("paint: " + paint)
    parts.append("thickness: " + (thickness or DEFAULT_RULE_PT))
    cap = CAP_NAME.get(o.get("line cap"))
    if cap:
        parts.append('cap: "%s"' % cap)
    join = JOIN_NAME.get(o.get("line join"))
    if join:
        parts.append('join: "%s"' % join)
    if join in (None, "miter"):
        parts.append("miter-limit: " + PGF_MITER_LIMIT)
    if dash:
        parts.append("dash: " + dash)
    return ["stroke: (%s)" % ", ".join(parts)]


def draws_rule(o, verb=""):
    r"""Whether this statement strokes its path -- the one fact that decides both its rule and its tip.

    pgf keeps two modes and the verb turns on one of them: `\draw` and `\filldraw` stroke, `\path` and
    `\fill` do not.  A `draw` key outranks the verb in both directions -- it turns the mode on wherever
    it is written and turns it off by name of `none`, which is why `\path[draw=red] (0,0)--(2,0);`
    strokes red and `\draw[draw=none] …` paints nothing at all -- both read off pdflatex page by page,
    together with the case that started this (`_work/measure_path_mode.py`: `\path (0,0)--(2,0);`,
    `\path[red] …` and `\path[red,->] …` leave an EMPTY page: no rule, and no arrow tip either, because
    a tip belongs to a stroke).
    """
    val = o.get("draw")
    return verb in ("draw", "filldraw") if val is None else val != "none"


def rule_args(o, pal, drawn):
    """The `stroke:` a shape carries, said out loud in both directions.

    Silence is not an option here: left without a `stroke:` a CeTz shape takes Typst's own 1pt black
    rule, which is a border the author never asked for on a filled-only shape and a too-heavy one on a
    drawn (`_work/measure_fill_stroke_default.py`, `_work/probe_frame_stroke_none.py`).
    """
    return stroke_args(o, pal) if drawn else ["stroke: none"]


# A node's three colour slots -- the words, the border, the field -- are set by different keys, and
# which key feeds which slot is measured, not guessed: `_work/measure_bare_color_node.py` puts 34
# node spellings through pdflatex, one picture per page, and reads every page back with fitz for the
# colour of its text spans and the colour of every stroked and filled path.  The law it gives:
#   a bare colour key and `color=` are the node's GENERAL colour -- they ink the words, and a
#   `draw` or `fill` written without a value takes that same colour as its paint;
#   `text=` inks the words and joins nothing else; `draw=` paints the border and `fill=` the field,
#   and neither touches the words; a `draw=` or `fill=` written with an EMPTY value is the same
#   spelling as the bare key -- it takes the general colour, which for `[blue,fill=]` is #0000ff;
#   where no colour is in force the general colour is the body's black, which is why a valueless
#   `draw` strokes black and a valueless `fill` fills black;
#   a border exists where `draw` is written and is not `none`, and nowhere else -- `[blue]`,
#   `[blue,fill=white]` and `[rectangle,fill=red]` all print with no rule around them.
NODE_INK_KEYS = ("text", "color")


def node_ink(o, pal):
    """The colour a node's words take, or None to leave them the body's black."""
    return color_option(o, pal, keys=NODE_INK_KEYS, bare=True)


def node_fill(o, pal):
    """The field inside a node's frame, or None where it has none.

    `fill=none` is no field; a `fill` written bare or with an empty value is the general colour, and
    where the option group names no colour the general colour is black (`_work/measure_bare_color_node.py`:
    `[blue,fill]` and `[text=red,fill]` paint #0000ff and #000000 fields under red words).
    """
    val = o.get("fill")
    if val is None or val == "none":
        return None
    if isinstance(val, str) and val:
        return color(val, pal)
    return color_option(o, pal, keys=(), bare=True) or "black"


def node_stroke_args(o, pal):
    """One CeTz `stroke:` for a node's frame, and `stroke: none` where pgf draws no rule.

    A fill alone is no border: the content stream of `node[fill=white]` laid over a line is one
    stroked path -- the line -- and one filled rect of 19.4x14.3pt with nothing around it, while
    `draw,fill=white` turns that rect into `fs` (`_work/measure_fill_only_frame.py`).  Typst and CeTz
    both stroke a frame they are not told to leave bare, so the absence of a border has to be said
    out loud (`_work/probe_frame_stroke_none.py`: the same `frame: "rect"` and the same `circle()`
    both lose their black rule to `stroke: none` and keep their fill).
    """
    return rule_args(o, pal, draws_rule(o))


# a node's name is whatever stands inside the parentheses, and pgf reads the whole token: measured
# against pdflatex (_work/pic-3d/measure_names.py), a `\coordinate (qf axes)` drawn from by
# `(qf axes)--(3,2)` lands on exactly the same line as the un-spaced spelling, so a space inside a
# name is part of the name and not a separator
ANCHORED = re.compile(r"([-\w](?:[-\w ]*[-\w])?)(?:\s*\.\s*([-\w ]*[-\w]))?")
NODE_DEF = re.compile(r"\\(?:node|coordinate)\b\s*")
# positioning-library syntax: 'below=2cm of a', 'below of=a', or a calc reference 'of $(a)!.5!(b)$'
POSITIONED = re.compile(r"\bof\b\s*=?\s*[-\w$]")
# (a -| b): the x of b with the y of a; (a |- b): the x of a with the y of b
INTERSECT = re.compile(r"^(.+?)\s*(-\||\|-)\s*(.+)$", re.S)

# 'right=of a' separates the two boxes by \node distance, whose TikZ default is 1cm; the node's own
# `inner sep` default is priced where NODE_BODY_SIZE_PT is, since its value needs that size.
NODE_DISTANCE = 1.0
# What each TeX size name means in points, read from the engine (_work/measure_tex_sizes.py,
# pdflatex's own \f@size for article at 10pt -- the class the corpus flattens from). A node's
# `font=\small` is relative, but the box width and the coordinates around it are absolute
# centimetres TeX measured at these sizes, so the canvas has to name the same absolute point size.
TEX_SIZE_PT = {"tiny": 5.0, "scriptsize": 7.0, "footnotesize": 8.0, "small": 9.0,
               "normalsize": 10.0, "large": 12.0, "Large": 14.4, "LARGE": 17.28,
               "huge": 20.74, "Huge": 24.88}
# How tall a node's own text is at each size: (a single line, the leading to the next), in points,
# read from pdflatex (_work/measure_node_leading.py -- article at 10pt, inner sep 8pt, one node of
# one line and one of two at the same `text width`, so the difference of the two boxes is the
# leading and the rest of the one-line box is the line). Keyed by the point size TEX_SIZE_PT gives
# the name, so a `font=\fontsize{9}{11}` reads the 9pt row and a size nobody measured reads none.
TEX_LINE_HEIGHT_PT = {5.0: (2.5528, 6.0), 7.0: (3.4139, 8.0), 8.0: (3.8444, 9.5),
                      9.0: (4.2750, 11.0), 10.0: (4.7055, 12.0), 12.0: (5.5666, 14.0),
                      14.4: (6.6000, 18.0), 17.28: (7.8389, 22.0), 20.74: (9.3284, 25.0),
                      24.88: (11.1106, 30.0)}
NODE_BODY_SIZE_PT = 10.0
# pgf's default `inner sep` is `.3333em` of the CLASS the package was loaded at, not of the node's own
# `font=`: pdflatex reads 3.3330pt around a `P` from `\tiny` to a 20pt label
# (`_work/measure_node_sep_whose_font.py`), and the same 3.33pt on the anchored edge of an unturned
# `[anchor=east]` and of `[anchor=east,font=\small]` (`_work/label103b_unrotated_pad.txt`, whose third
# column puts this engine's ink 0.16pt from pgf with this value and 3.4pt away with none). The INK
# does follow the node's font -- which is why a label's words stay small while its box keeps this slack.
INNER_SEP = 0.3333 * NODE_BODY_SIZE_PT * UNITS["pt"]
FONT_SIZE_NAME = re.compile(r"\\(tiny|scriptsize|footnotesize|small|normalsize|large|Large|"
                            r"LARGE|huge|Huge)\b")
FONT_SIZE_EXPLICIT = re.compile(r"\\fontsize\s*\{\s*([\d.]+)\s*\}")
# a node's label broken into rows: `\\`, which may carry its own gap `\\[3pt]` -- and that gap is
# measured to add exactly the points written (_work/measure_node_leading.py, at 3pt and 5pt)
LINE_BREAK = re.compile(r"\\\\\s*(?:\[\s*([^\]]*?)\s*\])?")
# pgf's own rule width: a node's border anchors sit half of it outside the box the author fixed.
PGF_LINE_WIDTH = 0.4 * UNITS["pt"]
DIRECTION = {"right": (1, 0), "left": (-1, 0), "above": (0, 1), "below": (0, -1),
             "above right": (1, 1), "above left": (-1, 1),
             "below right": (1, -1), "below left": (-1, -1)}
OF_TARGET = re.compile(r"^(?:(?:([-+\d.]+(?:\s*(?:cm|mm|pt|em|ex|in))?)"
                       r"(?:\s+and\s+([-+\d.]+(?:\s*(?:cm|mm|pt|em|ex|in))?))?)?"
                       r"\s*of\s+)?([-\w]+)(?:\s*\.\s*(north|south|east|west|"
                       r"north east|north west|south east|south west))?$")
# 'below=16mm of $(count)!0.5!(bounds)$': the reference is a calc expression, not a name, so the
# target is a bare point with no box to measure the gap from. Read by `_calc_point`, which already
# resolves `$(A)!.5!(B)$` and `(A.south)`.
OF_CALC = re.compile(r"^(?:([-+\d.]+(?:\s*(?:cm|mm|pt|em|ex|in))?)"
                     r"(?:\s+and\s+([-+\d.]+(?:\s*(?:cm|mm|pt|em|ex|in))?))?)?"
                     r"\s*of\s+(\$[^$]*\$)\s*$")


def _length(text, xf):
    """A TikZ length -> cm in the picture's own scales, or None."""
    got = _size(text) if isinstance(text, str) else None
    if got is None:
        return None
    val, user = got
    return val * _ux(xf) if user else val


def _braced(text):
    """A pgf value's own group -> its contents, peeling at most one balanced pair.

    An arrow-only style is written `flow/.style={-{Stealth[length=2mm]}}`, where the spec keeps a
    group of its own inside the definition's, so a character `strip("{} ")` eats the spec's opening
    brace along with the pair around it and hands back `-{Stealth[length=2mm]` -- a fragment that is
    the key of nothing.
    """
    text = text.strip()
    if text.startswith("{") and text.endswith("}") and find_group(text, 0) == len(text):
        return text[1:-1]
    return text


def picture_styles(head):
    """The '/.style' table a picture's option list declares: name -> its options.

    A flowchart writes `box/.style={draw,rounded corners}` in the picture's own brackets and then
    `\node[box]`, so a bare option key has to be read back to its definition before the box the
    author fixed is known.
    """
    out = {}
    for key, val in (head or {}).items():
        if key.endswith("/.style") and isinstance(val, str):
            out[key[:-len("/.style")]] = opts(_braced(val))
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
    frame, and not for a path, where it would fill the connecting lines white.  The key 'picture' is
    the one this converter invents for the other half of the head: a pen option written on the
    picture's own brackets is pgf's SCOPE default and reaches everything the picture draws, a node's
    frame included -- `_work/measure90_head_on_node.py` puts `line join=round` and `line cap=round`
    on `[line width=12pt]` heads and the node's rect comes back with lineJoin=1 and lineCap=1 -- while
    a statement's own key and a style it invokes both overrule it.
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
    for k, v in (styles.get("picture") or {}).items():
        if k not in got:
            got[k] = v
    if as_node:
        for k, v in (styles.get("every node") or {}).items():
            if k not in got:
                got[k] = v
    return got


def node_frame_width(o, xf):
    """The outer width of a box whose author fixed a measure, in cm, or None.

    Two keys name a width and they are not the same box (`_work/measure_textwidth_frame.py`):
    `text width=D` is the measure of the PARAGRAPH TeX sets, so the drawn frame is D with `inner sep`
    added on each side, while `minimum width=D` and `minimum size=D` are the frame itself. The padding
    that widens it is the HORIZONTAL axis only: a `text width=3cm` node reads half-width 46.212pt, with
    `inner xsep=7pt` 49.879pt and with `inner ysep=7pt` still 46.212 (`_work/measure_tex_inset_axes.py`). `node_size`
    divides this into the half-extent a neighbour steps over and `emit_node` hands it to Typst as the
    `box`'s own `width:`, so the one measurement is what both the placement and the drawing read.
    """
    w = None
    sep = node_inner_sep(o, xf)
    for key in ("text width", "minimum width", "minimum size"):
        got = _length(o.get(key), xf)
        if got is not None:
            w = max(w or 0.0, got + (2 * sep if key == "text width" else 0))
    return w


# CeTz frames content with the CIRCUMSCRIBED circle of the box it is given, so a range drawn as a
# circle comes out sqrt(2) wider than the measure written on it: `minimum size=9mm` came back
# 1.2758cm against pdflatex's 0.9000 (`_work/measure_cetz_frame_circle.py`). Shrinking the half-side
# by this factor lands on 0.9030cm -- the declared diameter, which is what the node's own half-extent
# already says its border is.
CIRCLE_FRAME = 2 ** -0.5

def node_shape(o):
    """The outline a node asks for, as one of the two names CeTz can frame.

    `[shape=circle]` and `[circle]` are the same node and both are in the corpus, so the option's own
    value is read first and the bare word after it. pgf's default shape is the rectangle, and a
    `circle` is the only round one: `ellipse`, `diamond` and the rest come back as `rect`, which is
    the extent TeX gives them but not their outline -- CeTz 0.5.0 has no frame for either, and the
    flat faces of the corpus are the eight `ellipse` nodes (`_work/probe_circle_face.py`).
    """
    val = o.get("shape")
    if isinstance(val, str) and val.strip():
        return "circle" if val.strip() == "circle" else "rect"
    return "circle" if o.get("circle") is True else "rect"


PADDING_KEYS = ("inner sep", "inner xsep", "inner ysep")


def node_padding(o, xf):
    """The gap pgf leaves between a node's words and its border, per axis, in cm.

    Three keys spell it and they are not three names for one number: `inner sep` writes both axes,
    `inner xsep` and `inner ysep` write one each (27 declarations over 11 papers use only the latter
    two, and nothing in the converter read them). pdflatex says pgf executes them in the order written
    and each touches only its own axis (`_work/measure_tex_inset_axes.py`, half-widths of a framed
    `ab` node): `inner sep=2pt, inner xsep=7pt` gives x=7 / y=2, while writing the same two options in
    the other order gives x=y=2 -- the general key written last overwrites both axes.

    An axis left unwritten by the end comes back None rather than a default, because pgf's default is
    `0.3333em` and only the caller that PRINTS the padding can keep it in em (`node_inset`); a caller
    that needs a length substitutes `INNER_SEP` (`node_inner_sep`), which is that em read at the
    document size the engine froze it at (`_node_pad` measures the same slack again for the box).
    """
    x = y = None
    for key, val in o.items():
        got = _length(val, xf) if key in PADDING_KEYS else None
        if got is None:
            continue
        if key != "inner ysep":
            x = got
        if key != "inner xsep":
            y = got
    return x, y


def node_inner_sep(o, xf):
    """The node's own horizontal padding in cm -- pgf's default where the author wrote none.

    This is the padding between the words and the border, so it is what a circle drawn around the
    words has to be padded by and, for a node holding nothing, the whole of its radius
    (`dot_radius`). An axis nobody wrote down is `INNER_SEP`, pgf's `.3333em` read at the class size
    that owns it.
    """
    x, _ = node_padding(o, xf)
    return INNER_SEP if x is None else x


def node_size(o, xf, text=None):
    """(half-width, half-height) in cm, or (None, None) for a node with neither label nor measure.

    TikZ measures the text to size the node; where the author fixed a measure that is what a box is
    drawn and a neighbour aligned by, and where he fixed none the label he wrote stands in for it --
    `_text_height` prices its rows and `_text_width` its ink -- so a neighbour placed `below=of` the
    node steps over the lines it holds and an arrow stops at its words instead of running through
    them into the centre. Only the geometry the converter has to decide reads an estimated axis; a
    frame Typst is asked to draw still comes off the measure written down, since Typst measures the
    glyphs and this only counts them.
    """
    w = node_frame_width(o, xf)
    h = None
    for key in ("minimum height", "text height", "minimum size"):
        got = _length(o.get(key), xf)
        if got is not None:
            h = max(h or 0.0, got)
    if node_shape(o) == "circle":
        # pgf's `circle` has ONE diameter and its anchors sit ON the round path: with pdflatex
        # `minimum width=1cm`, `minimum height=1cm` and `minimum size=1cm` each read
        # `east - center` = 14.426pt on BOTH axes, two unequal keys take the larger in either order,
        # and a label wider than that grows the circle instead of squaring it
        # (_work/measure_shaped_node_frame.py). One measure is therefore enough to fix the whole box,
        # which is also what hands `emit_node` a range to draw the circle on rather than leaving the
        # node to Typst's rectangle. Where nothing was written down the words decide the circle and
        # only Typst knows how wide they are, so the height the label measures is left standing for
        # the anchors that can read it.
        d = max(w or 0.0, h or 0.0)
        if d:
            return (d / 2.0, d / 2.0)
    if h is None:
        h = _text_height(o, xf, text)
    if w is None:
        w = _text_width(o, xf, text)
    return (None if w is None else w / 2.0, None if h is None else h / 2.0)


def node_font_size(o):
    """A node's `font=` option -> the point size to render its text at, or None.

    TikZ's size names are relative to the document class, so the answer comes from pdflatex's own
    `\\f@size` (TEX_SIZE_PT); `\\fontsize{9}` already carries an absolute number. A `font=` that
    names only a shape (`\\bfseries`) says nothing about size and leaves the node at the body's.
    """
    val = o.get("font")
    if not isinstance(val, str):
        return None
    m = FONT_SIZE_EXPLICIT.search(val)
    if m:
        return float(m.group(1))
    m = FONT_SIZE_NAME.search(val)
    return TEX_SIZE_PT[m.group(1)] if m else None


def _node_body(rest):
    """The label group a node statement writes after its position, as the author wrote it."""
    i = (rest or "").find("{")
    if i < 0:
        return None
    inner, _end = bracketed(rest, i)
    return inner


def _node_pad(o, xf, axis):
    """The slack pgf leaves between a node's words and its border on one axis, in cm.

    `inner sep` writes both axes, `inner xsep` and `inner ysep` one each -- `node_padding` reads the
    three in the order pgf executes them -- and an axis nobody wrote is pgf's default of .3333em plus
    half its rule. That default is priced at the DOCUMENT's font, not the node's: pdflatex leaves
    3.3330pt on every side of a `P` from `\\tiny` to a 20pt label, every one of them .3333em of the
    10pt class the package was loaded at (_work/measure_node_sep_whose_font.py -- while the INK does
    follow the node, cmr9's capital being 6.15pt where cmr10's is 6.83). It is the same slack on both
    axes and for every label (_work/measure_node_label_ink.py and _work/measure_node_vertical_ink.py
    give the same 7.70pt around all 24 labels at 11pt, whether `x` or `$F_{1,+}^{+,+}$`), so the two
    mirrors of the box measure it here once instead of each keeping its own default.
    """
    sep = node_padding(o, xf)[0 if axis == "x" else 1]
    if sep is None:
        return INNER_SEP + PGF_LINE_WIDTH / 2.0
    return sep


def _text_height(o, xf, text):
    r"""How tall a node's own label is in cm, or None when the label was never read.

    A node with no height written down is as tall as the ink TeX set inside it, from the highest mark
    of any row it carries to the lowest -- `_ink_v` counts the glyph, the scripts hanging off it and
    the root or fraction it wears -- plus the slack of `_node_pad` above and below.

    Only a label TeX sets as a PARAGRAPH breaks into rows at all: `\node {one\\two}` without
    `text width` or `align=` stays one line at any number of `\\` (_work/measure_node_box_shapes.py),
    while the same label in a box of its own gains one TEX_LINE_HEIGHT_PT leading between each pair of
    them, so the rows in between are paid for by the leading and only the first and last by their own
    ink -- the first at least as tall as the line TeX keeps, which is the taller of the two for the
    x-height words a flowchart writes. A paragraph at a size the leading table never measured is left
    unpriced rather than guessed at, and Typst's own text height stands.
    """
    if not text:
        return None
    size = node_font_size(o)
    if size is None:
        size = NODE_BODY_SIZE_PT
    parts = LINE_BREAK.split(text)
    if o.get("text width") is None and o.get("align") is None:
        # the label keeps one line whatever `\\` it carries, but every row's mark still counts and the
        # break's own bracket is syntax, not ink: pdflatex stands `one\\[3pt]two\\...\\six` at
        # 13.3159pt at \small -- the 0.694em of its `h`, no delimiter from the `[3pt]` on top
        # (_work/node_vertical_ink_small.txt), and `a\\b\\c` at 14.0104pt for the 0.694em of `b`
        rows = [_ink_v(row) for row in parts[0::2]]
        ink = (max(top for top, _ in rows) + max(low for _, low in rows)) * size
    else:
        row = TEX_LINE_HEIGHT_PT.get(size)
        if row is None:
            return None
        # a row is as tall as the taller of its own ink and the line TeX keeps for it
        # (_work/measure_node_row_height.py: six \small rows with an 8pt inner sep and a 3pt gap are
        # 78.275pt, whose first line is the 4.275pt line rather than the 3.879pt of `one`)
        first = _ink_v(parts[0])
        ink = max(row[0], first[0] * size) + _ink_v(parts[-1])[1] * size
        # LINE_BREAK's capture group puts each row's own gap between the rows it split
        ink += (len(parts) // 2) * row[1]
        for gap in parts[1::2]:
            got = _length(gap, xf)
            if got:
                ink += got / UNITS["pt"]
    return ink * UNITS["pt"] + 2 * _node_pad(o, xf, "y")


# What TeX charges for one visible character of a node label, in ems of the node's own size: the
# median over the corpus's own labels set at article's 10pt (_work/measure_node_label_width.py).
# A sub/superscript is set smaller and a space thinner, so each counts as part of one character;
# a capital is the one glyph the median under-prices, since the corpus's maths nodes are mostly one
# letter wide and `$X$` costs .91em where `$i$` costs .35.
INK_EM = 0.5
INK_CAP = 0.8
INK_SCRIPT = 0.7
INK_SPACE = 0.3
INK_SCRIPT_GROUP = re.compile(r"[_^]\s*(?:\{([^{}]*)\}|([A-Za-z0-9+\-*(),=|!.]))")
CS_GROUP = re.compile(r"\\[a-zA-Z]+\s*\{([^{}]*)\}")
CS_WORD = re.compile(r"\\([a-zA-Z]+)")
MATH_DELIM = re.compile(r"\\[()[\]]|\$")


def _ink_em(label):
    r"""How many ems of the node's own size a label's ink costs.

    Math delimiters carry no ink; a command that takes a braced argument prints only that argument
    (`\mathcal{P}` is the P, `\text{Readout}` the word); any other control word stands for one glyph
    of its own, which is what the `\alpha` and `\times` of a label are. The rest of the markup is
    braces and spacing that leave no mark.
    """
    s = MATH_DELIM.sub("", label or "")
    s = INK_SCRIPT_GROUP.sub(lambda m: "@" + (m.group(1) or m.group(2)) + "@", s)
    s = CS_GROUP.sub(lambda m: m.group(1), s)
    s = CS_WORD.sub("x", s)
    s = re.sub(r"@@|[{}\\\s]+", " ", s)
    em = 0.0
    script = False
    for ch in s:
        if ch == "@":
            script = not script
        elif ch == " ":
            em += INK_SPACE * INK_EM
        else:
            em += (INK_CAP if ch.isupper() else INK_EM) * (INK_SCRIPT if script else 1.0)
    return em


# How far one line of a label reaches above and below the baseline it stands on, in ems of the node's
# own size. pdflatex set each glyph on its own and answered `\ht0` and `\dp0`
# (_work/measure_node_glyph_heights.py -- _work/node_glyph_heights.txt, 277 readings at 10, 11 and
# 12pt; the 10pt column is quoted, the other two agree to the second decimal because an em is the
# same box at every size), and every price below is a spelling a node label in the corpus actually
# carries (_work/probe_node_label_shapes.py -- _work/node_label_shapes.txt, 8 139 labels): `\dot`,
# `\vec` and `{array}` are left unpriced because no label in 724 papers writes one.
V_LOW = (0.431, 0.0)        # a c e m n o r s u v w x z
V_TALL = (0.694, 0.0)       # b d h k l
V_DESC = (0.431, 0.194)     # g p q y ;
V_CAP = (0.683, 0.0)
V_DIGIT = (0.644, 0.0)
V_DELIM = (0.750, 0.250)    # ( ) [ ] { } / | \ -- the stretchy maths glyphs, at their unstretched size
V_BINOP = (0.583, 0.083)    # + - \times \div ... and what a word nobody priced is read as
V_RULE = (0.367, 0.0)       # = \to \mapsto \rightarrow
V_REL = (0.539, 0.039)      # < > \in \subset \supset
V_DOT = (0.106, 0.0)

V_LETTER = dict.fromkeys("aceemnorsuvwxz:", V_LOW)
V_LETTER.update(dict.fromkeys("bdhkl", V_TALL))
V_LETTER.update(dict.fromkeys("gpqy;", V_DESC))
V_LETTER.update(f=(0.694, 0.0), t=(0.615, 0.0), i=(0.668, 0.0), j=(0.668, 0.194))

V_COMMAND = dict.fromkeys(("sum", "prod", "coprod", "bigcup", "bigcap", "bigsqcup", "langle",
                           "rangle", "setminus", "mid", "parallel", "surd", "lbrace", "rbrace",
                           "lfloor", "rfloor", "lceil", "rceil"), V_DELIM)
V_COMMAND.update(dict.fromkeys(("int", "oint", "iint"), (0.806, 0.306)))
V_COMMAND.update(dict.fromkeys(("pm", "mp", "times", "div", "oplus", "ominus", "otimes",
                                "oslash", "varnothing"), V_BINOP))
V_COMMAND.update(dict.fromkeys(("to", "gets", "mapsto", "rightarrow", "longrightarrow",
                                "leftarrow", "sim"), V_RULE))
V_COMMAND.update(dict.fromkeys(("le", "ge", "subseteq", "supseteq"), (0.636, 0.136)))
V_COMMAND.update(dict.fromkeys(("ne", "neq", "dagger", "S", "P"), (0.694, 0.194)))
V_COMMAND.update(dict.fromkeys(("in", "subset", "supset"), V_REL))
V_COMMAND["notin"] = (0.750, 0.039)
V_COMMAND.update(dict.fromkeys(("cdot", "circ", "bullet", "cdots", "diamond"), (0.444, 0.0)))
V_COMMAND.update(dict.fromkeys(("ast", "star", "triangleleft", "triangleright"), (0.465, 0.0)))
V_COMMAND.update(dict.fromkeys(("cup", "cap", "prime"), (0.556, 0.0)))
V_COMMAND.update(equiv=(0.464, 0.0), approx=(0.483, 0.0), cong=(0.634, 0.050),
                 leadsto=(0.378, 0.0), angle=(0.692, 0.0), hbar=(0.689, 0.0),
                 emptyset=(0.750, 0.056), ldots=V_DOT)
V_COMMAND.update(dict.fromkeys(("partial", "ell", "forall", "exists", "perp", "Re"), (0.694, 0.0)))
V_COMMAND.update(dict.fromkeys(("alpha", "epsilon", "varepsilon", "kappa", "nu", "sigma", "tau",
                                "upsilon", "pi", "omega", "imath", "infty", "propto"), V_LOW))
V_COMMAND.update(dict.fromkeys(("gamma", "mu", "rho", "chi", "jmath"), V_DESC))
V_COMMAND.update(dict.fromkeys(("beta", "zeta", "xi", "psi", "phi", "varphi"), (0.694, 0.194)))
V_COMMAND.update(dict.fromkeys(("delta", "theta", "vartheta", "lambda"), (0.694, 0.0)))
V_COMMAND.update(dict.fromkeys(("Gamma", "Delta", "Theta", "Lambda", "Xi", "Pi", "Sigma", "Upsilon",
                                "Phi", "Psi", "Omega", "nabla"), V_CAP))

V_SYMBOL = dict((ch, V_DELIM) for ch in "{}[]()|/")
V_SYMBOL.update({"$": None, " ": None, "\t": None, "\n": None, "~": None, "%": (0.750, 0.056),
                 "&": (0.694, 0.0), "'": (0.752, 0.0), "?": (0.694, 0.0), "!": (0.694, 0.0)})

# How the pieces of a line stack. A sub/superscript is set at `\font\scriptfont` -- pdflatex reads
# the same maths 0.70 an em tall and deep (`_work/measure_node_scripts.py`) -- and it is placed off
# the base, not off the previous script: a superscript's own top clears the baseline by .36em, a lone
# subscript's bottom drops .15em, and a subscript written under a superscript drops further still.
# A base that carries its limits ON the glyph -- an integral, a sum, an accent -- has to lift them
# clear of itself as well.
V_SCRIPT = 0.7
V_SUP_RISE = 0.36
V_SUB_DROP = 0.15
V_SUB_PAIRED = 0.25
V_SUP_CLEAR = 0.02
V_RIDE_TOP = 0.20
V_RIDE_BOTTOM = 0.05
V_MATH_AXIS = 0.25          # the axis a `\left ... \right` delimiter is stretched about
V_LEFT_SLACK = 0.04
V_BIG = {"big": (0.850, 0.350), "Big": (1.150, 0.650), "bigg": (1.450, 0.950),
         "Bigg": (1.750, 1.250)}
V_ACCENT = {"hat": 0.262, "widehat": 0.319, "check": 0.197, "breve": 0.263, "tilde": 0.236,
            "widetilde": 0.319, "acute": 0.263, "grave": 0.263, "mathring": 0.263,
            "overline": 0.20, "bar": 0.20}
V_BIGOP = frozenset(("sum", "prod", "coprod", "int", "oint", "iint", "bigcup", "bigcap", "bigsqcup"))
V_SPACING = frozenset((",", ";", ":", "!", " ", "quad", "qquad"))
V_WORD = re.compile(r"[A-Za-z]+")


def _ink_v(label):
    r"""A label's ink above and below its baseline, in ems: the (top, bottom) of ONE line.

    The other axis of `_ink_em`, and read the same way -- `$` carries no ink, a command that takes an
    argument prints only that argument, a control word with none is one glyph of its own. What it
    adds is the vertical composition TeX performs: scripts hang off the base rather than the previous
    script, a big operator's or an accent's limits ride clear of the glyph they sit on, and `\left`
    ...`\right` stretches its delimiter about the maths axis. Row breaks price each row apart
    (`_text_height`), and a construct with no measured row -- `{cases}`, `{array}` -- reads as the
    words it holds, which is what the corpus's single such label leaves standing.
    """
    top, bottom, _ = _v_scan(label or "", 0)
    return (top, bottom)


def _v_scan(text, i, until_right=False):
    """Walk one group's atoms from `i` -> (top, bottom, index just past what was read)."""
    top = bottom = 0.0
    while i < len(text):
        ch = text[i]
        if ch == "}":
            break
        if until_right and text.startswith("\\right", i):
            break
        atom, i = _v_read(text, i)
        sup, sub, i = _v_scripts(text, i)
        rise, drop = _v_place(atom, sup, sub)
        top, bottom = max(top, rise), max(bottom, drop)
    return top, bottom, i


def _v_read(text, i):
    """One atom of a label -> ((top, bottom, rides), index just past it)."""
    if text[i] == "{":
        top, bottom, j = _v_scan(text, i + 1)
        return (top, bottom, False), (j + 1 if j < len(text) else j)
    if text[i] == "\\":
        return _v_command(text, i + 1)
    ch = text[i]
    if ch.isdigit():
        pair = V_DIGIT
    elif ch.isupper():
        pair = V_CAP
    else:
        pair = V_LETTER.get(ch) or V_SYMBOL.get(ch, V_BINOP)
    if pair is None:
        return (0.0, 0.0, False), i + 1
    return (pair[0], pair[1], False), i + 1


def _v_command(text, i):
    """The control sequence whose backslash sits at `i - 1` -> (atom, index just past it)."""
    if i >= len(text):
        return (0.0, 0.0, False), i
    if text[i] == "\\":
        return (0.0, 0.0, False), i + 1      # `\\` -- a row break, which `_text_height` splits on
    if text[i] in "{}[]|()":
        return (V_DELIM[0], V_DELIM[1], False), i + 1
    if text[i] in ",;:! ":
        return (0.0, 0.0, False), i + 1          # `\,` and `\ ` ask for room, not for ink
    m = V_WORD.match(text, i)
    if m is None:
        pair = V_SYMBOL.get(text[i], V_BINOP)
        return (pair[0], pair[1], False), i + 1
    word, j = m.group(0), m.end()
    if word in V_SPACING:
        return (0.0, 0.0, False), j
    if word[:3] in ("big", "Big"):
        key = word
        while key and key not in V_BIG and key[-1] in "lrm":
            key = key[:-1]
        if key in V_BIG:
            return (V_BIG[key][0], V_BIG[key][1], False), _v_skip_delim(text, j)
    if word == "left":
        top, bottom, j = _v_scan(text, _v_skip_delim(text, j), True)
        stretch = max(top - V_MATH_AXIS, bottom + V_MATH_AXIS)
        if text.startswith("\\right", j):
            j = _v_skip_delim(text, j + 6)
        # TeX never SHRINKS the delimiter below its own glyph, however short the body is: a
        # `\left(x\right)` measures 0.750 over 0.250 -- a whole em, while its `x` is 0.431 of it --
        # and only a body taller than that stretches the glyph about the axis
        # (_work/measure_left_delim_floor.py: `x`, `a`, `u`, `q`, `y` and a prose label all stand at
        # 1.0000em of ink, `x^2` and a fraction at 1.2000, an integral at 1.8000). The .04 the
        # stretched half pays above pdflatex is #74's named residual.
        if stretch + V_MATH_AXIS <= V_DELIM[0]:
            return (V_DELIM[0], V_DELIM[1], False), j
        radius = stretch + V_LEFT_SLACK
        return (V_MATH_AXIS + radius, max(0.0, radius - V_MATH_AXIS), False), j
    if word in V_ACCENT:
        num, den, j = _v_argument(text, j)
        return (num + V_ACCENT[word], den, True), j
    if word == "underline":
        num, den, j = _v_argument(text, j)
        return (num, den + 0.20, False), j
    if word in ("frac", "tfrac", "cfrac", "dfrac"):
        num, den, j = _v_argument(text, j)
        sup, deep, j = _v_argument(text, j)
        if word == "dfrac":
            # set in display style, so the pair is spread wide around the rule and the whole
            # denominator hangs below the baseline
            return (0.677 + num, 0.042 + sup, False), j
        return (0.22 + num, 0.34 + deep, False), j
    if word == "sqrt":
        if text.startswith("[", _v_space(text, j)):
            j = text.find("]", _v_space(text, j))
            j = len(text) if j < 0 else j + 1
        num, den, j = _v_argument(text, j)
        return (num + 0.37, den + 0.24, True), j
    if word in V_COMMAND:
        num, den = V_COMMAND[word]
        return (num, den, word in V_BIGOP), j
    num, den, k = _v_argument(text, j, loose=True)
    if k > j:
        # a command the gauge never priced still prints the argument it carries -- `\pmod{2}`, a
        # `\operatorname{}`, a `\begin{tikzpicture}` -- which is a better answer than one glyph
        return (num, den, False), k
    return (V_BINOP[0], V_BINOP[1], False), j


def _v_scripts(text, i):
    """The `^` and `_` scripts hanging off the atom just read."""
    sup = sub = None
    for _ in range(2):
        j = _v_space(text, i)
        if j >= len(text) or text[j] not in "^_":
            break
        if text[j] == "^" and sup is not None:
            break
        if text[j] == "_" and sub is not None:
            break
        atom, i = _v_read(text, j + 1)
        if text[j] == "^":
            sup = atom
        else:
            sub = atom
    return sup, sub, i


def _v_place(atom, sup, sub):
    """Where a base with its scripts puts the ink, in ems above and below the baseline."""
    top, bottom = atom[0], atom[1]
    if sup is None and sub is None:
        return top, bottom
    if sup is not None:
        rise = V_SUP_RISE + V_SCRIPT * sup[0]
        if sub is not None:
            # the pair is stacked on each other, so the upper has to clear the lower's own top
            rise = max(rise, V_SCRIPT * (sub[0] - sub[1]) - V_SUB_DROP
                       + V_SCRIPT * (sup[0] + sup[1]) + V_SUP_CLEAR)
        top = max(top, rise)
    if sub is not None:
        drop = (V_SUB_PAIRED if sup is not None else V_SUB_DROP) + V_SCRIPT * sub[1]
        bottom = max(bottom, drop)
    if atom[2]:
        top = max(top, atom[0] + V_RIDE_TOP)
        bottom = max(bottom, atom[1] + V_RIDE_BOTTOM)
    return top, bottom


def _v_argument(text, i, loose=False):
    """The group (or lone token) a command takes -> (top, bottom, index just past it)."""
    i = _v_space(text, i)
    if i >= len(text):
        return 0.0, 0.0, i
    if text[i] == "{":
        top, bottom, j = _v_scan(text, i + 1)
        return top, bottom, (j + 1 if j < len(text) else j)
    if loose:
        return 0.0, 0.0, i
    atom, j = _v_read(text, i)
    return atom[0], atom[1], j


def _v_skip_delim(text, i):
    r"""The delimiter a `\left` or `\big` writes, which the command itself is priced for."""
    i = _v_space(text, i)
    if i >= len(text):
        return i
    if text[i] == "\\":
        return _v_command(text, i + 1)[1]
    return i + 1


def _v_space(text, i):
    """The index of the next character that is not a space."""
    while i < len(text) and text[i] in " \t\n":
        i += 1
    return i


def _text_width(o, xf, text):
    r"""How wide a node's own label is in cm, or None when the label was never read.

    The mirror of `_text_height`: TikZ sizes a node to the words TeX set inside it, so a box nobody
    wrote down is its ink plus the engine's slack on each side. pdflatex answers `east - center` as
    `\wd0 / 2 + .3333em + half the line width` for every label tried
    (_work/measure_node_label_ink.py -- the same 7.699pt of slack on all 24, maths and prose alike),
    and the ink is `INK_EM` a visible character. Typst measures the same words far better than this
    counts them, so the number is for the geometry the converter must decide on its own -- where a
    line stops, where a `label=` clears the box, how far a neighbour steps -- and never for a frame
    Typst is asked to draw.
    """
    if not text:
        return None
    if node_shape(o) == "circle":
        # a round node is ONE radius, and `_anchor_ring` already refuses to guess that radius from a
        # label; counting characters would answer with two unequal halves of a rectangle instead
        return None
    size = node_font_size(o)
    if size is None:
        size = NODE_BODY_SIZE_PT
    # LINE_BREAK's capture group puts each row's own gap between the rows it split
    rows = LINE_BREAK.split(text)[0::2]
    if o.get("text width") is not None or o.get("align") is not None:
        # a label TeX sets as a PARAGRAPH is as wide as its widest row; one it never breaks runs on
        # a single line however many `\\` it carries, which is what _text_height measured
        ink = max(_ink_em(row) for row in rows)
    else:
        ink = sum(_ink_em(row) for row in rows)
    return ink * size * UNITS["pt"] + 2 * _node_pad(o, xf, "x")


def _outer_sep(o, xf):
    """How far a node's border sits outside the box the author fixed, in cm.

    Measured against pdflatex (`_work/pic-shapes/measure_outer_sep.py`): TikZ's `outer sep` answers
    half the node's own line width, whether or not the node is drawn -- 0.4070cm of radius for a
    `minimum size=8mm` circle on pgf's 0.4pt rule, 0.4351cm for the same node with `line width=2pt`
    -- and a size the author wrote replaces that answer exactly.  The pen is read through
    `pen_width_pt`, so a node carrying `[thick]` moves its border by the same half as one carrying
    `line width=0.8pt`, and it is priced as the PAGE length it is: `_work/measure91_pen_widths.py`
    section D shows `scale=2` and `x=2cm` leave the rule at 1.993pt, so the transform must not
    reprice it -- while the box the words sit in does not move at all (`_work/measure91_node_pen_box.py`:
    `center->east` grows by exactly half the pen's change, 0.2pt for `thick`, 5.8pt for a 12pt head,
    and the words' slack keeps pgf's .3333em).
    """
    sep = o.get("outer sep")
    if sep is not None and sep is not True and str(sep).strip() != "auto":
        return _length(str(sep), xf)
    want = pen_width_pt(o)
    return (want if want is not None else 0.4) * UNITS["pt"] / 2.0


def _anchor_ring(o, xf):
    """The radius of the circle a `to` leaves and re-enters a *round* node through, or None.

    TikZ puts a tangent `to`'s endpoints on the node's border, not its centre, and for a `circle`
    node that border is the declared half-size plus `outer sep`; `_work/pic-shapes/measure_outer_sep.py`
    reads the radius as exactly that for `minimum size` 8mm and 20mm, for an undrawn node and for
    one with a written `outer sep`. A node sized by its own text is the one case the numbers will
    not give back -- the label `wide text here` grew its circle to 1.2423cm against the 0.4070cm its
    `minimum size=8mm` claims -- so a node whose box was never written down keeps the ring None and
    its loop stays refused rather than drawn on a guessed circle.
    """
    if node_shape(o) != "circle":
        return None
    hw, hh = node_size(o, xf)
    sep = _outer_sep(o, xf)
    if hw is None or hh is None or hw != hh or sep is None:
        return None
    return hw + sep


# the eight compass points and the centre, as the unit directions TikZ names them on a node's border
COMPASS = {"center": (0.0, 0.0), "mid": (0.0, 0.0), "text": (0.0, 0.0),
           "east": (1.0, 0.0), "west": (-1.0, 0.0), "north": (0.0, 1.0), "south": (0.0, -1.0),
           "north east": (1.0, 1.0), "north west": (-1.0, 1.0),
           "south east": (1.0, -1.0), "south west": (-1.0, -1.0)}


def _anchor_point(box, anchor):
    """A named point's box and an anchor suffix -> the page point that anchor names.

    TikZ puts `.west`, `.north east` and the rest on the node's *border*, not its centre, so a
    path written to `(disks.west)` starts at the west edge; reading the centre drew the line
    through the node's own text. A box the author never sized has its label's ink for a half-extent
    (`_text_width`), so the named points land outside the letters as they do on the page; a circle
    keeps every anchor at its centre, since nothing we can count says where its round border is
    (`_anchor_ring`), and an unknown suffix falls back to the centre rather than inventing a place.
    """
    x, y = box[0], box[1]
    d = COMPASS.get(" ".join((anchor or "").split()).lower())
    if d is None or d == (0.0, 0.0):
        return (x, y)
    dx, dy = d
    ring = box[4] if len(box) > 4 else None
    if ring is not None:
        norm = math.hypot(dx, dy)
        return (x + ring * dx / norm, y + ring * dy / norm)
    hw = box[2] if len(box) > 2 else None
    hh = box[3] if len(box) > 3 else None
    if (dx and hw is None) or (dy and hh is None):
        return (x, y)
    return (x + dx * (hw or 0.0), y + dy * (hh or 0.0))


def _clip_to_border(box, at, toward):
    """A segment endpoint named by a bare node -> the point its line crosses the border.

    TikZ draws `(a) -- (b)` from border to border, not centre to centre, so a line written between
    two boxes stops at each frame instead of running through its text. The crossing is the ray from
    the centre toward the other end; a round node meets it on the ring, a box on whichever
    half-extent the ray reaches first -- and since #73 a box whose measure the author never wrote has
    one too, its label's ink, which is what keeps an arrowhead out of the letters. A circle sized only
    by words it never wrote down leaves the point where it is, because no count of characters gives
    back the one radius it has.
    """
    x, y = box[0], box[1]
    dx, dy = toward[0] - x, toward[1] - y
    if dx == 0.0 and dy == 0.0:
        return at
    ring = box[4] if len(box) > 4 else None
    if ring is not None:
        t = ring / math.hypot(dx, dy)
    else:
        hw = box[2] if len(box) > 2 else None
        hh = box[3] if len(box) > 3 else None
        if hw is None or hh is None:
            return at
        tx = hw / abs(dx) if dx else float("inf")
        ty = hh / abs(dy) if dy else float("inf")
        t = min(tx, ty)
    return (x + dx * t, y + dy * t)


def box_visible(o):
    """Whether the author asked to see this node's frame.

    TikZ sizes a node from 'text width' even when it draws nothing around it, and a bare colour on a
    node inks its *text*, not a border: `\\node[blue!65!black] at (1,2) {primary pieces};` stands on
    the page with no rectangle. Only 'draw' or 'fill' asks for one, and `draw=none` takes the 'draw'
    back again -- `\\node[blue,fill=red,draw=none]` is red field under blue words with no rule
    (`_work/measure_bare_color_node.py`), so the two keys are asked separately and neither one gets
    a vote over the other. A stroke-thickness or dash written without either colours a frame that is
    never drawn and invents nothing.
    """
    draw = o.get("draw")
    fill = o.get("fill")
    return ((draw is not None and draw != "none")
            or (fill is not None and fill != "none"))


def dot_radius(o, pad, extent):
    """How far an empty node's drawn circle reaches from its point, in cm.

    A node holding nothing is a box made of padding alone, so pgf's circle around it has the padding's
    own diagonal for a radius: pdflatex reads `east - center` as 1.614pt at `inner sep=1pt`, 3.029pt at
    2pt, 20.321pt at 5mm and 4.914pt at nothing written -- sqrt(2) times the sep in each case, plus the
    0.2pt the rule sticks out (_work/measure_shaped_node_frame.py). A declared `minimum size` is the
    larger half once it has grown past that, which is the same max a circle sized by its words obeys;
    where the measure was read as (None, None) the words or the padding decide. A node that names no
    circle is drawn as the point it has always been, since CeTz has no empty rectangle either.
    """
    if node_shape(o) != "circle":
        return 0.05
    got = 2 ** 0.5 * pad
    return max(got, max(extent)) if None not in extent else got


def default_distance(o, xf):
    r"""The separation a `node distance=` writes -> (horizontal, vertical) cm, or None.

    TikZ separates the two boxes EDGE to edge here too -- the same reading a per-statement distance
    gets -- and its default is 1cm. Read with pdflatex (`_work/m100_nd_probe.tex`, anchors dumped
    through `\pgfgetlastxy`): the gap is `B.west - A.east` = 28.453pt for the default and 102.430pt
    = 36mm under `node distance=13mm and 36mm`, and a reference node whose own label is three times
    as wide (half-width 49.28pt) leaves exactly the same 102.430pt, since the border the measurement
    starts from is already the wider one.

    Its two-number form names the axes in the OPPOSITE order to a statement's: 13mm above moved the
    VERTICAL (36.989pt) while 36mm right moved the HORIZONTAL, and writing `36mm and 13mm` swaps the
    two readings -- where `right=1cm and 2cm of a` follows its own direction word instead (the law
    already measured inside `placed_at`). A single value answers both axes, and the corpus writes only
    these two shapes, always in mm or cm: `node distance=` stands on the picture's own brackets in
    every one of its 56 pictures and never on a scope, a `\tikzset{}` or a node statement
    (`_work/probe100c_where_node_distance.py`).
    """
    val = (o or {}).get("node distance")
    if not isinstance(val, str):
        return (NODE_DISTANCE, NODE_DISTANCE)
    parts = [p.strip() for p in re.split(r"\s+and\s+", val.strip())]
    if len(parts) == 1:
        gap = _length(parts[0], xf)
        return None if gap is None else (gap, gap)
    if len(parts) == 2:
        vert, horiz = (_length(p, xf) for p in parts)
        return None if None in (vert, horiz) else (horiz, vert)
    return None


def placed_at(key, val, names, xf, size, o=None):
    """'right=0.35cm of reset' -> the centre that sets this node beside that one, or None.

    TikZ separates the two boxes by the gap measured edge to edge, and we know a box only when
    the author fixed its size. Where it was left to the text we take the node for a point: the
    distance is then centre to centre, which is what the older 'right of=a' spelling meant and
    what keeps a flowchart readable when a box is a little closer than the paper drew it.

    A statement that writes no distance asks the picture instead: `node distance=13mm and 36mm`
    on the picture's own brackets is the gap every bare `right=of a` in it separates by, and it
    reaches `o` the way any other head default does (through `resolve_opts`, as the `picture`
    style). Left unread it was the 1cm TikZ uses when nobody writes anything, which pulled the
    nodes of 52 pictures over each other by up to 2.6cm.

    The reference may also be a calc expression -- 'below=16mm of $(count)!0.5!(bounds)$' names the
    midpoint of two anchors -- which resolves to a bare point with no box of its own, so the gap is
    measured from that point. Reading only the named form left such a node at the scope origin, on
    top of whatever else stood there.
    """
    if key not in DIRECTION or not isinstance(val, str):
        return None
    text = val.strip()
    m = OF_TARGET.match(text)
    if m:
        ref = (names or {}).get(m.group(3))
        if ref is None:
            return None
        rx, ry = ref[0], ref[1]
        rw = ref[2] if len(ref) > 2 and ref[2] is not None else 0.0
        rh = ref[3] if len(ref) > 3 and ref[3] is not None else 0.0
        # 'of a.south' names the reference's own anchor; a box the author never fixed leaves that
        # anchor at the centre, which is the same reading a named point in a coordinate gets
        ax = DIRECTION.get(m.group(4) or "")
        if ax:
            rx, ry = rx + ax[0] * rw, ry + ax[1] * rh
        first, second = m.group(1), m.group(2)
    else:
        m = OF_CALC.match(text)
        if not m:
            return None
        at = point("(" + m.group(3) + ")", None, names, xf)
        if at is None:
            return None
        rx, ry, rw, rh = at[0], at[1], 0.0, 0.0
        first, second = m.group(1), m.group(2)
    half_w, half_h = size
    gap = default_distance(o, xf)
    if gap is None:
        return None
    gx, gy = gap
    if first:
        # a distance the statement writes itself outranks the picture's own, on both axes at once
        # when it names only the one (`right=2cm of a` in a `node distance=13mm and 36mm` picture
        # separates by 2cm, `_work/m100_nd_probe.tex`)
        gap = _length(first, xf)
        if gap is None:
            return None
        gx = gy = gap
    if second:
        # 'below left=1cm and 2cm of a' names the two axes in the order the direction word does,
        # measured with pdflatex: the first number moved the vertical of 'below left', the second
        # the horizontal, and 'right=1cm and 2cm' would swap them
        other = _length(second, xf)
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
            # a name carries its box as well, which a later 'right=of' node needs; a `.west`/`.north
            # east` reference lands on that box's edge, not its centre -- TikZ measured: an arrow
            # from `(disks.west)` starts at the west edge, and reading the centre drew it through
            # the node's own text
            return _anchor_point(names[m2.group(1)], m2.group(2))
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
    t = _transform(opts(inner), xf, names)
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
        names[head[0]] = _named_box_entry(head[1], o, xf, _node_body(head[2]), names)


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
    r"\rightrightarrows": "arrow.r.double.bar",
    # `\Vdash` is the DOUBLE-barred tack: pdflatex prints U+22A9 for it and U+22A8 for `\vDash`, and
    # Typst's names for those two are `forces` and `tack.rr` (`_work/measure_vdash.py`). The old entry
    # sent `\Vdash` to `tack.r.double`, which is U+22A8 -- one bar short of what the author wrote, and
    # deprecated besides.
    r"\Vdash": "forces",
    r"\ddagger": "dagger.double", r"\i": "i.dot",
    r"\displaystyle": " ",
    # the figure labels the leak audit named (probe_leak_names.py), each spelling compiled alone
    # and its glyph read back (probe_verify_spellings.py) so a name that compiles to the wrong
    # symbol is not shipped: `\cap` is Typst's `inter`, `\otimes` has no name and takes the glyph
    r"\cap": "inter", r"\mid": "divides", r"\sim": "tilde.op", r"\simeq": "tilde.eq",
    r"\langle": "chevron.l", r"\rangle": "chevron.r", r"\longmapsto": "arrow.r.long.bar",
    r"\otimes": "\u2297", r"\leftrightarrow": "arrow.l.r", r"\ast": "ast.op",
    r"\pm": "plus.minus", r"\notin": "in.not", r"\cong": "tilde.equiv",
    r"\jmath": "dotless.j", r"\ni": "in.rev", r"\bigoplus": "xor.big", r"\gg": "gt.double",
    r"\int": "integral", r"\lfloor": "floor.l", r"\rfloor": "floor.r",
    r"\longleftrightarrow": "arrow.l.r.long", r"\longleftarrow": "arrow.l.long",
    r"\Longleftrightarrow": "arrow.l.r.double.long", r"\neg": "not",
    r"\preceq": "prec.curly.eq", r"\supseteq": "supset.eq", r"\supset": "supset",
    r"\bot": "tack.t", r"\downarrow": "arrow.b", r"\uparrow": "arrow.t",
    r"\emptyset": "nothing", r"\iff": "arrow.l.r.double", r"\lor": "or",
    r"\prod": "product", r"\varrho": "rho.alt",
    r"\chi": "chi", r"\Psi": "Psi", r"\sum": "sum", r"\asymp": "asymp",
    r"\approx": "approx", r"\top": "top", r"\bullet": "bullet", r"\sharp": "sharp",
    r"\perp": "perp", r"\div": "div",
    # operator names: the letters are the operator's own, and Typst sets a bare name upright with
    # the right spacing, where the quoted fallback used the text font
    r"\cos": "cos", r"\sin": "sin", r"\tan": "tan", r"\cot": "cot", r"\sec": "sec",
    r"\csc": "csc", r"\tanh": "tanh", r"\max": "max", r"\min": "min", r"\sup": "sup",
    r"\inf": "inf", r"\ker": "ker", r"\dim": "dim", r"\deg": "deg", r"\exp": "exp",
    r"\liminf": "liminf", r"\Im": "Im", r"\Re": "Re",
    # sizing and style declarations draw nothing; leaving the name printed it as a word. `\left.`
    # and `\right.` are handled before the lookup, since their dot is an invisible delimiter.
    r"\left": " ", r"\right": " ", r"\big": " ", r"\Big": " ", r"\bigg": " ",
    r"\Bigg": " ", r"\bigl": " ", r"\bigr": " ", r"\Bigl": " ", r"\Bigr": " ",
    r"\biggl": " ", r"\biggr": " ", r"\Biggl": " ", r"\Biggr": " ", r"\bigm": " ",
    r"\Bigm": " ", r"\biggm": " ", r"\textstyle": " ", r"\scriptstyle": " ",
    r"\scriptscriptstyle": " ", r"\limits": " ", r"\nolimits": " ",
    r"\bmod": "mod", r"\th": "\u00fe", r"\aa": "\u00e5", r"\ae": "\u00e6",
    # a size name inside maths sets nothing we can honour -- the node's own size already carries
    # it (node_font_size) -- so the name goes rather than printing as a word
    r"\tiny": " ", r"\scriptsize": " ", r"\footnotesize": " ", r"\small": " ",
    r"\normalsize": " ", r"\large": " ", r"\Large": " ", r"\LARGE": " ",
    r"\huge": " ", r"\Huge": " ",
}

# A declaration that takes one argument and selects a Typst function, not a symbol: `\mathcal{Q}`
# is `cal(Q)`, and `{\rm d}` is `upright(d)`. The argument is walked like the rest of the maths, so
# `\widehat\lambda` becomes `hat(lambda)`. Every spelling below was compiled alone and its glyph
# read back (_work/probe_verify_funcs.py); `\bar` is Typst's `macron`, since `bar` draws |x|.
MATH_FUNCS = {
    "mathcal": "cal", "mathbb": "bb", "mathbf": "bold", "mathrm": "upright",
    "mathsf": "sans", "mathfrak": "frak", "mathit": "italic", "boldsymbol": "bold",
    "rm": "upright", "bf": "bold", "it": "italic", "sf": "sans", "tt": "mono",
    "overline": "overline", "bar": "macron", "widetilde": "tilde", "widehat": "hat",
    "vec": "arrow", "dot": "dot", "ddot": "dot.double", "hat": "hat", "tilde": "tilde",
    "sqrt": "sqrt", "check": "caron",
}
# The bare-token spelling `\mathcal M` (no braces) is the commonest form, and TikZ reads the next
# token as the argument; bracing it here lets the one lookup below handle both spellings.
MATH_DECL = re.compile(
    r"\\(mathcal|mathbb|mathbf|mathrm|mathsf|mathfrak|mathit|boldsymbol"
    r"|overline|widetilde|widehat|bar|vec|dot|ddot|hat|tilde|sqrt|check|rm|bf|it|sf|tt)"
    r"(?![A-Za-z])"
    r"\s*(\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}|\\[A-Za-z]+|[A-Za-z0-9])")
# `\pmod{n}` prints as `(mod n)`, whose `mod` is marked so the quote pass leaves it a name
MATH_PMOD = re.compile(r"\\pmod\s*(\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}|\\[A-Za-z]+|[^\s{}])")
# `\frac{A}{B}` (and TeX's brace-less `\frac14`) -> Typst's `frac(A, B)`, whose name is marked so
# the quote pass leaves it alone. Two brace groups, a command, or a single character each count.
# amsmath's `\tfrac`/`\dfrac`/`\cfrac` are the same fraction set smaller, bigger, or nested, and
# Typst spells all of them `frac`, so the prefix is read off rather than looked up.
MATH_FRAC = re.compile(
    r"\\[tdc]?frac\s*(\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}|\\[A-Za-z]+|[^\s{}])"
    r"\s*(\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}|\\[A-Za-z]+|[^\s{}])")


def _brace_decl(m):
    arg = m.group(2)
    return "\\%s%s" % (m.group(1), arg if arg.startswith("{") else "{%s}" % arg)


def _frac_call(m):
    a, b = m.group(1), m.group(2)
    return " \x01frac\x02(%s, %s) " % (a[1:-1] if a.startswith("{") else a,
                                       b[1:-1] if b.startswith("{") else b)


def _pmod_call(m):
    arg = m.group(1)
    return " (\x01mod\x02 %s) " % (arg[1:-1] if arg.startswith("{") else arg)


SCRIPT_GROUP = re.compile(r"([\^_])\{((?:\\.|[^{}])*)\}")


def _group_scripts(tex):
    r"""A braced script -> Typst's own grouping, innermost group first.

    Typst prints the braces a script carries: `$x_{i+1}$` reaches the page as `x{i+1}` with the braces
    drawn, while `$x_(i+1)$` and `$x_i$` set a clean subscript (`_work/brace_probe4.typ`, read at
    350 dpi; `N_(e,0)`, `z_a^(c_1)` and a two-level `x_(a^(i+1))` are in `_work/brace_probe5.typ`).
    The body's own braces are already gone by the time this runs -- the pass above strips every group
    that is not a script's -- except the ones the author escaped to get a character, and those print
    too: `$c_{\{k,j\}}$` sets `c{{k,j}}`, one pair too many, while `$c_(\{k,j\})$` sets the `c{k,j}`
    the author wrote (`_work/brace_probe6.typ`). So an escaped brace belongs inside the parentheses,
    and the group that carries it still loses its own.

    A single atom needs no group at all; a run of letters is spaced (`z_(i j)`) because TeX reads
    `z_{ij}` as two italic atoms while Typst reads the fused `ij` as one unknown name and the quote
    pass would print it upright; digits and letter-digit runs keep the old brace-free spelling
    (`x_{12}` -> `x_12`). Anything else goes into parentheses. A body with unbalanced parentheses is
    left alone rather than turned into a syntax error the gate would only report as a lost picture.
    """
    while True:
        def one(m):
            op, body = m.group(1), m.group(2)
            if not body or body.count("(") != body.count(")"):
                return m.group(0)
            if body.isalpha() and len(body) > 1:
                return op + "(" + " ".join(body) + ")"
            if body.isalnum():
                return op + body
            return op + "(" + body + ")"
        out = SCRIPT_GROUP.sub(one, tex)
        if out == tex:
            return tex
        tex = out


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

    Typst rejects a '#' in maths -- a bare hash switches to code mode and its neighbour reads as a
    variable (`$A#B$` is `unknown variable: B`) -- while the escaped `\\#` sets the hash glyph the
    author's own `\\#` sets (`_work/measure92_math_fidelity.py`: same characters, same gaps).  A
    nested '$' is a delimiter, not a character. A `_`/`^` needs something to hang from, and the
    honest statement of that is a list of what cannot END an atom -- an opening delimiter or another
    script -- rather than a list of what may: every one of the 80 distinct figure formulas the old
    allow-list refused compiles when handed to Typst as the maths it was
    (`_work/measure_refused_formulas.py`), a prime, a norm's closing `|`, a `+`, a symbol glyph and
    a space all being legal bases.  A slash and a comment pair are not on the list because `_math_body`
    never hands them to this guard: its own last pass turns every `/` into the `"/"` glyph, and `*/`,
    `/*` and `//` cannot be spelled without one.  A letter fused to a digit is broken by that pass's
    neighbour too, so this guard states what Typst refuses rather than what the converter leaves
    unfixed.
    """
    if re.search(r"(?<!\\)#", tex) or "$" in tex:
        return False
    for m in re.finditer(r"[\^_]", tex):
        base = tex[:m.start()].rstrip()
        if not base or base[-1] in "([{^_":
            return False
    if re.search(r"[\^_](?:[\^_]|$)", tex):
        return False
    return True


MATH_WORD = re.compile(r"\\([a-zA-Z]+)\s*(\{((?:[^{}]|\{[^{}]*\})*)\})?")
# TeX's spacing tokens are not control words, so they cannot go through the lookup. Typst reads
# them with its own lexer instead of TeX's: `\ ` BREAKS the line and `\,` prints a comma
# (`_work/probe86_control_space_face.py test`), while a `#h(<x>em)` charges exactly x times the
# current size on both engines. Measured against pdflatex (`_work/measure86_space_tokens.py`, the
# ink gap after a comma over the gap of a space TeX ignores, at 10pt): `\,` 1.664pt = .1664em,
# `\;` 2.769 = .2769, `\ ` and `~` 3.317 = .3317, `\!` -1.664 = -.1664 -- the mu table of the
# TeXbook (3/18, 5/18, one interword space, -3/18) to within the pixel the reading is worth.
MATH_SPACES = {r"\ ": "0.3333", r"\,": "0.1667", r"\;": "0.2778", r"\!": "-0.1667"}
# the lookbehind keeps a line break's own backslash out of it: `\\ ` is a break followed by a
# space, not a word space, and `\\,` likewise. The whitespace it eats on both sides is the author's
# input separator, which TeX ignores in maths and Typst prints -- without the eat, `R \, n` would
# be one Typst space plus our call and price the thin at a full interword space
MATH_SPACE = re.compile(r"(?<!\\)[ \t]*(\\[ ,;!])[ \t]*")
# the ratio rides to the end of the conversion as a holder rather than as Typst's own call:
# `math_safe` reads a '#', and a call spelled here would fail the guard and quote every label that
# carries a space; `quote_words` must not see the letters 'em' either, so they arrive after it ran.
# The call it expands to keeps a space on its right: Typst reads `h(...)(` as a second call and
# refuses the whole canvas (`_work/measure86_h_paren.py` -- all four sizes fail tight), and that
# space is free, since tight and spaced set the same line at the letters (slope 10.0000 pt/em,
# base 0.000) and `#h(0.3333em) ` measures 3.333pt against pdflatex's 3.317 for `\ `
MATH_HOLD = re.compile(r"\x04([-\d.]+)\x05")
# This table ends where the emitter writes its own maths. A `build_cd` label is Typst as pandoc
# left it, and there the dialect is different: pandoc prices `\,` at `thin` (1.833pt against TeX's
# 1.822, `mathconv.SPACE_VALUES`) and SPELLS AN AUTHOR'S COMMA as `\,`, so the same rule run on its
# output would delete commas from the page (`_work/probe86_cd_path.py mathconv`).


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
        func = MATH_FUNCS.get(m.group(1))
        if func is not None:
            # a declaration takes one argument and selects a function; a bare name with no
            # argument is dropped rather than printed, since there is nothing to wrap
            if m.group(3) is None:
                return " "
            return " \x01%s\x02(%s) " % (func, unwrap(m.group(3)))
        got = MATH_SYMBOLS.get("\\" + m.group(1))
        if got is None:
            unknown.append(m.group(1))
            # the command's name goes and its argument stays, but Typst prints the braces the name
            # came off: `\underline{\mathbb{Q}}` reached the page as `{ {Q}}`. The argument is
            # walked the same way, since re.sub does not rescan a replacement.
            # a name with no argument keeps itself: `z^\perp` with the symbol deleted reached Typst
            # as `z^ /r`, and a script with no atom is a compile error that made the gate quote the
            # whole picture (measured on the Taming canvas, whose Typst names are the real glyphs)
            return " %s " % (unwrap(m.group(3)) if m.group(3) is not None else m.group(1))
        # spaces on both sides: the match swallows whatever spacing followed the command,
        # so 'h\longrightarrow 0' with only a trailing space reads 'harrow.r.long' and
        # quote_words then quotes the fused pair as one name
        return " \x01%s\x02 %s " % (got, unwrap(m.group(3)) if m.group(3) is not None else "")

    def unwrap(arg):
        return MATH_WORD.sub(one, arg)

    # `\left.` and `\right.` are invisible delimiters: the dot must go with the command, or the
    # lookup below deletes `\left` and leaves the dot as a visible period on the page
    tex = re.sub(r"\\(?:left|right)\s*\.", " ", tex)
    # `\frac` carries two arguments and a declaration's argument may be written without braces;
    # both are put in the one-argument shape the lookup below reads
    tex = MATH_FRAC.sub(_frac_call, tex)
    tex = MATH_PMOD.sub(_pmod_call, tex)
    tex = MATH_DECL.sub(_brace_decl, tex)
    tex = MATH_WORD.sub(one, tex)
    tex = MATH_SPACE.sub(lambda m: "\x04%s\x05" % MATH_SPACES[m.group(1)], tex)
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
    # as `a_{0}` while `$a_0$` and `$a_12$` set clean subscripts.
    tex = _group_scripts(tex)
    tex = quote_words(tex.strip())
    # Typst's lexer glues a letter and the digit behind it into ONE identifier: `$l1$` and
    # `$W_(s0)$` are `unknown variable: l1` / `unknown variable: s0`, so a whole refused label came
    # out as quoted source text.  A space is the boundary, and it costs about half a hair on the
    # page: replaying the 29 labels through the emitter against a pdflatex control of the author's
    # own node (`_work/probe92_sites_fidelity.py`) gives the same glyph sequence with the gap across
    # the boundary at 0.62pt where TeX sets 0.0-0.5pt -- Typst's ordinary spacing between two atoms,
    # which an escaped hash (`#_p`) pays too.  A quote is already a boundary, so a word run
    # `quote_words` wrapped is untouched.
    tex = re.sub(r"([A-Za-z])(?=[0-9])", r"\1 ", tex)
    # Typst reads a `/` in maths as a FRACTION: `$R^2/d_{ij}^{2}$` reaches the page as three LINES,
    # the denominator running to the end of the span, where TeX sets one line with an ordinary slash
    # (`_work/probe93_slash_classes2.py`: 261 spans over 122 papers ship that shape today).  The
    # quoted string `"/"` sets the glyph the author's slash sets -- measured on fifteen shapes taken
    # out of those spans against a pdflatex node of the same TeX
    # (`_work/measure93_slash_fidelity.py`): every one comes back with the control's own line strings,
    # and the gaps the slash bounds read 0.00-0.17pt (the two worst readings, 0.708 and 0.717, sit on a
    # superscript's kern, which is an engine difference 轴 74 already records).  A space on either side
    # of the quoted glyph costs 3.32pt TeX never charges, so the call goes out tight and the author's
    # own spaces around the slash go with it (42 spans over 30 papers write one; TeX ignores a space in
    # maths).  Nothing here is a stacked fraction in disguise:
    # `\frac`/`\dfrac`/`\tfrac` became `frac(...)` calls above (38/6/25 spans) and TeX's infix
    # `\over`/`\nicefrac`/`\binom`/`\slash` appear 0 times in the canvas maths the emitter receives,
    # and a `/` cannot hide inside a quoted word because `quote_words` only wraps letter runs.
    # The lookbehind keeps TeX's italic correction `\/` -- a sign that draws nothing -- out of a law
    # about the slash the author means as division; turning it into `"/"` would hang an accent on it.
    tex = re.sub(r"[ \t]*(?<!\\)/[ \t]*", '"/"', tex)
    if not math_safe(tex):
        # a label the guard refuses goes to plain text, and there the spacing call would be
        # printed rather than charged: it becomes the space the author asked for
        return '"%s"' % re.sub(r"[\"$\\]", "", MATH_HOLD.sub(" ", tex.strip()))
    return MATH_HOLD.sub(lambda m: "#h(%sem) " % m.group(1), tex)


LINEBREAK = re.compile(r"\\\\\s*(?:\[[^\]]*\])?|\\par(?![a-zA-Z])")
PARAGRAPH = re.compile(r"\\par(?![a-zA-Z])")
TEXTCOLOR = re.compile(r"\\textcolor\s*\{([^{}]*)\}\s*(\{(?:[^{}]|\{[^{}]*\})*\})")
# a node body's maths arrives in either delimiter: `$...$` or the plain-TeX `\( ... \)`
# spelling, which the prose pass below strips of its command names -- measured on a
# Thompsons-group legend, `\([\alpha-\eta,\alpha+\eta]\)` reached the page as `\[-,+\]`.
# The display pair `\[ ... \]` is the third: TeX sets it as a centred equation on its own
# line even inside a node's paragraph, so it travels as one of those, not as prose.
# TeX reads `\\` as one control sequence and starts a fresh line after it, so a `\( ... \)` written
# tight behind a break is still maths (`_work/measure_node_break_math.py`: `{Reset\\\(t\in[2,5]\)}`
# sets `Reset` on one line and the italic `t ∈ [2, 5]` on the next) -- 64 labels in 23 papers lost
# their formula and printed the delimiters as escaped parentheses when the inline pair was guarded
# the way the display one is. The display keeps the lookbehind, because there the second backslash
# really is the beginning of something else: `\\[3pt]` is the break's own spacing argument.
NODE_MATH = re.compile(r"\$([^$]*)\$|\\\((.*?)\\\)|(?<!\\)\\\[(.*?)\\\]", re.S)

# TeX writes an accent as one control symbol (or a one-letter control word) plus its letter, braced
# or not. The markup pass below deletes command names, so an accent it does not read leaves its own
# punctuation standing on the page: a node's `K\"ahler` reached it as `K“ahler`, Typst setting the
# bare `"` as a curly quote. Unicode composes the pair, so the answer is the letter with its mark
# rather than the mark's spelling.
# A punctuation symbol takes its letter directly (`\"a`) but a letter command does not: TeX reads
# `\vc` as one control word, so `\v c` needs the space or the braces, and the guard is what keeps
# `\c` out of `\color` and `\d` out of `\draw` -- the same census without it counts 369 `\draw`
# statements as accents (_work/probe_accent_shapes.py).
ACCENT_MARK = {"\"": "\u0308", "'": "\u0301", "`": "\u0300", "^": "\u0302", "~": "\u0303",
               "=": "\u0304", "u": "\u0306", "v": "\u030c", "H": "\u030b", "c": "\u0327"}
ACCENT = re.compile(r"\\(?:([\"'`^~=])|([uvHc])(?![A-Za-z]))"
                    r"\s*(?:\{([A-Za-z])\}|([A-Za-z]))")


def _accents(chunk):
    r"""`\"a`, `\'{e}`, `\v c` -> the letter Unicode composes for them."""
    return ACCENT.sub(lambda m: unicodedata.normalize(
        "NFC", (m.group(3) or m.group(4)) + ACCENT_MARK[m.group(1) or m.group(2)]), chunk)


def _markup_text(chunk):
    r"""TikZ prose -> Typst markup: commands go, every markup special is escaped.

    Typst reads '_', '*', '()', '<x>', '%' and '//' as syntax inside '[...]',
    so node text that merely looks like maths has to escape all of them.
    """
    chunk = re.sub(r"\\[a-zA-Z]+|[{}\\]", "", chunk).replace("//", "\\//")
    return re.sub(r"([*_`@#()\[\]<>%$])", r"\\\1", chunk)


def _prose(chunk):
    r"""Prose between two math spans: TikZ's '\\' forces a line, its '\par' a paragraph.

    The two are not the same break. A `\\` inside a node with no measure stays one line whatever
    TeX is given (`_work/measure_node_box_shapes.py`), while `\par` ends the paragraph and starts
    another, so it has to reach Typst as `#parbreak()` -- which a fixed-width `box` does honour
    (`_work/measure_node_par.py`: 20.4pt between the two paragraphs against 14.4pt of line spacing).
    Four labels in four papers write one, and without it a figure's three-paragraph note prints as a
    single run-on block.
    """
    out, pos = [], 0
    for m in LINEBREAK.finditer(chunk):
        out.append(_markup_text(chunk[pos:m.start()]))
        out.append("#parbreak()" if PARAGRAPH.match(m.group(0)) else "#linebreak()")
        pos = m.end()
    out.append(_markup_text(chunk[pos:]))
    return "".join(out)


def node_text(inner, pal=None):
    r"""A TikZ node body -> Typst markup: delimited maths stays math, '\\' breaks the line.

    A colour written on the text itself is read the way a stroke colour is, because the
    markup pass below deletes command names and would leave the specification standing on
    the page as words; a colour it cannot model refuses the body rather than mis-inking it.
    An accent is composed into its letter for the same reason: the command name goes and the
    mark would be left standing as punctuation.
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
    keep = _accents(keep)
    out, pos = [], 0
    for m in NODE_MATH.finditer(keep):
        out.append(_prose(keep[pos:m.start()]))
        body = _math_body(next(g for g in m.groups() if g is not None))
        if body:
            # a display span stands alone in its paragraph, which is what makes Typst set it
            # centred and in display style; a break at either end of the label would only add
            # an empty paragraph TeX never draws
            if m.group(3) is not None:
                if "".join(out).strip():
                    out.append("#parbreak()")
                out.append("$%s$" % body)
                out.append(chr(3))
            else:
                out.append("$%s$" % body)
        pos = m.end()
    out.append(_prose(keep[pos:]))
    text = re.sub(r"\s+", " ", "".join(out)).strip()
    text = text.replace(chr(3), " #parbreak()")
    text = re.sub(r" #parbreak\(\)$", "", text)
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

    Each iteration consumes one definition, so the walk ends as soon as the picture has no more of
    them -- a lattice drawn as an 81-cell foreach carries 162 definitions, and a fixed budget would
    refuse it for being long.
    """
    values = {}
    while True:
        m = PGFMATH_DEF.search(body)
        if not m:
            return _values_of(body, values)
        # TeX expands a macro where the name is *used*, so the numbers computed so far have to be
        # written into the text before this definition: one sweep at the end would hand every cell
        # of a redefined loop the last iteration's centre. Rewriting the head changes its length,
        # so the definition is then read and spliced at its *new* offset -- keeping the old one
        # cuts the picture mid-token.
        head = _values_of(body[:m.start()], values)
        start = len(head)
        body = head + body[m.start():]
        pos = start + (m.end() - m.start())
        if body[pos:pos + 1] != "{":
            return None
        text, pos = bracketed(body, pos)
        if text is None:
            return None
        val = expr(_values_of(text, values))
        if val is None:
            return None
        if m.group(1) == "truncate":
            # \pgfmathtruncatemacro cuts toward zero (2.7 -> 2, -2.7 -> -2), it does not round
            values[m.group(2)] = "%d" % int(val)
        else:
            values[m.group(2)] = "%.5g" % val
        if body[pos:pos + 1] == ";":
            pos += 1
        body = body[:start] + body[pos:]


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
    r"""The \ifnum comparison signs (= < >) and pgfmath's spellings of the same six tests."""
    return CMPS[op](a, b)


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

    Each iteration removes one \ifnum shell and its \fi, so the walk ends with the last
    conditional the picture holds -- a nine-cell strip of eight tests each is 72 of them,
    and a fixed budget would refuse the picture for being long.
    """
    while True:
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
# the same words carry a distance, and then they move the pinned point as well: the direction
# the node's own offset runs in, in canvas axes (y up, as CeTz draws it). A diagonal carries the
# distance as a RADIUS, not per axis -- measured against pdflatex (`_work/measure_diagonal_offset.py`,
# positioning library loaded): `above left=2pt` lands the south-east corner at (-1.414pt, +1.414pt),
# so each axis takes d/sqrt(2), while `above=2pt` still takes the full 2pt on its own axis.
INV_SQRT2 = 2 ** -0.5
SIDE_MOVE = {"above": (0.0, 1.0), "below": (0.0, -1.0), "right": (1.0, 0.0), "left": (-1.0, 0.0),
             "above right": (INV_SQRT2, INV_SQRT2), "above left": (-INV_SQRT2, INV_SQRT2),
             "below right": (INV_SQRT2, -INV_SQRT2), "below left": (-INV_SQRT2, -INV_SQRT2)}


def _side_key(o):
    """The side placement a node writes with a distance of its own: `above=20pt` -> ('above','20pt').

    Diagonals answer too (`above left=2pt`), since the corner they pin is in `SIDE_ANCHOR` already and
    only the offset was missing.

    `above=6mm of up` is a placement beside another node, which `placed_at` answers on its own terms,
    and a bare `above` carries no distance at all -- it picks the anchor and moves nothing. Both are
    left to their own paths by the requirement that the value read as a plain dimension.
    """
    for word in SIDE_MOVE:
        val = o.get(word)
        if isinstance(val, str) and _size(val) is not None:
            return word, val
    return None


def _anchor_name(o):
    """Which point of the node TikZ pins to its coordinate, spelled as the name table reads it.

    The answer is the one `_node_anchor` hands Typst and `_named_box_entry` steps back along; it is
    kept as a bare name because the table has to turn it into a direction.
    """
    fixed = o.get("anchor")
    if fixed is not None and fixed is not True:
        name = str(fixed).strip().replace(" ", "-")
        return name if name in TIKZ_ANCHORS else None
    for word, name in SIDE_ANCHOR.items():
        if o.get(word) is True:
            return name
    side = _side_key(o)
    if side:
        return SIDE_ANCHOR[side[0]]
    return None


def _node_anchor(o):
    """Which point of the node TikZ pins to its coordinate -> CeTz's `anchor` argument.

    Only a node sized by its own text has an unambiguous answer for its half-extent, but none of them
    needs one: CeTz's `anchor:` moves the LAID-OUT body, so Typst measures the box and we only name the
    point of it to pin (`_work/measure_node_anchor_north.py`: north, south, east and north-east land on
    pgf's rectangle within 0.2bp, framed or not). A side key carries the same promise with a distance
    (`above=20pt`), which `_node_shift` adds; the anchor is the same either way.  A node that is also
    `rotate=d` keeps the same name and hands the turn to CeTz's `angle:`, which turns the anchor before
    pinning it (`emit_node`).
    """
    name = _anchor_name(o)
    return None if name is None else 'anchor: "%s"' % name


def _turned_anchor_step(name, angle, own):
    """How far a TURNED node's centre sits from its coordinate, in canvas cm.

    pgf turns the node and then puts the TURNED anchor on the point
    (`_work/probe100h_rot_anchors.py`, and `_work/probe101a_rot_variants.py` for the `inner sep` and
    `font=` variants the corpus writes): the anchor vector is read on the node's own box, which is its
    label's ink with `inner sep` entering WHOLE on both axes (the default `.3333em` included -- a plain
    `\node[anchor=south,rotate=90]` reads its ink edge 3.28pt off the point, not 0), and that vector
    rotates with the node.  So `rotate=90,anchor=south` hangs the words a half-HEIGHT west of the point
    and `anchor=east` a half-LABEL below it.

    The page itself gets this from CeTz's own `content(..., angle:)`, which turns the anchors it
    measured (`emit_node`); this function is the bookkeeping half -- the name table has to record the
    centre the turned anchor left behind, or a neighbour placed `below=of` a rotated node steps over
    nothing.
    """
    d = COMPASS.get(name.replace("-", " "))
    if not d:
        return (0.0, 0.0)
    rad = math.radians(angle)
    vx, vy = d[0] * (own[0] or 0.0), d[1] * (own[1] or 0.0)
    return (vx * math.cos(rad) - vy * math.sin(rad),
            vx * math.sin(rad) + vy * math.cos(rad))


FIT_REF = re.compile(r"\(([^()]*)\)")


def fit_rect(o, names, xf):
    r"""The box a `fit=` node gathers -> (centre x, centre y, half-width, half-height) in cm, or None.

    pgf builds it as the UNION of the boxes the author names, and a placement reads that box like the
    border of any other node.  Read off pgf's own anchors (`_work/measure_fit_box.py`, dumped with
    `\pgfpointanchor` + `\pgfgetlastxy` -- `\pgfgetlastxy` alone answers 0pt after a `coordinate`, so it
    is not the tool), for two `text width=2cm` nodes standing at (0,0) and (3.2,2.4):
    `fit=(a)(b),inner sep=0pt,outer sep=0pt` gives x [-1.1242, +4.3242] y [-0.4273, +2.6340], which is
    the min/max of a's and b's own rects to the last decimal, and `below=10mm of f` then leaves exactly
    1.0000cm between the union's south edge and the next node's north one -- the edge-to-edge law
    `placed_at` already spends, on a box this function hands it.

    The node's own padding grows that union on EVERY side, per axis: `inner sep=5pt` reads 5.198pt a
    side (its 5pt plus the 0.2pt a node's `outer sep` answers by default), `inner xsep=4mm,inner ysep=
    8mm` reads 0.4000cm left and right and 0.8000cm above and below and nothing on the other axis, and
    writing neither spends pgf's default 0.3333em (3.332pt, the class size's em -- a `font=\small` on
    the picture does not reprice it) plus that same half-pen.  A bare `\coordinate` has no box, so
    `fit=(p)(q)` is the rect through the two points, and the gathered node keeps its CENTRE on the
    union's midpoint unless the statement writes an `at=`: `[fit=(a)(b)] (f) at (0,5)` holds its
    5.4624 x 3.0754cm rect and moves the centre to (0,5), which is why the centre below is only the
    fallback `_node_at` stands the node on.

    What a reference names is the box the emitter registered for it, whose border is the author's own
    measure; pgf reads that node's ANCHORS, half a pen further out per side, and that tier is §7's
    existing account rather than a second law.  A reference this cannot resolve -- a name the picture
    never declares, or an anchor inside the `fit=` list, which the corpus writes nowhere
    (`_work/label104d_fit_opts.txt` on all five of its statements) -- yields None, and `_node_at`
    refuses the picture on it the way it refuses an unread placement.  Left unread entirely the node
    stood on the scope origin with no box at all, which is how four canvases came to be stacked on
    themselves: `below=10mm of branches` is the flowchart's third stage landing on its second.
    """
    val = o.get("fit")
    if not isinstance(val, str) or not names:
        return None
    refs = [token.strip() for token in FIT_REF.findall(val)]
    if not refs:
        return None
    left = right = low = high = None
    for ref in refs:
        got = names.get(ref)
        if got is None:
            return None
        x, y = got[0], got[1]
        hw = got[2] or 0.0
        hh = got[3] or 0.0
        left = x - hw if left is None else min(left, x - hw)
        right = x + hw if right is None else max(right, x + hw)
        low = y - hh if low is None else min(low, y - hh)
        high = y + hh if high is None else max(high, y + hh)
    sep = _outer_sep(o, xf)
    ix, iy = node_padding(o, xf)
    if sep is None:
        return None
    ix = (INNER_SEP if ix is None else ix) + sep
    iy = (INNER_SEP if iy is None else iy) + sep
    return ((left + right) / 2.0, (low + high) / 2.0,
            (right - left) / 2.0 + ix, (high - low) / 2.0 + iy)


def _named_box_entry(at, o, xf, text, names=None):
    """A node's name-table entry: centre, half-extents, and the ring a tangent `to` crosses.

    The coordinate a node names is not always its centre. `anchor=west` and the side words put a
    BORDER point on it, which Typst honours through the `anchor:` argument but the table has to step
    back out of -- `(a)` and `(a.west)` are read from the recorded centre, so a node pinned by its
    west edge stored a centre a whole half-width too far west, and a line written to `(qf label.west)`
    clipped from there to land outside the box. Where the half-extent is None the axis cannot be
    stepped and the coordinate stands as it was. A node that is also `rotate=d` is pinned by its
    TURNED border point, so the step rotates with it (`_turned_anchor_step`).

    A `fit=` node's extent is not its own measure but the box it gathers, so this is where the two
    readers of the table (`register` and `translate_statement`) get the same numbers (`fit_rect`).
    """
    rect = fit_rect(o, names, xf)
    own = (rect[2], rect[3]) if rect else node_size(o, xf, text)
    name = _anchor_name(o)
    if name:
        dx, dy = _turned_anchor_step(name, _slant(xf) + (_node_tilt(o) or 0.0), own)
        at = (at[0] - dx, at[1] - dy)
    return tuple(at) + own + (_anchor_ring(o, xf),)


def _node_align(o):
    """Typst's `align` for the words inside a box of fixed width, or None for the engine's own left.

    Measured (`_work/measure_textwidth_frame.py`): the paragraph a `text width` forces is ragged-left
    unless the node says `align=`, while a `minimum width` frame centres what it holds. `align=` is
    the author's word and wins over both.
    """
    val = o.get("align")
    word = val.strip().lower() if isinstance(val, str) else ""
    if word in ("center", "left", "right"):
        return None if word == "left" else word
    if o.get("text width") is not None:
        return None
    return "center"


def node_inset(o):
    """The `inset:` a Typst `box` needs to carry this node's padding.

    pgf's default is `0.3333em` and it follows the node's own font — Typst spends it the same way
    (`_work/measure_box_inset_gap.py`: the same body reads 3.33pt at 10pt and 3.00pt inside
    `#text(size: 9pt)`), so the default stays in em and only a measure the author wrote down becomes an
    absolute length. What it costs is exact on both sides: `inset: 5pt` turns 9.5pt of words into a
    19.5pt frame, which is the `frame = text + 2 * inner sep` pgf draws
    (`_work/measure_shaped_node_frame.py`). A `box` with no `inset:` at all has none — 9.5pt of words
    gives a 9.5pt frame — so this is the only place the padding can come from.

    Two axes get their own dictionary when the author wrote them apart (`inner xsep=7pt, inner ysep=6pt`
    is one paper's whole flowchart style): Typst spends `(x: A, y: B)` as A left and right, B above and
    below, and a mixed pair with the em default is legal (`_work/measure_inset_axes.py`: `x: 7pt, y:
    0.3333em` measures 6.58+2*3.333pt tall). An axis a dictionary leaves out gets NOTHING, not the
    default (`inset: (x: 7pt)` has the same height as no inset at all), so both axes are named whenever
    one is.
    """
    def one(cm):
        return "0.3333em" if cm is None else "%.4gcm" % cm

    x, y = node_padding(o, IDENT)
    if x is None and y is None:
        return "0.3333em"
    if x is not None and x == y:
        return one(x)
    return "(x: %s, y: %s)" % (one(x), one(y))


def corner_radius_pt(o):
    """The `rounded corners` radius in pt, or None where the author asked for no rounding.

    pgf's default is 4pt and a written dimension keeps its own unit; both read off the page
    (`_work/measure_rounded_corners.py`: a 2cm x 1cm rectangle's arcs start 3.985bp from the corner
    for a bare `rounded corners` and 7.970bp for `=8pt` -- 4pt and 8pt, since fitz counts bp at
    0.99651 of a TeX pt).  A value this cannot read yields no radius rather than a wrong one, the
    same rule `_length` already gives the node frame.
    """
    rc = o.get("rounded corners")
    if rc is True:
        return 4.0
    if rc is None:
        return None
    cm = _length(str(rc), IDENT)
    return None if cm is None else cm * 28.346


def corner_args(o):
    """CeTz's `radius:` for a rounded rectangle path, or nothing at all."""
    radius = corner_radius_pt(o)
    return [] if radius is None else ["radius: %.4gpt" % radius]


def rounded_run(pts, radius_cm):
    r"""A straight run with its inner corners cut by an arc, as pgf lays them out.

    pgf puts each tangent point exactly `radius` along the edge from the nominal corner, and it does
    NOT clamp to the edge's own length (`_work/measure89_rounded_clamp.py`, one case per page, the
    corner recovered as the intersection of the two runs that border the arc): `rounded corners=40pt`
    on a 1cm edge still measures 39.991pt from the corner to the tangent point, which is 11.5pt PAST
    the path's own endpoint, and a 0.6cm middle segment serves 40pt to each of its two corners so the
    arcs cross. The bare keyword is pgf's 4pt (`corner_radius_pt`), a written dimension keeps its
    unit, and neither of them is a share of the drawing. 18 of the 38 corners of the corpus face
    (`_work/probe109_rounded_poly_true_face.py`) would have been shortened by a `min(r, ½·edge)` law.

    A corner's arc is the short way round: its two radius vectors point back along the incoming edge
    and forward along the outgoing one, so they differ by the turn's exterior angle, which is under
    180deg. CeTz follows `stop - start` with its sign (`drawable.typ:222`), so `stop` is re-expressed
    within 180deg of `start` -- a right turn then reads +90 and a left one -90, and the arc lands on
    the inside of the turn. A corner that does not turn anything has no arc to give (CeTz asserts
    `Angle must be greater than 0deg`), and where the tangent points overshoot their neighbours the
    straight piece between them simply runs backwards, which is what the control page shows pgf doing.

    The radius is therefore read as a length OF THE PAGE and not of the picture's user space, which is
    what makes this function work on the points as `translate_path` holds them (page cm) without any
    transform: a 20pt corner cut measures 19.995pt on the paper under `[x=0.5cm,y=0.5cm]`, under
    `[scale=0.5]`, under the anisotropic `[x=1cm,y=0.5cm]` (where the two edges of one corner run
    along axes of different length and both still give 19.995pt) and under `[rotate=30]` alike
    (`_work/measure89b_rounded_radius_space.py`). The arc is a circular one centred on the corner: its
    bezier handles come out at 0.5523 of the radius for a right turn, pgf's own quarter-circle
    constant, so no ellipse is hiding in the anisotropic case either.

    The run comes out as one `("run", ...)` item holding the `("poly", ...)` and `("arc", ...)`
    pieces, and `_render` bolts them into a single `merge-path`: stroking the pieces apart leaves a
    butt-cap bite at every junction, which is invisible with a hair pen and a white notch with a 12pt
    one. The stroke and the arrow tip therefore go on once, over the whole run.
    """
    out, prev = [], pts[0]
    for i in range(1, len(pts) - 1):
        dirs = [_unit(*pts[i - 1][:2], *pts[i][:2]), _unit(*pts[i][:2], *pts[i + 1][:2])]
        if None in dirs or dirs[0] == dirs[1]:
            continue
        din, dout = dirs
        corner = pts[i]
        start = (corner[0] - din[0] * radius_cm, corner[1] - din[1] * radius_cm)
        stop = (corner[0] + dout[0] * radius_cm, corner[1] + dout[1] * radius_cm)
        if math.hypot(start[0] - prev[0], start[1] - prev[1]) > 1e-9:
            out.append(("poly", [prev, start]))
        a = math.degrees(math.atan2(-din[1], -din[0]))
        b = math.degrees(math.atan2(dout[1], dout[0]))
        while b - a > 180.0:
            b -= 360.0
        while b - a < -180.0:
            b += 360.0
        out.append(("arc", (start, a, b, "%.4gcm" % radius_cm)))
        prev = stop
    if math.hypot(pts[-1][0] - prev[0], pts[-1][1] - prev[1]) > 1e-9:
        out.append(("poly", [prev, pts[-1]]))
    return out


def _unit(ax, ay, bx, by):
    """The unit vector from A to B, or None when the two points are the same place."""
    dx, dy = bx - ax, by - ay
    length = math.hypot(dx, dy)
    return None if length == 0 else (dx / length, dy / length)


def box_args(o, pal):
    """The Typst `box` arguments that carry a node's frame: padding, corners, stroke.
    A frame the author asked for but did not size is drawn by Typst, which knows the text's box;
    only the look of the border is ours to translate."""
    framed = ["inset: " + node_inset(o)]
    framed += corner_args(o)
    framed += node_stroke_args(o, pal)
    return framed


def _box_edges(text):
    r"""The two `text` edges a `#box` body is measured by: #63's for prose, its own bounds for maths.

    `cap-height -> baseline` is a law about TEXT, and a math element is not text: every math body
    measured **14.85 bp** whatever it contained -- `$x_i^2$`, `$y_{i,1}$`, `$\frac{a}{b}$`,
    `$f_\alpha^{(k)}$`, `$n+1$` -- while pgf prices each one (17.34 / 13.78 / 17.00 / 18.98 / 13.89),
    so ink ran past the rule the box drew around it: a subscript 0.62 bp below, `$\frac{a}{b}$` 1.62,
    `$\sum_{k=1}^{n} k$` 3.40 below and its limits over the top
    (`_work/measure69_bottom_edge.py`, `_work/bottom_edge_run131.txt`; the corpus face is
    `_work/probe_frame_ink_overflow.py --all --over 0.2`: 1,168 escapes over 242 papers at the bottom
    rule and 796 over 203 at the top, both in a math face).

    Of the spellings Typst 0.15 accepts (`baseline`/`descender`/`bounds`/a length below,
    `ascender`/`cap-height`/`x-height`/`baseline`/`bounds`/a length above), `bounds` is the only one
    that is content-dependent: the others answer a font constant, which is the disease itself --
    `ascender`+`descender` reads 18.33 bp for all ten bodies whatever they hold. Measured as the
    worst escape over those ten, `bounds` on both edges costs 0.34 bp (`$y_{i,1}$` at the top rule),
    where the emitted pair costs 3.40, `descender` 1.28 and `bounds` on the bottom alone 0.53 (the
    sum's limits). The one pairing that clears that 0.34 is `ascender` above `bounds`, and it buys it
    with height: `$y_{i,1}$` then draws 20.40 bp against pgf's 13.78, the worst of the ten
    (`_work/bottom_edge_run132.txt`), so the 0.34 is left where it is. `bounds`/`bounds` leaves #63's
    anchor law untouched: `$x_i^2$` still reads south y1=-0.00, north y0=+0.00 and no anchor
    symmetric at +-9.69. Prose keeps cap-height/baseline, where `bounds` would grow a box that is
    already correct (14.57 -> 17.63 against pgf's 15.50) to fix an escape that does not happen.

    What it costs is height: a math frame now comes out 1.3-3.6 bp TALLER than pgf's (`$x_i^2$`
    19.39 against 17.34, `$\frac{a}{b}$` 18.93 against 17.00, `\sum` 21.26 against 17.64), so #69's
    "the box is 2.5 bp short" becomes "the box is ~2 bp tall" -- the direction that cannot cut ink,
    and no edge spelling answers pgf's number, since TeX sizes the box by font metrics and Typst's
    `bounds` by the glyphs. Two things this does not fix and does not claim: `anchor:` is ignored
    altogether on a body taller than one line (`$\frac{a}{b}$` reads y0=-8.65 y1=+10.29 for south,
    north and centre alike, the library shifting by a measure the box never drew), and `$A_1$\\$B_2$`
    breaks into two rows in Typst where TeX, without `align=`, sets one.

    The two are told apart by a dollar, which is all the body has left of the maths by the time it is
    Typst markup: a math element always arrives as `$...$` and prose never carries one, the corpus
    having no escaped dollar at all (0 real `\$` over 724 flat files,
    `_work/probe_escaped_dollar_node.py` -- the 258 `\$` pairs a naive count finds are a row break's
    `\\` abutting the maths that follows it).
    """
    return BOX_MATH_EDGES if "$" in text else BOX_TEXT_EDGES


BOX_TEXT_EDGES = 'top-edge: "cap-height", bottom-edge: "baseline"'
BOX_MATH_EDGES = 'top-edge: "bounds", bottom-edge: "bounds"'


def _box_body(text, align, horizon=False):
    """The body a frame of fixed width gets.

    Hyphenation is off because TeX takes a node's paragraph apart at spaces it is given
    (`_work/measure_node_box_shapes.py`), and Typst's is the only alignment a `box` can be told:
    `box` has no `align:` argument, so centring is a call around the words.
    `horizon` is the vertical half of the same law, for a frame CeTz draws over a RANGE: TeX sits a
    node's words mid-height whatever it declares around them (pdflatex reads dY +0.45pt -- the ink's
    own asymmetry, the same number an unsized node gives -- for `minimum height=1cm` on one line and
    on two, and still mid-height when `text width` leaves the paragraph ragged-left;
    `_work/measure_tex_node_text_centre.py`), while CeTz lays a range's body at its TOP-LEFT
    (`_work/measure_cetz_range_align.py`: dX -26.1pt, dY +11.2pt for one letter in a 2cm x 1cm box,
    -0.1 and -0.4 once the call is there). A `box` that hugs its own text needs no such call, which is
    why only the range path asks for it.
    """
    if horizon:
        inner = "#align(%s + horizon)[%s]" % (align or "left", text)
        return "[#set text(hyphenate: false); %s]" % inner
    inner = "#align(%s)[%s]" % (align, text) if align else text
    # CeTz sizes an auto-measured content block by `measure(cap-height -> baseline)` and then adds
    # `measure(cap-height -> bounds) - measure(cap-height -> baseline)` beneath it, so the block is a
    # band TALLER than the box it draws and `south` names the bottom of the band, not of the frame:
    # a one-line `#box` hangs 2.62 bp above its point, and a four-line, a `font=\small` 9pt and a
    # wrapped `text width` box the same 2.1-3.0 bp (`_work/measure_anchor_bottom_edge.py`). Writing the
    # wrapper's own edges back into the body makes the library's two measures agree, the band vanishes,
    # the drawn box keeps the height it has today (14.57 -> 14.57 bp) and south/north/centre all read
    # 0.00 against the ruler.
    return '[#set text(hyphenate: false, %s); %s]' % (_box_edges(text), inner)


def sized_box(box, text, args, align=None, grow=False, anchor=None):
    """A node whose size the author wrote down, framed by Typst rather than by CeTz.

    `box` is that node's `(x1, y1, x2, y2)` corners in cm.
    `anchor` is the CeTz `anchor:` argument, which names the point of the drawn box that sits on the
    coordinate; the shift it causes moves the whole declared box, measured by Typst.

    This is the only spelling that has a `radius:`: CeTz 0.5.0 builds a `frame: "rect"` as a
    hardcoded line-strip (`src/draw/shapes.typ:1248`), so `rounded corners` on a sized node has
    nowhere to go until the frame is Typst's (`_work/measure_box_vertical_align.py`: `radius: 8pt`
    on a declared 3cm x 2cm box strokes 4 beziers over the same 3.0000 x 2.0000 cm).  The swap costs
    nothing else, because the page says Typst keeps the two behaviours the range frame had: a
    declared size is honoured exactly (3cm x 2cm stayed 3.0000 x 2.0000 while three lines of words
    ran out through its bottom -- a `height:` is NOT the minimum pgf treats it as, which is why
    `grow` exists) and `#align(horizon)` puts the words mid-height, ink 2.0020 against box 2.0000.

    `grow` is the one case where the declared measure must not be the size: a label that breaks its
    own lines is taller than any height written around it, pgf grows the frame over it, and the
    height is left for Typst to measure.  A circle stays on CeTz's frame -- Typst's `box` has no
    round outline, and `radius:` is a corner, not a shape.
    """
    x1, y1, x2, y2 = box
    size = ["width: %.4gcm" % abs(x2 - x1)]
    if not grow:
        size.append("height: %.4gcm" % abs(y2 - y1))
    return ("content(%s, [#box(%s, %s, %s)]%s)"
            % (fmt((x1 + x2) / 2, (y1 + y2) / 2), ", ".join(size), ", ".join(args),
               _box_body(text, align, horizon=not grow), (", " + anchor) if anchor else ""))


# `label=<side>:<text>` is a second node hanging off the first. The corpus spells its position with the
# eight compass words (388 nodes over 60 building pictures -- _work/probe_label_option.py, which is blind
# to the pictures that refuse, so the three preamble spellings below came from the churn probe's LOST
# list). TeX pins the label's own box, 1pt of `inner sep` included, on the point where that direction's
# ray leaves the parent
# (_work/measure_label_offset.py: `above` reads the parent's north with a gap of exactly zero for a dot
# and for a box, and a bare `label:$f$` measures the same as `above:`; `above left` on a 1.2cm by 8pt box
# lands at (-0.1482, 0.1482) -- the TOP edge, not the corner, because the anchor is a 135-degree ray, and
# `135:` and `above left:` measure identically). CeTz's `anchor:` knows the label's own extent, so only the
# parent's half-size and that 1pt are added here; a parent nobody sized keeps its point.
LABEL_INNER_SEP = UNITS["pt"]
LABEL_DIAG = 2 ** -0.5
LABEL_SIDE = {"above": (0.0, 1.0, "south"),
              "below": (0.0, -1.0, "north"),
              "left": (-1.0, 0.0, "east"),
              "right": (1.0, 0.0, "west"),
              "above left": (-LABEL_DIAG, LABEL_DIAG, "south-east"),
              "above right": (LABEL_DIAG, LABEL_DIAG, "south-west"),
              "below left": (-LABEL_DIAG, -LABEL_DIAG, "north-east"),
              "below right": (LABEL_DIAG, -LABEL_DIAG, "north-west")}


def label_placements(o):
    """[(offset, anchor, text)] for every `label=` a node writes; None for one we cannot place.

    `offset` is where the label hangs RELATIVE to the parent's boundary point, as a (x, y) pair in
    canvas axes. `opts` keeps a repeated `label` as a list because two labels on one node are two nodes
    in TeX, not a setting that overrides itself, and `label={above:$f$}` groups the whole specification
    -- unwrapping it first is what keeps that group from hiding the position colon.
    A bracketed preamble restyles the label node, and three of its keys answer in coordinates:
    `inner sep` replaces the 1pt the box is pinned with, `label distance` adds to the same push, and
    `xshift`/`yshift` slide the result. A position that is no compass word and a preamble key we do
    not place refuse the picture rather than draw the text somewhere else.
    """
    out = []
    for val in o.get("label") or []:
        spec = str(val).strip()
        if spec.startswith("{"):
            inner, end = bracketed(spec, 0)
            if inner is None or spec[end:].strip():
                return None
            spec = inner.strip()
        along = LABEL_INNER_SEP
        shift = (0.0, 0.0)
        while spec.startswith("["):
            inner, end = bracketed(spec, 0)
            if inner is None:
                return None
            spec = spec[end:].strip()
            for key, got in opts(inner).items():
                if key in ("inner sep", "label distance", "xshift", "yshift"):
                    cm = _length(str(got), IDENT)
                    if cm is None:
                        return None
                    if key == "inner sep":
                        along = cm
                    elif key == "label distance":
                        along += cm
                    else:
                        shift = (shift[0] + (cm if key == "xshift" else 0.0),
                                 shift[1] + (cm if key == "yshift" else 0.0))
                else:
                    return None
        i = top_level_find(spec, ":")
        pos, text = ("above", spec) if i < 0 else (spec[:i].strip().lower(), spec[i + 1:].strip())
        if pos not in LABEL_SIDE:
            return None
        if text.startswith("{"):
            inner, end = bracketed(text, 0)
            if inner is None or text[end:].strip():
                return None
            text = inner
        ux, uy, anchor = LABEL_SIDE[pos]
        out.append(((ux, uy), anchor, text, along, shift))
    return out


def label_lines(at, o, pal, extent):
    """The CeTz lines a node's `label=` texts draw, or None when one of them cannot be placed.

    The pin is the point where the direction's ray leaves the PARENT -- a diagonal ray crosses a wide
    box through its short edge, so the smaller half-size stands on both axes there (`above left:` and
    `135:` measure the same) -- plus the label's own push, which is its `inner sep` by default and the
    preamble's `label distance`, `xshift` and `yshift` on top.
    """
    placed = label_placements(o)
    if placed is None:
        return None
    hw, hh = extent
    lines = []
    for (ux, uy), anchor, text, along, shift in placed:
        body = node_text(text, pal)
        if body is None:
            return None
        if ux and uy:
            step = min(hw or 0.0, hh or 0.0)
            dx, dy = (step if ux > 0 else -step), (step if uy > 0 else -step)
        else:
            dx, dy = ux * (hw or 0.0), uy * (hh or 0.0)
        lines.append("content(%s, [%s], anchor: \"%s\")"
                     % (fmt(at[0] + dx + ux * along + shift[0],
                            at[1] + dy + uy * along + shift[1]), body, anchor))
    return lines


def emit_node(at, inner, o, pal=None, box=None, angle=0.0, width=None, extent=(None, None),
              pad=INNER_SEP):
    """A TikZ node -> the CeTz lines that draw it, the text its `label=` writes included.

    `at` is the node's point in cm.
    `box` is the `(x1, y1, x2, y2)` corners in cm of a node whose size the author wrote down; with it
    the rectangle the node really is gets drawn, where an unknown size leaves the text at its centre.
    `width` is that same node's outer frame width for the far more common case of a measure written
    without a height (`node_frame_width`), and it is what makes Typst lay the label as a paragraph of
    that width instead of hugging the words.
    `extent` is the node's half-width and half-height (`node_size` read with its own label), which is
    how far a `label=` has to be pushed to clear the box; a node that was never sized hangs its
    label off the point. For a `circle` it is the radius of the round path, and both the drawn circle
    and the dot of an empty node are read out of it.
    `pad` is the node's own `inner sep` (`node_inner_sep`), the gap between its words and its border:
    it is what a circle drawn around the words is padded by, and the whole of an empty node's radius.
    """
    pt = fmt(*at)
    # Which of the node's own points sits on its coordinate. Every branch that hangs the node off `pt`
    # adds it to its `content(...)` arguments; the round frame drawn over a RANGE the author wrote is
    # already placed by that range, and an `anchor:` there would move the words inside it, not the frame.
    side = _node_anchor(o)
    kw = []
    c = node_fill(o, pal)
    if c:
        kw.append("fill: " + c)
    text = node_text(inner, pal)
    if text is None:
        return None
    size = node_font_size(o)
    if size is not None and text:
        # A node's text renders at the body's 11pt unless it says otherwise, while the box around
        # it and every coordinate beside it came from TeX's own metrics at `font=\small`'s 9pt; the
        # words then overflow the frame and the frame runs through its neighbours. The size rides on
        # the node's text, as `#text(size: 9pt)[...]` -- a bare `set text(size:)` in the canvas body
        # turns the block into content and CeTz refuses the whole picture (probe_canvas_set_size.py).
        text = "#text(size: %gpt)[%s]" % (size, text)
    ink = node_ink(o, pal)
    if ink and text:
        # the node's general colour is its words' ink whatever else sits on the same option group: a
        # framed `[blue,fill=white]` prints blue words over a white field with no rule around them
        # (`_work/measure_bare_color_node.py`, cases 4 and 22), so the ink cannot ride on the
        # border's lookup the way it did until #50
        text = "#text(fill: %s)[%s]" % (ink, text)
    rot = []
    if text and angle:
        # A turned node is the runtime's own `content(..., angle:)`, not a Typst `rotate()` wrapped
        # around its body: `cetz-0.5.0/src/draw/shapes.typ:1180` builds that node's anchors as
        # `centre + R(angle) * (±w, ±h)` and pins the named one on the coordinate, which is pgf's rule
        # (the TURNED anchor lands on the point) measured on Typst's own glyph box.  Handing the turn
        # to `#page_rotate` instead left the layout box unturned, so an `anchor:` there pinned the
        # UNTURNED edge a whole half-label away (`_work/probe101d_rot_typst.py`) and the only way to
        # say it was to step the coordinate by an estimated box -- which is what a `$-1\le y\le1$`
        # label got wrong by 10.07pt (`_work/label101g_rot_face.txt` NODE 04).  The runtime lands
        # within 0.20pt of pdflatex on the anchored edge of twelve forms at 34, 45, 63 and 90 degrees,
        # with `inner sep` 0 and 3pt and with `font=\footnotesize` (`_work/label101i_cetz_angle.txt`).
        rot = ["angle: %.4gdeg" % angle]
    # what hangs the node off its point: the author's anchor name, and for a turned node the runtime's
    # turn beside it -- every branch below ends in a `content(...)`, so the same tail goes to all of them
    pin = ", ".join(([side] if side else []) + rot)
    shape = node_shape(o)
    if shape == "circle" and box_visible(o) and None not in extent:
        # The author's measure is the DIAMETER and CeTz frames a range with the circumscribed circle
        # of it, so the range it is handed has to be the inscribed square: half the declared measure
        # over again by `CIRCLE_FRAME`, which draws 0.9030cm for `minimum size=9mm` against the
        # 1.2758cm the full range gives (_work/measure_cetz_frame_circle.py, pdflatex's own 0.9000).
        # A circle whose box was never written down has a None half-width (`node_size` refuses it and
        # so does `_text_width`), which is what leaves that case to the `padding:` branch below where
        # Typst measures the words. A node placed on a path never had its `box` built, and this makes
        # its circle from the same two numbers every other consumer of `node_size` reads.
        rad = max(extent) * CIRCLE_FRAME
        box = (at[0] - rad, at[1] - rad, at[0] + rad, at[1] + rad)
    if not text:
        # An empty node is a circle of its own padding, and it is drawn when the author asked to see a
        # frame: pdflatex reads `east - center` on `\node[circle, draw] {}` as 4.914pt, which is
        # sqrt(2) * pgf's default `inner sep` plus half the rule (_work/measure_shaped_node_frame.py).
        # Where nothing asked for a border the node is invisible, as it was.
        drawn = []
        if box_visible(o):
            if box and node_shape(o) == "rect":
                # an empty node that has a RECTANGLE written down is one: a `fit=` panel gathers its
                # box from its neighbours and stands with nothing in it, and this is the same call a
                # `\draw (a) rectangle (b)` path emits -- corners first, then the author's paint,
                # dash and `rounded corners` (`_work/label104_fit_box.txt`, sep0/xsep)
                drawn = ["rect(%s, %s%s)"
                         % (fmt(box[0], box[1]), fmt(box[2], box[3]),
                            _style(c, node_stroke_args(o, pal) + corner_args(o)))]
            else:
                args = ([pt, "radius: %.4g" % dot_radius(o, pad, extent)] + kw
                        + node_stroke_args(o, pal))
                drawn = ["circle(%s)" % ", ".join(args)]
    elif box:
        if shape == "rect":
            # The author's own rectangle, framed by Typst rather than CeTz -- `radius:` lives there,
            # and a `rounded corners` node had no way to be round (#61).
            drawn = [sized_box(box, text, box_args(o, pal) + kw, _node_align(o),
                               grow="#linebreak()" in text, anchor=pin)]
        else:
            # a circle keeps CeTz's frame: Typst's `box` has no round outline, and `radius:` is a
            # corner, not a shape
            framed = ["frame: \"circle\""] + kw + node_stroke_args(o, pal) + rot
            drawn = ["content(%s, %s, %s)"
                     % ("%s, %s" % (fmt(box[0], box[1]), fmt(box[2], box[3])),
                        _box_body(text, _node_align(o), horizon=True), ", ".join(framed))]
    elif shape == "circle" and box_visible(o):
        # A circle nobody sized is drawn around its own words, and pgf's rule for that is the
        # circumscription of the padded text box -- the same thing CeTz's `frame: "circle"` does to
        # content Typst has measured (`_work/measure_circle_pair_engines.py`: the two engines agree to
        # 3% on the same bodies at the same size). `padding:` is what carries `inner sep` to that
        # frame; an `inset:` on the style changes nothing (_work/measure_cetz_frame_circle.py), and the
        # name comes from cetz's own `set-style(content: (frame: "circle", padding: ...))`.
        # `anchor:` on this one moves the words and the frame is drawn around them afterwards, so the
        # rule keeps part of its `padding:` on the far side of the point: an 18.3bp circle lands 2.4bp
        # over where TeX's border sits 0.2bp under (`_work/measure_node_anchor_circle_frame.py`), while
        # an anchor we never sent left the point its whole 8.7bp half-width inside the frame. No corpus
        # node of this shape writes an anchor, so the numbers are the engine's, not a page's.
        framed = (["frame: \"circle\"", "padding: %.4gcm" % pad] + kw
                  + node_stroke_args(o, pal) + ([side] if side else []) + rot)
        drawn = ["content(%s, [%s]%s)" % (pt, text, ", " + ", ".join(framed))]
    elif box_visible(o):
        # The author fixed a frame; where he also fixed a measure, Typst lays the label as a paragraph
        # of that width -- `box`'s `width:` is the outer size and its own `inset:` is what TikZ's
        # `inner sep` already is, so the frame spans the box TeX drew instead of hugging the words.
        # CeTz puts the laid-out box's centre on the point (`_work/probe_box_anchor_ruler.py`: the
        # frame read -30.3..+30.3 around the coordinate with and without the added width), so a wider
        # frame needs no compensation of its own.
        args = box_args(o, pal) + kw
        if width is not None:
            args.insert(0, "width: %.4gcm" % width)
        # every body a Typst `box` draws goes through `_box_body`, which is where the edges CeTz
        # measures by are written back (#63) -- a frame that hugs its words needs the same promise as
        # one that lays them out as a paragraph, or its `anchor:` names the bottom of the library's band.
        drawn = ["content(%s, [#box(%s, %s)]%s)"
                 % (pt, ", ".join(args), _box_body(text, _node_align(o)),
                    (", " + pin) if pin else "")]
    else:
        # No frame is asked for, but the measure the author wrote still stands: pgf sets a
        # `text width=7.4cm` label as a paragraph of that width whether or not anything is ruled
        # around it, and without the `box` Typst runs the words out on ONE line -- 36cm of prose that
        # took the canvas to 1018pt and left half the picture off the page (the node's own rectangle
        # reads x=-440pt on Canonical-conformal p99, `_work/clip_by_colour.py`). A `box` with no
        # `stroke:` draws no rule (`_work/measure_box_default_stroke.py` reads zero drawing operators
        # for it), so this costs nothing on the page. 138 nodes in 56 papers write a `text width` and
        # no frame, 24 more a `minimum width` (`_work/probe_invisible_measure.py`).
        inner = text
        if width is not None:
            inner = "#box(width: %.4gcm, inset: %s, %s)" % (
                width, node_inset(o), _box_body(text, _node_align(o)))
        # `inner sep` is the other half of the box pgf reads an anchor off, and an unframed label with no
        # written measure is the one case nothing else brings it -- as CeTz's `padding:` it enters the box
        # Typst measured (the 3.33pt default sep is the whole of the 3.40pt a `rotate=90,anchor=south`
        # label sat short of the point without it, `_work/label101i_cetz_angle.txt` rows 4 and 16). With a
        # frame or a `width:` the body already carries it as `inset:`, and without an anchor the box is
        # pinned at its centre, where a symmetric pad moves nothing (#101i rows 5 and 6 read the same
        # offsets with and without it).  The turn is not what asks for it: pgf pins the box edge on the
        # point for an unturned `anchor=east` too, and without the pad this engine put that label's right
        # edge 3.49pt (10pt) and 3.52pt (`font=\small`) past where pgf lands it, with the pad 0.16 and
        # 0.52pt -- `_work/label103b_unrotated_pad.txt` on all four side anchors, the `north` rows still
        # carrying the 1.7pt line-box tier that is 轴 72's own account.
        args = kw + ([side] if side else []) + rot
        if side and width is None:
            args.append("padding: %.4gcm" % pad)
        drawn = ["content(%s, [%s]%s)"
                 % (pt, inner, (", " + ", ".join(args)) if args else "")]
    labels = label_lines(at, o, pal, extent)
    if labels is None:
        return None
    return drawn + labels


# A TikZ arrow tip is spelled either as a mnemonic character or, since `arrows.meta`, as a word.
# Measured against pdflatex (_work/measure_tikz_tips.py), `Stealth` and `Latex` draw a solid head of
# aspect .75, which is the head CeTz's `">>"` and `")>"` draw (_work/probe_mark_shapes.py), while a
# bare `>` is an open V in both engines -- so the words carry a fill and the characters do not. A
# word CeTz has no twin for draws nothing; the corpus spells only Stealth and Latex.
TIP_WORDS = {"stealth": (">>", True), "Stealth": (">>", True),
             "latex": (")>", True), "Latex": (")>", True)}
TIP_CHARS = set("<>()[]|ox+*")


def _arrow_tips(side):
    """One half of an arrow specification -> [(mark name, solid, declared options)], or None.

    `side` is whatever stands on one end of the middle dash: `|<` in `|<->|`, `>` in `-.->`,
    `{Stealth[length=2mm]}` in `-{Stealth[length=2mm]}`, `latex` in `-latex`. The dashes and dots
    along its edges spell the line's dash pattern, not a tip, so they are dropped first. A character
    or word that is no tip at all means this was never a specification, and the option key is left
    alone -- which is what keeps `x-scale=-1` from being read as a cross tip on the line's start.
    """
    side = side.strip(".-")
    out, i = [], 0
    while i < len(side):
        c = side[i]
        if c == "{":
            end = find_group(side, i)
            inner, i = side[i + 1:end - 1].strip(), end
        else:
            got = re.match(r"[A-Za-z]+", side[i:])
            if got and got.group(0) in TIP_WORDS:
                inner, i = got.group(0), got.end()
            elif c in TIP_CHARS:
                inner, i = c, i + 1
            else:
                return None
        j = inner.find("[")
        args = ""
        if j >= 0 and inner.endswith("]"):
            args = inner[j + 1:-1]
            inner = inner[:j].strip()
        if inner in TIP_WORDS:
            sym, solid = TIP_WORDS[inner]
        elif len(inner) == 1 and inner in TIP_CHARS:
            sym, solid = inner, False
        else:
            return None
        out.append((sym, solid, opts(args)))
    return out


def _arrow_spec(key):
    """A TikZ option key that is an arrow specification -> (start tips, end tips), or None.

    The two halves split at the last dash that is not inside a group, so `->` and `-.->` keep their
    head on the end, `<-` moves it to the start, and `|<->|` and `{Latex[..]}-{Latex[..]}` split in
    the middle. A key with no such dash is not a specification -- `>=stealth` declares what `>` means
    without drawing anything.
    """
    depth, cut = 0, -1
    for i, c in enumerate(key):
        if c in "{[(":
            depth += 1
        elif c in "}])":
            depth = max(0, depth - 1)
        elif depth == 0 and c == "-":
            cut = i
    if cut < 0:
        return None
    start, end = _arrow_tips(key[:cut]), _arrow_tips(key[cut + 1:])
    if start is None or end is None or not (start or end):
        return None
    return start, end


def _mark_item(tip, paint):
    """One tip -> its CeTz `symbol:`/`length:`/`fill:` item.

    A bare mnemonic with nothing declared stays the plain string it has always emitted; the per-side
    dictionary form only appears once the tip has something to carry.
    """
    sym, solid, declared = tip
    args = []
    for key in ("length", "width"):
        val = declared.get(key)
        if isinstance(val, str):
            got = _size(val)
            if got is not None and not got[1]:
                args.append("%s: %.4gcm" % (key, got[0]))
    if solid:
        args.append("fill: " + paint)
    if not args:
        return '"%s"' % sym
    return '(symbol: "%s"%s)' % (sym, "".join(", " + a for a in args))


def arrow_default(val):
    """What a `>=<name>` declaration says a bare `>` or `<` means -- or None to leave it alone.

    `>=` draws nothing: it re-points the characters `>` and `<` at a named tip, so every `->` in the
    picture's scope changes head. pdflatex measures three regimes, three heads
    (`_work/measure_tikz_tips.py`, with `arrows.meta` loaded the way 476 flat papers load it): nothing
    written leaves an OPEN V, 2.07pt long and 4.78 tall -- which is what CeTz's bare `">"` mark draws,
    so an unset picture needs no change; `[>=latex]` a filled 3.99 x 2.99pt curve-sided one;
    `[>=Stealth]` a filled 3.57 x 2.69pt four-line one. The corpus writes only the four names
    `TIP_WORDS` already knows (`_work/probe_tip_default_face.py`), and a name it has not measured keeps
    its characters rather than a guess.

    The name may be written in its own group (`[>={Stealth}]`, and the Morse-number picture's five
    arrows were open V's until this peeled it): pgf reads the group and the bare spelling the same way,
    measured as `site: head braced` -- so the group comes off before the lookup.
    """
    return TIP_WORDS.get(_braced(val)) if isinstance(val, str) else None


def _named_side(tips, default):
    """One side of a spec, with the `>=<name>` that reaches it written onto its bare characters."""
    if not (default and tips):
        return tips
    return [default + (declared,) if sym in "<>" else (sym, solid, declared)
            for sym, solid, declared in tips]


def arrow_mark(o, pal, drawn, default=None):
    r"""A TikZ option group -> one CeTz `mark:` argument, or None.

    An arrow specification is an option *key* whose shape names the two ends of a path
    (`_arrow_spec`), so the head comes out of the key and not out of a value. TikZ fills a named tip
    with the line's own ink, which is what makes `Stealth` solid and `>` an open V, and an author's
    `length`/`width` belong to the end that declared them: measured (_work/probe_mark_per_side.py)
    that CeTz honours them per side, while a `length:` written beside `start:` and `end:` would size
    both heads from one number.

    `default` is the picture's own `>=<name>` (`arrow_default`), applied to the characters a spec is
    written with; a tip that already names itself is untouched by it. A statement may declare the
    default in its own brackets or through the style it invokes, and pgf then reads THAT name and not
    the one above it -- measured in both option orders, so the merged `o` answers first and the picture
    head only for the statements that say nothing (`_work/probe_tip_decl_site.py`).
    """
    for key in o:
        spec = _arrow_spec(key)
        if spec:
            break
    else:
        return None
    if not drawn:
        # a tip belongs to the stroke: `\path[->] (0,0)--(2,0);` leaves an empty page, and so does
        # `\path[red,->] …` (`_work/measure_path_mode.py`)
        return None
    if ">" in o:
        default = arrow_default(o[">"])
    start, end = spec
    start = _named_side(start, default)
    end = _named_side(end, default)
    paint = color_option(o, pal, ("color", "draw")) or "black"
    parts = []
    for side, tips in (("start", start), ("end", end)):
        if tips:
            items = [_mark_item(t, paint) for t in tips]
            parts.append("%s: %s" % (side, items[0] if len(items) == 1
                                     else "(%s)" % ", ".join(items)))
    return "mark: (%s)" % ", ".join(parts) if parts else None


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


def _named_box(token, names):
    """The box a bare node-name coordinate names, or None.

    Only a bare `(a)` carries the box TikZ clips a path at; `(a.west)` is already a border point
    and `(1,2)` is no node at all, so neither has a border to cut back to.
    """
    if not names:
        return None
    t = token.strip()
    if t.startswith("+"):
        return None
    if not t.startswith("("):
        return None
    end = paren_span(t, 0)
    if end is None or t[end:].strip():
        return None
    m = ANCHORED.fullmatch(t[1:end - 1].strip())
    if not m or m.group(2):
        return None
    return names.get(m.group(1))


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

    A node with no coordinate and no placement sits at the current point, which TikZ resets to the
    scope origin for every statement; a node placed relative to a named node is placed by
    `placed_at`, and a placement we cannot work out is refused rather than stacked on the origin
    with its neighbours.
    """
    rest = rest.lstrip()
    name = None
    # the same reading as ANCHORED: pgf takes the whole parenthesised token as the name, spaces
    # included, so a figure that names its points `qf axes` has to have those names registered
    m = re.match(r"\(([-\w](?:[-\w ]*[-\w])?)\)\s*", rest)
    if m:
        name, rest = m.group(1), rest[m.end():].lstrip()
    # TikZ reads the option group either side of the name, and an author placing a node by its
    # neighbours writes it after: `\node (b) [right=of a] {text}`. Left unread, that group is not a
    # missing placement but a node dropped on the scope origin -- the five diagrams of #71 were
    # canvases whose every coordinate was (0, 0), because the placement stood where this reader
    # had never looked.
    extra, pos = _opts_at(rest, 0)
    if extra is None:
        return None
    if extra:
        rest = rest[pos:]
        o = {**(o or {}), **extra}
    if not rest.startswith("at"):
        # 'right=of reset' is a placement, not a missing coordinate: the two boxes and the
        # gap between them are all numbers the author wrote down
        rect = fit_rect(o or {}, names, xf)
        size = (rect[2], rect[3]) if rect else node_size(o or {}, xf, _node_body(rest))
        for key, val in (o or {}).items():
            got = placed_at(key, val, names, xf, size, o)
            if got is not None:
                return name, got, rest
        if rect:
            # a `fit=` node stands on the box it gathers, and that box's own midpoint is where it
            # goes -- left to the scope origin the third stage of a flowchart landed on its second
            return name, (rect[0], rect[1]), rest
        if (o or {}).get("fit") is not None or POSITIONED.search(
                " ; ".join("%s=%s" % (k, v) for k, v in (o or {}).items())):
            return None
        return name, _origin(xf), rest
    rest = rest[2:].lstrip()
    at, end = _coord_at(rest, 0, names, xf)
    if at is None:
        return None
    return name, at, rest[end:]


def _bend_controls(a, b, bend):
    """pgf's arms for `to[bend left=deg]`: 0.39 of the chord, at +-deg off the chord's direction.

    A bend is a tangent `to` whose two angles are read off the chord (`_work/measure_bend_default.py`:
    `bend left=45` on a horizontal chord leaves along +45 and arrives along -45, and a bare
    `bend left` is 30), and the angle does not enter the arm length at all --
    `_work/measure_bend_arm.py` reads 0.39 * chord at 10, 30, 45, 60 and 90 degrees and on chords of
    1, 2, 3 and 5cm alike. So the bend shares `_tangent_controls`, `looseness` and all, and a node
    written on the edge lands on the curve's own midpoint instead of the chord's.
    """
    theta, loose = bend
    phi = math.degrees(math.atan2(b[1] - a[1], b[0] - a[0]))
    # `_tangent_controls` reads both of its angles as the bearing a control sits on, seen from its own
    # endpoint, while pgf's `in` is the direction the curve travels INTO b -- half a turn away.
    return _tangent_controls(a, b, (phi + theta, phi - theta + 180.0), loose)


# the page direction a `to` with no `out=` leaves along, and one with no `in=` arrives along
TANGENT_FALLBACK = (45.0, 135.0)

# the bearings the five `loop` keys stand for, as control directions seen from their own endpoint:
# `tikzlibrarytopaths.code.tex` expands `loop above` to `above,out=105,in=75,loop` and the rest the
# same way, while a bare `loop` writes no angles at all and so takes pgf's own 45/135 defaults
LOOP_ANGLES = {"": (45.0, 135.0), "above": (105.0, 75.0), "below": (285.0, 255.0),
               "left": (195.0, 165.0), "right": (15.0, -15.0)}
# `loop` is a `to path` carrying `[looseness=8,min distance=5mm]`. A loop's chord is zero, so a
# chord-proportional control distance has nothing to scale: the 5mm floor, an absolute page length
# like the pen, is what puts the ink anywhere at all, and the looseness of 8 is what grows a loop on
# a node wide enough for its chord to win (`_work/pic-shapes/measure_loop.py`: a bare coordinate loop
# sits 0.5cm out, an 8mm circle's 0.6570 = 8 x 0.39 x its 0.2106 chord)
LOOP_LOOSENESS = 8.0
LOOP_MIN_DISTANCE = 0.5


def _tangent_dirs(angles):
    """The two page directions a tangent `to` leaves and arrives along.

    A key that is not written stands for its own measured direction -- 45 at the start, 135 at the
    end -- not for the other key's angle, and not for a straight arrival
    (`_work/measure_tangent_table.py` reads both out of a pdflatex render).
    """
    return tuple(TANGENT_FALLBACK[i] if angles[i] is None else angles[i] for i in (0, 1))


def _tangent_endpoints(box, a, b, angles):
    """A self-`to`'s endpoints, carried from the node's centre onto its border.

    Only a loop answers to this. TikZ takes a `to` whose two ends name the same node off that node's
    border, at the point each tangent ray meets it -- `\tikz@to@modify` appends the `out=` and `in=`
    angles to the node name as anchors, so `(six) to[loop above] (six)` leaves `six.105` and arrives
    at `six.75` -- and the chord, controls and head follow from those points rather than the centres.
    `_work/pic-shapes/measure_loop.py` reads an undrawn `$R$` node leaving at (-0.0654, 0.2443), the
    105-deg ray where it crosses that node's own ink, and a drawn 8mm circle leaving at
    (-0.1053, 0.3932), the same ray out on its ring.
    """
    if a != b or box is None or box[:2] != a:
        return a, b
    return tuple(_clip_to_border(box, a, (a[0] + math.cos(math.radians(dirn)),
                                          a[1] + math.sin(math.radians(dirn))))
                 for dirn in _tangent_dirs(angles))


def _tangent_controls(a, b, angles, loose=1.0, min_off=0.0):
    """Control points for TikZ `to[out=α,in=β]`, both 0.39 of the chord along the tangent.

    Measured out of a pdflatex render (`_work/measure_tangent_table.py`,
    `_work/measure_tangent_dir.py`): the factor is 0.39, and the angle a missing key stands for is
    an absolute page direction, 45 at the start and 135 at the end, the same whatever the chord's
    own direction is. So `to[out=30]` still curves at the far end instead of arriving straight.
    `looseness` scales that length and nothing else (`_work/measure_looseness.py` reads 0.39·L at
    the control points for L=0.5, 2 and 5), so the two endpoints move together along their tangents.
    The chord is the one between the *endpoints*, which for a loop are already the node's border
    anchors -- `_work/pic-shapes/measure_outer_sep.py` reads off/chord = 1.9498 at looseness 5 for
    anchors, centres and round nodes of four different sizes alike.
    `min_off` floors that length at an absolute page measure, which is the only way a loop, whose
    chord is zero, gets controls at all; with no floor and no chord there is nothing to place and
    the statement has no ink to give (`_work/pic-shapes/measure_loop.py` reads a bare coordinate
    `to[loop above]` sitting 0.5cm out on each tangent).
    """
    dx, dy = b[0] - a[0], b[1] - a[1]
    off = max(math.hypot(dx, dy) * 0.39 * loose, min_off)
    if off == 0:
        return None
    return tuple((at[0] + math.cos(math.radians(ang)) * off,
                  at[1] + math.sin(math.radians(ang)) * off)
                 for at, ang in zip((a, b), _tangent_dirs(angles)))


def _render(seg, closed, mark, sa, fill):
    kind, data = seg
    if kind == "poly":
        args = [fmt(*p) for p in data]
        if closed:
            args.append("close: true")
        fn = "line"
    elif kind == "run":
        # a rounded run is one path: stroking its pieces separately leaves a butt-cap bite at every
        # junction, which a wide pen turns into a white notch (`_work/measure89d_rounded_seam_typst.py`,
        # the same 12pt corner drawn both ways -- `merge-path` bolts the pieces into one subpath and
        # takes the stroke and the mark for the whole of it)
        fn = "merge-path"
        args = ["{%s}" % "; ".join(_render(s, False, None, [], None) for s in data)]
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


PLOT_TENSION = 0.2775


def _support(p, ahead, behind, t):
    """p moved `t` of the way along the vector from the knot behind it to the one ahead."""
    return tuple(p[k] + t * (ahead[k] - behind[k]) for k in range(2))


def smooth_curve(pts, tension=0.5):
    r"""`plot[smooth]`'s knots -> the cubic pieces pdf draws between them; (start, stop, c1, c2).

    Measured off the compiled control PDFs in `_work/pic-plot/meas/`: `smooth` swaps the plot
    handler for pgf's `\pgfplothandlercurveto` (tikz.code.tex:1233), which holds a *support* at
    every knot and draws each piece as the cubic from that support to the next one's. The support
    at an interior knot is `0.2775 * tension` times the vector between its two neighbours, so

        piece i:  c1 = p_i + t (p_{i+1} - p_{i-1})      c2 = p_{i+1} - t (p_{i+2} - p_i)

    and the two ends carry no support at all -- `law_3` reads `c1 = p_0` on the first piece and
    `c2 = p_n` on the last, so two knots come out of the two knots' own controls and TeX draws them
    as one straight piece (`law_2`). The default `tension=0.5` sets t to 0.13875 (pgf's own
    `\pgfsetplottension{0.5}` multiplies by 0.2775), and on knots (0,0) (1,1) (2,0) (3,1) (4,0) that
    puts the first piece's far control at (1,1) - 0.13875*(2,0) = (0.7225, 1) -- the measured number
    (`law_p5`, `law_tension` reads 0.445 there for `tension=1`).

    A value written on `smooth` itself is ignored by TeX and changes nothing (`law_smoothvalue`);
    only `tension=` moves t (`law_tension` reads 0.2775 for `tension=1`).

    pgf builds the supports in the user space and the page transform is applied afterwards; every
    control here is an affine combination of knots, so building them from transformed knots -- all
    this converter holds -- gives the same pieces under `scale=`, `x=`/`y=` and a rotated scope.
    """
    t = PLOT_TENSION * tension
    out = []
    for i in range(len(pts) - 1):
        a, b = pts[i], pts[i + 1]
        c1 = a if i == 0 else _support(a, b, pts[i - 1], t)
        c2 = b if i + 2 == len(pts) else _support(b, pts[i + 2], a, -t)
        out.append((a, b, c1, c2))
    return out


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
    r"""`plot` -> its points, its cubic pieces and the text after it; None when we draw it wrong.

    Two operands are worth drawing: a written-out `coordinates { (0,0) (1,2) ... }` list, and a
    function or parametric pair over `domain=` with `samples=`. pgf feeds both the same way, so
    `plot` answers with its knots and, when `smooth` asked for the curveto handler, with the
    measured cubic pieces between them (`pieces` is None when the knots join by straight lines).

    `scope` is the statement's own option list: papers write `domain=` and `samples=` on the
    `\draw` far more often than on the `plot`, and pgf reads them from either.
    """
    m = re.match(r"\s*plot\s*(\[[^\]]*\])?\s*", rest[pos:])
    if not m:
        return None
    po = {**scope, **opts(m.group(1)[1:-1])} if m.group(1) else dict(scope)
    keys = {str(k).strip() for k in po}
    if keys & {"only marks", "each", "mesh", "surfaces", "smooth cycle"} or any(
            k.startswith("mark") for k in keys):
        # `smooth cycle` runs pgf's closed-curve handler, whose end knots do carry a support -- a
        # different measured law from `smooth_curve`, so it stays quoted rather than opened up
        return None
    smooth = "smooth" in keys
    tension = 0.5
    if smooth and po.get("tension") is not None:
        tension = expr(str(po["tension"]).replace(" ", ""))
        if tension is None:
            return None
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
    else:
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
        # `samples=70` measured over TeX's own PDF (`_work/pic-plot/meas/fn70.pdf`): 70 knots,
        # 69 straight pieces, the first at the domain's own end and the step (hi-lo)/69
        n = max(2, int(float(po.get("samples") or 25)))
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
    if len(pts) < 2:
        return None
    return pts, end, (smooth_curve(pts, tension) if smooth else None)


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


def translate_path(rest, verb, o, names, xf=IDENT, pal=None, styles=None, default=None):
    """One \\draw/\\fill/\\path statement -> CeTz draw calls, or None.

    `default` is the picture's `>=<name>` arrow tip, carried down to every `arrow_mark` on the path.
    """
    rest = rest.strip()
    extra, end = _opts_at(rest, 0)
    if extra is None:
        return None
    o = {**o, **extra}
    rest = rest[end:].strip()
    drawn = draws_rule(o, verb)
    mark = arrow_mark(o, pal, drawn, default)
    painted = verb in ("fill", "filldraw")
    sa = rule_args(o, pal, drawn)
    fill = color_option(o, pal, ("fill",), bare=painted)
    if fill is None and painted:
        fill = "black"
    # `even odd rule` asks pgf to fill the region BETWEEN the statement's sub-paths, and the only
    # shape that carries that here is one compound path: shipped as separate filled shapes the later
    # one paints over the hole the author left open.  Measured on three shapes
    # (`_work/label99d_annulus.txt`, 600 dpi, sample points taken off each drawing's own box): the
    # pdflatex control and CetZ's `compound-path` both read the hole at paper, our two filled
    # `circle`s read it at the fill.  `nonzero rule` needs nothing -- it is pgf's and Typst's default.
    hole = o.get("even odd rule") is True
    # a `rounded corners` on the statement cuts every inner corner of the straight runs it governs
    radius = corner_radius_pt(o)
    rounded_cm = None if radius is None else radius / 28.346
    items, poly, cursor = [], [], None
    # the node box each poly point came from, so a segment named by a bare node can be cut back
    # to that node's border the way TikZ draws it
    poly_boxes = []
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
            pts = list(poly)
            boxes = list(poly_boxes)
            if not closed and not fill and any(b is not None for b in boxes[1:-1]):
                # a box in the middle of a run means the path enters and leaves it at two
                # different border points, which one polyline cannot carry, so the run is cut
                for i in range(len(pts) - 1):
                    a, b = pts[i], pts[i + 1]
                    ca = _clip_to_border(boxes[i], a, b) if boxes[i] is not None else a
                    cb = _clip_to_border(boxes[i + 1], b, a) if boxes[i + 1] is not None else b
                    add(("poly", [ca, cb]))
            else:
                if boxes[0] is not None:
                    pts[0] = _clip_to_border(boxes[0], pts[0], pts[1])
                if boxes[-1] is not None:
                    pts[-1] = _clip_to_border(boxes[-1], pts[-1], pts[-2])
                if rounded_cm is not None and not closed and len(pts) > 2:
                    add(("run", rounded_run(pts, rounded_cm)))
                else:
                    add(("poly", pts))
        del poly[:]
        del poly_boxes[:]

    while pos < len(rest):
        chunk = rest[pos:]
        seg = None
        m = re.match(r"\s*node\s*(\[[^\]]*\])?\s*(\[[^\]]*\])?\s*(?:\(([^()]*)\)\s*)?\{", chunk)
        if m:
            inner, end = bracketed(rest, pos + m.end() - 1)
            if inner is None:
                return None
            no = opts(m.group(1)[1:-1]) if m.group(1) else {}
            if styles:
                # an in-path `node` IS a node, so its bracket may name a `/.style` the picture
                # declared -- and the keys that make a label visible at all usually live there: the
                # Partition triangle's `node[overlap]` is `{fill=white, inner sep=3pt}`, the white
                # that interrupts the line it sits on. Measured (`_work/probe_inpath_node_options.py`):
                # the same options written inline reach the box, written through a name they vanish.
                # The lookup goes first, before the placement keys are read, because a style may
                # carry `pos=` or `sloped` as much as a colour.
                no = resolve_opts(no, styles)
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
                                         a[1] + t * (b[1] - a[1])) \
                + node_size(no, xf) + (_anchor_ring(no, xf),)
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
            pts, end, pieces = got
            if pieces is None:
                # plot continues the path it sits on, so its points join the running polyline
                poly.extend(pts)
                poly_boxes.extend([None] * len(pts))
            else:
                # `sm_after.pdf` measured: TeX starts the spline as its own subpath at the first
                # knot -- the point the path stood on before is left where it is, with no join drawn
                # to it -- and carries on *from* the last knot, so the polyline resumes there
                flush()
                for a, b, c1, c2 in pieces:
                    add(("bezier", (a, b, c1, c2)))
                poly.append(pts[-1])
                poly_boxes.append(None)
            cursor, pos = None, end
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
                loose = None
                min_off = 0.0
                loop = None
                bent = None
                for key, val in spec.items():
                    flat = key.strip() + ("" if val is True else "=" + str(val))
                    got = re.fullmatch(r"bend\s+(left|right)\s*(?:=\s*(-?[\d.]+))?", flat)
                    if got:
                        # the signed turn off the chord: `bend left` leaves along chord+deg
                        bent = (30.0 if got.group(2) is None else float(got.group(2))) \
                            * (1 if got.group(1) == "left" else -1)
                        continue
                    got = re.fullmatch(r"(out|in)\s*=\s*([-+]?\d*\.?\d+)", flat)
                    if got:
                        angles[0 if got.group(1) == "out" else 1] = float(got.group(2))
                        continue
                    got = re.fullmatch(r"looseness\s*=\s*([-+]?\d*\.?\d+)", flat)
                    if got:
                        loose = float(got.group(1))
                        continue
                    got = re.fullmatch(r"loop\s*(above|below|left|right)?", flat)
                    if got:
                        loop = (got.group(1) or "").lower()
                # `looseness` counts wherever it is written, before or after the key it scales
                if loop is not None:
                    # the loop's own bearings, looseness and floor. An author's `looseness=` replaces
                    # the whole package rather than one part of it: `measure_loop.py` reads
                    # `loop above,looseness=4` on an 8mm circle at 4 x 0.39 x its chord, under the
                    # 5mm the loop standing alone costs.
                    angles = [LOOP_ANGLES[loop][i] if angles[i] is None else angles[i]
                              for i in (0, 1)]
                    if loose is None:
                        loose, min_off = LOOP_LOOSENESS, LOOP_MIN_DISTANCE
                loose = 1.0 if loose is None else loose
                if bent is not None:
                    bend = (bent, loose)
                if any(a is not None for a in angles):
                    tangent = (tuple(angles), loose, min_off)
                pos = end
            # TikZ applies `every edge`/`every to` to each such sub-path, layered on what the
            # statement already said, so a head or an ink declared there belongs to this segment alone:
            # a mixed `(a) -- (b) (c) edge (d)` must not head the plain one, and a `\draw[thick]` above
            # it must not leave the edge's own line at pgf's default weight.
            name = "every edge" if m.group(0).strip().startswith("edge") else "every to"
            eo = {**o, **((styles or {}).get(name) or {}), **spec}
            drawn = draws_rule(eo, verb)
            edge_pending[0] = (arrow_mark(eo, pal, drawn, default),
                               rule_args(eo, pal, drawn))
            continue
        m = re.match(r"\s*cycle\b", chunk)
        if m:
            closed = True
            pos += m.end()
            continue
        stripped = chunk.lstrip()
        if re.match(r"(?:\+\+?)?\s*\(", stripped):
            tok = pos + (len(chunk) - len(stripped))
            p, end = _coord_at(rest, tok, names, xf, cursor)
            if p is None:
                return None
            box_p = _named_box(rest[tok:end], names)
            start = cursor if cursor is not None else (poly[-1] if poly else None)
            if grid_from is not None:
                strokes = grid_lines(grid_from, p, o, xf, sa)
                if strokes is None:
                    return None
                items.extend(("raw", s) for s in strokes)
                grid_from = None
            elif rect_from is not None:
                if _turns(xf):
                    lo, hi = _unmap(xf, rect_from), _unmap(xf, p)
                    if lo is None or hi is None:
                        return None
                    corners = [_apply(xf, x, y) for x, y in
                               ((lo[0], lo[1]), (hi[0], lo[1]),
                                (hi[0], hi[1]), (lo[0], hi[1]))]
                    # a turned rectangle is a four-point polygon and CeTz's `line` takes no corner
                    # radius, so this one keeps its square corners
                    items.append(("raw", "line(%s, close: true%s)"
                                  % (", ".join(fmt(*c) for c in corners), _style(fill, sa))))
                else:
                    items.append(("raw", "rect(%s, %s%s)"
                                  % (fmt(*rect_from), fmt(*p),
                                     _style(fill, sa + corner_args(o)))))
                rect_from = None
            elif ctrl is not None or bend is not None or tangent is not None:
                if start is None:
                    return None
                if ctrl is not None:
                    curve = (_control(start, ctrl[0]), _control(p, ctrl[1]))
                elif tangent is not None:
                    start, p = _tangent_endpoints(box_p, start, p, tangent[0])
                    curve = _tangent_controls(start, p, *tangent)
                else:
                    curve = _bend_controls(start, p, bend)
                if curve is None or curve[0] is None:
                    return None
                flush()
                add(("bezier", (start, p) + tuple(curve)))
                seg = ("cubic", start, curve[0], curve[1])
                ctrl = bend = tangent = None
            elif join in ("-|", "|-") and start is not None:
                poly.append((p[0], start[1]) if join == "-|" else (start[0], p[1]))
                poly_boxes.append(None)
                poly.append(p)
                poly_boxes.append(box_p)
            else:
                if not poly and start is not None:
                    poly.append(start)
                    poly_boxes.append(None)
                poly.append(p)
                poly_boxes.append(box_p)
            # the segment just walked, which is the one a node written at the end of the path sits on
            done = (start if start is not None else p, p, seg)
            if pending is not None:
                prev, t, no, inner, tilt, off, nm = pending
                base = _node_along(prev, p, 0.5 if t is None else t, seg)
                own = node_size(no, xf, inner)
                if nm:
                    names[nm] = _named_box_entry((base[0] + off[0], base[1] + off[1]),
                                                 no, xf, inner)
                for line in emit_node((base[0] + off[0], base[1] + off[1]), inner, no,
                                      pal, angle=_slant(xf) + tilt,
                                      width=node_frame_width(no, xf), extent=own,
                                      pad=node_inner_sep(no, xf)):
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
            drawn = draws_rule(o, verb)
            mark = arrow_mark(o, pal, drawn, default)
            sa = rule_args(o, pal, drawn)
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
        own = node_size(no, xf, inner)
        if nm:
            names[nm] = _named_box_entry((base[0] + off[0], base[1] + off[1]), no, xf, inner)
        for line in emit_node((base[0] + off[0], base[1] + off[1]), inner, no, pal,
                              angle=_slant(xf) + tilt, width=node_frame_width(no, xf),
                              extent=own, pad=node_inner_sep(no, xf)):
            nodes.append(line)
    if hole and fill and len(items) > 1:
        # one compound path with the statement's paint, and each sub-path drawn as its own hole:
        # `compound-path` reads only the segments of what the block builds and repaints them with the
        # style given to it, so the `fill:` each shape call already carries is dropped by CeTz itself
        # (three pages, `_work/label99e_compound_styles.txt`: sub-shapes bare, sub-shapes filled the
        # same colour, the inner one filled white -- all three read the hole at paper)
        parts = []
        for it in items:
            if it[0] == "raw":
                parts.append(it[1])
            elif it[0] == "run":
                parts.extend(_render(s, False, None, [], None) for s in it[1])
            else:
                parts.append(_render(it, False, None, [], None))
        merged = "compound-path({%s}, fill: %s, fill-rule: \"even-odd\"%s)" % (
            "; ".join(parts), fill, (", " + ", ".join(sa)) if sa else "")
        return [merged] + nodes
    segs = [i for i, it in enumerate(items) if it[0] != "raw"]
    if not segs:
        return [it[1] for it in items if it[0] == "raw"] + nodes or None
    if fill and len(segs) > 1:
        # one filled outline spanning straight and curved pieces
        flat = [s for i in segs for s in (items[i][1] if items[i][0] == "run" else [items[i]])]
        body = "; ".join(_render(s, False, None, [], None) for s in flat)
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


def translate_statement(stmt, names, xf=IDENT, pal=None, styles=None, default=None):
    """One TikZ statement -> its CeTz lines, or None to refuse the picture.

    `default` is the picture's own `>=<name>` arrow tip (`arrow_default`), which reaches the paths.
    """
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
        rect = fit_rect(o, names, xf)
        size = (rect[2], rect[3]) if rect else node_size(o, xf)
        own = size if rect else node_size(o, xf, inner)
        if name:
            # what a neighbour is placed by steps over the label's own rows; what gets drawn is the
            # box the author wrote down, since Typst -- not this converter -- is what measures glyphs
            names[name] = _named_box_entry(at, o, xf, inner, names)
        box = None
        if box_visible(o) and None not in size:
            box = (at[0] - size[0], at[1] - size[1], at[0] + size[0], at[1] + size[1])
        # a node's own `rotate=` turns its contents, and an `anchor=` beside it names the turned
        # point -- `emit_node` hands both to CeTz's `content(..., angle:, anchor:)`
        return emit_node(at, inner, o, pal, box, _slant(xf) + tilt,
                         node_frame_width(o, xf), own, node_inner_sep(o, xf))
    return translate_path(stmt[pos:], verb, o, names, xf, pal, styles, default)


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
    r"""Reject a canvas whose maths is left open, before the caller pays for a compile.

    Only `$` parity is checked, and that is the whole of what this can say on its own: markup that
    does not balance its delimiters fails `compiles` one line later, and Typst is the authority on
    what compiles. Counting brackets used to be the cheap pre-filter for that, but two things in a
    canvas carry a bracket *inside a string* -- CeTz names its curved head ")" and its bar tip "]",
    and an author's own character survives in node text, where a paper's `K\"ahler` reaches the line
    as `K"ahler` -- so a count over the line as written refuses pictures that draw perfectly well.
    """
    for line in canvas.splitlines()[2:-1]:
        if re.sub(r"\\.", "", line).count("$") % 2:
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


# a braced angle is a pgfmath expression, measured (_work/pic-scoped/m_rotate_expr.tex):
# `rotate={45/2+90}` lands exactly where `rotate={112.5}` does. A `deg` suffix belongs only to
# a plain number: TeX itself errors on `rotate={45/2+90 deg}` (PGF Math: unknown operator `d'),
# so an expression angle carrying a letter refuses.
ROTATE = re.compile(r"^\s*\{?\s*([^:{}(]+?)\s*(deg)?\s*"
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
    """rotate=45, rotate={45/2+90} or rotate around={45:(1,2)} -> (degrees, centre); None unreadable."""
    m = ROTATE.match(val.strip())
    if not m:
        return None
    angle = m.group(1)
    if m.group(2) and not re.fullmatch(r"-?[\d.]+", angle):
        return None
    ang = expr(angle)
    if ang is None:
        return None
    if m.group(3) is None:
        return (ang, None)
    centre = point("(%s, %s)" % (m.group(3), m.group(4)), None)
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
    """The offset a node's own placement options give it, read the way a scope's shift is read.

    TikZ places the node where its coordinates say and then moves it, so this is a placement
    change only: it neither turns nor stretches the contents the way a scope's transform does.
    A side key that carries a dimension -- `above=20pt`, the spelling an edge label writes --
    adds its own distance in its own direction on top of that, alongside the anchor
    `_node_anchor` picks for it: measured against pdflatex
    (`_work/measure_side_key_offset.py`), `above=20pt` lands the node's south point exactly 20pt
    off the coordinate, with no half-height and no `outer sep` added to the gap.
    """
    off = (0.0, 0.0)
    moves = {k.strip(): v for k, v in o.items()
             if k.strip() in MOVES or k.strip() == "shift"}
    if moves:
        got = _transform(moves, xf)
        if got is None:
            return None
        off = (got[10], got[11])
    side = _side_key(o)
    if side:
        dx, dy = SIDE_MOVE[side[0]]
        dist = _length(side[1], xf)
        off = (off[0] + dx * dist, off[1] + dy * dist)
    return off


def _axis_vector(pair, along):
    """One axis option -> its canvas vector; a bare dimension stands `along` that axis.

    Measured against pdflatex: `x=1.3cm` is (1.3, 0) and `y=1.3cm` (0, 1.3), but pgf writes a bare
    `z=1.3cm` into both components, (1.3, 1.3), which is not the direction of the default z.
    """
    return pair if len(pair) == 2 else (along[0] * pair[0], along[1] * pair[0])


def _transform(o, outer=IDENT, names=None, scope=False):
    """Options that move the coordinate system -> a scope's matrix, axes and origin; None if unreadable.

    `scope` says these are the options of a `scope`/`tikzpicture`, not of a node or a coordinate point:
    measured against pdflatex (_work/probe81e_scale_shift.py, _work/probe81g_node_shift.py), a scope's
    `xshift` is stretched by the enclosing `scale=` (1.7cm -> 2.456cm at 1.45) and turned by its
    `rotate=`, while a node's own `xshift` stays one centimetre along the page under both.

    Measured against pdflatex (_work/probe_3d_basis.py, _work/probe_3d_order.py): 'shift' counts user
    units of the *enclosing* axes (so it is taken through outer's matrix), while 'xshift' is an
    absolute length that the enclosing matrix still stretches and turns, and 'scale' a factor. A 'shift' may also name a node; measured
    (_work/pic-scoped/m_shift_name.tex) its canvas point then translates the origin verbatim -- under
    x=2cm a `shift={(A)}` on a node two centimetres out moves two centimetres, not four, and stays
    put through an enclosing `rotate=90`, because a name is a point of the page, not a count of
    units. A scale or a 'rotate' turns the whole
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
            inside = val.strip().strip("{}")
            got = point(inside, None)
            if got is None:
                got = point(inside, None, names) if names else None
                if got is None:
                    return None
                # a named point already carries the page: it shifts by its own centimetres
                dx, dy = dx + got[0], dy + got[1]
            else:
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
            elif key in MOVES:
                mx, my = (d, 0.0) if key == "xshift" else (0.0, d)
                if not scope:
                    dx += mx
                    dy += my
                    continue
                # a scope's shift is a length of the page taken through the matrix in force where it
                # is written -- the enclosing one, then whatever this very option list already did.
                a = outer[0] * ma + outer[1] * mc
                b = outer[0] * mb + outer[1] * md
                c = outer[2] * ma + outer[3] * mc
                e = outer[2] * mb + outer[3] * md
                dx += a * mx + b * my
                dy += c * mx + e * my
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


def _walk_scopes(body, xf, out, names=None, styles=None):
    """Collect (statement, transform) pairs; False on a scope we cannot read.

    With a names table handed in, each statement is registered the moment the walk passes it, so a
    later `shift={(A)}` finds the point A already placed -- in TeX as here a name a scope shifts
    onto has to exist before the scope opens.
    """
    pos = 0
    while True:
        m = SCOPE.search(body, pos)
        if not m:
            for s in split_statements(body[pos:]):
                out.append((s, xf))
                if names is not None:
                    register(s, names, xf, styles)
            return True
        if m.group(1) == "end":
            return False
        for s in split_statements(body[pos:m.start()]):
            out.append((s, xf))
            if names is not None:
                register(s, names, xf, styles)
        o, start = _opts_at(body, m.end())
        inner = _transform(o, xf, names, scope=True) if o is not None else None
        if inner is None:
            return False
        depth, i = 1, start
        while depth:
            n = SCOPE.search(body, i)
            if not n:
                return False
            depth += 1 if n.group(1) == "begin" else -1
            i = n.end()
        if not _walk_scopes(body[start:n.start()], _compose(xf, inner), out, names, styles):
            return False
        pos = i


def scoped(body, xf=IDENT, names=None, styles=None):
    """Statements paired with their enclosing transform; None to refuse."""
    out = []
    return out if _walk_scopes(body, xf, out, names, styles) else None


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
# `column sep` and `row sep` separate neighbouring cells edge to edge, between their boxes -- not
# between their centres: the same diagram compiled with one-letter cells and with ten-letter ones
# leaves the same ink-to-ink gap (11pt, the environment's own default separation: 35.57pt against
# 36.61pt, `_work/probe90_cd_sep_law.py`).  A neighbour's centre therefore sits at
# `sep + (box[a] + box[b]) / 2`.  The six named steps are multiples of one base per axis --
# tiny 1, small 2, scriptsize 3, normal 4, large 6, huge 8 -- and writing nothing asks for `normal`.
# Every number here is priced at 11pt because that is the only class the corpus's exchange diagrams
# use: `_work/probe91_cd_cell_box.py` reads 324 distinct cell lines over every `tikzcd` in
# `_work/flat` and they all come from an 11pt document.
CD_STEP_NAMES = {"tiny": 1, "small": 2, "scriptsize": 3, "normal": 4, "large": 6, "huge": 8}
CD_SEP_BASE = {"column": 0.2309, "row": 0.1734}  # the `tiny` step in cm: 6.545pt, 4.915pt at 11pt
CD_BODY_CM = 11 * 2.54 / 72.27  # an author's `2em` prices at the body size (probe90: 0.77cm)
CD_UNIT_CM = {"cm": 1.0, "mm": 0.1, "in": 2.54, "pt": 2.54 / 72.27, "em": CD_BODY_CM}
CD_DIM = re.compile(r"([0-9.]+)\s*(cm|mm|in|pt|em)")
# marks we have not drawn against the compiler, and paths we cannot place on a grid.
# 'two heads' is drawn: the compile gate takes ">>" for the double tip at a line's end.
CD_REFUSE = re.compile(r"\b(?:tail|curve|shorten|shift|circle|"
                       r"triple|arrows|no arrows)\b")
CD_BEND = re.compile(r"bend\s+(left|right)(?:\s*=\s*(\d+))?")
# texmath grows \bigl( and \bigr) with a #scale call; a canvas line cannot host a
# markup escape, so the delimiter keeps its shape and the sizing is dropped
CD_SCALE = re.compile(r"#scale\([^)]*\)\[((?:[^\[\]]|\[[^\]]*\])*)\]")


def cd_gap(head, key):
    """The separation an author sets on `column sep` / `row sep`, in cm.

    tikz-cd takes a named step or a dimension, and a step it does not know is an error on its own
    page rather than a silent default, so the one reading this function cannot give is a value the
    author wrote: an unknown shape keeps the `normal` step the environment uses when the author
    writes nothing at all.  The corpus writes the names `small`, `large`, `huge` and the units `cm`
    and `em` -- 12 pictures over 11 papers whose value the old name-only table used to drop
    (`_work/probe89_cd_sep_census.py`).
    """
    m = re.search(re.escape(key) + r"\s*=\s*(?:\{([^{}]*)\}|([^\s,\]}]+))", head)
    base = CD_SEP_BASE[key.split()[0]]
    if not m:
        return base * CD_STEP_NAMES["normal"]
    value = (m.group(1) or m.group(2)).strip().lower()
    if value in CD_STEP_NAMES:
        return base * CD_STEP_NAMES[value]
    dim = CD_DIM.fullmatch(value)
    if dim:
        return float(dim.group(1)) * CD_UNIT_CM[dim.group(2)]
    return base * CD_STEP_NAMES["normal"]


def cd_arrow(spec):
    """A tikzcd \\arrow option list -> a drawing recipe, or None if we cannot place it.

    A hook gets a straight barb at its tail and a bend pgf's own cubic, because those are the shapes
    CeTz draws: the barb hangs on the left of travel, which is where `_work/measure48_cd_hook.py`
    reads tikz-cd's, and the bend's angle is carried through so `_bend_controls` can put the arc at
    0.39 of the chord on that side instead of at a fixed bulge.  Anything needing an unverified mark
    is refused rather than drawn wrong.
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
            m = CD_BEND.fullmatch(opt)
            # a bare `bend left` is pgf's default 30 degrees, and the sign is the side of travel
            got["bend"] = (1 if m.group(1) == "left" else -1) * float(m.group(2) or 30)
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


CD_STACK = re.compile(r"\\begin\{(gathered|aligned|substack|array|matrix)\}.*?\\end\{\1\}", re.S)
CD_STACK_ENV = re.compile(r"\\(?:begin|end)\{(?:gathered|aligned|substack|array|matrix)\}")
CD_NL = "\x00cdnl\x00"
# the baseline pitch of one stacked cell line, and the height of a one-line cell's box, both in cm:
# `_work/probe91_cd_cell_box.py` sets a two-line `gathered` cell on a real tikz-cd page and reads its
# lines 16.6pt apart, and `_work/probe90_cd_sep_law.py` reads a single-line row's own box as 15.43pt
# at the default separation (35.07pt centre distance less the 19.64pt gap between the boxes).
CD_LINE_CM = 0.586
CD_ROW_CM = 0.545
# an arrow's label clears its line by this much, measured on the label's own ink rather than on the
# point it hangs on.  The gap is tikz-cd's `inner sep`: `_work/measure48_cd_bend.py` reads a label's
# ink edge 0.077cm off a horizontal shaft and 0.0825cm off a vertical one.  The height is twice how
# far our label's ink reaches below the anchor Typst centres it on -- measured by pixel threshold at
# 300 dpi in `_work/measure48_cd_hang.py` over the shapes this corpus writes (0.111cm for `ab`,
# 0.195 for an italic `f`, 0.204 for a fraction), because Typst ships text as text and
# `get_drawings()` holds no glyph outlines to read.  The fixed 0.45cm this replaces was that height
# term applied to every direction, which drove a vertical arrow's line through a long label.
CD_LABEL_GAP = 0.077
CD_LABEL_H = 0.41  # twice the deepest ink a one-line label hangs below its anchor, in cm
# Both of those were read off a real tikz-cd page, whose arrow labels are `\scriptstyle`:
# `_work/probe88b_cd_label_size.py` compiles the same diagram at the three class sizes and reads
# cells 9.96/10.91/11.96pt against labels 6.97/7.97/7.97pt -- the same in amscd, and independent of
# how the label is spelled (`\mathrm`, `\text`, bare maths). A label that opens its own `$...$`
# escapes the environment's maths and prints at body size; the corpus has none of those (384 labels
# over 113 canvases, all plain, and every one of those papers is 11pt -- `_work/probe88c_cd_label_corpus.py`).
# The size therefore goes out as a ratio of the page's own, which is exact at 11pt and 0.70/0.67 at
# 10/12pt, and the label's own box shrinks with it.
CD_LABEL_EM = 0.73


def cd_lines(text):
    """The rendered lines of a cell: a stacked cell keeps one entry per `gathered` line."""
    return [part.strip() for part in text.split(CD_NL) if part.strip()]

def cd_protect_stacks(body):
    r"""Hide the `\\` that breaks lines inside a stacked cell from the row splitter.

    A tikzcd row ends at `\\` and a `gathered` cell uses the same token for its own lines;
    split on it there and one cell lands on two grid rows with the arrow between the halves.
    """
    return CD_STACK.sub(lambda m: LINEBREAK.sub(CD_NL, m.group(0)), body)


# A cell's box is its ink plus the padding the matrix puts around it.  Setting every distinct cell
# line of the corpus's exchange diagrams on a pdflatex page (`_work/probe91_cd_cell_box.py`, 306
# lines at 11pt) fits the ink at 5.91 + 3.742 * characters pt against the same character count this
# function pays for -- rms 8.73pt, and no two-term model (script-size sub/superscripts, upright
# `\text` at its own advance) fits better than the single count -- while
# `_work/probe90_cd_sep_law.py` reads the padding across a column's two boxes as 9.39pt of ink gap.
# So the box is 15.30 + 3.742 * characters pt: 0.540 + 0.132 * characters cm.  The old
# 0.55 + 0.17 * characters kept the intercept and over-priced each character by a quarter, which is
# 0.57cm too wide at the median of that population.
CD_CELL_CM = (0.540, 0.132)


def cd_chars(text):
    """What `cd_width` pays for: the cell's own glyphs, with commands and grouping removed."""
    body = re.sub(r"\\[a-zA-Z@]+\*?", " ", text)
    return len(re.sub(r"[{}\\$]", "", body).strip())


def cd_width(text):
    """The centimetre width of a cell's box -- what a column separation is measured between."""
    return CD_CELL_CM[0] + CD_CELL_CM[1] * max([cd_chars(part) for part in cd_lines(text) or [""]],
                                               default=0)


def cd_height(text):
    """The centimetre height of a cell's box: a line's own box plus the pitch of every line above."""
    return CD_ROW_CM + CD_LINE_CM * max(0, len(cd_lines(text)) - 1)


def cd_label_off(label, px, py):
    r"""How far an arrow's label sits off its line, measured along that line's normal.

    A label hangs centred on the point it is given, so the offset has to carry the label's own box
    clear of the shaft: half its width where the arrow runs vertically, half its height where it
    runs horizontally.  The fixed 0.45 cm this used to be is the height term alone -- right for
    `\arrow[r,"f"]`, and on a vertical arrow it drove the line through the middle of a long label
    (`group and residue duality`, p40 of the Filtered-chromatic paper).

    The box is the label's own at the size the label prints, which is `CD_LABEL_EM` of the page: the
    gap is already read off a script-size label, so only the two half-box terms carry the ratio.
    """
    return (CD_LABEL_GAP + (cd_width(label) * CD_LABEL_EM / 2) * abs(px)
            + (CD_LABEL_H * CD_LABEL_EM / 2) * abs(py))


def cd_columns(grid, colsep):
    """The x of each column: the separation the author set, plus the two boxes it sits between."""
    ncols = max((len(row) for row in grid), default=0)
    wide = [max([cd_width(grid[r][c][0]) for r in range(len(grid))
                 if c < len(grid[r])], default=0.0) for c in range(ncols)]
    xs = [0.0]
    for c in range(1, ncols):
        xs.append(xs[-1] + colsep + (wide[c - 1] + wide[c]) / 2)
    return xs


def cd_rows(grid, rowsep):
    """The y of each row, descending: the same edge-to-edge law read down the column of boxes.

    A row is as tall as its tallest cell, so a `gathered` cell pushes the rows under it by the pitch
    it measures between its own lines.
    """
    high = [max([cd_height(cell[0]) for cell in row], default=0.0) for row in grid]
    ys = [0.0]
    for r in range(1, len(grid)):
        ys.append(ys[-1] - (rowsep + (high[r - 1] + high[r]) / 2))
    return ys


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
    # amscd's own spacing, converted into the separations build_cd lays out with: its cells keep a
    # 41.3pt ink-to-ink gap across a column whatever the cells are made of (40.80pt for one letter
    # against 41.85pt for ten) and a fixed 21.10pt centre pitch down a row (`_work/probe92_cd_amscd_sep.py`,
    # 11pt).  build_cd pays 9.39pt of box padding across a column pair and 15.45pt of one-line box
    # for a row pair, so those are the separations that reproduce the source page.
    return ("\\begin{tikzcd}[column sep=1.125cm,row sep=0.199cm]%s\\end{tikzcd}"
            % merge_arrow_rows(drawn))


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
    colsep = cd_gap(head, "column sep")
    rowsep = cd_gap(head, "row sep")
    rows = [split_top(line, "&") for line in LINEBREAK.split(cd_protect_stacks(body))]
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
            row.append((CD_STACK_ENV.sub(" ", CD_ARROW.sub(" ", cell)).strip(), parsed))
            arrows += parsed
        grid.append(row)
    xs = cd_columns(grid, colsep)
    ys = cd_rows(grid, rowsep)
    lines, maths = [], []

    def slot(tex):
        """Reserve a place for one cell or label; the diagram converts its own maths.

        tikzcd puts every cell in math mode, so a cell is just a formula, and pandoc
        maps it far better than the hand-written symbol table TikZ nodes use.
        """
        maths.append(tex)
        return "ZQCDM%03d" % (len(maths) - 1)

    def pos(r, c):
        # a row's place comes from cd_rows, which already descends; a step off the grid lands one
        # separation beyond the last row or column the diagram actually fills
        return (xs[c] if c < len(xs) else xs[-1] + colsep,
                ys[r] if r < len(ys) else ys[-1] - rowsep)

    def edge(r, c, ux, uy):
        """How far a cell's box reaches along the direction an arrow leaves it."""
        text = grid[r][c][0] if r < len(grid) and c < len(grid[r]) else ""
        return max(abs(ux) * cd_width(text) / 2, abs(uy) * cd_height(text) / 2)

    for r, row in enumerate(grid):
        for c, (text, _parsed) in enumerate(row):
            cell = cd_lines(text)
            x, y = pos(r, c)
            for i, part in enumerate(cell):
                # a stacked cell is centred on its grid point, the way tikzcd sets the group,
                # and its first line is the highest one on a page whose y grows upward
                lines.append("content(%s, [$%s$])"
                             % (fmt(x, y + ((len(cell) - 1) / 2 - i) * CD_LINE_CM), slot(part)))
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
        px, py = -uy, ux  # the left of travel on a canvas whose y grows upward: the side tikz-cd
        # puts a plain label, a `bend left` and a hook's barb on (`_work/measure48_cd_bend.py`,
        # `_work/measure48_cd_hook.py`), and the reverse of what this line used to claim
        a = (p1[0] + ux * edge(arrow["row"], arrow["col"], ux, uy),
             p1[1] + uy * edge(arrow["row"], arrow["col"], ux, uy))
        b = (p2[0] - ux * edge(arrow["row"] + step[1], arrow["col"] + step[0], ux, uy),
             p2[1] - uy * edge(arrow["row"] + step[1], arrow["col"] + step[0], ux, uy))
        curve = _bend_controls(a, b, (arrow["bend"], 1.0)) if arrow["bend"] else None
        # a label hangs off the middle of the line it labels, and for a bend that is the curve's own
        # midpoint, which tikz-cd puts at t = 0.5 of the cubic (`_work/measure48_cd_bend.py`)
        mid = _cubic_at(a, curve[0], curve[1], b, 0.5) if curve else \
            ((a[0] + b[0]) / 2, (a[1] + b[1]) / 2)
        args = cd_mark(arrow)
        if arrow["equal"]:
            for off in (0.11, -0.11):
                lines.append("line(%s, %s%s)" % (fmt(a[0] + px * off, a[1] + py * off),
                                                 fmt(b[0] + px * off, b[1] + py * off), args))
        elif curve:
            lines.append("bezier(%s, %s, %s, %s%s)" % (fmt(*a), fmt(*b), fmt(*curve[0]),
                                                       fmt(*curve[1]), args))
        else:
            lines.append("line(%s, %s%s)" % (fmt(*a), fmt(*b), args))
        if arrow["hook"]:
            lines.append("line(%s, %s)" % (fmt(*a), fmt(a[0] + px * 0.3 * arrow["hook"],
                                                        a[1] + py * 0.3 * arrow["hook"])))
        # on a bent arrow the plain label rides OUTSIDE the bulge, whichever way it bends --
        # `bend left` reads -0.199cm off the curve and `bend right` +0.200cm
        # (`_work/measure48_cd_bend.py`) -- so the bend's side multiplies the label's own
        bend_side = 1 if arrow["bend"] >= 0 else -1
        for i, label in enumerate(arrow["labels"]):
            # two labels mean both sides of the arrow, tikzcd's own convention
            side = bend_side * arrow["side"] * (1 if i == 0 else -1)
            off = side * cd_label_off(label, px, py)
            lines.append("content(%s, [#text(size: %gem)[$%s$]])"
                         % (fmt(mid[0] + px * off, mid[1] + py * off), CD_LABEL_EM, slot(label)))
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


def strip_envelope(src):
    r"""Drop the display an equation wraps a picture in, keeping the drawing itself untouched.

    The envelope only carries numbering, which the emitter reads from the source itself. Its
    brackets are matched outside the drawing alone: a `\[ ... \]` inside it is the author's own
    display maths standing in a node label, and stripping it there leaves the equation's body to
    the prose pass, which prints it escaped -- `e^ Hm_*w>2B_0.` on the gate figure's note
    (`Canonical-conformal-limits-o` p99).
    """
    out, pos = [], 0
    for m in PICTURE_ENV.finditer(src):
        out.append(MATH_ENVELOPE.sub("", src[pos:m.start()]))
        out.append(m.group(0))
        pos = m.end()
    out.append(MATH_ENVELOPE.sub("", src[pos:]))
    # the envelope's own line breaks are part of it: `\begin{equation}` on its line leaves the
    # drawing held two newlines off the front, and `build` reads a picture from its first character
    return "".join(out).strip()


def convert(src, colors=None, line_cm=None, refs=None):
    """A TikZ picture or a tikzcd diagram -> a CeTz canvas that compiles, else None."""
    core = expand_linewidth(strip_envelope(src), line_cm)
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
    core = strip_envelope(src)
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
    base = _transform(head, scope=True)
    if base is None:
        return None
    body = body[pos:]
    end = body.find("\\end{tikzpicture}")
    if end < 0:
        # a fragment cut out of a picture still starts with \begin, and the statements it kept
        # would draw as a confident partial figure; only a whole picture is a drawing
        return None
    if body[end + len("\\end{tikzpicture}"):].strip():
        # a display equation may hold the diagram and the author's own line of maths side by side.
        # A canvas is a block, so the pair cannot share one formula, and reading only the picture
        # would draw it and drop the line beside it -- what `convert` answered for the BSD diagram
        # in #70. This string is not one drawing; `split` is the route that keeps both halves.
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
    styles = picture_styles(head)
    styles.update(extra)
    # A picture-head `font=\small` is the picture's default for every node, and TikZ lets a node's
    # own `font=` (or an `every node` style) override it, so it enters as that style's fallback.
    if isinstance(head.get("font"), str) and "font" not in styles.get("every node", {}):
        styles.setdefault("every node", {})["font"] = head["font"]
    # A pen key on the picture's own brackets is pgf's scope default rather than a style anyone
    # invokes, and the corpus writes `line cap` 155 times and `line join` 77 times exactly there
    # (`_work/probe122_pen_option_face.py`); left out of the table they never reach a path.  The
    # weight joins the same three: `_work/measure91_pen_widths.py` section B puts `[line width=2pt]`
    # on the head and reads 1.993pt back off a plain path, a node's rect, a circle's frame and a
    # slanted rule, while a statement that writes a pen itself still overrules the brackets.  A name
    # is folded into a length here rather than passed through, because `resolve_opts` declines to add
    # a picture key a statement already names -- and `[line width=2pt]` on the head with `[thin]` on
    # the statement is a picture the author drew with a 0.4pt pen.  The weight is taken from
    # `every path/.style={line width=.6pt}` when the picture declares one: pgf applies that style to
    # each path without being told, and it outranks the brackets' own key --
    # `_work/measure91_every_path.py` B reads 1.993pt back for
    # `[every path/.style={line width=2pt}, line width=1pt]`, while a statement's own key (0.398) and
    # a style the statement invokes (0.797) both still beat it.  The corpus writes it 12 times over 8
    # papers and each one carries a weight and nothing else
    # (`_work/probe138_scope_style_contents.py`), so this is the width's rule, not the cap's.
    head_defaults = dict((k, head[k]) for k in ("line cap", "line join")
                         if isinstance(head.get(k), str))
    want = pen_width_pt(styles.get("every path") or head)
    if want is not None:
        head_defaults["line width"] = "%gpt" % want
    # `node distance=` on the same brackets is the same kind of thing: pgf's scope default, here the
    # gap every bare `right=of a` in the picture separates its boxes by. It joins the `picture` table
    # rather than a length of its own because it may name two axes at once (`13mm and 36mm`) and
    # `placed_at` is the one that knows which component feeds which.
    if isinstance(head.get("node distance"), str):
        head_defaults["node distance"] = head["node distance"]
    if head_defaults:
        styles["picture"] = head_defaults
    # names fills as the walk passes each statement, so a scope's `shift={(A)}` reads a node
    # the walk has already placed; every statement is still registered before any is translated
    default = arrow_default((head or {}).get(">"))
    names = {}
    placed = scoped(body, base, names, styles)
    if placed is None:
        return None
    lines = []
    for stmt, xf in placed:
        got = translate_statement(stmt, names, xf, pal, styles, default)
        if got is None:
            return None
        lines.extend(got)
    if not lines:
        return None
    return "#cetz.canvas({\n  import cetz.draw: *\n" + "\n".join("  " + l for l in lines) + "\n})"
