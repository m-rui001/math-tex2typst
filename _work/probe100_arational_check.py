# -*- coding: utf-8 -*-
r"""Which code built `A-rational-obstruction`'s product: old (branch present) or the new bake?

Also: does the old PROSE_DIALECT[0] really eat `&\hspace{1em}20,21`?

  python _work/probe100_arational_check.py
"""
import io
import os
import sys
import time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import prep  # noqa: E402

STEM = "A-rational-obstruction-to-strong-chromatic-splitting-at-height-three-September-25-2026"


def mtime(p):
    return time.strftime("%H:%M:%S", time.localtime(os.path.getmtime(p)))


def main():
    for rel in ("tools/t2t/convert.py", "tools/t2t/prep.py", "tools/t2t/mathconv.py",
                "typst/%s/main.typ" % STEM, "typst/%s/report.json" % STEM):
        p = os.path.join(ROOT, rel)
        print("  %-64s %s" % (rel, mtime(p) if os.path.exists(p) else "MISSING"))
    rx = prep.PROSE_DIALECT[0][0]
    for probe in (r"&\hspace{1em}20,21", r"&\hspace{1em},21", r"&\hspace{1em}20"):
        m = rx.search(probe)
        print("  regex on %-24r -> %r" % (probe, m.group(0) if m else None))
    return 0


if __name__ == "__main__":
    sys.exit(main())
