r"""Rebuild only the papers #77's widened trigger changes.

The products list comes from `_work/probe77_churn.py`'s stub diff (old trigger vs new, same base), so
the queue is the measured churn face -- 52 papers -- not the whole corpus.
"""
import io
import os
import sys
import time
from concurrent.futures import ThreadPoolExecutor

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")

from batch_typst import run

with io.open(os.path.join(ROOT, "_work", "regen77.txt"), encoding="utf-8") as f:
    names = [line.strip() for line in f if line.strip()]
items = [(n, os.path.join(ROOT, "_work", "flat", n + ".tex")) for n in names]
print("queue: %d papers" % len(items), flush=True)
start = time.time()
with ThreadPoolExecutor(12) as pool:
    reports = list(pool.map(run, items))
print("done %d/%d compile_ok elapsed=%.0fs" % (sum(r.get("compile_ok") for r in reports),
                                               len(reports), time.time() - start))
for r in reports:
    if not r.get("compile_ok"):
        print("  FAILED %s | %s" % (r.get("paper"), str(r.get("error"))[:120]))
