r"""Render the pages a spacing fix moved, before and after, and crop exactly the strip that moved.

The #83 rule rewrites pandoc's `#h(-1em)` (its price for TeX's `\!`, minus a whole em) to
`#h(-0.16667em)` (the real -3mu). The token count on the products says 3,427 sites changed; it does
not say what the page looks like. So rebuild the worst papers twice -- once with the rule stubbed off
(`mathconv.SPACE_VALUES = ()`), once as shipped -- and read the two PDFs with the same instrument:
the text spans whose position moved, union of their boxes, 300 dpi, both versions.

  python _work/probe83_render_shot.py [n_papers]
"""
import concurrent.futures
import json
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
TMP = os.path.join(ROOT, "_work", "_m83")
TOKEN_NEW = "#h(-0.16667em)"
TOKEN_OLD = "#h(-1em)"


def candidates(n):
    manifest = json.load(open(os.path.join(ROOT, "_work", "manifest.json"), encoding="utf-8"))
    items = []
    for entry in manifest:
        name = entry.get("paper")
        if not name or not entry.get("entry"):
            continue
        path = os.path.join(ROOT, "typst", name, "main.typ")
        if not os.path.exists(path):
            continue
        count = open(path, encoding="utf-8").read().count(TOKEN_NEW)
        if count:
            items.append((count, name))
    items.sort(reverse=True)
    return items[:n]


def build_old(name):
    """Rebuild this paper with the rule off, into _work/_m83/<name>."""
    from t2t import mathconv
    from t2t.convert import convert_paper

    os.makedirs(TMP, exist_ok=True)
    saved = mathconv.SPACE_VALUES
    mathconv.SPACE_VALUES = ()
    try:
        convert_paper(os.path.join(ROOT, "_work", "flat", name + ".tex"),
                      os.path.join(TMP, name), name)
    finally:
        mathconv.SPACE_VALUES = saved
    return os.path.join(TMP, name, "main.pdf")


def pages(pdf):
    doc = fitz.open(pdf)
    out = []
    for page in doc:
        out.append([(tuple(round(v, 1) for v in s["bbox"]), s["text"].strip())
                    for b in page.get_text("dict")["blocks"] if b.get("lines")
                    for l in b["lines"] for s in l["spans"] if s["text"].strip()])
    doc.close()
    return out


def report(count, name):
    new_pdf = os.path.join(ROOT, "typst", name, "main.pdf")
    old_pdf = build_old(name)
    if not os.path.exists(old_pdf):
        return "%-58s %4d sites  OLD BUILD FAILED" % (name[:58], count)
    a, b = pages(old_pdf), pages(new_pdf)
    moved, line = [], []
    for i, (pa, pb) in enumerate(zip(a, b)):
        if len(pa) != len(pb):
            line.append("p%d span count %d vs %d" % (i + 1, len(pa), len(pb)))
        diffs = [(r1, r2, t) for (r1, t), (r2, t2) in zip(pa, pb) if t == t2 and r1 != r2]
        if diffs:
            moved.append((i, diffs))
    worst = max(moved, key=lambda m: len(m[1]), default=None)
    shots = []
    if worst:
        i, diffs = worst
        box = fitz.Rect(diffs[0][0])
        for r1, r2, _t in diffs[1:]:
            box |= fitz.Rect(r1)
        box += (-16, -16, 16, 16)
        for tag, path in (("old", old_pdf), ("new", new_pdf)):
            doc = fitz.open(path)
            clip = box & doc[i].rect
            name_png = os.path.join(ROOT, "_work", "shot83_%s_p%d_%s.png" % (name[:34], i + 1, tag))
            doc[i].get_pixmap(clip=clip, dpi=300).save(name_png)
            doc.close()
            shots.append(os.path.basename(name_png))
    return ("%-58s %4d sites  pages moved %d, spans %d%s%s"
            % (name[:58], count, len(moved), sum(len(d) for _i, d in moved),
               ("  worst p%d: %s" % (worst[0] + 1, " ".join(shots))) if worst else "  NOTHING MOVED",
               ("  " + "; ".join(line[:3])) if line else ""))


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 3
    items = candidates(n)
    print("rendering %d papers with the most %s" % (len(items), TOKEN_NEW), flush=True)
    # one worker: the rule is stubbed by monkeypatching a module global, which two threads
    # building at once would restore out from under each other
    with concurrent.futures.ThreadPoolExecutor(max_workers=1) as pool:
        for line in pool.map(lambda arg: report(*arg), items):
            print(line, flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
