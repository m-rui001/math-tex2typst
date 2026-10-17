r"""Build the loop law's OLD shape into `_work/old98/t2t_old98` so a stub diff has a base.

Copies `tools/t2t` verbatim, then puts the four hunks #98 changed back to what they were, asserting
each replacement lands exactly once.  Nothing else in the copy differs, so the diff the census prints
is the round's改动面 and not somebody else's.

  python _work/probe98_make_stub.py
"""
import os
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, "tools", "t2t")
DST = os.path.join(ROOT, "_work", "old98", "t2t_old98")

OLD_RING = r'''def _ring_at(names, a, b):
    """The border ring of the node a path leaves and comes back to, or None.

    Only a loop answers to this, and only a round node carries a ring at all: the coordinate token
    has long been consumed by the time the curve is built, so the ring is read back off the name
    registered at that very centre.
    """
    if a != b:
        return None
    for rec in (names or {}).values():
        if len(rec) > 4 and rec[4] is not None and (rec[0], rec[1]) == a:
            return rec[4]
    return None


def _ring_endpoints(a, b, angles, ring):
    """A loop's endpoints, carried off the centre and onto the ring it leaves and returns on.

    TikZ takes a `to` whose two ends name the same node from that node's border: the anchors are the
    ring's points under the two tangent directions, and the chord, controls and head all follow from
    them (`_work/pic-shapes/measure_loop.py` reads a loop on an 8mm circle leaving at
    (-0.2878, 0.2878) and arriving at (0.2878, 0.2878) about its centre).
    """
    return tuple((at[0] + math.cos(math.radians(ang)) * ring,
                  at[1] + math.sin(math.radians(ang)) * ring)
                 for at, ang in zip((a, b), _tangent_dirs(angles)))
'''

NEW_RING = r'''def _tangent_endpoints(box, a, b, angles):
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
'''

OLD_CONST = r'''# the page direction a `to` with no `out=` leaves along, and one with no `in=` arrives along
TANGENT_FALLBACK = (45.0, 135.0)
'''

NEW_CONST = r'''# the page direction a `to` with no `out=` leaves along, and one with no `in=` arrives along
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
'''

OLD_CONTROLS_HEAD = r'''def _tangent_controls(a, b, angles, loose=1.0):'''
NEW_CONTROLS_HEAD = r'''def _tangent_controls(a, b, angles, loose=1.0, min_off=0.0):'''

OLD_CONTROLS_TAIL = r'''    anchors, centres and round nodes of four different sizes alike.
    """
    dx, dy = b[0] - a[0], b[1] - a[1]
    length = math.hypot(dx, dy)
    if length == 0:
        return None
    off = length * 0.39 * loose
'''
NEW_CONTROLS_TAIL = r'''    anchors, centres and round nodes of four different sizes alike.
    `min_off` floors that length at an absolute page measure, which is the only way a loop, whose
    chord is zero, gets controls at all; with no floor and no chord there is nothing to place and
    the statement has no ink to give (`_work/pic-shapes/measure_loop.py` reads a bare coordinate
    `to[loop above]` sitting 0.5cm out on each tangent).
    """
    dx, dy = b[0] - a[0], b[1] - a[1]
    off = max(math.hypot(dx, dy) * 0.39 * loose, min_off)
    if off == 0:
        return None
'''

OLD_READER = r'''                angles = [None, None]
                loose = 1.0
                bent = None
'''
NEW_READER = r'''                angles = [None, None]
                loose = None
                min_off = 0.0
                loop = None
                bent = None
'''

OLD_READER_TAIL = r'''                    got = re.fullmatch(r"looseness\s*=\s*([-+]?\d*\.?\d+)", flat)
                    if got:
                        loose = float(got.group(1))
                # `looseness` counts wherever it is written, before or after the key it scales
                if bent is not None:
                    bend = (bent, loose)
                if any(a is not None for a in angles):
                    tangent = (tuple(angles), loose)
'''
NEW_READER_TAIL = r'''                    got = re.fullmatch(r"looseness\s*=\s*([-+]?\d*\.?\d+)", flat)
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
'''

OLD_WALK = r'''                elif tangent is not None:
                    ring = _ring_at(names, start, p)
                    if ring is not None:
                        start, p = _ring_endpoints(start, p, tangent[0], ring)
                    curve = _tangent_controls(start, p, *tangent)
'''
NEW_WALK = r'''                elif tangent is not None:
                    start, p = _tangent_endpoints(box_p, start, p, tangent[0])
                    curve = _tangent_controls(start, p, *tangent)
'''

HUNKS = [(NEW_RING, OLD_RING), (NEW_CONST, OLD_CONST),
         (NEW_CONTROLS_HEAD, OLD_CONTROLS_HEAD), (NEW_CONTROLS_TAIL, OLD_CONTROLS_TAIL),
         (NEW_READER, OLD_READER), (NEW_READER_TAIL, OLD_READER_TAIL),
         (NEW_WALK, OLD_WALK)]


def main():
    if os.path.isdir(os.path.join(ROOT, "_work", "old98")):
        shutil.rmtree(os.path.join(ROOT, "_work", "old98"))
    os.makedirs(os.path.dirname(DST))
    shutil.copytree(SRC, DST)
    path = os.path.join(DST, "cetz.py")
    text = open(path, encoding="utf-8", newline="").read()
    for new, old in HUNKS:
        crlf = "\r\n" in text
        a, b = (new.replace("\n", "\r\n"), old.replace("\n", "\r\n")) if crlf else (new, old)
        if text.count(a) != 1:
            sys.exit("stub: %s matches %d times, expected 1" % (a.splitlines()[0][:60], text.count(a)))
        text = text.replace(a, b)
    open(path, "w", encoding="utf-8", newline="").write(text)
    print("stub written: %s" % path)


if __name__ == "__main__":
    main()
