# -*- coding: utf-8 -*-
r"""Do the generated products still carry LaTeX that Typst will print as literal text?

A compile gate cannot see these: `\\textbf{...}` and `` `` `` are perfectly legal Typst *content*
-- they just print the backslash and the letters. So the list has to come from the products
themselves, from prose only: maths (`$...$`), canvas blocks and `#raw` quotes are excluded, since
inside them a backslash is either the maths channel's own spelling or the author's quoted source.
"""
import collections
import glob
import os
import re
import sys

ROOT = r"E:\math"

# what a LaTeX-ism looks like once it is sitting in Typst prose
CMD = re.compile(r"\\(?:textbf|textit|emph|texttt|text|mathrm|mathbf|boldsymbol|"
                 r"footnote|item|begin|end|ref|eqref|cref|cite|label|url|href|"
                 r"S|P|dag|ddag|backslash|newline|linebreak|centering|noindent|"
                 r"quad|qquad|hspace|vspace|kern)\b")
QUOTE = re.compile(r"``|''")
BREAK = re.compile(r"\\\\\s")
MATH = re.compile(r"\$(?:[^$]|\$)*\$", re.S)
CANVAS = re.compile(r"#cetz\.canvas\(\{.*?^\s*\}\)", re.S | re.M)
RAW = re.compile(r"#raw\([^)]*\)")
ESCAPED = re.compile(r"\\[^A-Za-z]")


def prose(text):
    text = CANVAS.sub(" ", text)
    text = RAW.sub(" ", text)
    return MATH.sub(" ", text)


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    hits = collections.Counter()
    papers = collections.defaultdict(set)
    sample = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        for line in prose(open(path, encoding="utf-8", errors="replace").read()).splitlines():
            for kind, rx in (("latex command", CMD), ("latex quote pair", QUOTE),
                             ("latex line break", BREAK), ("other escaped char", ESCAPED)):
                for m in rx.finditer(line):
                    hits[kind] += 1
                    papers[kind].add(stem)
                    key = (kind, m.group(0))
                    if key not in sample:
                        sample[key] = (stem, " ".join(line.split())[:120])
    for kind, n in hits.most_common():
        print("%-22s hits=%-6d papers=%d" % (kind, n, len(papers[kind])))
        for (k, token), (stem, line) in sorted(sample.items()):
            if k == kind and hits[kind] <= 400:
                print("      %-14s %s: %s" % (token, stem[:30], line))


if __name__ == "__main__":
    main()
