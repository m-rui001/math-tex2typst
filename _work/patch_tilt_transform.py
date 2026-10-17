"""Stage 2 of the tilt: _transform builds a real 2x2 matrix, _compose multiplies.

Behaviour for the axis-aligned options is unchanged by construction -- a diagonal matrix reads back
as the old (sx, sy, dx, dy) at every consumer.
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
PATH = pathlib.Path(__file__).resolve().parents[1] / "tools" / "t2t" / "cetz.py"
TEXT = PATH.read_text(encoding="utf-8")

OLD_T = '''def _transform(o, outer=IDENT):
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
    return sx, sy, dx, dy'''

NEW_T = '''ROTATE = re.compile(r"^\\s*\\{?\\s*(-?[\\d.]+)\\s*(?:deg)?\\s*"
                    r"(?:[:(=]\\s*\\(?\\s*(-?[\\d.]+)\\s*,\\s*(-?[\\d.]+)\\s*\\)?\\s*)?\\}?\\s*$")


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


def _transform(o, outer=IDENT):
    """Options that move the coordinate system -> the affine transform; None if one is unreadable.

    Measured against pdflatex: 'shift' counts user units of the *enclosing* axes (so it is taken
    through outer's matrix), while 'xshift' and the axis lengths are absolute dimensions and 'scale'
    a factor. 'rotate' turns the plane and 'x={(a,b)}' writes the image of a unit axis directly, so
    both become the matrix's columns; a slant or a bare 'cm=' is a matrix we do not read and refuses.
    'transform shape' only says nodes inherit the tilt, which is drawn by rotating the text.
    """
    sx = sy = 1.0
    ox = oy = 0.0
    dx = dy = 0.0
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
            sx, ox, oy, sy = (ca * sx - sa * oy, sa * sx + ca * oy,
                              ca * ox - sa * sy, sa * ox + ca * sy)
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
                sx, ox, oy, sy = d * sx, d * ox, d * oy, d * sy
            elif key == "xscale":
                sx, ox = d * sx, d * ox
            elif key == "yscale":
                oy, sy = d * oy, d * sy
            elif key == "xshift":
                dx += d
            else:
                dy += d
        elif key in AXES:
            pair = _basis_pair(val)
            if pair is None:
                return None
            if len(pair) == 1:
                pair = (pair[0], 0.0) if key == "x" else (0.0, pair[0])
            if key == "x":
                sx, ox = pair
            else:
                oy, sy = pair
    return (sx, oy, ox, sy, dx, dy)'''

OLD_C = '''def _compose(outer, inner):
    """Combine two transforms: scales multiply, translations add.

    TikZ reads an 'xshift' as a real length regardless of the enclosing axis
    scales (measured against pdflatex), so a scope's shift is already absolute.
    """
    sx1, sy1, dx1, dy1 = outer
    sx2, sy2, dx2, dy2 = inner
    return (sx1 * sx2, sy1 * sy2, dx1 + dx2, dy1 + dy2)'''

NEW_C = '''def _compose(outer, inner):
    """Combine two transforms: the matrices multiply, the translations add.

    TikZ reads an 'xshift' as a real length regardless of the enclosing axis scales (measured
    against pdflatex), so a scope's own shift arrives already in cm and is not transformed again.
    """
    oa, ob, oc, od, odx, ody = outer
    ia, ib, ic, id_, idx, idy = inner
    return (oa * ia + ob * ic, oa * ib + ob * id_,
            oc * ia + od * ic, oc * ib + od * id_,
            idx + odx, idy + ody)'''

for old, new in ((OLD_T, NEW_T), (OLD_C, NEW_C)):
    if TEXT.count(old) != 1:
        raise SystemExit("anchor not found exactly once:\n%s" % old[:80])
    TEXT = TEXT.replace(old, new)

TEXT = TEXT.replace('    """Collect (statement, transform) pairs; False if a scope tilts the plane."""',
                    '    """Collect (statement, transform) pairs; False on a scope we cannot read."""')
# TILTS was the refusal list; rotate and the axis basis are read now, and the three that remain
# refuse by name inside _transform, so the tuple would be dead weight
if 'TILTS = ("rotate", "rotate around", "xslant", "yslant", "transform shape", "cm")\n' not in TEXT:
    raise SystemExit("TILTS line not found")
TEXT = TEXT.replace('TILTS = ("rotate", "rotate around", "xslant", "yslant", "transform shape", "cm")\n', "")
PATH.write_text(TEXT, encoding="utf-8")
print("stage 2 written")
