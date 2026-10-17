r"""End-to-end check of the `\hspace` length round trip through the real maths channel.

Calls `mathconv.convert_formulas` -- the same entry `convert.py` uses -- so clean(), the batch,
pandoc and `tex_space_values` all run exactly as they do for a paper. Each row is one spelling
whose old and new answers differ, plus the ones that must NOT move.

  python _work/probe87d_hspace_roundtrip.py
"""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import mathconv  # noqa: E402

CASES = [
    ("\\hspace{12mm}", r"a\hspace{12mm}b", "12mm absolute"),
    ("\\hspace{1cm}", r"a\hspace{1cm}b", "1cm absolute"),
    ("\\hspace{2em}", r"a\hspace{2em}b", "em, same unit both sides"),
    ("\\hspace{-1em}", r"a\hspace{-1em}b", "negative em (collides with the \\! token)"),
    ("\\hspace{12pt}", r"a\hspace{12pt}b", "TeX pt -> Typst pt scale"),
    ("\\hspace{0.5cm}", r"a\hspace{0.5cm}b", "fractional cm"),
    ("\\hspace{100pt}", r"a\hspace{100pt}b", "wide pt"),
    ("\\hspace{\\fill}", r"a\hspace{\fill}b", "elastic: must keep the old \\,"),
    ("\\hfill", r"a\hfill b", "elastic: must keep the old \\,"),
    ("\\;", r"a\;b", "the 5mu correction"),
    ("\\enspace", r"a\enspace b", "shares the token, read at the \\; price"),
    ("\\!", r"a\!b", "the #83 row, must not move"),
    ("\\,", r"a\,b", "thin, must not move"),
    ("\\:", r"a\:b", "med, must not move"),
    ("\\quad", r"a\quad b", "quad, must not move"),
    ("plain", r"a+b", "no spacing at all"),
]


def main():
    got, refused, err = mathconv.convert_formulas([c[1] for c in CASES], {})
    for i, (name, _src, note) in enumerate(CASES):
        out = got.get(i)
        print("  %-16s -> %-34s  %s" % (name, (out or ("REFUSED " + str(refused.get(i))))[:34], note))
    if err.strip():
        print("stderr:", err.strip()[:200])
    return 0


if __name__ == "__main__":
    sys.exit(main())
