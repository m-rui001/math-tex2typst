"""#103 face: which shipped `content(...)` nodes hang off an anchor with no `padding:`.

`emit_node`'s unframed branch only gives CeTz the node's `inner sep` as `padding:` when the node is
also turned (`cetz.py:3228`, `if side and width is None and rot`), so an `anchor:` on a plain label
pins Typst's INK edge on the point where pgf pins the edge of the box that is ink + 2*sep.  The face
here is read off the products, because that is what a page already carries: every `content(` whose
arguments name an `anchor:` and carry neither `padding:` nor a `#box(width:` (the framed/measured
branches bring their sep as `inset:`) is a node this law would move.

The third column matters more than the count: a node pinned at its CENTRE moves nothing under a
symmetric pad, so only the ones with a side anchor are the law's, and among those the ones whose
body is a `#text(size: Xpt)` are also priced at the wrong em tier (tier ①).
"""
import io
import os
import re
import sys

ROOT = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "typst")
CONTENT = re.compile(r"content\(")
ANCHOR = re.compile(r'anchor: "([a-z]+)"')
TEXTSIZE = re.compile(r"#text\(size: ([\d.]+)pt\)")


def call_end(text, open_paren):
    """Index just past the close paren matching the one at `open_paren`."""
    depth = 0
    for i in range(open_paren, len(text)):
        if text[i] == "(":
            depth += 1
        elif text[i] == ")":
            depth -= 1
            if depth == 0:
                return i + 1
    return len(text)


def main():
    sites = []
    canvases = set()
    papers = set()
    tiers = {}
    for stem in sorted(os.listdir(ROOT)):
        path = os.path.join(ROOT, stem, "main.typ")
        if not os.path.isfile(path):
            continue
        text = io.open(path, encoding="utf-8", errors="replace").read()
        canvas_at = [m.start() for m in re.finditer(r"#cetz\.canvas", text)]
        for m in CONTENT.finditer(text):
            end = call_end(text, m.end() - 1)
            body = text[m.end() - 1:end]
            side = ANCHOR.search(body)
            if not side:
                continue
            if "padding:" in body or "#box(width:" in body:
                continue
            which = max((i for i, c in enumerate(canvas_at) if c < m.start()), key=lambda i: canvas_at[i], default=None)
            key = "%s#%s" % (stem, which) if which is not None else stem
            size = TEXTSIZE.search(body)
            tier = size.group(1) + "pt" if size else "body"
            sites.append((key, side.group(1), tier, body[:60].replace("\n", " ")))
            canvases.add(key)
            papers.add(stem)
            tiers[tier] = tiers.get(tier, 0) + 1
    out = ["content(...) with an anchor and no padding: %d sites" % len(sites),
           "canvases: %d   papers: %d" % (len(canvases), len(papers)),
           "by text-size tier: %s" % sorted(tiers.items(), key=lambda t: -t[1]),
           "", "side anchors used: %s" % sorted({s[1] for s in sites}),
           "centre-only anchors (a symmetric pad moves nothing): %s"
           % sorted({s[1] for s in sites if s[1] == "centre"}),
           "", "first 25:"]
    out += ["  %-58s %-7s %-8s %s" % (s[0][:58], s[1], s[2], s[3]) for s in sites[:25]]
    text = "\n".join(out) + "\n"
    io.open(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                         "label103a_anchor_pad_face.txt"), "w", encoding="utf-8").write(text)
    sys.stdout.write(text)


if __name__ == "__main__":
    main()
