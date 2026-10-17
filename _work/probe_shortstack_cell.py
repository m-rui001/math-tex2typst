r"""Does `\\shortstack{}` reach pandoc at all, and where does the corpus use it?

A-spectral-gap's figure 1 now draws as a table, but two of its rows came out empty: the source cells are
`\\shortstack{\\(\\Downarrow\\)\\quad terminal gap on good paths\\\\[2pt] $...$}` -- a stack of lines
inside one cell. The thin blank row between the first and third boxes is the `\\multicolumn{2}{c}{\\shortstack{…}}`
above the diagram. So the question is whether pandoc keeps `\\shortstack` content in a cell, and if not,
how many cells in the corpus are written that way.
"""
import glob
import json
import os
import re
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PANDOC = os.environ.get("PANDOC", "pandoc")
SHORTSTACK = re.compile(r"\\shortstack\s*\*?\s*\[?[ltc]?\]?\s*\{")


def words(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        out = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"],
                             capture_output=True).stdout
        ast = json.loads(out.decode("utf-8", "replace"))
    text = json.dumps(ast, ensure_ascii=False)
    tabs = len([t for t in _walk(ast["blocks"]) if t.get("t") == "Table"])
    return tabs, text


def _walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def main():
    cases = [
        ("shortstack in a cell",
         "\\begin{tabular}{cc}\\shortstack{Alpha text\\\\ $x+1$} & B \\end{tabular}"),
        ("same content, no shortstack",
         "\\begin{tabular}{cc}Alpha text $x+1$ & B \\end{tabular}"),
        ("shortstack with math only",
         "\\begin{tabular}{cc}\\shortstack{terminal gap on good paths\\\\ $y$} & B \\end{tabular}"),
    ]
    for label, src in cases:
        tabs, text = words(src)
        print("%-28s -> Table %d | 'Alpha text' %s | 'terminal gap' %s"
              % (label, tabs, "kept" if "Alpha" in text else "LOST",
                 "kept" if "terminal" in text else "LOST"))
    total = papers = 0
    in_tabular = 0
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        src = open(path, encoding="utf-8", errors="replace").read()
        hits = len(SHORTSTACK.findall(src))
        if not hits:
            continue
        total += hits
        papers += 1
        in_tabular += len(re.findall(r"\\shortstack[^&\\\\]*?\\\\", src))
    print("\\shortstack uses in the flat sources: %d over %d papers" % (total, papers))


if __name__ == "__main__":
    main()
