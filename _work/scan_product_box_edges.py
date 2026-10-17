r"""Products-side closure for #69: does any emitted body still carry the TEXT edges over a maths body?

The law is `_box_edges(text)` = bounds/bounds whenever the body holds a `$`, cap-height/baseline
otherwise.  The churn that drove run132's regen list was measured on the STATIC basis
(`_work/probe69_churn.py` builds each `\begin{tikzpicture}` with `cetz.build` and no colours, no
declarations, no `\linewidth` axis), and "static diff is only a lower bound" has now bitten three
times (#45 four papers short, #63 six).  So the authority on whether the fix landed is the products
themselves, not the diff.

A regex over "the next 120 characters" is not the test either: the discriminator is a `$` ANYWHERE in
the body, so the body has to be taken by bracket matching from the `#align(…)[` that follows the set
rule.  Reports every stale (paper, line, body) triple and the papers holding one, so the difference
against `_work/regen_needed.txt` is the list still to rebuild.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

TEXT_EDGES = 'top-edge: "cap-height", bottom-edge: "baseline"'
MATH_EDGES = 'top-edge: "bounds", bottom-edge: "bounds"'
SET_RULE = re.compile(r'#set text\(hyphenate: false, ([^)]*)\);\s*')


def body_after(text, i):
    r"""The bracketed body that follows the set rule ending at `i`, or None."""
    j = text.find("[", i)
    if j < 0 or j - i > 120:
        return None
    depth, k = 0, j
    while k < len(text):
        c = text[k]
        if c == "\\":
            k += 2
            continue
        if c == "[":
            depth += 1
        elif c == "]":
            depth -= 1
            if depth == 0:
                return text[j + 1:k]
        k += 1
    return None


def main():
    stale = []
    math_edges = text_edges = no_edges = 0
    papers_stale = set()
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        src = open(path, encoding="utf-8", errors="replace").read()
        for m in SET_RULE.finditer(src):
            edges, body = m.group(1), body_after(src, m.end())
            if body is None:
                continue
            if edges == MATH_EDGES:
                math_edges += 1
            elif edges == TEXT_EDGES:
                text_edges += 1
                if "$" in body:
                    line = src.count("\n", 0, m.start()) + 1
                    stale.append((stem, line, body[:110].replace("\n", " ")))
                    papers_stale.add(stem)
            else:
                no_edges += 1
    print("bodies carrying bounds/bounds        : %d" % math_edges)
    print("bodies carrying cap-height/baseline  : %d" % text_edges)
    print("bodies carrying some other edge pair : %d" % no_edges)
    print("STALE (text edges over a body with a '$'): %d over %d papers"
          % (len(stale), len(papers_stale)))
    for stem, line, body in stale[:25]:
        print("  %s:%d  %s" % (stem[:44], line, body))
    if len(stale) > 25:
        print("  ... %d more" % (len(stale) - 25))
    print()
    print("papers: %s" % ", ".join(sorted(s[:40] for s in papers_stale)))
    regen = set()
    listing = os.path.join(ROOT, "_work", "regen_needed.txt")
    if os.path.exists(listing):
        for line in open(listing, encoding="utf-8"):
            if line.strip():
                regen.add(line.strip())
    print("run132 regen list: %d papers; stale papers NOT on it: %d"
          % (len(regen), len(papers_stale - regen)))
    for stem in sorted(papers_stale - regen):
        print("  missed: %s" % stem)


if __name__ == "__main__":
    main()
