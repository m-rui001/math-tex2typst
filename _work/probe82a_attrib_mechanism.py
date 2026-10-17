r"""Attribute the RESIDUAL label-vs-box / ink-vs-ink collisions to an emitter construct.

The census (`_work/probe81_label_box_face.py render`) says 157 canvases / 126 papers still collide after
axis 65. Before touching the emitter each family has to be named, so this probe reads the page pair back
into the canvas source that emitted it:

  * which `content(` call carries the invading text (matched on whitespace/punctuation-stripped letters --
    a page span is the body's own prose with the spaces squeezed out by fitz),
  * whether that call carries a `frame:` (so the box invaded is its OWN declared box, not a neighbour's),
  * for ink-on-ink: whether the two spans came out of ONE body (a paragraph whose lines land on each
    other) or two calls (two nodes parked on one spot).

Nothing here is a defect claim; it is the grouping step.  Usage: python _work/probe82a_attrib_mechanism.py [N]
"""
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
HERE = os.path.join(ROOT, "_work")


def norm(s):
    return re.sub(r"[^0-9A-Za-z]", "", s)


def content_calls(block):
    """Every top-level `content(...)` call in a canvas, as (arg prefix, body, whole call)."""
    out, i = [], 0
    while True:
        j = block.find("content(", i)
        if j < 0:
            return out
        depth, k = 0, j + len("content")
        while k < len(block):
            char = block[k]
            if char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
                if not depth:
                    break
            k += 1
        call = block[j:k + 1]
        b0 = call.find("[")
        body = ""
        if b0 >= 0:
            d2, k2 = 0, b0
            while k2 < len(call):
                if call[k2] == "[":
                    d2 += 1
                elif call[k2] == "]":
                    d2 -= 1
                    if not d2:
                        break
                k2 += 1
            body = call[b0 + 1:k2]
        out.append((call[:b0], body, call))
        i = k + 1


def find_call(calls, letters):
    """The call whose body renders as this page span (longest common containment wins)."""
    best, best_len = None, -1
    for arg, body, call in calls:
        n = norm(body)
        if not n or not letters:
            continue
        if n.startswith(letters) or letters.startswith(n) or n in letters or letters in n:
            if len(n) > best_len:
                best, best_len = (arg, body, call), len(n)
    return best


def describe(arg, call):
    keys = []
    for key in ("frame:", "inset:", "width:", "height:", "anchor:", "label", "align:", "stroke:"):
        if key in call:
            keys.append(key.rstrip(":"))
    m = re.match(r"content\(\s*\(([^)]*)\)", arg or call)
    where = m.group(1).strip() if m else "?"
    return where, ",".join(keys) or "-"


def main():
    records = json.load(open(os.path.join(HERE, "label81_pairs.json"), encoding="utf-8"))
    products = {}
    for path in sorted(os.listdir(os.path.join(ROOT, "typst"))):
        p = os.path.join(ROOT, "typst", path, "main.typ")
        if os.path.exists(p):
            products[path] = open(p, encoding="utf-8", errors="replace").read()

    def blocks(stem):
        sys.path.insert(0, HERE)
        import probe81_label_box_face as g
        return g.canvas_blocks(products[stem])

    rows = []
    for stem, k, _sizes, found, both in records:
        depth = max([t[0] for t in found] + [t[0] for t in both])
        rows.append((depth, stem, k, found, both))
    rows.sort(key=lambda r: -r[0])
    limit = int(sys.argv[1]) if len(sys.argv) > 1 else 18

    tally = {}
    for depth, stem, k, found, both in rows[:limit]:
        text = products[stem]
        calls = content_calls(blocks(stem)[k])
        print("== %.1fpt  %s#%d   content calls: %d" % (depth, stem[:44], k, len(calls)))
        for tag, items, other in (("foreign", found, None), ("on-ink", both, None)):
            for t in items[:3]:
                d, _dx, _dy = t[0], t[1], t[2]
                if tag == "foreign":
                    a_txt, own_rect, box = t[3], t[4], t[5]
                    hit = find_call(calls, norm(a_txt))
                    where, keys = describe(*hit[:2]) if hit else ("?", "?")
                    print("   foreign %.1f  %r  -> content at (%s) [%s]" % (d, a_txt[:30], where, keys))
                    kind = "foreign/own-frame" if hit and "frame" in keys else "foreign"
                else:
                    d1, d2 = t[0], t[1]
                    a_txt, b_txt, box = t[3], t[4], t[5]
                    ha = find_call(calls, norm(a_txt))
                    hb = find_call(calls, norm(b_txt))
                    same = "same body" if ha and hb and ha[2] == hb[2] else (
                        "two calls" if ha and hb else "unmatched")
                    where, keys = describe(*ha[:2]) if ha else ("?", "?")
                    print("   on-ink  %.1f  %r x %r  -> %s at (%s) [%s]"
                          % (d, a_txt[:20], b_txt[:20], same, where, keys))
                    kind = "on-ink/" + same
                tally[kind] = tally.get(kind, 0) + 1
    print("\ntally over the worst %d canvases:" % limit)
    for kind, n in sorted(tally.items(), key=lambda x: -x[1]):
        print("  %-22s %d" % (kind, n))
    return 0


if __name__ == "__main__":
    sys.exit(main())
