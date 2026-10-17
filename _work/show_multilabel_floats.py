r"""Show every float in the two papers that drops a label, with its caption and label chain.

Read-only over _work/flat. The question is what the author wrote around each dropped label: whether
the extra \label sits under the same caption (LaTeX then numbers it from that caption, so it must
print the same number) or somewhere else entirely.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
FLOAT = re.compile(r"\\begin\{(figure|table)(\*?)\}.*?\\end\{\1\2\}", re.S)
LABEL = re.compile(r"\\label\{([^}]*)\}")
DROPPED = {"apptr:entry", "apptr:endpoint", "apptr:coupling-table", "fig:topology-compression"}

for tex in sorted(os.listdir(FLAT)):
    if not tex.endswith(".tex"):
        continue
    src = open(os.path.join(FLAT, tex), encoding="utf-8", errors="replace").read()
    hits = []
    for m in FLOAT.finditer(src):
        labels = LABEL.findall(m.group(0))
        if len(labels) > 1 and set(labels) & DROPPED:
            hits.append(m)
    if not hits:
        continue
    print("=== %s" % tex[:70])
    for m in hits:
        text = m.group(0)
        print("--- float (%d labels) len=%d" % (len(LABEL.findall(text)), len(text)))
        print(text[:1800])
        print("   [...rest %d chars]" % max(0, len(text) - 1800))
