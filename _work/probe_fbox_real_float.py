r"""Print the real float, then bisect the `unwrap_fbox` regression on it.

The minimal tabular probe (`_work/probe_fbox_cell_variants.py`) could not reproduce the loss: all
seven spellings of one cell reach pandoc as a Table.  So the culprit is in this float's own text.
Print it, then walk the unwrapped version back to a table by peeling constructs off the outside
(shortest cell, one row, no `\\[3pt]`, no caption) and report which peel is the one that changes
Table into text.
"""
import json
import os
import re
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

from t2t import prep  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STEM = ("A-spectral-gap-throughout-the-high-temperature-"
        "Sherrington-Kirkpatrick-phase-September-24-2026")
FLOAT = re.compile(r"\\begin\{figure\}.*?\\end\{figure\}", re.S)
PANDOC = os.environ.get("PANDOC", "pandoc")


def kind(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        proc = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"], capture_output=True)
        try:
            ast = json.loads(proc.stdout.decode("utf-8", "replace"))
        except Exception:                                            # noqa: BLE001
            return "PARSE-FAIL"
        n = len([t for t in _walk(ast["blocks"]) if t.get("t") == "Table"])
        return "Table %d" % n if n else "no table"


def _walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def main():
    src = open(os.path.join(ROOT, "_work", "flat", STEM + ".tex"),
               encoding="utf-8", errors="replace").read()
    f = FLOAT.search(src).group(0)
    print("=== as written ===")
    print(f)
    print("=== peels (all applied to the UNWRAPPED text, which is the broken one) ===")
    u = prep.unwrap_fbox(f)
    print("%-28s -> %s" % ("unwrap_fbox", kind(u)))
    print("%-28s -> %s" % ("drop \\caption", kind(re.sub(r"\\caption\{.*?\}\s*", "", u, flags=re.S))))
    print("%-28s -> %s" % ("drop \\label", kind(re.sub(r"\\label\{[^}]*\}", "", u))))
    print("%-28s -> %s" % ("drop \\centering", kind(u.replace("\\centering", ""))))
    print("%-28s -> %s" % ("fbox kept", kind(f)))
    # the group left behind by the wrapper: put the command back one cell at a time
    cells = re.findall(r"\\fbox\{", f)
    half = f
    for i in range(len(cells)):
        half = half.replace(r"\fbox{", "{", 1)
        print("%-28s -> %s" % ("%d of %d wrappers dropped" % (i + 1, len(cells)), kind(half)))


if __name__ == "__main__":
    main()
