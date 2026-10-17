r"""Every distinct `\hspace{<len>}` (and star form) inside maths, plus the unit histogram.

Feeds the conversion table: only the units that actually occur need a row, and the units that
do NOT occur tell us how far the "read it or fall back to `\,`" gate has to reach.

  python _work/probe87c_hspace_units.py
"""
import collections
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import probe87_math_spans as B  # noqa: E402

HSPACE = re.compile(r"\\hspace(\*?)\s*\{([^{}]*)\}")
UNIT = re.compile(r"^([-+]?[0-9]*\.?[0-9]+)\s*(mm|cm|pt|in|bp|pc|em|ex|mu|sp)?$")


def main():
    per = collections.Counter()
    star = collections.Counter()
    units = collections.Counter()
    unreadable = collections.Counter()
    files = sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")))
    for path in files:
        text = io.open(path, encoding="utf-8", errors="replace").read()
        maths = "".join(text[a:b] for a, b in B.spans(text))
        for star_mark, arg in HSPACE.findall(maths):
            arg = arg.strip()
            per[arg] += 1
            star[star_mark] += 1
            m = UNIT.match(arg)
            if m:
                units[m.group(2) or "(bare)"] += 1
            else:
                unreadable[arg] += 1
    total = sum(per.values())
    print("in-maths \\hspace{} = %d  (star forms = %d, bare = %d)"
          % (total, star["*"], star[""]))
    print("-- units --")
    for u, n in units.most_common():
        print("  %-8s %4d" % (u, n))
    if unreadable:
        print("-- not a plain number+unit (%d) --" % sum(unreadable.values()))
        for a, n in unreadable.most_common(20):
            print("  %-24s %4d" % (a, n))
    print("-- all distinct lengths (%d) --" % len(per))
    for a, n in per.most_common():
        print("  %-16s %4d" % (a, n))


if __name__ == "__main__":
    sys.exit(main())
