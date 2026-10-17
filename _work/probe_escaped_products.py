# -*- coding: utf-8 -*-
r"""Escaped characters the products print literally, outside maths and outside quoted code.

Inside `$…$` a backslash-paren is Typst's own escape and the page reads it as a bracket (that is
settled, see the residue checklist), and `#raw("…")` is the author's source quoted on purpose --
so both are stripped here. What is left is prose and bibliography text, and there `\(`, `\[`, `\;`
are LaTeX that survived the conversion: Typst compiles them without a word and prints the
backslash.
"""
import collections
import glob
import os
import re
import sys

ROOT = r"E:\math"

ESCAPED = re.compile(r"\\[^A-Za-z0-9\s]")
BIB = re.compile(r"#bibitem\(")
MATH = re.compile(r"\$(?:[^$]|\$)*\$", re.S)
RAW = re.compile(r'#raw\("[^"]*"\)|#raw\(block: true[^\n]*')


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    table = collections.Counter()
    papers = collections.defaultdict(set)
    sample = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        for line in open(path, encoding="utf-8", errors="replace").read().splitlines():
            body = MATH.sub(" ", RAW.sub(" ", line))
            if not ESCAPED.search(body):
                continue
            where = "bibliography" if BIB.search(line) else "prose"
            for m in ESCAPED.finditer(body):
                table[(where, m.group(0))] += 1
                papers[where].add(stem)
                sample.setdefault((where, m.group(0)),
                                  (stem, " ".join(body.split())[:110]))
    for (where, token), n in sorted(table.items(), key=lambda kv: (kv[0][0], -kv[1])):
        print("%-13s %-4s hits=%-5d papers=%d" % (where, token, n, len(papers[where])))
        stem, line = sample[(where, token)]
        print("      %s: %s" % (stem[:32], line))


if __name__ == "__main__":
    main()
