r"""Count the leaked command names after a change, by rebuilding every picture's canvas.

Reads the same TeX-defined word list the leak audit uses and counts quoted words left in the
built canvases' maths -- a name the table maps is marked and stays unquoted, so it is gone.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
CONTENT = re.compile(r"^\s*content\(\([^)]*\),\s*\[(.*)\]\s*\)\s*$")
QUOTED = re.compile(r'"([A-Za-z][A-Za-z0-9]{1,20})"')


def defined_words():
    out = set()
    with open(os.path.join(ROOT, "_work", "cscheck", "words.txt")) as fh:
        for line in fh:
            parts = line.split()
            if len(parts) == 2 and parts[0] == "YES":
                out.add(parts[1])
    return out


def main():
    defined = defined_words()
    counts = Counter()
    pics = refused = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(text):
            pics += 1
            got = cetz.build(p)
            if got is None:
                refused += 1
                continue
            for line in got.splitlines():
                m = CONTENT.match(line)
                if not m:
                    continue
                for w in QUOTED.findall(m.group(1)):
                    # a mapped name is never quoted (it is marked), so a quoted word the table
                    # still lacks is the real leak; `upright("in")` is an operator, not a leak
                    if w in defined and ("\\" + w) not in cetz.MATH_SYMBOLS:
                        counts[w] += 1
    print("pictures %d, refused %d" % (pics, refused))
    print("leaked (quoted, TeX-defined) words: %d names, %d occurrences"
          % (len(counts), sum(counts.values())))
    for w, n in counts.most_common(40):
        print("   %-20s %d" % (w, n))


if __name__ == "__main__":
    main()
