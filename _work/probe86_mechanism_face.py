"""Classify the 15 on-ink canvases by the source statement that put the two spans where they are.

Inputs are already measured: probe85b's face (census x control, depth >3pt) says WHICH canvas, and
`control85b_rows.json` carries the picture index (`pic`) that probe84 matched to it, so this only
reads the author's own statements and tags them.

Tags are spellings found in that picture, not guesses about the emitter:
  of-place   `right=of a` / `below left=1cm and 2cm of b`  -- TikZ steps edge to edge, we go centre to centre
  path-node  `-- node[above] {...}`                        -- a label whose home is a line, not a point
  label-key  `label=...:` / `node[...$...$]` on a node
  rotated    `rotate=` / `sloped`
  multiline  a `\\` inside a node's text
A canvas with no tag is either an explicit-coordinate collision (the author drew it that way and the
control disagrees for another reason) or a tag this list does not know yet -- report it, do not force it.
"""
import io
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
import probe85b_emitter_face as face_mod  # noqa: E402

OF = re.compile(r"(right|left|above|below)(\s+and)?\s*(=\s*)?[^;]{0,24}?\bof\b")
PATHNODE = re.compile(r"\\node\s*(\[[^\]]*\])?\s*\{", re.I)
ONPATH = re.compile(r"--\s*node|-\*[a-z]+\s*node|edge\s+node", re.I)
LABELKEY = re.compile(r"\blabel\s*=")
ROT = re.compile(r"\brotate\s*=|\bsloped\b")
MULTI = re.compile(r"\$\{0,1}\s*\\\\\s*\[?[0-9.]*(pt|cm|mm)?\]?")


def pictures(stem):
    path = os.path.join(ROOT, "_work", "flat", stem + ".tex")
    if not os.path.exists(path):
        hits = [p for p in os.listdir(os.path.join(ROOT, "_work", "flat"))
                if p.startswith(stem[:40])]
        if not hits:
            return None
        path = os.path.join(ROOT, "_work", "flat", hits[0])
    text = io.open(path, encoding="utf-8", errors="replace").read()
    return [m.group(0) for m in re.finditer(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", text, re.S)]


def tags(body):
    out = []
    if OF.search(body):
        out.append("of-place")
    if ONPATH.search(body) or PATHNODE.search(body):
        out.append("path-node")
    if LABELKEY.search(body):
        out.append("label-key")
    if ROT.search(body):
        out.append("rotated")
    if MULTI.search(body):
        out.append("multiline")
    return out or ["none"]


def statements(body, needle):
    """the source lines whose letters, in order, can carry this printed run"""
    letters = re.findall(r"[A-Za-z]{2,}", needle)
    if not letters:
        return []
    want = letters[0][:5]
    return [l.strip()[:150] for l in body.split("\n") if want in l][:3]


LINE = re.compile(r"\\node|\\draw|\\path|\\begin\{scope\}|\\\\|rotate")


def dump(depth=3.0):
    """every statement line of the matched picture -- the tags alone do not say who moved"""
    by = {}
    for stem, k, d, t1, t2 in face_mod.face(depth=depth)["onink"]:
        by.setdefault((stem, k), []).append((d, t1, t2))
    ctl = {(r["stem"], r["k"]): r for r in face_mod.load("control85b_rows.json")}
    for (stem, k), pairs in sorted(by.items()):
        pics = pictures(stem)
        pic = (ctl.get((stem, k)) or {}).get("pic")
        print("===== %s#%d  pic %s  worst %.2f" % (stem[:46], k, pic, max(p[0] for p in pairs)))
        if not pics or pic is None or pic >= len(pics):
            print("   NO SOURCE PICTURE")
            continue
        for line in pics[pic].split("\n"):
            if LINE.search(line.strip()):
                print("   ", line.strip()[:165])


def main(depth=3.0):
    rows = face_mod.face(depth=depth)["onink"]
    ctl = {(r["stem"], r["k"]): r for r in face_mod.load("control85b_rows.json")}
    by = {}
    for stem, k, d, t1, t2 in rows:
        by.setdefault((stem, k), []).append((d, t1, t2))
    for (stem, k), pairs in sorted(by.items()):
        c = ctl.get((stem, k)) or {}
        pics = pictures(stem)
        pic = c.get("pic")
        if not pics or pic is None or pic >= len(pics):
            print("%s#%d  NO SOURCE PICTURE (pic=%s of %s)" % (stem[:52], k, pic, len(pics or [])))
            continue
        body = pics[pic]
        print("%s#%d  pic %d  %s  pairs=%d  worst=%.2f"
              % (stem[:52], k, pic, "/".join(tags(body)), len(pairs), max(p[0] for p in pairs)))
        for d, t1, t2 in sorted(pairs, reverse=True)[:2]:
            for s in statements(body, t1) + statements(body, t2):
                print("      %.2f  %-24r %-24r | %s" % (d, t1[:22], t2[:22], s))


if __name__ == "__main__":
    args = [a for a in sys.argv[1:] if a != "dump"]
    depth = float(args[0]) if args else 3.0
    (dump if "dump" in sys.argv else main)(depth)
