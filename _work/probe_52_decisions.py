r"""#52: which decisions the new path-mode law makes, counted where they are made.

Three buckets, all read off `translate_path`'s own arguments rather than off a guess about the source
text:

  none      a shape the statement does not stroke, so the absence is said out loud (`\fill` shapes and
            bare `\path` statements -- the two families that used to arrive wearing CeTz's own 1pt black
            rule, or inventing a line pgf never drew);
  weight    a shape that IS stroked and names pgf's default 0.4pt because the option group wrote no
            `line width` of its own (before, such a line inherited Typst's 1pt);
  flip      the `draw` key outranking the verb in either direction (`\draw[draw=none]`, `\path[draw=red]`).

The fourth count is the tip a non-stroked statement no longer emits: `arrow_mark` is asked again with
the mode on, and where that answer is non-empty the tip really was being invented on an empty page
(`_work/measure_path_mode.py`: `\path[red,->] (0,0)--(2,0);` leaves an EMPTY page).
"""
import pathlib
import re
import sys
from collections import Counter, defaultdict

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
GEOM = re.compile(r"^\s*(circle|rect|line|arc|curve|bezier|ellipse|polyline|polygon|path)\(")
LC = 15.79

live_path = cetz.translate_path
live_mark = cetz.arrow_mark
buckets = Counter()
papers = defaultdict(set)
canvases = defaultdict(set)
samples = defaultdict(list)
CUR = ["", 0]


def note(bucket, line):
    buckets[bucket] += 1
    papers[bucket].add(CUR[0])
    canvases[bucket].add((CUR[0], CUR[1]))
    if len(samples[bucket]) < 3:
        samples[bucket].append("%s#%d  %s" % (CUR[0][:40], CUR[1], line.strip()[:110]))


def spy_path(rest, verb, o, *a, **kw):
    drawn = cetz.draws_rule(o, verb)
    if drawn != (verb in ("draw", "filldraw")):
        flip = "flip off (%s[draw=%s])" % (verb, o.get("draw")) if not drawn else \
               "flip on (%s[draw=%s])" % (verb, o.get("draw"))
    else:
        flip = None
    out = live_path(rest, verb, o, *a, **kw)
    for line in out or []:
        if not GEOM.match(line):
            continue
        own = re.sub(r"mark: \(.*\)\)?\s*$", "", line)
        if "stroke: none" in own:
            note("none %s" % verb, line)
        elif "thickness: 0.4pt" in own:
            note("weight %s" % verb, line)
        if flip:
            note(flip, line)
    return out


def spy_mark(o, pal, drawn, default=None):
    out = live_mark(o, pal, drawn, default)
    if not drawn and live_mark(o, pal, True, default):
        note("tip suppressed", "arrow spec %r" % (o.get("arrows") or o.get(">") or default,))
    return out


def main():
    cetz.translate_path = spy_path
    cetz.arrow_mark = spy_mark
    walked = built = 0
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(text)}
        for i, m in enumerate(PIC.finditer(text)):
            CUR[0], CUR[1] = path.stem, i
            walked += 1
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
            if cetz.build(core, pal) is not None:
                built += 1
    cetz.translate_path = live_path
    cetz.arrow_mark = live_mark
    print("canvases walked %d, built %d" % (walked, built))
    for bucket, n in buckets.most_common():
        print("%-28s %6d   canvases %4d   papers %4d"
              % (bucket, n, len(canvases[bucket]), len(papers[bucket])))
        for s in samples[bucket]:
            print("      " + s)
    touched = set().union(*papers.values()) if papers else set()
    print("papers touched by any bucket: %d   canvases walked %d" % (len(touched), walked))


if __name__ == "__main__":
    main()
