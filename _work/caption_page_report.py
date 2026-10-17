r"""Which \caption words genuinely never reach the page?

The first version of this instrument took the caption as the text up to its first `}`, so a caption
carrying `$10^{-3}$` or `\cite{...}` was read as a mid-sentence fragment and then missed in the page
as a fragment too - the miss said nothing about the words. Here the argument is brace-matched whole,
its maths and commands cut out, and what remains is searched for in the rendered PDF text, where
Typst has already laid the caption out. A caption with no prose left after the cut is not a caption
this report can speak about, and is counted separately.
"""
import os
import re
import sys
import unicodedata

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
TYP = os.path.join(ROOT, "typst")
CAP = re.compile(r"\\caption\b\s*(?:\[[^\]]*\])?\s*\{")
MATH = re.compile(r"\$[^$]*\$|\\\([\s\S]*?\\\)|\\\[[\s\S]*?\\\]")
CMD = re.compile(r"\\[a-zA-Z@]+\*?(?:\s*(?:\[[^\]]*\]|\{[^{}]*\}))*")


def prose(text):
    """The caption's runs of prose words, maths and commands cut out of the middle.

    Stripping the maths makes two runs that the page separates by a formula look like one sentence,
    and a needle across that join is missing from any page - so each run is matched on its own.
    """
    runs = []
    for chunk in MATH.split(CMD.sub(" ", text)):
        words = re.sub(r"[^a-zA-Z ]+", " ", chunk).split()
        if len(words) >= 3:
            runs.append(words)
    return runs


def main():
    checked = missing = wordless = 0
    papers_hit = set()
    for fn in sorted(os.listdir(FLAT)):
        if not fn.endswith(".tex"):
            continue
        paper = fn[:-4]
        pdf_path = os.path.join(TYP, paper, "main.pdf")
        if not os.path.exists(pdf_path):
            continue
        body = open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
        typ_path = os.path.join(TYP, paper, "main.typ")
        typ = re.sub(r"[^a-zA-Z ]+", " ", open(typ_path, encoding="utf-8",
                                               errors="replace").read()) if os.path.exists(typ_path) else ""
        doc = fitz.open(pdf_path)
        # The page carries accents as one composed character ("\'etale" renders "étale"), while the
        # source spells an accent as a command whose letters survive the cut. Dropping non-ASCII from
        # the page would delete the very letter the source contributed ("tale" against "etale"), so
        # decompose the accents first and keep their base letters (measured on The-Margulis-Platonov).
        raw_text = "".join(p.get_text().replace("\xad", "") for p in doc)
        raw_text = unicodedata.normalize("NFKD", raw_text).encode("ascii", "ignore").decode()
        # Typst breaks a long word with a soft hyphen (U+00AD), which the page carries as an
        # invisible character; left in place it splits the word into two tokens and a caption that is
        # on the page reads as missing (measured: "simul\xadder" in Square-lattice-FK-interfaces)
        page_text = " ".join(re.sub(r"[^a-zA-Z ]+", " ", raw_text).split())
        # A caption that mixes prose with maths italic is extracted with gaps *inside* words
        # ("leave the i t f t 6" for "leave the interface at x = -6", measured on Polynomial-PEPS
        # page 45), so word adjacency is not something this match may assume: keep a space-free copy
        # of the page and match the run's letters against it.
        page_squashed = re.sub(r"[^a-zA-Z]", "", page_text).lower()
        doc.close()
        pos = 0
        while True:
            m = CAP.search(body, pos)
            if not m:
                break
            # the `{` sits at the end of the match; bracketed wants the index of it
            inner, end = cetz.bracketed(body, m.end() - 1)
            pos = m.end() + max(end - m.end(), 1)
            words = prose(inner)
            checked += 1
            if not words:
                wordless += 1
                continue
            lost_run = next((r for r in words
                             if "".join(r[:5]).lower() not in page_squashed
                             and "".join(r[:3]).lower() not in page_squashed), None)
            if lost_run:
                missing += 1
                papers_hit.add(paper)
                needle3 = " ".join(lost_run[:3])
                print("  MISSING %-42s %-38s in main.typ: %s"
                      % (paper[:42], needle3[:38], needle3 in re.sub(r"\s+", " ", typ)))
    print("captions brace-matched: %d (no prose to match: %d)" % (checked, wordless))
    print("not found in the rendered page: %d ; papers affected: %d" % (missing, len(papers_hit)))


main()
