r"""Does pandoc read a tabular whose column preamble holds an `@{…}`?

`prep.fix_multicolumn_specs` already strips `@{…}` -- but only from `\multicolumn{n}{@{}l}{…}`, on
the recorded ground that pandoc's reader gives up on the whole table and re-emits the environment as
running text, preamble included. `A-spectral-gap-throughout…` fig. 1 shows the same failure one level
up: `\begin{tabular}{c@{\quad}c}` with no `@` in any multicolumn, and the product carries the mangled
preamble as a visible line (`[c\@c`) plus literal `\&` separators.

This asks pandoc directly, on a two-row table, for each spelling of a column spec, and reports which
ones come back as a Table node.
"""
import json
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

DOC = ("\\documentclass{article}\\begin{document}\n"
       "\\begin{table}\\centering\\begin{tabular}{%s}\nA & B \\\\\nC & D\n"
       "\\end{tabular}\\caption{T}\\end{table}\n\\end{document}\n")

SPECS = ["cc", "c@{\\quad}c", "c@{}c", "c!{\\quad}c", "|c|c|",
          ">{\\bfseries}cc", "c>{\\quad}lc", "p{3cm}c", "c@{\\,}c"]


def tables(node, out=None):
    out = [] if out is None else out
    if isinstance(node, dict):
        if node.get("t") == "Table":
            out.append(node)
        for v in node.values():
            tables(v, out)
    elif isinstance(node, list):
        for v in node:
            tables(v, out)
    return out


def main():
    pandoc = os.environ.get("PANDOC", "pandoc")
    for spec in SPECS:
        with tempfile.TemporaryDirectory() as d:
            src = os.path.join(d, "a.tex")
            open(src, "w", encoding="utf-8").write(DOC % spec)
            proc = subprocess.run([pandoc, src, "-f", "latex", "-t", "json"],
                                  capture_output=True)
            try:
                ast = json.loads(proc.stdout.decode("utf-8", "replace"))
            except Exception as e:                                    # noqa: BLE001
                print("%-18s no json: %s" % (spec, e))
                continue
            got = tables(ast["blocks"])
            # the failure shape is the environment coming back as plain text: look for the preamble
            # letters and an escaped `@` among the inline nodes
            dump = json.dumps(ast, ensure_ascii=False)
            leaked = "\\@" in dump or '"@{}l"' in dump
            print("%-18s Table nodes: %d   leaked-as-text: %s" % (spec, len(got), leaked))


if __name__ == "__main__":
    main()
