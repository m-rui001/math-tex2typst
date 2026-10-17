r"""#45 census: how many anchored nodes carry a maths body, and which tall constructs they use.

`_work/measure69_bottom_edge.py`'s anchor-law block reads `$\frac{a}{b}$` at y0=-8.65 y1=+10.29 for
`anchor=south`, `anchor=north` and no anchor alike -- the anchor is ignored whole, while `$x_i^2$` and
`Abg` both obey it (south -19.39/-0.00, north +0.00/+19.39).  Before deciding whether that is worth a
round, count it: the discipline is to census the spelling in the corpus first, never to write a mapping
for a shape nobody uses.

The face is taken on the batch basis per node by wrapping `emit_node` (the instrument
`_work/probe_anchor_dropped_face.py` introduced, corrected here to `convert.lifted_pictures` plus the
figure's own macros, declarations and `\linewidth` axis -- that probe indexes `picture_scopes` by a
`TIKZ_SPAN.findall` position, which is off by every picture held back inside a display and raises
IndexError on the papers that have one), because a keyword census over `_work/flat` misses anchors that
arrive through `above=20pt` or an `/.style`.  `build` and not `convert`: a compile cannot see an
anchor, and `convert` pays one per canvas.

Classification is by construct, not by a guess at "tall": the classes are the ones the gauge can be
pointed at next, so the census says which class to measure rather than which class is broken.  Nodes
whose anchor is NOT carried are counted separately -- for those the code path never runs, so they are
not #45's face whatever their body looks like.

**Every zero a classifier reports has to be fed the spelling it was written for first**
(`_work/check45_classifier.py`): the `limits` pattern ended in `\b`, and `_` is a word character, so
`\sum_{k=1}^{n}` had no boundary to match and the class reported 0 nodes -- an instrument that reads
zero for the one shape it exists to count.  `(?![A-Za-z])` is the guard that works before `_`.
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

# Order matters only for reporting: a body is filed under every construct it holds.
CLASSES = [
    ("frac", re.compile(r"\\[dtc]?frac\b")),
    ("binom", re.compile(r"\\[dtc]?binom\b")),
    ("sqrt", re.compile(r"\\sqrt\b")),
    ("limits", re.compile(r"\\(?:sum|prod|int|oint|bigcup|bigcap|coprod|bigvee|bigwedge|max|lim|sup|inf)"
                          r"(?![A-Za-z])(?:\s*_|[^\\]|\\[A-Za-z]+)*?(?:_\{|_\\?|\^\{|\^\\?)")),
    ("stackrel", re.compile(r"\\(?:overset|underset|stackrel|overbrace|underbrace|overline|underline|"
                            r"widehat|widetilde|overrightarrow)\b")),
    ("matrix", re.compile(r"\\begin\{(?:[pbvB]?matrix|smallmatrix|array|cases|aligned|gathered|split)\}")),
    ("rowbreak", re.compile(r"\\\\")),
    ("leftright", re.compile(r"\\left[^a-zA-Z]|\\right[^a-zA-Z]")),
]


def form(lines):
    if not lines:
        return "nothing"
    ln = lines[0]
    if ln.startswith("circle("):
        return "dot"
    if "#box(" in ln:
        return "cetz-range" if RANGE.match(ln) else "typst-box"
    return "cetz-range" if RANGE.match(ln) else "point"


def classify(body):
    hits = [name for name, rx in CLASSES if rx.search(body)]
    return hits or ["plain"]


def main():
    carried = Counter()          # class -> nodes whose anchor reached the product
    carried_form = Counter()     # (class, form) for the same
    not_carried = Counter()      # class -> anchor asked but absent from the lines (a different defect)
    prose = Counter()            # non-maths bodies, for the ratio
    papers = {}                  # class -> set of stems
    canvases = set()
    unbuilt = 0
    examples = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        body = prep.scale_linewidth_in_minipages(body)
        body = prep.unwrap_boxes(body)
        pics = convert.lifted_pictures(body)
        if not pics:
            continue
        scopes = convert.picture_scopes(body, p.macros)
        axis = convert.line_cm(p)
        for i, m in enumerate(pics):
            pic = m.group(0)
            table, decls = scopes[i]
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, table)
            core = cetzmod.expand_linewidth(cetzmod.strip_envelope(pic), axis)
            seen = []
            real, reall = cetzmod.emit_node, cetzmod.label_lines
            labels = [0]

            def spy(*args, **kw):
                o = args[2] if len(args) > 2 else kw.get("o")
                inner = args[1] if len(args) > 1 else kw.get("inner")
                side = cetzmod._node_anchor(o)
                got = real(*args, **kw)
                own = got[:len(got) - labels[0]] if got else got
                seen.append((side, inner or "", own,
                             bool(own) and any(CARRIED.search(l) for l in own)))
                return got

            def lspwy(*args, **kw):
                out = reall(*args, **kw)
                labels[0] = len(out or [])
                return out

            cetzmod.emit_node, cetzmod.label_lines = spy, lspwy
            try:
                canvas = cetzmod.build(core, p.colors) or cetzmod.build_cd(core)
            finally:
                cetzmod.emit_node, cetzmod.label_lines = real, reall
            if canvas is None:
                unbuilt += 1
                continue
            for side, text, own, has in seen:
                if not side:
                    continue
                math = "$" in text
                if not math:
                    prose["prose"] += 1
                    continue
                for cls in classify(text):
                    if has:
                        carried[cls] += 1
                        carried_form[(cls, form(own))] += 1
                        papers.setdefault(cls, set()).add(stem)
                        if cls != "plain" and len(examples.get(cls, [])) < 2:
                            examples.setdefault(cls, []).append(
                                (side, stem[:38], i, text[:110]))
                    else:
                        not_carried[cls] += 1
                    if has and cls != "plain":
                        canvases.add((stem, i))
    print("anchored nodes with a NON-maths body (ratio, not #45): %s" % dict(prose))
    print()
    print("anchor CARRIED into the product, maths bodies, by construct:")
    for cls, n in carried.most_common():
        print("  %-12s %4d nodes / %3d papers" % (cls, n, len(papers.get(cls, ()))))
    print()
    print("same, split by the emitted box form:")
    for (cls, f), n in sorted(carried_form.items(), key=lambda kv: (-kv[1], kv[0])):
        print("  %-12s %-11s %4d" % (cls, f, n))
    print()
    print("anchor ASKED but absent from the lines (#62's face, not #45): %s"
          % dict(not_carried.most_common()))
    print()
    tall = set()
    for cls in carried:
        if cls != "plain":
            tall |= papers.get(cls, set())
    print("canvases holding at least one tall-maths anchored node: %d over %d papers"
          % (len(canvases), len(tall)))
    print("papers: %s" % ", ".join(sorted(s[:34] for s in tall)))
    print()
    for cls, ex in sorted(examples.items()):
        for side, stem, i, text in ex:
            print("  %-11s %s p%d %s: %s" % (cls, stem, i, side, text))
    print("canvases that do not build (not counted): %d" % unbuilt)


if __name__ == "__main__":
    main()
