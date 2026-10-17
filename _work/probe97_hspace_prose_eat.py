# -*- coding: utf-8 -*-
r"""How much of `\hspace{<len>}` does `prep.PROSE_DIALECT` eat?  (B's 10-14 22:36 item 7-2)

`PROSE_DIALECT[0]` is

    \\(?:newpage|...|hspace\s*\{[^}]*\}|...)\b

The trailing `\b` is meant to stop `\null` from matching inside `\nullable`, but the
`hspace{...}` branch ends on the closing `}`, which is a NON-word char -- so `\b` only fires
when the NEXT character is a word char (`[A-Za-z0-9_]`).  Hence

    \hspace{29mm}85   -> ` 85`      (the 29mm gap is deleted)
    \hspace{29mm},    -> kept

i.e. the branch eats exactly the sites where the gap is followed by text, and keeps the rest.
This probe walks every flat source and, for each `\hspace{<len>}`, records the character after
`}`, whether the site sits inside a maths span, and whether it sits inside a held-out picture
(tikzpicture/tikzcd/CD are lifted before fix_dialect_prose runs).  The eaten set is taken from
the real regex (`prep.PROSE_DIALECT[0][0].finditer`), not re-derived, so the reading is the
pipeline's own.

  python _work/probe97_hspace_prose_eat.py [--list]
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import probe87_math_spans as M  # noqa: E402
from t2t import prep  # noqa: E402

HSPACE = re.compile(r"\\hspace\s*\{[^}]*\}")
EAT_RX = prep.PROSE_DIALECT[0][0]
PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}")


def picture_spans(text):
    out = []
    for m in PIC.finditer(text):
        end = text.find("\\end{%s}" % m.group(1), m.end())
        out.append((m.start(), end if end >= 0 else len(text)))
    return out


def inside(pos, sp):
    return any(s <= pos < e for s, e in sp)


def main():
    show = "--list" in sys.argv
    flats = sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")))
    tot = eat = eat_math = eat_prose = eat_pic = 0
    keep = keep_math = 0
    papers = {}
    rows = []
    for path in flats:
        stem = os.path.basename(path)[:-4]
        text = open(path, encoding="utf-8").read()
        sp = M.spans(text)
        pics = picture_spans(text)
        eaten = [m for m in EAT_RX.finditer(text)
                 if m.group(0).startswith("\\hspace")]
        eaten_pos = {m.start() for m in eaten}
        n = e_m = e_p = e_pic = k_m = 0
        for m in HSPACE.finditer(text):
            n += 1
            math = inside(m.start(), sp)
            pic = inside(m.start(), pics)
            if m.start() in eaten_pos:
                e_m += 1 if math else 0
                e_p += 0 if math else 1
                e_pic += 1 if pic else 0
            else:
                k_m += 1 if math else 0
        tot += n
        eat += len(eaten)
        eat_math += e_m
        eat_prose += e_p
        eat_pic += e_pic
        keep += n - len(eaten)
        keep_math += k_m
        if eaten:
            papers[stem] = len(eaten)
            rows.append((len(eaten), stem, n, e_m, e_p))
    print("flat sources = %d" % len(flats))
    print(r"  \hspace{<len>} total        %4d in %d papers" % (tot, len(papers) or 0))
    print(r"  EATEN by PROSE_DIALECT      %4d  (math %d / prose %d; %d inside held-out pictures)"
          % (eat, eat_math, eat_prose, eat_pic))
    print(r"  kept (char after } is not a word char)  %4d  (of which math %d)" % (keep, keep_math))
    print("  papers with at least one eaten site: %d" % len(papers))
    if show:
        rows.sort(reverse=True)
        print("\n-- papers with eaten \\hspace{...} (eaten / total / in-math / in-prose) --")
        for e, stem, n, em, ep in rows:
            print("  %-58s %2d / %2d   math %d  prose %d" % (stem[:58], e, n, em, ep))
    return 0


if __name__ == "__main__":
    sys.exit(main())
