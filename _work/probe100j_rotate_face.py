r"""How wide is the rotated-node face, and how many of those nodes also name an anchor?

The page-side discriminator (`_work/probe100i_page_pair.py`) put two of the 14 on-ink rows on
`A-Linear-Clock-for-Random-Walk-on-Tree-Weighted-Planar-M`, whose source writes
`\node[anchor=east,rotate=90] at (-0.93,2.45) {...}`.  pgf turns the node and anchors the **turned**
box on the point (`_work/probe100h_rot_anchors.py`), so an `anchor=` beside a `rotate=` is a pair the
emitter has to read together -- and `anchor` without `rotate` is the ordinary case it already gets
right.  This counts the population on the source side over the same picture list the control leg uses,
so the number is the one probe84/probe100 already speak of.

  python _work/probe100j_rotate_face.py            # tally + the papers
  python _work/probe100j_rotate_face.py tsv        # one line per node that carries `rotate`
"""
import io
import os
import re
import sys
import glob

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import compare_figure  # noqa: E402

PIC = compare_figure.PIC
NODE = re.compile(r"\\node\s*(?:\[([^\]]*)\])?\s*(?:at\s+([^\s{;]+)\s*)?\{")
ROT = re.compile(r"\brotate(?:\s+around)?\s*=")
ANCH = re.compile(r"\banchor\s*=\s*([A-Za-z]+)")

# `anchor=...,rotate=90` and the reverse order are the same two keys; what matters is that they sit
# in one option list, because that is the pair whose pgf reading is not the sum of its halves.
def main():
    tsv = "tsv" in sys.argv[1:]
    keys = "keys" in sys.argv[1:]
    pics = papers = 0
    rot_pics = 0
    rot_papers = set()
    both_pics = 0
    both_papers = set()
    nodes = 0
    anchors = 0
    rows = []
    rot_rows = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = io.open(path, encoding="utf-8", errors="replace").read()
        for j, m in enumerate(PIC.finditer(src)):
            if j == 0:
                papers += 1
            pic = m.group(0)
            pics += 1
            hit_rot = False
            hit_both = False
            for nm in NODE.finditer(pic):
                opts = nm.group(1) or ""
                if not ROT.search(opts):
                    continue
                nodes += 1
                hit_rot = True
                rot_rows.append((stem, j, " ".join(opts.split())))
                a = ANCH.search(opts)
                if a:
                    anchors += 1
                    hit_both = True
                    rows.append((stem, j, a.group(1),
                                 " ".join(opts.split())[:44], nm.group(2) or "-"))
            if hit_rot:
                rot_pics += 1
                rot_papers.add(stem)
            if hit_both:
                both_pics += 1
                both_papers.add(stem)
    if keys:
        # What else sits in the option list of a turned node decides which branches of `emit_node`
        # the fix has to be right for: a `label=` reads the node's point afterwards, and a frame
        # (`draw`, a measure, a shape) makes the branch draw a box that Typst does not turn.
        GROUPS = [
            ("anchor", re.compile(r"\banchor\s*=")),
            ("label=", re.compile(r"\blabel\s*=")),
            ("above/below/right/left", re.compile(r"\b(above|below|right|left)\s*=")),
            ("bare above/below/right/left", re.compile(r"(?<![=\w])(above|below|right|left)(?![\s]*=)")),
            ("draw", re.compile(r"(?<![=\w])draw\b")),
            ("fill", re.compile(r"\bfill\s*=")),
            ("inner sep", re.compile(r"\binner sep\s*=")),
            ("font=", re.compile(r"\bfont\s*=")),
            ("minimum/text measure", re.compile(r"\b(minimum (size|width|height)|text (width|height))\s*=")),
            ("shape", re.compile(r"(?<![=\w])(circle|rectangle|ellipse|draw)\b")),
            ("rotate around", re.compile(r"\brotate\s+around\s*=")),
            ("xscale/yscale", re.compile(r"\b(xscale|yscale)\s*=")),
        ]
        print("nodes carrying a `rotate`: %d" % nodes)
        for name, pat in GROUPS:
            hit = [r for r in rot_rows if pat.search(r[2])]
            print("  %-26s %2d nodes / %d papers"
                  % (name, len(hit), len({r[0] for r in hit})))
        print("\nthe ones that are neither anchored nor framed (this is what the fix moves):")
        for stem, j, opts in rot_rows:
            if not re.search(r"\banchor\s*=", opts):
                continue
            if re.search(r"\bdraw\b|\bfill\s*=|\bmin(imum)?\s*(size|width|height)\s*=|\btext\s*width\s*=",
                         opts):
                print("  FRAMED+ANCHOR %s #%d  %s" % (stem[:52], j, opts[:70]))
        return 0
    print("source pictures: %d in %d papers" % (pics, papers))
    print("  a `rotate` on a node: %d nodes / %d pictures / %d papers"
          % (nodes, rot_pics, len(rot_papers)))
    print("  rotate AND a named `anchor=`: %d nodes / %d pictures / %d papers"
          % (anchors, both_pics, len(both_papers)))
    if tsv:
        for stem, j, a, opts, at in rows:
            print("%s\t%d\t%s\t%s\t%s" % (stem, j, a, opts, at))
    else:
        tally = {}
        for stem, j, a, opts, at in rows:
            tally[stem] = tally.get(stem, 0) + 1
        print("\npapers carrying rotate+anchor, most first:")
        for stem, c in sorted(tally.items(), key=lambda x: (-x[1], x[0]))[:15]:
            print("  %2d  %s" % (c, stem[:70]))
        print("\nanchor spelling tally:")
        kinds = {}
        for stem, j, a, opts, at in rows:
            kinds[a] = kinds.get(a, 0) + 1
        for a, c in sorted(kinds.items(), key=lambda x: -x[1]):
            print("  %-12s %d" % (a, c))
    return 0


if __name__ == "__main__":
    sys.exit(main())
