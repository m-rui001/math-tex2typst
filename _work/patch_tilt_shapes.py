"""Stage 3 of the tilt: the shapes that cannot survive a turned plane as they stand.

A rectangle is emitted from two opposite corners, which under a rotation are no longer opposite
corners of the figure -- so the corners are taken back through the matrix and mapped again one by
one. An arc keeps its radius and turns its angles. An ellipse and a grid cannot be turned in CeTz
at all, so they refuse. Node text follows the plane by Typst's own rotate().
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
PATH = pathlib.Path(__file__).resolve().parents[1] / "tools" / "t2t" / "cetz.py"
TEXT = PATH.read_text(encoding="utf-8")

EDITS = [
    ('def _origin(xf):\n    return (xf[4], xf[5])\n',
     'def _origin(xf):\n    return (xf[4], xf[5])\n'
     '\n'
     '\n'
     'def _unmap(xf, at):\n'
     '    """cm on the page -> the scope\'s own coordinates; None when the axes have collapsed."""\n'
     '    a, b, c, d, dx, dy = xf\n'
     '    det = a * d - b * c\n'
     '    if abs(det) < 1e-9:\n'
     '        return None\n'
     '    x, y = at[0] - dx, at[1] - dy\n'
     '    return ((d * x - b * y) / det, (a * y - c * x) / det)\n'
     '\n'
     '\n'
     'def _turns(xf):\n'
     '    """True when the plane is turned: a rectangle\'s two corners are then not its corners."""\n'
     '    return bool(xf[1] or xf[2])\n'
     '\n'
     '\n'
     'def _spins(xf):\n'
     '    """True when the turn is a rotation with a uniform scale, the only tilt an arc survives."""\n'
     '    a, b, c, d, _dx, _dy = xf\n'
     '    return abs(a - d) < 1e-12 and abs(b + c) < 1e-12\n'),

    ('            elif rect_from is not None:\n'
     '                tail = _style(fill, sa)\n'
     '                items.append(("raw", "rect(%s, %s%s)" % (fmt(*rect_from), fmt(*p), tail)))\n'
     '                rect_from = None',
     '            elif rect_from is not None:\n'
     '                tail = _style(fill, sa)\n'
     '                if _turns(xf):\n'
     '                    lo, hi = _unmap(xf, rect_from), _unmap(xf, p)\n'
     '                    if lo is None or hi is None:\n'
     '                        return None\n'
     '                    corners = [_apply(xf, x, y) for x, y in\n'
     '                               ((lo[0], lo[1]), (hi[0], lo[1]),\n'
     '                                (hi[0], hi[1]), (lo[0], hi[1]))]\n'
     '                    items.append(("raw", "line(%s, close: true%s)"\n'
     '                                  % (", ".join(fmt(*c) for c in corners), tail)))\n'
     '                else:\n'
     '                    items.append(("raw", "rect(%s, %s%s)"\n'
     '                                  % (fmt(*rect_from), fmt(*p), tail)))\n'
     '                rect_from = None'),

    ('            a, b, srx, sry, user, end = spec\n'
     '            rx, ry = _apply_size((srx, sry, user), xf)\n',
     '            a, b, srx, sry, user, end = spec\n'
     '            if _turns(xf) and not _spins(xf):\n'
     '                return None\n'
     '            a, b = a + _slant(xf), b + _slant(xf)\n'
     '            rx, ry = _apply_size((srx, sry, user), xf)\n'),

    ('            rx, ry = _apply_size(spec, xf)\n',
     '            rx, ry = _apply_size(spec, xf)\n'
     '            if _turns(xf) and ry is not None and abs(rx - ry) > 1e-12:\n'
     '                return None  # an ellipse has no turned form to emit\n'),

    ('    sx, sy = _grid_step(o, "xstep", xf), _grid_step(o, "ystep", xf)',
     '    if _turns(xf):\n'
     '        return None\n'
     '    sx, sy = _grid_step(o, "xstep", xf), _grid_step(o, "ystep", xf)'),

    ('def emit_node(at, inner, o, pal=None, box=None):',
     'def emit_node(at, inner, o, pal=None, box=None, angle=0.0):'),

    ('    text = node_text(inner)\n',
     '    text = node_text(inner)\n'
     '    if text and angle:\n'
     '        # Typst measures rotate() clockwise on the page, TikZ and CeTz counter-clockwise\n'
     '        text = "rotate(%.4gdeg)[%s]" % (-angle, text)\n'),

    ('                for line in emit_node(fmt(*anchor), inner,\n'
     '                                      opts(m.group(1)[1:-1]) if m.group(1) else {}, pal):',
     '                for line in emit_node(fmt(*anchor), inner,\n'
     '                                      opts(m.group(1)[1:-1]) if m.group(1) else {},\n'
     '                                      pal, angle=_slant(xf)):'),

    ('return emit_node(fmt(*at), inner, o, pal, box)',
     'return emit_node(fmt(*at), inner, o, pal, box, _slant(xf))'),
]

for old, new in EDITS:
    n = TEXT.count(old)
    if n != 1:
        raise SystemExit("expected one match, found %d for:\n%s" % (n, old[:90]))
    TEXT = TEXT.replace(old, new)
PATH.write_text(TEXT, encoding="utf-8")
print("stage 3 written")
