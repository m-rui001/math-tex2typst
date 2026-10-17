r"""#102f: the change face of the dash fix -- the OLD law stubbed, the same base read twice.

The rule this project prices a change with (轴 68 / #81) is one base, two laws: here every flat
picture -- `tikzcd` and `CD` included, since `cetz.build` draws all three into the same canvases the
products carry -- is handed to `cetz.build` twice, once with `dash_argument` stubbed back to the two
bare keys the emitter read before this round and once with the fix in place.  The stub returns the
SAME shape the old caller built (`"dashed"`/`"dotted"`, quoted, because the new code only
concatenates what `dash_argument` hands back), so the two runs differ exactly where the law differs.
A canvas whose strings differ is one the fix moves; a canvas that differs some other way is a
regression, so the printout names the differing text.

Nothing here opens `typst` and nothing under `typst/` is written.

  PYTHONIOENCODING=utf-8 python _work/probe102f_change_face.py
"""
import collections
import difflib
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(HERE, "flat")
OUT = os.path.join(HERE, "label102f_change_face.txt")
PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)

from t2t import cetz  # noqa: E402

DASH = re.compile(r"dash: (\"[^\"]*\"|\((?:[^()]|\([^()]*\))*\))")
BARE = ('"dashed"', '"dotted"')
NEW = {}
OLD = {}
CACHE = []


def old_law(o, thickness):
    """What `dash_argument` answered before #102: the two bare names, nothing else."""
    if o.get("dashed") is True:
        return '"dashed"'
    if o.get("dotted") is True:
        return '"dotted"'
    return None


def pictures():
    if not CACHE:
        for name in sorted(os.listdir(FLAT)):
            if not name.endswith(".tex"):
                continue
            text = io.open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
            for k, m in enumerate(PIC.finditer(text)):
                CACHE.append((name[:-4] + "#" + str(k), m.group(0)))
    return CACHE


def run(law, sink):
    saved = cetz.dash_argument
    cetz.dash_argument = law or saved
    try:
        for key, pic in pictures():
            sink[key] = cetz.build(pic)
    finally:
        cetz.dash_argument = saved


def main():
    sys.stdout.reconfigure(errors="replace")
    run(old_law, OLD)
    run(None, NEW)
    changed = [k for k in NEW if NEW.get(k) != OLD.get(k)]
    papers = sorted({k.split("#")[0] for k in changed})
    both = [k for k in changed if NEW[k] and OLD[k]]
    added = sum(max(0, NEW[k].count("dash: ") - OLD[k].count("dash: ")) for k in both)
    removed = sum(max(0, OLD[k].count("dash: ") - NEW[k].count("dash: ")) for k in both)
    lines = ["dash fix change face -- same base, old law stubbed",
             "pictures: %d in %d papers" % (len(NEW), len({k.split("#")[0] for k in NEW})),
             "canvases changed: %d over %d papers" % (len(changed), len(papers)),
             "newly refused: %d   newly built: %d"
             % (sum(1 for k in changed if NEW[k] is None),
                sum(1 for k in changed if OLD[k] is None)),
             "dash tokens: %d added, %d removed" % (added, removed),
             ""]
    for k in changed[:12]:
        diff = [l for l in difflib.unified_diff(OLD[k].splitlines(), NEW[k].splitlines(),
                                                n=0, lineterm="")
                if (l.startswith("+") or l.startswith("-")) and not l.startswith(("+++", "---"))]
        lines.append("%s: %d lines" % (k, len(diff)))
        for l in diff[:6]:
            i = min([x for x in (l.find("stroke:"), l.find("dash")) if x >= 0] or [0])
            lines.append("  " + l[max(0, i - 40):i + 90])
    # the same tokens grouped by value, so this face reconciles with what the products carry
    # (`_work/probe102i_product_dash.py` counts the tree, this counts the law)
    added_values = collections.Counter()
    for k in NEW:
        if NEW[k]:
            added_values.update(collections.Counter(DASH.findall(NEW[k]))
                                - collections.Counter(DASH.findall(OLD[k] or "")))
    lines.append("")
    lines.append("tokens added, by value (%d in all):" % sum(added_values.values()))
    for v, c in added_values.most_common():
        lines.append("  %-26s %d" % (v, c))
    # reconcile with the products, paper by paper: the old law could only ever send the two bare
    # names, so a page's non-bare tokens are exactly the fix's, and a paper where the two counts
    # differ belongs to a channel this scan does not walk -- that has to be named, not buried in a
    # total.  Walk every picture, not just the changed ones, since the product carries them all.
    prod = collections.Counter()
    for stem in sorted({k.split("#")[0] for k in NEW}):
        path = os.path.join(ROOT, "typst", stem, "main.typ")
        if not os.path.isfile(path):
            lines.append("NO PRODUCT for %s" % stem)
            continue
        text = io.open(path, encoding="utf-8", errors="replace").read()
        prod[stem] = sum(1 for v in DASH.findall(text) if v not in BARE)
    emit = collections.Counter()
    for k, canvas in NEW.items():
        if canvas:
            emit[k.split("#")[0]] += sum(1 for v in DASH.findall(canvas) if v not in BARE)
    differ = [(s, prod[s], emit[s]) for s in emit if prod[s] != emit[s]]
    lines.append("")
    lines.append("new-form tokens: product %d   emitter %d" % (sum(prod.values()), sum(emit.values())))
    lines.append("papers where the product's non-bare dash tokens differ from the emitter's: %d"
                 % len(differ))
    for s, p, e in sorted(differ, key=lambda t: -abs(t[2] - t[1]))[:10]:
        lines.append("  %-56s product %d  emitter %d" % (s[:56], p, e))
    # name the channel for each of those papers: which environment their pictures are written in, how
    # many canvases the replay builds and how many the product carries.  The replay hands one string
    # per source picture while the batch may build a canvas per nested environment, so a cd paper is
    # the only place these two rulers can disagree without one of them being wrong.
    for s, p, e in sorted(differ, key=lambda t: -abs(t[2] - t[1]))[:4]:
        keys = [k for k in NEW if k.split("#")[0] == s]
        envs = collections.Counter(
            re.match(r"\\begin\{(\w+)\}", pic).group(1)
            for k, pic in pictures() if k.split("#")[0] == s)
        prod_text = io.open(os.path.join(ROOT, "typst", s, "main.typ"),
                            encoding="utf-8", errors="replace").read()
        lines.append("  %s: %d pictures (%s)  built here %d, canvas blocks here %d  "
                     "product: %d canvas blocks"
                     % (s[:44], len(keys), ", ".join("%s %d" % t for t in envs.most_common()),
                        sum(1 for k in keys if NEW[k]),
                        sum((NEW[k] or "").count("#cetz.canvas") for k in keys),
                        prod_text.count("#cetz.canvas")))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
