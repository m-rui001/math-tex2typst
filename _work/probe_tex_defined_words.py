r"""Ask TeX which of the quoted words in figure maths are real control sequences.

A quoted word inside maths prints its own letters, so ``$q "longleftrightarrow" q'$``
shows the word where the source had a double arrow.  That is a loss only when the word
is a command TeX actually defines: ``\tr`` is not (the author wrote ``\operatorname{tr}``
and upright "tr" is the correct rendering), ``\simeq`` is.  pdflatex answers the question
for every candidate in one run instead of a hand-kept table.
"""
import glob
import os
import re
import subprocess
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
OUT = os.path.join(ROOT, "_work", "cscheck")
CONTENT = re.compile(r"^\s*content\(\([^)]*\),\s*\[(.*)\]\s*\)\s*$")
BOXMATH = re.compile(r"#box\([^)]*\[\$")
QUOTED = re.compile(r'"([A-Za-z][A-Za-z0-9]{1,20})"')
MATH = re.compile(r"\$([^$]*)\$", re.S)
PREAMBLE = r"""\documentclass{article}
\begin{document}
\newwrite\out
\immediate\openout\out=words.txt
\makeatletter
\newcommand\chk[1]{\expandafter\ifcsname#1\endcsname
  \expandafter\ifx\csname#1\endcsname\relax
    \immediate\write\out{NO\space #1}\else
    \immediate\write\out{YES\space #1}\fi\else
  \immediate\write\out{NO\space #1}\fi}
\makeatother
"""


def figure_words():
    """(word -> occurrences) inside canvas text, and the same for every math region."""
    fig, allm = Counter(), Counter()
    for tpath in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        text = open(tpath, encoding="utf-8", errors="replace").read()
        for line in text.splitlines():
            m = CONTENT.match(line)
            if not m:
                continue
            for reg in MATH.finditer(m.group(1)):
                for w in QUOTED.findall(reg.group(1)):
                    fig[w] += 1
        for reg in MATH.finditer(text):
            for w in QUOTED.findall(reg.group(1)):
                allm[w] += 1
    return fig, allm


def main():
    if not os.path.isdir(OUT):
        os.makedirs(OUT)
    fig, allm = figure_words()
    print("figure content(): %d distinct quoted words, %d occurrences"
          % (len(fig), sum(fig.values())))
    words = sorted(set(fig) | set(allm))
    tex = [PREAMBLE]
    tex += ["\\chk{%s}" % w for w in words]
    tex += ["\\immediate\\closeout\\out", "\\end{document}", ""]
    open(os.path.join(OUT, "chk.tex"), "w", encoding="ascii").write("\n".join(tex))
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                        OUT, os.path.join(OUT, "chk.tex")], capture_output=True, cwd=OUT)
    lines = open(os.path.join(OUT, "words.txt"), encoding="ascii").read().splitlines()
    defined, undef = {}, []
    for line in lines:
        parts = line.split()
        if len(parts) != 2:
            continue
        verdict, w = parts
        if verdict == "YES":
            defined[w] = "DEF"
        else:
            undef.append(w)
    fig_leaks = {w: n for w, n in fig.items() if w in defined}
    all_leaks = {w: n for w, n in allm.items() if w in defined}
    print("TeX-defined: %d of %d candidates" % (len(defined), len(words)))
    print("\n== leaked command names in FIGURE text: %d distinct, %d occurrences"
          % (len(fig_leaks), sum(fig_leaks.values())))
    for w, n in sorted(fig_leaks.items(), key=lambda kv: -kv[1]):
        print("   %-18s %4d" % (w, n))
    print("\n== whole-corpus maths: %d distinct, %d occurrences, top 40"
          % (len(all_leaks), sum(all_leaks.values())))
    print("   " + " ".join("%s(%d)" % (w, n) for w, n in
                           sorted(all_leaks.items(), key=lambda kv: -kv[1])[:40]))


if __name__ == "__main__":
    main()
