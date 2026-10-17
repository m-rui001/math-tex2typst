r"""What spelling of a multi-line cell does pandoc keep?

`\shortstack{A\\B}` loses both lines to pandoc (`_work/probe_shortstack_cell.py`: 34 uses over 11
papers, all their words gone).  The candidate replacements are the two ways LaTeX itself stacks lines
inside a cell -- a nested `tabular`, and a `array` in math mode -- plus the two ways Typst would want
it: a `\\` turned into a line break inside one cell, and a `makecell` macro.  Judge each by whether the
words come back AND the outer environment is still read as a Table.
"""
import json
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
PANDOC = os.environ.get("PANDOC", "pandoc")
CELLS = {
    "shortstack": r"\shortstack{Alpha text\\ $x+1$}",
    "nested tabular": r"\begin{tabular}[t]{@{}l@{}}Alpha text\\ $x+1$\end{tabular}",
    "math array": r"$\begin{array}{l}\text{Alpha text}\\ x+1\end{array}$",
    "newline cmd": r"Alpha text\newline $x+1$",
    "makecell": r"\makecell[l]{Alpha text\\ $x+1$}",
    "stackrel-ish stack": r"Alpha text\\ $x+1$",
}
TPL = "\\begin{tabular}{cc}%s & B \\end{tabular}"


def run(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        out = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"],
                             capture_output=True).stdout
        ast = json.loads(out.decode("utf-8", "replace"))
    text = json.dumps(ast, ensure_ascii=False)
    tabs = [t for t in _walk(ast["blocks"]) if t.get("t") == "Table"]
    in_first = _words(tabs[0]) if tabs else ""
    return len(tabs), ("Alpha" in in_first), ("x" in in_first or "+1" in in_first), in_first[:46]


def _walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def _words(node):
    return " ".join(n["c"] for n in _walk(node) if n.get("t") == "Str")


def main():
    for label, cell in CELLS.items():
        n, has_text, has_math, preview = run(TPL % cell)
        print("%-18s -> Table %d | words %s | math %s | first table holds: %s"
              % (label, n, "kept" if has_text else "LOST",
                 "kept" if has_math else "LOST", preview))


if __name__ == "__main__":
    main()
