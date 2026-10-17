"""Move every consumer of the old (sx, sy, dx, dy) onto the matrix accessors.

Each replacement must match exactly once, so a silent miss is a crash rather than a wrong figure.
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
PATH = pathlib.Path(__file__).resolve().parents[1] / "tools" / "t2t" / "cetz.py"
TEXT = PATH.read_text(encoding="utf-8")

EDITS = [
    ("    return val * xf[0] if user else val",
     "    return val * _ux(xf) if user else val"),
    ("    sx, sy, dx, dy = xf\n"
     "    if relative:\n"
     "        if cursor is None:\n"
     "            return None\n"
     "        return (cursor[0] + got[0] * sx, cursor[1] + got[1] * sy)\n"
     "    return (got[0] * sx + dx, got[1] * sy + dy)",
     "    if relative:\n"
     "        if cursor is None:\n"
     "            return None\n"
     "        vx, vy = _delta(xf, got[0], got[1])\n"
     "        return (cursor[0] + vx, cursor[1] + vy)\n"
     "    return _apply(xf, got[0], got[1])"),
    ("    return (at[0] + sign * off[0] * xf[0], at[1] + sign * off[1] * xf[1])",
     "    vx, vy = _delta(xf, off[0], off[1])\n"
     "    return (at[0] + sign * vx, at[1] + sign * vy)"),
    ("    return (rx * xf[0], ry * xf[1]) if user else (rx, ry)",
     "    return (rx * _ux(xf), ry * _uy(xf)) if user else (rx, ry)"),
    ("        return name, (xf[2], xf[3]), rest",
     "        return name, _origin(xf), rest"),
    ('    return got[0] * xf[1 if key == "ystep" else 0] if got[1] else got[0]',
     '    scale = _uy(xf) if key == "ystep" else _ux(xf)\n'
     "    return got[0] * scale if got[1] else got[0]"),
    ("        anchor = xf[2 + axis]",
     "        anchor = _origin(xf)[axis]"),
]

for old, new in EDITS:
    n = TEXT.count(old)
    if n != 1:
        raise SystemExit("expected one match, found %d for:\n%s" % (n, old[:70]))
    TEXT = TEXT.replace(old, new)
PATH.write_text(TEXT, encoding="utf-8")
print("consumers moved: %d" % len(EDITS))
