r"""Where does A-spectral-gap's figure-1 tabular stop being a table?

The float is a `figure` (not a `table`) whose body is a `tabular` of two columns of `\\[3pt]`-stacked
minipages wrapped in `\\fbox{}`. The product carries the preamble as a visible line and the cells
separated by literal `\\&`, so something between the source and the emitted figure lost the table.

Walk it outward-in: pandoc on the float alone, then pandoc on the float with `\\fbox` unwrapped, then
with the minipages unwrapped, then on a bare two-row tabular -- and report which step makes a Table
node appear. That names the construct pandoc chokes on, which is the only thing worth fixing.
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


def tables(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        proc = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"], capture_output=True)
        try:
            ast = json.loads(proc.stdout.decode("utf-8", "replace"))
        except Exception:                                            # noqa: BLE001
            return -1, proc.stderr.decode("utf-8", "replace")[:120]
        tab = [t for t in _walk(ast["blocks"]) if t.get("t") == "Table"]
        cells = sum(len(part) for t in tab for part in t["c"][3:6])
        # what the table actually holds: every Str inside it, and every Str outside it
        inside = _strings(tab[0]) if tab else ""
        outside = _strings([b for b in ast["blocks"] if b not in tab])
        text = json.dumps(ast, ensure_ascii=False)
        leaked = "@c" in text or "\\u0026" in text or '"&"' in text
        return (len(tab), cells, inside[:90], outside[:90],
                "text-leak" if leaked else "clean")


def _walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def _strings(nodes):
    out = []
    for n in _walk(nodes):
        if n.get("t") in ("Str", "Quoted", "Math"):
            c = n.get("c")
            out.append(c if isinstance(c, str) else json.dumps(c, ensure_ascii=False)[:40])
    return " ".join(out)


def main():
    src = open(os.path.join(ROOT, "_work", "flat", STEM + ".tex"),
               encoding="utf-8", errors="replace").read()
    floats = FLOAT.findall(src)
    print("figure floats in the source: %d" % len(floats))
    for i, f in enumerate(floats):
        if "tabular" not in f:
            continue
        print("\n--- float %d (%d chars, %d tabulars, %d fboxes, %d minipages)"
              % (i, len(f), f.count(r"\begin{tabular"), f.count(r"\fbox"),
                 f.count(r"\begin{minipage")))
        variants = [
            ("as written", f),
            ("unwrap_fbox", prep.unwrap_fbox(f)),
            ("no minipage", re.sub(r"\\begin\{minipage\}(?:\[[^\]]*\])?\{[^}]*\}", "{",
                                   prep.unwrap_fbox(f))),
            ("bare tabular", "\\begin{tabular}{cc}\nA & B \\\\\nC & D\n\\end{tabular}"),
        ]
        for label, v in variants:
            n, cells, ins, out, flag = tables(v)
            print("    %-16s -> Table %d rows %d | %s" % (label, n, cells, flag))
            print("        in-table: %s" % ins)
            print("        elsewher: %s" % out)
        break


if __name__ == "__main__":
    main()
