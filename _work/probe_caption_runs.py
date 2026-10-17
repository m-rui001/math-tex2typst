r"""Adjudicate the flagged captions: are the words off the page, or only off my matcher?

`caption_page_report.py` cuts maths and commands out of a source caption and then looks for the
remaining words next to each other in the page text. Typst renders the maths it removed as glyphs, so
a run that sat beside a formula in the source has extra tokens between its words on the page, and a
line break or a hyphenated word does the same. This matches each flagged run word by word with up to
four intervening page tokens allowed, which is what the caption would cost if it were really there.
A run that still fails is a loss; one that passes was my matcher.
"""
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
TYP = os.path.join(ROOT, "typst")
CAP = re.compile(r"\\caption\b\s*(?:\[[^\]]*\])?\s*\{")
MATH = re.compile(r"\$[^$]*\$|\\\([\s\S]*?\\\)|\\\[[\s\S]*?\\\]")
CMD = re.compile(r"\\[a-zA-Z@]+\*?(?:\s*(?:\[[^\]]*\]|\{[^{}]*\}))*")
PAPERS = sys.argv[1:] or []


def runs_of(text):
    out = []
    for chunk in MATH.split(CMD.sub(" ", text)):
        words = re.sub(r"[^a-zA-Z ]+", " ", chunk).split()
        if len(words) >= 3:
            out.append(words)
    return out


def tolerant(tokens, words, gap=4):
    """Can the words be walked in order, skipping at most `gap` tokens between neighbours?"""
    starts = [i for i, t in enumerate(tokens) if t == words[0]]
    for start in starts:
        pos = start
        for w in words[1:]:
            nxt = next((j for j in range(pos + 1, min(pos + gap + 1, len(tokens)))
                        if tokens[j] == w), None)
            if nxt is None:
                break
            pos = nxt
        else:
            return start
    return None


def main():
    for fn in sorted(os.listdir(FLAT)):
        if not fn.endswith(".tex"):
            continue
        paper = fn[:-4]
        if PAPERS and not any(p.lower() in paper.lower() for p in PAPERS):
            continue
        pdf_path = os.path.join(TYP, paper, "main.pdf")
        typ_path = os.path.join(TYP, paper, "main.typ")
        if not os.path.exists(pdf_path) or not os.path.exists(typ_path):
            continue
        body = open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
        tokens = re.sub(r"[^a-zA-Z ]+", " ", " ".join(
            p.get_text() for p in fitz.open(pdf_path))).split()
        typ_words = " ".join(re.sub(r"[^a-zA-Z ]+", " ", open(
            typ_path, encoding="utf-8", errors="replace").read()).split())
        for m in CAP.finditer(body):
            inner, _ = cetz.bracketed(body, m.end() - 1)
            for words in runs_of(inner):
                strict = " ".join(words[:4])
                if strict in typ_words and strict not in " ".join(tokens):
                    hit = tolerant(tokens, words[:4])
                    print("%-40s %-34s %s" % (
                        paper[:40], " ".join(words[:4])[:34],
                        "ON THE PAGE at token %d (matcher artifact)" % hit
                        if hit is not None else "ABSENT from the page (real loss)"))


main()
