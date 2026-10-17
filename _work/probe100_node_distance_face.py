r"""How many source diagrams set a `\node distance` in their picture head, and do they use `=of`?

The emitter places `right=of a` with a hard-coded centimetre gap (cetz.py `NODE_DISTANCE = 1.0`), so a
head that writes `node distance=13mm and 36mm` is read by pgf and by nobody here. This counts the face
on the source side through the same picture list the control leg uses (`compare_figure.PIC`), so the
population is the one probe84 and probe81 already measure.

  python _work/probe100_node_distance_face.py            # tally + the top papers
  python _work/probe100_node_distance_face.py tsv        # one line per picture that carries the key
"""
import io
import os
import re
import sys
import glob

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import compare_figure  # noqa: E402

PIC = compare_figure.PIC
HEAD = re.compile(r"\\begin\{tikzpicture\}\s*\[")
OF = re.compile(r"\b(?:right|left|above|below|above right|above left|below right|below left)"
                r"\s*(?:=|\bof\b)")
DIST = re.compile(r"node\s+distance\s*=\s*([^\],]*)")


def head_opts(pic):
    """The picture's own option list, bracket-matched from the head."""
    m = HEAD.search(pic)
    if not m:
        return ""
    depth, i, out = 1, m.end(), []
    while i < len(pic) and depth:
        c = pic[i]
        if c == "[":
            depth += 1
        elif c == "]":
            depth -= 1
            if not depth:
                break
        out.append(c)
        i += 1
    return "".join(out)


def main():
    tsv = "tsv" in sys.argv[1:]
    pics = 0
    papers = set()
    with_dist = 0
    dist_papers = set()
    of_pics = 0
    both = 0
    both_papers = set()
    rows = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = io.open(path, encoding="utf-8", errors="replace").read()
        for j, m in enumerate(PIC.finditer(src)):
            pic = m.group(0)
            pics += 1
            papers.add(stem)
            opts = head_opts(pic)
            d = DIST.search(opts)
            uses_of = bool(OF.search(pic))
            if uses_of:
                of_pics += 1
            if d:
                with_dist += 1
                dist_papers.add(stem)
                if uses_of:
                    both += 1
                    both_papers.add(stem)
                    rows.append((stem, j, d.group(1).strip(), opts.count("of")))
    print("source pictures: %d in %d papers" % (pics, len(papers)))
    print("  a `node distance=` in the picture head: %d pictures / %d papers"
          % (with_dist, len(dist_papers)))
    print("  uses an `=of` placement: %d pictures" % of_pics)
    print("  BOTH (head sets the distance and the diagram uses `of`): %d pictures / %d papers"
          % (both, len(both_papers)))
    kinds = {}
    for stem, j, val, n in rows:
        kinds.setdefault(val, []).append((stem, j))
    print("\nspelling tally:")
    for val, items in sorted(kinds.items(), key=lambda x: -len(x[1]))[:18]:
        print("  %-28s %2d pictures / %2d papers" % (val[:28], len(items),
                                                     len({s for s, _ in items})))
    if tsv:
        for stem, j, val, n in rows:
            print("%s\t%d\t%s" % (stem, j, val))
    else:
        print("\ntop papers:")
        tally = {}
        for stem, j, val, n in rows:
            tally[stem] = tally.get(stem, 0) + 1
        for stem, c in sorted(tally.items(), key=lambda x: (-x[1], x[0]))[:12]:
            print("  %2d  %s" % (c, stem[:72]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
