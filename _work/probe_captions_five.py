r"""Convert the five caption-losing papers on their own and see which captions came back.

A full corpus run costs six minutes and this question is local: does the stand-in body put the
trailing caption on the page, and do the other four sites share the mechanism. Each paper is run
through the converter into a scratch directory, and the caption's prose words are looked for in the
generated page text the same way _work/caption_page_report.py looks for them.
"""
import os
import re
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
OUT = os.path.join(ROOT, "_work", "_probe_captions")
MISMATCH = re.compile(r"\\caption\b\s*(?:\[[^\]]*\])?\s*\{")
MATH = re.compile(r"\$[^$]*\$|\\\([\s\S]*?\\\)|\\\[[\s\S]*?\\\]")
CMD = re.compile(r"\\[a-zA-Z@]+\*?(?:\s*(?:\[[^\]]*\]|\{[^{}]*\}))*")
PAPERS = [
    "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026",
    "An-Irrational-Trace-Counterexample-to-Reduced-Baum-Connes-September-23-2026",
    "Finite-angular-cylinder-covers-below-the-half-area-bound-September-27-2026",
    "Strongly-rational-unitary-vertex-operator-algebras-September-26-2026",
    "The-Deligne-Drinfeld-conjecture-September-23-2026",
]


def prose(text):
    text = MATH.sub(" ", CMD.sub(" ", text))
    return re.sub(r"[^a-zA-Z ]+", " ", text).split()


def main():
    shutil.rmtree(OUT, ignore_errors=True)
    os.makedirs(OUT, exist_ok=True)
    for paper in PAPERS:
        src = os.path.join(FLAT, "%s.tex" % paper)
        if not os.path.exists(src):
            cands = [d[:-4] for d in os.listdir(FLAT) if d.startswith(paper[:40])]
            if not cands:
                print("!! no flat source for %s" % paper[:40])
                continue
            paper = cands[0]
            src = os.path.join(FLAT, "%s.tex" % paper)
        out = os.path.join(OUT, paper)
        os.makedirs(out, exist_ok=True)
        res = convert.convert_paper(src, out, paper)
        typ_path = os.path.join(out, "main.typ")
        if not res.get("ok") or not os.path.exists(typ_path):
            print("!! %s: convert ok=%s stage=%s" % (paper[:40], res.get("ok"), res.get("stage")))
            continue
        typ = open(typ_path, encoding="utf-8", errors="replace").read()
        page = re.sub(r"[^a-zA-Z ]+", " ", typ).split()
        page = " ".join(page)
        body = open(src, encoding="utf-8", errors="replace").read()
        lost = []
        for m in MISMATCH.finditer(body):
            inner, _ = cetz.bracketed(body, m.end() - 1)
            words = prose(inner)
            if len(words) < 4:
                continue
            needle = " ".join(words[:4])
            if needle not in page:
                lost.append(needle)
        print("%-44s ok labels=%s missing=%d %r" % (paper[:44], res.get("labels"), len(lost), lost[:2]))


main()
