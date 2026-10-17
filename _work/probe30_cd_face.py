r"""#30: what does the tikzcd road actually put on the page, and where is it wrong?

Two defects are open on this row.  The first is a mechanism claim -- *a diagonal arrow's label is
crossed by its own line*.  The label is placed off the line along the arrow's normal by a fixed
0.45 cm (`build_cd`), which clears a horizontal or vertical arrow because the label is only
~0.35 cm tall, but a 45-degree normal cuts the label's box diagonally and reaches further than the
offset.  This does not argue: it measures, on every canvas the converter emits, the perpendicular
distance from each label's centre to its own line against the distance that label's box would
actually need, and prints the two for all three arrow directions so the direction is what
separates them.

The second is a spelling claim -- *multi-line cells written other than with `gathered`*.  Whether
that has a corpus at all is a count of which environments authors put inside a cell, so the probe
also dumps that census verbatim rather than trusting the row's wording.

The basis is the one the page uses: tikzcd and CD reach Typst through `emit.math_text`, which calls
`cetz.convert` on the display string; `build` and `build_cd` are replayed here without the
`sane`/`compiles` gates, and a diagram neither builds is counted as a blind spot, not as clean.
"""
import collections
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")

CD_SRC = re.compile(r"\\begin\{(?:tikzcd|CD)\}.*?\\end\{(?:tikzcd|CD)\}", re.S)
LINE_T = re.compile(r"line\(\((-?[\d.]+), (-?[\d.]+)\), \((-?[\d.]+), (-?[\d.]+)\)")
CONTENT_T = re.compile(r"content\(\((-?[\d.]+), (-?[\d.]+)\), \[(.*?)\]\)", re.S)
LABEL_H = 0.35  # cm, the ink height of a one-line maths label

# What a converted label actually prints: the text inside Typst's quotes, plus single characters.
# Everything else in the body is a name -- `epsilon.alt` is how Typst spells ε, `overline` is an
# accent, `thin` a space -- and counting those letters as ink made a three-glyph label look 3 cm
# wide and reported a crossing where the page reads clean.
QUOTED = re.compile(r'"([^"]*)"')
LONG_NAME = re.compile(r"[A-Za-z][A-Za-z.]*")
INK = re.compile(r"[A-Za-z0-9+\-*/=<>.,;:!?'|()\[\]{}^_\\@&#%]")


def ink_width(body):
    """Centimetres of ink a converted label prints -- `cd_width`'s rate, on the printed characters."""
    rest = LONG_NAME.sub(" ", QUOTED.sub(" ", body))
    ink = "".join(QUOTED.findall(body)) + "".join(INK.findall(rest))
    return 0.55 + 0.17 * len(ink)


def canvases(old=False):
    """(paper, canvas text, source env) for every diagram the two CD builders emit over the corpus.

    `--old` installs the withdrawn law -- the fixed 0.45 cm -- at the seam the code now uses, so the
    two readings of this gauge differ only by the rule under test.  The source travels with the
    canvas because a label crossed by a *neighbouring* line needs its author's spelling to say why:
    a `bend` arrow is drawn here as its chord, and the chord is what runs through the next arrow's
    label.
    """
    live = cetz.cd_label_off
    if old:
        cetz.cd_label_off = lambda label, px, py: 0.45
    out, refused = [], []
    try:
        for name in sorted(os.listdir(FLAT)):
            if not name.endswith(".tex"):
                continue
            src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
            for m in CD_SRC.finditer(src):
                core = cetz.strip_envelope(m.group(0))
                canvas = cetz.build(core) or cetz.build_cd(core)
                if canvas:
                    out.append((name[:-4], canvas, m.group(0)))
                else:
                    refused.append((name[:-4], m.group(0)))
    finally:
        cetz.cd_label_off = live
    return out, refused


def offsets(canvas):
    """Per arrow label: the nearest line of the diagram, and the clearance its box needs.

    `build_cd` writes every cell first and then each arrow's line followed by its labels, so a
    content token appearing after the first line is a label and not a grid cell -- the cells are
    left out here because an arrow is trimmed away from them by `edge()`.

    The pairing of a label to *its own* arrow is not trusted: a `bend` arrow draws two segments and
    an `equal` two lines, so the label's line is not simply the last one before it.  What a reader
    sees is one label box and all the lines, so the distance measured is to the nearest point of
    any line, against the half-extent of that box along that line's normal -- a line crosses the
    label exactly when it comes nearer than that.
    """
    lines = []
    for m in LINE_T.finditer(canvas):
        x1, y1, x2, y2 = (float(v) for v in m.groups())
        length = ((x2 - x1) ** 2 + (y2 - y1) ** 2) ** 0.5
        if length:
            lines.append((x1, y1, x2, y2, (x2 - x1) / length, (y2 - y1) / length, length))
    if not lines:
        return []
    first = min(LINE_T.finditer(canvas), key=lambda m: m.start()).start()
    ordered = sorted([m.start() for m in LINE_T.finditer(canvas)])
    rows = []
    for m in CONTENT_T.finditer(canvas):
        if m.start() < first:
            continue
        cx, cy = float(m.group(1)), float(m.group(2))
        body = m.group(3)
        w = ink_width(body)
        own = [i for i, start in enumerate(ordered) if start < m.start()]
        own = own[-1] if own else None  # `build_cd` writes each arrow's line before its labels
        best = None
        for i, (x1, y1, x2, y2, ux, uy, length) in enumerate(lines):
            t = max(0.0, min(length, (cx - x1) * ux + (cy - y1) * uy))
            d = ((cx - x1 - t * ux) ** 2 + (cy - y1 - t * uy) ** 2) ** 0.5
            need = (w / 2) * abs(uy) + (LABEL_H / 2) * abs(ux)
            if best is None or d - need < best[0] - best[1]:
                best = (d, need, ux, uy, i)
        ux, uy = best[2], best[3]
        across = "diagonal" if abs(ux) > 0.01 and abs(uy) > 0.01 else (
            "horizontal" if abs(uy) < 0.01 else "vertical")
        rows.append((across, best[0], best[1], w, body[:44], best[4] == own))
    return rows


