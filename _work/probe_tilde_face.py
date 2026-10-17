r"""Split the page-side `tilde` family (#77) into the faces that need different fixes.

`_work/probe_page_syntax_tokens.py` counts 415 `~` over 224 papers but cannot say which of them is a
defect: `Vol.~II` in a bibliography entry should be a space, while `.../~hatcher/AT/AT.pdf` is a URL
that is *supposed* to print a tilde. This probe takes each printed occurrence, classes the token, and
attributes it by searching the literal token in that paper's `refs.bib` and `main.typ`. Judgement is
the combination, not the count.
"""
import io
import os
import re
import sys
from collections import Counter, defaultdict

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")

NAMED = re.compile(r"^(?:Vol|No|Fig|Figs|Sec|Sect|Thm|Thm|Lem|Cor|Prop|Eq|Eqs|Ref|pp|p|Ed|Eds|"
                   r"Theorem|Lemma|Remark|Definition|Exercise|Chapter)\.?[~]", re.I)


def class_of(token):
    if "://" in token or ("/" in token and "." in token):
        return "url"
    if NAMED.match(token):
        return "named-ref"
    if token.startswith("~") or token.endswith("~"):
        return "spaced"
    if "~" in token[1:-1]:
        return "tight"
    return "edge"


def main():
    import pymupdf

    klasses = Counter()
    by_class_paper = defaultdict(set)
    attr = Counter()
    attr_paper = defaultdict(set)
    samples = defaultdict(list)
    papers = sorted(d for d in os.listdir(TYPST) if os.path.isdir(os.path.join(TYPST, d)))
    for name in papers:
        pdf = os.path.join(TYPST, name, "main.pdf")
        if not os.path.exists(pdf):
            continue
        bib = ""
        typ = ""
        for fn, box in (("refs.bib", "bib"), ("main.typ", "typ")):
            p = os.path.join(TYPST, name, fn)
            if os.path.exists(p):
                with io.open(p, encoding="utf-8", errors="replace") as f:
                    txt = f.read()
                if box == "bib":
                    bib = txt
                else:
                    typ = txt
        doc = pymupdf.open(pdf)
        for pno, page in enumerate(doc, 1):
            for line in page.get_text("text").split("\n"):
                s = line.strip()
                if "~" not in s:
                    continue
                for tok in s.split():
                    if "~" not in tok:
                        continue
                    k = class_of(tok)
                    klasses[k] += 1
                    by_class_paper[k].add(name)
                    in_bib = tok in bib
                    in_typ = tok in typ
                    a = ("bib" if in_bib else "") + ("+typ" if in_typ else "")
                    a = a.strip("+") or "neither"
                    attr[(k, a)] += 1
                    attr_paper[(k, a)].add(name)
                    if len(samples[(k, a)]) < 6:
                        samples[(k, a)].append((name, pno, tok))
        doc.close()

    print("occurrences by class:")
    for k, v in klasses.most_common():
        print("  %-10s %4d 处 / %3d 篇" % (k, v, len(by_class_paper[k])))
    print("\noccurrences by (class, where the literal lives):")
    for (k, a), v in sorted(attr.items(), key=lambda x: -x[1]):
        print("  %-10s %-8s %4d 处 / %3d 篇" % (k, a, v, len(attr_paper[(k, a)])))
    print("\nsamples:")
    for (k, a), ss in sorted(samples.items(), key=lambda x: -attr[x[0]]):
        for name, pno, tok in ss:
            print("  %-10s %-8s %-44s p%-3d %s" % (k, a, name, pno, tok[:90]))


main()
