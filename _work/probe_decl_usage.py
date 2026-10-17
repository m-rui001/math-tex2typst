r"""How the font-declaration commands are actually written in the flattened pictures."""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
CMDS = ["mathcal", "mathbb", "mathbf", "mathrm", "mathsf", "mathfrak", "mathit",
        "rm", "bf", "it", "sf", "tt", "bar", "overline", "widetilde", "widehat",
        "vec", "dot", "ddot", "hat", "tilde", "sqrt", "frac", "boldsymbol"]
# how the command is used: braced / bare-token / switch inside a group
USE = re.compile(r"\\(%s)(\s*\{|\s*[A-Za-z\\]|\s*[^A-Za-z{])" % "|".join(CMDS))


def main():
    sys.stdout.reconfigure(errors="replace")
    shape = Counter()
    samples = {}
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(text):
            for m in USE.finditer(p):
                cmd = m.group(1)
                nxt = m.group(2)
                if nxt.startswith("{"):
                    kind = "brace"
                elif re.match(r"\s*[A-Za-z]", nxt):
                    kind = "bare-token"
                else:
                    kind = "switch/other"
                shape[(cmd, kind)] += 1
                samples.setdefault((cmd, kind), p[max(0, m.start() - 15):m.start() + 25])
    for (cmd, kind), n in sorted(shape.items(), key=lambda kv: -kv[1]):
        print("  %-12s %-14s %4d   e.g. %r" % (cmd, kind, n, samples[(cmd, kind)]))


if __name__ == "__main__":
    main()
