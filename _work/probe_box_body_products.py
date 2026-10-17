r"""Which products still write a `#box` body whose edges CeTz will measure by the wrong pair?

The list a rebuild must be drawn from is read off `typst/*/main.typ` directly, not off the source: a
picture can be quoted rather than drawn, can come from a `tikzcd`, or can reach the page through a path
this probe cannot replay, and any of those would vanish from a build-side count.  A body is settled when
it either names the two edges the wrapper is measured by (#63) or asks for `horizon`, which is the
mid-height call a box of declared `height:` needs Typst's own edges for.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

BOX = re.compile(r"#box\(")


def main():
    hug, oldset, settled, papers_bad = 0, 0, 0, []
    edge = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        bad = 0
        for line in open(path, encoding="utf-8", errors="replace"):
            if "content(" not in line or not BOX.search(line):
                continue
            named = re.search(r'anchor: "([^"]+)"', line)
            whom = named.group(1) if named else "(none)"
            if 'top-edge: "cap-height"' in line or "+ horizon" in line:
                settled += 1
                continue
            if "#set text(hyphenate: false);" in line:
                oldset += 1
            else:
                hug += 1
            edge[whom] = edge.get(whom, 0) + 1
            bad += 1
        if bad:
            papers_bad.append((os.path.basename(os.path.dirname(path)), bad))
    print("settled box bodies: %d" % settled)
    print("hugging words, no body set at all: %d" % hug)
    print("old set without the edges:         %d" % oldset)
    print("unsettled by the anchor the author named:")
    for whom, n in sorted(edge.items(), key=lambda kv: -kv[1]):
        print("   %-12s %d" % (whom, n))
    print("papers to rebuild: %d / lines: %d"
          % (len(papers_bad), sum(n for _, n in papers_bad)))
    with open(os.path.join(ROOT, "_work", "box_body_list.txt"), "w",
              encoding="utf-8") as out:
        for name, _ in papers_bad:
            out.write(name + "\n")


if __name__ == "__main__":
    main()