def protected(env):
    """Whether `CD_STACK` hides this environment's own `\\\\` from the row splitter."""
    return cetz.CD_STACK.search(r"\begin{%s}a\end{%s}" % (env, env)) is not None


def env_census():
    """Every environment written inside a tikzcd/CD cell, and whether `CD_STACK` protects it."""
    counter = collections.Counter()
    papers = collections.defaultdict(set)
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        for m in CD_SRC.finditer(src):
            for env in re.findall(r"\\begin\{(\w+\*?)\}", m.group(0)):
                counter[env] += 1
                papers[env].add(name[:-4])
    return counter, papers


def main():
    old = "--old" in sys.argv
    built, refused = canvases(old)
    print("== rule under test: %s" % ("withdrawn -- a fixed 0.45 cm" if old
                                      else "live -- the label's own box"))
    print("== CD canvases: built %d over %d papers; refused %d over %d papers"
          % (len(built), len({p for p, _, _ in built}), len(refused),
             len({p for p, _ in refused})))
    for p, src in refused[:6]:
        print("     refused  %s  %s" % (p[:40], " ".join(src.split())[:90]))

    by_kind = collections.defaultdict(lambda: [0, 0, []])
    for paper, canvas, src in built:
        bent = 1 if re.search(r"bend", src) else 0
        for across, dist, need, w, body, is_own in offsets(canvas):
            row = by_kind[across]
            row[0] += 1
            if dist < need:
                row[1] += 1
                row[2].append((paper, dist, need, w, body, is_own, bent))
    print("== arrow labels by arrow direction: count, and how many a line crosses (dist < need)")
    for kind in ("horizontal", "vertical", "diagonal"):
        n, bad, ex = by_kind[kind]
        print("   %-11s labels %4d   crossed %4d   (median label width %.2f cm)"
              % (kind, n, bad,
                 sorted([e[3] for e in ex])[len(ex) // 2] if ex else 0.0))
    hit = {e[0] for kind in ("horizontal", "vertical", "diagonal") for e in by_kind[kind][2]}
    allbad = [e for k in ("horizontal", "vertical", "diagonal") for e in by_kind[k][2]]
    own = [e for e in allbad if e[5]]
    print("   crossed by its OWN arrow's line   : %d" % len(own))
    print("   crossed by another arrow's line   : %d" % (len(allbad) - len(own)))
    for e in sorted(own, key=lambda x: x[1] - x[2])[:8]:
        print("     own  %-28s dist %.3f need %.3f  %s" % (e[0][:28], e[1], e[2], e[4]))
    nb = [e for e in allbad if not e[5]]
    print("   neighbour-crossed, split by whether the diagram holds a bend arrow: %d bend / %d plain"
          % (len([e for e in nb if e[6]]), len([e for e in nb if not e[6]])))
    for e in sorted(nb, key=lambda x: (-x[6], x[1] - x[2]))[:12]:
        print("     %-4s %-30s dist %.3f need %.3f w %.2f  %s"
              % ("bend" if e[6] else "plain", e[0][:30], e[1], e[2], e[3], e[4]))
    print("   papers with a crossed label: %d over %d labels" % (len(hit), len(allbad)))
    print("   per-paper worst:")
    per = collections.Counter(e[0] for k in ("vertical", "diagonal") for e in by_kind[k][2])
    for p, n in per.most_common(10):
        print("     %3d  %s" % (n, p[:56]))
    worst = sorted((e for k in ("vertical", "diagonal") for e in by_kind[k][2]),
                   key=lambda x: x[1] - x[2])
    for e in worst[:10]:
        print("     dist %.3f need %.3f w %.2f  %s  %s"
              % (e[1], e[2], e[3], e[0][:30], e[4]))

    counter, papers_env = env_census()
    print("== environments written inside a CD environment, and whether CD_STACK protects them")
    for env, n in counter.most_common(24):
        if env in ("tikzcd", "CD"):
            continue
        print("   %5d  %-14s %-10s %d papers"
              % (n, env, "protected" if protected(env.rstrip("*")) else "NOT",
                 len(papers_env[env])))


if __name__ == "__main__":
    main()
