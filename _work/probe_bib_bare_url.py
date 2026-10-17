r"""#77's second face: does the pass we ALREADY run eat a URL's own tilde?

The plain writer keeps `\url{...}` verbatim (its tilde survives) but turns a BARE `https://x.edu/~y`
into `x.edu/<nbsp>y` -- a link broken in the reader's hand. Which of those two spellings live in the
fields `bib_field_spans` already reads is the number that decides whether a link mask is a real face
or a mapping for a spelling the corpus does not have.
"""
import io
import os
import re
import sys
from collections import Counter, defaultdict

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")

from t2t.convert import bib_field_spans

URLISH = re.compile(r"(?:https?|ftp|doi)://[^\s{}]+|[\w.-]+\.(?:edu|org|com|net|hu|uk|de|fr|jp|cn|ch|"
                    r"se|pl|cz|it|es|gov|gr|ru|at|be|ca|kr|nl|no|pt|ro|es)\.[a-z]{2,}/[^\s{}]*")


def main():
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    out = os.path.join(root, "typst")
    stats = Counter()
    papers = defaultdict(set)
    samples = []
    for name in sorted(os.listdir(out)):
        src = os.path.join(out, name, "refs.original.bib")
        if not os.path.isdir(os.path.join(out, name)) or not os.path.exists(src):
            continue
        with io.open(src, encoding="utf-8", errors="replace") as f:
            bib = f.read()
        for start, stop, value in bib_field_spans(bib):
            for m in URLISH.finditer(value):
                url = m.group(0)
                if "~" not in url:
                    continue
                # a URL the author wrapped in a TeX link macro is verbatim data for pandoc;
                # one written bare in the field's prose is TeX text, and `~` there is active.
                wrapped = m.start() > 0 and value[m.start() - 1] == "{"
                key = "bare-in-read-field" if not wrapped else "wrapped-in-read-field"
                stats[key] += url.count("~")
                papers[key].add(name)
                if not wrapped:
                    if len(samples) < 10:
                        samples.append((name, value[max(0, m.start() - 30):m.end() + 8]))
    for k in ("bare-in-read-field", "wrapped-in-read-field"):
        print("  %-22s %4d tildes / %3d papers" % (k, stats[k], len(papers[k])))
    print("\n  bare samples (URL typed straight into the field):")
    for name, ctx in samples:
        print("   %-40s %s" % (name[:40], ctx.replace("\n", " ")))


main()
