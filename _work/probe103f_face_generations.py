# -*- coding: utf-8 -*-
"""Attribute the movement of the collision face between two generations.

run151's flagged-canvas list (`_work/label81_pairs_run151.json`) and run152's
(`_work/label81_pairs.json`) come from the SAME gauge (`probe81_label_box_face.py render`);
what differs is the products underneath it.  #103 moved every anchored label by its
`inner sep` (~3.3pt), so the face must not be quoted as one number: which canvases left,
which arrived, and whether each pair is foreign-ink or ink-on-ink is read here, and the
arrivals are the ones that need an explanation before anyone says "fewer collisions".
"""
import io
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OLD = os.path.join(HERE, "label81_pairs_run151.json")
NEW = os.path.join(HERE, "label81_pairs.json")
OUT = os.path.join(HERE, "label103f_face_generations.txt")


def index(path):
    """(stem, canvas) -> the pair tallies probe81 wrote for it."""
    rows = {}
    for stem, k, _counts, foreign, onink in json.load(io.open(path, encoding="utf-8")):
        rows[(stem, k)] = (foreign, onink)
    return rows


def kinds(foreign, onink):
    return len(foreign), len(onink)


def main():
    sys.stdout.reconfigure(errors="replace")
    old, new = index(OLD), index(NEW)
    gone = sorted(set(old) - set(new))
    arrived = sorted(set(new) - set(old))
    shared = sorted(set(old) & set(new))
    lines = ["collision face, same gauge, two generations of products",
             "run151 canvases %d   run152 canvases %d" % (len(old), len(new)),
             "pairs  run151 foreign %d on-ink %d   run152 foreign %d on-ink %d"
             % (sum(len(v[0]) for v in old.values()), sum(len(v[1]) for v in old.values()),
                sum(len(v[0]) for v in new.values()), sum(len(v[1]) for v in new.values())),
             ""]
    moved = [(k, old[k], new[k]) for k in shared if kinds(*old[k]) != kinds(*new[k])]
    lines.append("-- canvases on both sides whose pair tally changed: %d --" % len(moved))
    for k, (of, oo), (nf, no) in moved:
        lines.append("   %-44s#%-2d  foreign %d->%d   on-ink %d->%d"
                     % (k[0][:44], k[1], len(of), len(nf), len(oo), len(no)))
    lines.append("")
    lines.append("-- left the face (%d): what they carried last generation --" % len(gone))
    for k in gone:
        f, o = old[k]
        lines.append("   %-44s#%-2d  foreign %d on-ink %d   %s"
                     % (k[0][:44], k[1], len(f), len(o),
                        " | ".join((p[3][:26] if len(p) > 3 else "?") for p in (f + o)[:3])))
    lines.append("")
    lines.append("-- arrived on the face (%d): what they carry now --" % len(arrived))
    for k in arrived:
        f, o = new[k]
        who = ["F %.2fpt %s" % (p[0], str(p[3])[:26]) for p in f[:3]]
        who += ["O %.2fpt %s" % (p[0], str(p[3])[:26]) for p in o[:3]]
        lines.append("   %-44s#%-2d  foreign %d on-ink %d   %s"
                     % (k[0][:44], k[1], len(f), len(o), " | ".join(who[:4])))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
