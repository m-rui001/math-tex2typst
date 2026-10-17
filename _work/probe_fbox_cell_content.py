r"""Does the float that keeps its table also keep its words?

`_work/probe_fbox_three_spellings.py` settled the structure question: on A-spectral-gap's figure 1 only
`keep` (the `\fbox` untouched) reaches pandoc as a Table, while `group` and `bare` both collapse to
text -- yet on #28's nested-tabular cell only `group`/`bare` give a Table.  A table whose cells are
empty is worse than text that has everything, so the pass criterion has to be per-cell content, not
table-ness.  Print, for each of the five boxes' own heading words, whether it is present in the AST
under each spelling, plus how many Str nodes sit inside the Table.
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
HEADINGS = ["Ordinary rarity", "Weighted-mean estimate", "Variance on bad paths",
            "Directional covariance estimate", "Total remaining variance"]


def run(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        proc = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"], capture_output=True)
        ast = json.loads(proc.stdout.decode("utf-8", "replace"))
    tabs = [t for t in _walk(ast["blocks"]) if t.get("t") == "Table"]
    in_tab = _flat(tabs[0]) if tabs else ""
    everywhere = _flat(ast["blocks"])
    return (len(tabs), in_tab, everywhere)


def _walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def _flat(node):
    return " ".join(n["c"] for n in _walk(node) if n.get("t") == "Str") \
        + " " + " ".join(n["c"][1] for n in _walk(node) if n.get("t") == "Math")


def main():
    src = open(os.path.join(ROOT, "_work", "flat", STEM + ".tex"),
               encoding="utf-8", errors="replace").read()
    f = FLOAT.search(src).group(0)
    variants = {"keep": f, "group": prep.unwrap_fbox(f),
                "bare": _bare(f)}
    for label, v in variants.items():
        n, in_tab, everywhere = run(v)
        held = sum(1 for h in HEADINGS if h in in_tab)
        anywhere = sum(1 for h in HEADINGS if h in everywhere)
        print("%-6s -> Table %d | headings inside the table: %d/5 | anywhere: %d/5"
              % (label, n, held, anywhere))
        for h in HEADINGS:
            print("        %-32s in-table %-5s anywhere %s"
                  % (h, h in in_tab, h in everywhere))


def _bare(src):
    m = re.search(r"\\fbox\s*\{", src)
    while m:
        end = _match(src, m.end())
        src = src[:m.start()] + src[m.end():end] + src[end + 1:]
        m = re.search(r"\\fbox\s*\{", src)
    return src


def _match(text, j):
    depth = 1
    while j < len(text) and depth:
        if text[j] == "{":
            depth += 1
        elif text[j] == "}":
            depth -= 1
        j += 1
    return j - 1


if __name__ == "__main__":
    main()
