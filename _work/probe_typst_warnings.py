# -*- coding: utf-8 -*-
"""What does `typst` say about the products when nobody is watching the exit code?

The batch gate only records `returncode == 0`, so every warning a paper compiles with is invisible
from the outside: a capturable argument that was not captured, a reference to a label that does not
exist, a line the layout could not fit. This runs the real compiler over every product and files
each diagnostic by its first line, with one example per kind.
"""
import collections
import glob
import os
import re
import subprocess
import sys
import tempfile

ROOT = r"E:\math"
NOTE = re.compile(r"^(warning|error)(?::|\s+-)?\s*(.*)", re.M)


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    kinds = collections.Counter()
    papers = collections.defaultdict(set)
    sample = {}
    tmp = tempfile.mkdtemp(prefix="typstwarn")
    paths = sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ")))
    for n, path in enumerate(paths):
        stem = os.path.basename(os.path.dirname(path))
        got = subprocess.run(["typst", "compile", path, os.path.join(tmp, "o.pdf")],
                             capture_output=True)
        err = got.stderr.decode("utf-8", "replace")
        if got.returncode:
            kinds["COMPILE FAILED"] += 1
            print("FAILED %s" % stem)
        blocks = re.split(r"\n(?=(?:warning|error))", err)
        for block in blocks:
            m = NOTE.match(block.strip())
            if not m:
                continue
            kind = re.sub(r"\s+", " ", m.group(2))[:70]
            kind = re.sub(r'"[^"]{6,}"', '"…"', kind)
            kinds[kind] += 1
            papers[kind].add(stem)
            sample.setdefault(kind, (stem, " ".join(block.split())[:150]))
        if (n + 1) % 100 == 0:
            print("... %d/%d" % (n + 1, len(paths)), flush=True)
    print("\n== %d products" % len(paths))
    for kind, hits in kinds.most_common():
        print("%-4d hits  %-3d papers  %s" % (hits, len(papers[kind]), kind))
        stem, line = sample[kind]
        print("        %s: %s" % (stem[:34], line))


if __name__ == "__main__":
    main()
