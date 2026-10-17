"""Delete every .pdf/.png in the tree plus LaTeX byproducts and python caches.

Work logs (_work/*.log, batch_run*.log), readouts (.txt/.json) and scripts stay untouched: the
`.log` extension is how the ledger records a run, so it is never a byproduct here.

  python _work/_tidy_products.py          # count only, nothing removed
  python _work/_tidy_products.py --apply  # remove
"""
import os
import sys

root = os.path.abspath(os.getcwd())
SKIP_DIRS = {".git"}
IMAGE = (".pdf", ".png")
# pdflatex/latexmk leftovers, counted next to the .pdf they accompanied; `.log` deliberately absent
# (the ledger records a run as batch_run153.log), and so are `.out`/`.bbl` -- an arXiv source can
# legitimately ship a .bbl, and a probe can legitimately write a .out readout.
BYPRODUCT = (".aux", ".fls", ".fdb_latexmk", ".synctex.gz", ".lof", ".toc", ".blg")

apply = "--apply" in sys.argv
removed = {}
freed = 0
for dirpath, dirnames, filenames in os.walk(root, topdown=False):
    dirnames[:] = [d for d in dirnames if d not in SKIP_DIRS]
    for f in filenames:
        low = f.lower()
        e = os.path.splitext(low)[1]
        kind = None
        if e in IMAGE:
            kind = e
        elif any(low.endswith(x) for x in BYPRODUCT):
            kind = "latex-byproduct"
        p = os.path.join(dirpath, f)
        if kind is None:
            continue
        try:
            size = os.path.getsize(p)
        except OSError:
            continue
        removed[kind] = removed.get(kind, 0) + 1
        freed += size
        if apply:
            os.remove(p)
    if apply and os.path.basename(dirpath) in ("__pycache__", ".pytest_cache"):
        try:
            os.removedirs(dirpath)
        except OSError:
            pass

print("%s: %s" % ("APPLIED" if apply else "DRY RUN", ", ".join(
    "%s=%d" % (k, v) for k, v in sorted(removed.items()))))
print("files %d, %.2f GB" % (sum(removed.values()), freed / 2**30))
