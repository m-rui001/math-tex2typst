r"""Which TeX-defined commands found as quoted words in figure maths really render a glyph.

pdflatex typesets one command per page; fitz reads the page back.  If the page text is the
command's own letters (``deg``, ``max``) then upright letters are a faithful rendering and
the quote is not a loss.  Anything else -- ``\simeq`` giving an ``~=`` glyph, ``\bar`` giving
an accented letter, ``\left`` giving nothing -- means the corpus prints a word where the
source had a symbol.
"""
import glob
import os
import re
import subprocess
import sys
from collections import Counter

import fitz
sys.stdout.reconfigure(errors="replace")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "glyphchk")
sys.path.insert(0, os.path.join(ROOT, "_work"))
from probe_tex_defined_words import figure_words  # noqa: E402
HEAD = "\\documentclass{article}\n\\begin{document}\n"


def main():
    if not os.path.isdir(OUT):
        os.makedirs(OUT)
    fig, allm = figure_words()
    words = sorted(fig)
    tex = [HEAD]
    tex += ["$\\csname %s\\endcsname a$\\par\\eject" % w for w in words]
    tex += ["\\end{document}", ""]
    open(os.path.join(OUT, "g.tex"), "w", encoding="ascii").write("\n".join(tex))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                    OUT, os.path.join(OUT, "g.tex")], capture_output=True, cwd=OUT)
    doc = os.path.join(OUT, "g.pdf")
    if not os.path.exists(doc):
        print("no pdf: run failed")
        print(open(os.path.join(OUT, "g.log"), encoding="utf-8", errors="replace")
              .read()[-2500:])
        return
    d = fitz.open(doc)
    letters, glyph, nothing = Counter(), Counter(), Counter()
    for i, w in enumerate(words):
        raw = d[i].get_text().strip() if i < d.page_count else ""
        txt = raw.splitlines()[0].strip() if raw else ""  # the page number is its own line
        body = txt[:-2] if txt.endswith(" a") else txt
        if body.lower() == w.lower():
            letters[w] += fig[w]
        elif body == "":
            nothing[w] += fig[w]
        else:
            glyph[w] += fig[w]
    print("figure quoted words: %d distinct, %d occurrences" % (len(words), sum(fig.values())))
    print("  render their own letters (operator name, faithful): %d words, %d occurrences"
          % (len(letters), sum(letters.values())))
    print("  render a glyph or accent (LOSS):                    %d words, %d occurrences"
          % (len(glyph), sum(glyph.values())))
    print("  render nothing (structural / failed):              %d words, %d occurrences"
          % (len(nothing), sum(nothing.values())))
    print("\n-- losses, by occurrences in figure text")
    for w, n in glyph.most_common(45):
        txt = d[words.index(w)].get_text().strip()
        print("   %-16s %4d   TeX gives %r" % (w, n, txt[:12]))
    print("\n-- render nothing")
    print("   " + " ".join("%s(%d)" % (w, n) for w, n in nothing.most_common(25)))


if __name__ == "__main__":
    main()
