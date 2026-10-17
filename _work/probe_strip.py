"""strip_comments: real TeX comments still go, percent-encoded URLs stay.

Run: python _work/probe_strip.py
"""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from inventory import strip_comments  # noqa: E402

CASES = [
    (r"\href{https://x.org/a/%5B4%5D.pdf}{arXiv}. % note",
     r"\href{https://x.org/a/%5B4%5D.pdf}{arXiv}. "),
    (r"a % comment", "a "),
    (r"100\% sure", r"100\% sure"),
    (r"\url{http://e/x?a=1&b=%7B%7D} and % cut", r"\url{http://e/x?a=1&b=%7B%7D} and "),
    (r"\href{u}{a {nested} b} % c", r"\href{u}{a {nested} b} "),
    (r"% whole line", ""),
    (r"\includegraphics[width=3cm]{fig/a%20b.png} %",
     r"\includegraphics[width=3cm]{fig/a%20b.png} "),
    (r"\href{https://x.org/a/%5B4%5D.pdf", r"\href{https://x.org/a/%5B4%5D.pdf"),
    (r"x=\frac{a%b}{c} % note", "x=\\frac{a"),  # a bare % outside a link really is TeX
]
bad = 0
for src, want in CASES:
    got = strip_comments(src)
    if got != want:
        bad += 1
        print("FAIL %r -> %r (want %r)" % (src, got, want))
print("cases=%d failures=%d" % (len(CASES), bad))
