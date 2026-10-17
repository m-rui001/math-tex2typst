r"""Print the stacked cells whose words the page gauge could not find, source line next to page text.

_work/probe_stacked_cell_page.py joins a line's words into one needle and looks for it in the
whitespace-stripped page. That is strict: a two-letter word the needle drops ("on"), or an inline
formula between two words, breaks the match even when every word is standing on the page. Print both
sides so the eye decides whether the gauge is wrong or the content really is missing.
"""
import glob
import os
import re
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
from probe_stacked_cell_page import STACKED, BREAK, WORD, group_end  # noqa: E402

TARGETS = {
    "A-Sharp-Threshold-*": "wholly",
    "A-spectral-gap-*": "entropy inequality",
    "The-Gaussian-Propeller-*": "elim",
    "The-sharp-exponential-*": "per unit",
}


def main():
    for pat, hint in TARGETS.items():
        matches = glob.glob(os.path.join(ROOT, "_work", "flat", pat + ".tex"))
        if len(matches) != 1:
            print("SKIP %s -> %d flat files" % (pat, len(matches)))
            continue
        path = matches[0]
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        i, found = 0, []
        while True:
            m = STACKED.search(src, i)
            if not m:
                break
            end = group_end(src, m.end() - 1)
            inner = src[m.end():end]
            for line in BREAK.split(inner):
                if hint.split()[0] in line:
                    found.append(line)
            i = end
        pdf = os.path.join(ROOT, "typst", stem, "main.pdf")
        doc = fitz.open(pdf)
        pagetext = "".join(p.get_text() for p in doc)
        doc.close()
        flat = re.sub(r"\s+", "", pagetext)
        print("\n=== %s" % stem[:60])
        for line in found:
            print("  src  |%s|" % line.strip()[:160])
            words = WORD.findall(re.sub(r"\\[A-Za-z]+\*?", " ",
                                        re.sub(r"\$[^$]*\$", " ", line)))
            for w in words:
                k = flat.find(w)
                print("         %-22s %s" % (w, "on page: …%s…" % flat[max(0, k - 12):k + 22]
                                             if k >= 0 else "NOT ON PAGE"))


if __name__ == "__main__":
    main()
