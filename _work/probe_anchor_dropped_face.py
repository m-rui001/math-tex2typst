r"""How many framed nodes lose the `anchor=` the author wrote, and which papers they are in.

`_node_anchor`'s docstring says a framed node is not moved because "one whose frame hugs the text
cannot be moved by half a height we never measure" -- but CeTz's own `anchor:` moves the LAID-OUT body
(`_work/measure_node_anchor_north.py`: north/south/east/north-east all land on pgf's rectangle to
0.2bp), so the reason has expired.  This counts the nodes that still lose it.

The face is taken on the batch basis, per node, by wrapping `emit_node`: the anchor the option table
asks for against the `anchor:` the emitted lines carry.  A keyword census over `_work/flat` would miss
anchors that arrive through `above=20pt` or an `/.style`.  `build` and not `convert`, because `convert`
pays a typst compile for every canvas and a compile cannot see an anchor.

`emit_node` returns the node's own lines plus its `label=` lines, and a label line carries an anchor of
its own (`label_lines`), so the two are split by wrapping `label_lines` too -- otherwise a node whose
frame lost its anchor reads as carried by its label.
"""
import glob
import os
import re
import sys
from collections import Counter

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz as cetzmod  # noqa: E402

CARRIED = re.compile(r'anchor: "')
RANGE = re.compile(r'^content\(\([^)]*,[^)]*,[^)]*,[^)]*\)')


def form(lines):
    if not lines:
        return "nothing"
    ln = lines[0]
    if ln.startswith("circle("):
        return "dot"
    if "#box(" in ln:
        return "cetz-range" if RANGE.match(ln) else "typst-box"
    return "cetz-range" if RANGE.match(ln) else "point"


def main():
    lost, kept, canvases, papers, unbuilt = Counter(), Counter(), 0, set(), 0
    examples = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        body = prep.scale_linewidth_in_minipages(body)
        body = prep.unwrap_boxes(body)
        pics = convert.TIKZ_SPAN.findall(body)
        if not pics:
            continue
        scopes = convert.picture_scopes(body, p.macros)
        for i, pic in enumerate(pics):
            table, decls = scopes[i]
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, table)
            asked = []
            real, reall = cetzmod.emit_node, cetzmod.label_lines
            labels = [0]

            def spy(*args, **kw):
                o = args[2] if len(args) > 2 else kw.get("o")
                side = cetzmod._node_anchor(o)
                got = real(*args, **kw)
                own = got[:len(got) - labels[0]] if got else got
                asked.append((side, own, bool(own) and any(CARRIED.search(l) for l in own)))
                return got

            def lspwy(*args, **kw):
                out = reall(*args, **kw)
                labels[0] = len(out or [])
                return out

            cetzmod.emit_node, cetzmod.label_lines = spy, lspwy
            try:
                canvas = cetzmod.build(cetzmod.strip_envelope(pic), p.colors, convert.line_cm(p))
            finally:
                cetzmod.emit_node, cetzmod.label_lines = real, reall
            if canvas is None:
                unbuilt += 1
                continue
            bad = [(s, g) for s, g, c in asked if s and not c]
            for s, g, c in asked:
                if not s:
                    continue
                (kept if c else lost)[form(g)] += 1
                if not c and len(examples.get(form(g), [])) < 2:
                    examples.setdefault(form(g), []).append(
                        (s, stem[:38], i, g[0][:130] if g else ""))
            if not bad:
                continue
            canvases += 1
            papers.add(stem)
    print("carried: %s  total %d" % (dict(kept), sum(kept.values())))
    print("LOST:    %s  total %d in %d canvases / %d papers"
          % (dict(lost), sum(lost.values()), canvases, len(papers)))
    for f, ex in sorted(examples.items()):
        for s, stem, i, ln in ex:
            print("  %-11s %s p%d: %s\n      %s" % (f, stem, i, s, ln))
    print("canvases that do not build (not counted): %d" % unbuilt)
    print("papers: %s" % ", ".join(sorted(s[:34] for s in papers)))


if __name__ == "__main__":
    main()
