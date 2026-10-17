r"""#94 second census: the maths on the page that carries a BARE `/` (the stacked-fraction shape).

The first census (`_work/probe94_escape_face.py`) split the population: pandoc's Typst writer escapes a
division slash as `\/` (49,353 body spans), which Typst prints as the glyph -- so the body channel is
already faithful.  What is left bare (`/` with no backslash in front, inside `$ ... $`) is the shape
轴 75 proved Typst reads as a **stacked fraction** -- 轴 77 later measured the bar over the one atom after
the slash, so 「runs to the end of the maths」 in this file's first draft does not hold.

This dumps every one of those spans with the marks that say WHO wrote it: a `#h(` / `#scale(` / `#text(`
call inside the span means one of our own emitters built the string, `#raw(` means a quoted fallback, and
nothing at all means it came straight out of pandoc.

  python _work/probe94_bare_slash.py            # summary
  python _work/probe94_bare_slash.py --tsv      # also write _work/m94_bare_slash.tsv
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import canvases  # one canvas walker, #93's

MATH = re.compile(r"\$[^$\n]+\$")
BARE = re.compile(r"(?<!\\)/")
OURS = {"#h(": re.compile(r"#h\("), "#scale(": re.compile(r"#scale\("), "#text(": re.compile(r"#text\("),
        "frac(": re.compile(r"frac\("), "root(": re.compile(r"root\("), "script-arg": re.compile(r"_\(|\^\(")}


def channels(text):
    r"""[(kind, text)]: each `#cetz.canvas({ ... })` block, newlines folded, then the file minus them.

    The same walker #93 uses; the line-by-line brace counter this census first ran on was opened by a
    `#cetz.canvas(` and closed by a stray `}` in a node, which put stretches of body under the canvas
    flag and lost the rest.
    """
    blocks = canvases(text)
    rest = text
    for c in blocks:
        rest = rest.replace(c, " ", 1)
    return [("canvas", c.replace("\n", " ")) for c in blocks] + [("body", ln) for ln in rest.splitlines()]


def main():
    tsv = "--tsv" in sys.argv
    rows = []
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        paper = os.path.basename(os.path.dirname(path))
        text = open(path, encoding="utf-8", errors="replace").read()
        for kind, line in channels(text):
            if "#raw(" in line:
                continue
            for span in MATH.findall(line):
                # a slash inside a quoted string is the glyph #93 ships, and `\/` is the escape pandoc
                # writes for the slash the author typed -- neither is the stacked-fraction shape here
                n = len(BARE.findall(re.sub(r'"[^"\n]*"', "", span)))
                if n:
                    marks = ",".join(k for k, rx in OURS.items() if rx.search(span))
                    rows.append((paper, kind, n, marks, span.replace("\n", " ")))
    print("bare-`/` maths spans: %d over %d papers" % (len(rows), len({r[0] for r in rows})))
    for kind in ("canvas", "body"):
        sel = [r for r in rows if r[1] == kind]
        print("\n== %s: %d spans over %d papers" % (kind, len(sel), len({r[0] for r in sel})))
        by_mark = {}
        for r in sel:
            by_mark.setdefault(r[3] or "(nothing of ours)", []).append(r)
        for mark, group in sorted(by_mark.items(), key=lambda kv: -len(kv[1])):
            print("   %-22s spans=%-5d papers=%d" % (mark, len(group), len({g[0] for g in group})))
        for r in sel[:12]:
            print("   sample  %-44s %s" % (r[0][:44], r[4][:150]))
    if tsv:
        out = os.path.join(ROOT, "_work", "m94_bare_slash.tsv")
        with open(out, "w", encoding="utf-8") as fh:
            fh.write("paper\tkind\tn_slash\tmarks\tspan\n")
            for r in rows:
                fh.write("\t".join(str(x) for x in r) + "\n")
        print("\nwrote %s" % out)
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
