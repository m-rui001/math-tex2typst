# -*- coding: utf-8 -*-
r"""Context of every `\hspace{<len>}` that `prep.PROSE_DIALECT` eats, and pandoc's prose answer.

Two questions decide the fix for B's 10-14 22:36 item 7-2:
  1. what are the 12 eaten sites, verbatim, and which are maths vs prose;
  2. if the branch is dropped, what does a *prose* `\hspace{<len>}` become downstream -- the
     19 prose sites already pass through untouched today, so the answer is on the page already.

  python _work/probe97c_eaten_context.py
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import probe87_math_spans as M  # noqa: E402
from t2t import prep, mathconv  # noqa: E402

HSPACE = re.compile(r"\\hspace\s*\{[^}]*\}")
EAT_RX = prep.PROSE_DIALECT[0][0]


def inside(pos, sp):
    return any(s <= pos < e for s, e in sp)


def main():
    flats = sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")))
    n_eat = 0
    print("=== eaten sites (ctx 34 chars each side) ===")
    for path in flats:
        stem = os.path.basename(path)[:-4]
        text = open(path, encoding="utf-8").read()
        sp = M.spans(text)
        eaten = {m.start(): m for m in EAT_RX.finditer(text)
                 if m.group(0).startswith("\\hspace")}
        if not eaten:
            continue
        for m in HSPACE.finditer(text):
            if m.start() not in eaten:
                continue
            n_eat += 1
            where = "MATH" if inside(m.start(), sp) else "PROSE"
            a, b = max(0, m.start() - 34), min(len(text), m.end() + 34)
            ctx = text[a:b].replace("\n", "\\n")
            print("  %-6s %-52s %s" % (where, stem[:52], ctx))
    print("eaten total = %d" % n_eat)

    print("\n=== pandoc oracle: prose vs maths `\\hspace{29mm}` ===")
    for label, src in (("prose", r"A\hspace{29mm}B"),
                       ("maths $..$", r"$A\hspace{29mm}B$"),
                       ("display \\[..\\]", r"\[A\hspace{29mm}B\]"),
                       ("prose unreadable", r"A\hspace{\fill}B")):
        out, err = mathconv.run_pandoc(src)
        print("  %-16s %-26r -> %r%s" % (label, src, out.strip(),
                                         ("  ERR:" + err.strip()) if err.strip() else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main())
