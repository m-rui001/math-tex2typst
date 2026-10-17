r"""Which constructions does a node's own label actually carry?

The vertical ink law (#74) has to price shapes, and the discipline is to price only spellings the
corpus uses -- a table entry for a construct nobody writes is a mapping invented for a nonexistent
spelling. This walks every label a picture writes (`\node ... {..}`, `label={..}`, an in-path
`node {..}`) and counts the shapes a label is built from, so the prices that go into `cetz.py` are
the ones a reader can meet on a page.

Labels are read by BRACE MATCHING (`cetz.bracketed`), not by a nested quantifier: the first draft
of this probe wrote `(?:[^{}]*|\{[^{}]*\})*` over whole pictures and never returned.
"""
import collections
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

BRACE = "{"
NODE = re.compile(r"\\(?:node|coordinate)\b", re.S)
LABEL_OPT = re.compile(r"\\label\s*=")
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

SHAPES = [
    ("frac", re.compile(r"\\[dt]?frac")),
    ("sqrt", re.compile(r"\\sqrt")),
    ("int", re.compile(r"\\(?:oint|int)")),
    ("sum-prod", re.compile(r"\\(?:sum|prod|coprod)")),
    ("bigop-limits", re.compile(r"\\(?:lim|sup|inf|max|min)\b")),
    ("overline-bar", re.compile(r"\\(?:overline|bar)\b")),
    ("hat", re.compile(r"\\(?:hat|widehat)\b")),
    ("tilde", re.compile(r"\\(?:tilde|widetilde)\b")),
    ("dot-ddot", re.compile(r"\\(?:dot|ddot)\b")),
    ("vec", re.compile(r"\\vec\b")),
    ("accents-other", re.compile(r"\\(?:check|breve|acute|grave|mathring)\b")),
    ("left-right", re.compile(r"\\(?:left|right)\b")),
    ("big-delims", re.compile(r"\\[Bb]ig[gl]?[lr]?\b")),
    ("matrix-cases", re.compile(r"\\begin\{(?:pmatrix|bmatrix|matrix|vmatrix|cases|smallmatrix)\}")),
    ("array", re.compile(r"\\begin\{array\}")),
    ("text-mbox", re.compile(r"\\(?:text|textrm|textit|mbox|hbox)\s*\{")),
    ("operatorname", re.compile(r"\\operatorname")),
    ("mathbb", re.compile(r"\\mathbb")),
    ("mathcal", re.compile(r"\\mathcal")),
    ("mathbf-bf", re.compile(r"\\(?:mathbf|bm|boldsymbol)")),
    ("mathrm", re.compile(r"\\mathrm")),
    ("script-sup", re.compile(r"\^")),
    ("script-sub", re.compile(r"_(?![A-Za-z])")),
    ("delim-parens", re.compile(r"[()\[\]]")),
    ("delim-brace", re.compile(r"\\[\[\]{}]")),
    ("delim-angle", re.compile(r"\\(?:langle|rangle|vert|Vert|brace)\b")),
    ("binop", re.compile(r"[+=<>]")),
    ("comma", re.compile(r",")),
    ("newline", re.compile(r"\\\\\s*(?:\[|$)", re.M)),
    ("greek", re.compile(r"\\(?:alpha|beta|gamma|delta|epsilon|varepsilon|zeta|eta|theta|vartheta"
                         r"|iota|kappa|lambda|mu|nu|xi|pi|rho|sigma|tau|upsilon|phi|varphi|chi"
                         r"|psi|omega|Gamma|Delta|Theta|Lambda|Xi|Pi|Sigma|Upsilon|Phi|Psi|Omega)\b")),
    ("setrel", re.compile(r"\\(?:in|notin|subset|supset|cup|cap|emptyset|otimes|oplus|to|mapsto"
                          r"|rightarrow|longrightarrow|le|ge|ne|equiv|sim|approx)\b")),
    ("font-size-name", re.compile(r"\\(?:tiny|scriptsize|footnotesize|small|normalsize|large"
                                  r"|Large|LARGE|huge|Huge)\b")),
]


def _skip(s, i):
    while i < len(s) and s[i] in " \t\r\n":
        i += 1
    return i


def _balanced(s, i, open_ch, close_ch):
    """The end just past a [...] or (...) group starting at i, or i if nothing is there."""
    if i >= len(s) or s[i] != open_ch:
        return i
    depth = 0
    while i < len(s):
        if s[i] == open_ch:
            depth += 1
        elif s[i] == close_ch:
            depth -= 1
            if not depth:
                return i + 1
        i += 1
    return i


def _label_at(s, i):
    """The text of the {..} group a node statement writes, or None before its `;`.

    Between the keyword and its label sit whatever the author wrote -- `[options]`, a `(name)`, the
    words `at (2,3)`, `below=1cm of a` -- so the scan skips groups and words alike and stops at the
    first `{`, which is the label, or at a `;` or `,`, which means this node holds none.
    """
    stop = min(len(s), i + 400)
    while i < stop:
        i = _skip(s, i)
        if i >= stop or s[i] in ";,]":
            return None, i
        if s[i] == BRACE:
            inner, end = cetz.bracketed(s, i)
            return inner, end
        nxt = _balanced(s, i, "[", "]")
        if nxt == i:
            nxt = _balanced(s, i, "(", ")")
        i = nxt + 1 if nxt == i else nxt
    return None, i


def main():
    shape_count = collections.Counter()
    shape_papers = collections.defaultdict(set)
    plain_letters = 0
    total = mathy = 0
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        src = io.open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        paper = name[:-4]
        for pic in PICTURE.findall(src):
            for rx in (NODE, LABEL_OPT):
                for m in rx.finditer(pic):
                    label, _end = _label_at(pic, m.end())
                    if label is None:
                        continue
                    if not re.search(r"[A-Za-z]", label):
                        plain_letters += 1
                    if "$" in label or re.search(r"\\[A-Za-z]+", label):
                        mathy += 1
                    for key, rxs in SHAPES:
                        n = len(rxs.findall(label))
                        if n:
                            shape_count[key] += n
                            shape_papers[key].add(paper)
                    total += 1
    print("labels read: %d (with TeX or $: %d, no letters at all: %d)"
          % (total, mathy, plain_letters))
    print("%-20s %8s %8s" % ("shape", "count", "papers"))
    for key, _rx in SHAPES:
        print("%-20s %8d %8d" % (key, shape_count[key], len(shape_papers[key])))


if __name__ == "__main__":
    main()
