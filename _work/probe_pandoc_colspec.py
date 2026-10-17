r"""What does pandoc hand the emitter for a tabular's columns?

`emit.tabular()` takes `cols` and uses only `len(cols)`, so whatever alignment the author wrote in
`\begin{tabular}{lcr}` is dropped and every cell lands left-aligned -- Typst's `table` defaults to
`left`, while a `c` column in LaTeX centers its cell. Before fixing that, print the ColSpec list
pandoc actually produces for `{lcr}` and for a spec-less `tabular`, in both a plain table and a
captioned one, because the spelling of `AlignDefault` and of the width decides how the mapping reads.
"""
import json
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
PANDOC = os.environ.get("PANDOC", "pandoc")

DOCS = {
    "lcr": "\\begin{tabular}{lcr} a & b & c \\end{tabular}",
    "cc": "\\begin{tabular}{cc} a & b \\\\ c & d \\end{tabular}",
    "nospec": "\\begin{tabular} a & b \\end{tabular}",
    "preamble-less": "\\begin{tabular}{ccc} \\multicolumn{2}{c}{x} & y \\end{tabular}",
    "captioned": ("\\begin{table}[htbp]\\caption{Cap.}\\begin{tabular}{cr} a & b \\end{tabular}"
                  "\\end{table}"),
    "multicolumn": ("\\begin{tabular}{lcr} \\multicolumn{2}{c}{wide} & r \\\\"
                    "\\cmidrule(lr){1-2} a & b & c \\end{tabular}"),
}


def walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from walk(v)


def main():
    for label, body in DOCS.items():
        with tempfile.TemporaryDirectory() as d:
            p = os.path.join(d, "a.tex")
            open(p, "w", encoding="utf-8").write(
                "\\documentclass{article}\\begin{document}\n" + body + "\n\\end{document}\n")
            proc = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"], capture_output=True)
            ast = json.loads(proc.stdout.decode("utf-8", "replace"))
        tables = [n for n in walk(ast["blocks"]) if n.get("t") == "Table"]
        print("\n%-16s -> %d Table" % (label, len(tables)))
        for t in tables:
            print("      cols: %s" % json.dumps(t["c"][2], ensure_ascii=False))
            print("      rest: %s" % json.dumps(t["c"][3:], ensure_ascii=False)[:420])


if __name__ == "__main__":
    main()
