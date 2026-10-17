r"""Product scan for #61: does a sized node's box now carry the author's corner?

The criterion is read out of `typst/*/main.typ`, not out of the converter, because the whole point of
the round is what lands on the page: after the change every `frame: "rect"` is gone (a sized
rectangle is Typst's `#box`, the only frame with a `radius:`), and the nodes that wrote
`rounded corners` show it as a radius on that box.

Prints, corpus-wide: the `#box` lines by whether they carry `height:` (a declared measure kept) and
`radius:` (a corner kept), the leftover `frame: "rect"` count that must be zero, and the papers whose
rounded sized nodes still have no radius anywhere.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

BOX = re.compile(r"#box\([^)]*\)")


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    paths = sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ")))
    sized = rounded = both = 0
    leftover = []
    for path in paths:
        stem = os.path.basename(os.path.dirname(path))
        txt = open(path, encoding="utf-8", errors="replace").read()
        for line in txt.splitlines():
            if 'frame: "rect"' in line:
                leftover.append((stem, line.strip()[:120]))
            for box in BOX.finditer(line):
                got = box.group(0)
                h = "height:" in got
                r = "radius:" in got
                sized += h
                rounded += r
                both += (h and r)
    print("products: %d" % len(paths))
    print("#box with height: %d   with radius: %d   with both: %d"
          % (sized, rounded, both))
    print('leftover frame: "rect": %d' % len(leftover))
    for stem, line in leftover[:10]:
        print("   %s  %s" % (stem[:44], line))


if __name__ == "__main__":
    main()
