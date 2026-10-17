r"""Which part of `\fbox{}` makes pandoc lose a tabular, and which part keeps it?

#28 unwrapped every `\fbox` because pandoc was measured to discard an unknown command together with
its braced argument.  In A-spectral-gap's figure 1 the opposite happens: the float as written reaches
pandoc as a Table with its cells, and the same float AFTER `unwrap_fbox` reaches it as loose text.  So
the rule "drop the wrapper, keep the group" is not a no-op inside a tabular cell.

Minimize it: a two-column tabular whose cell holds one of six spellings of the same content, each run
through pandoc, and report table-or-not plus the exact cell text that comes back.  That separates
"pandoc knows \fbox" from "pandoc knows minipage" from "a bare group in a cell is what breaks it" --
only one of them can be fixed by a conditional in `unwrap_fbox`.
"""
import json
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
PANDOC = os.environ.get("PANDOC", "pandoc")

CELLS = {
    "plain": "A",
    "fbox+word": r"\fbox{A}",
    "group+word": r"{A}",
    "fbox+minipage": r"\fbox{\begin{minipage}[c]{0.36\linewidth}A text\end{minipage}}",
    "group+minipage": r"{\begin{minipage}[c]{0.36\linewidth}A text\end{minipage}}",
    "bare minipage": r"\begin{minipage}[c]{0.36\linewidth}A text\end{minipage}",
    "fbox+tabular": r"\fbox{\begin{tabular}{l}A\\B\end{tabular}}",
}

TPL = r"""\documentclass{article}
\begin{document}
\begin{tabular}{cc}
%s & B \\
\end{tabular}
\end{document}
"""


def read(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write(src)
        proc = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"], capture_output=True)
        try:
            ast = json.loads(proc.stdout.decode("utf-8", "replace"))
        except Exception:                                            # noqa: BLE001
            return "PARSE-FAIL", proc.stderr.decode("utf-8", "replace")[:80]
        tab = [b for b in ast["blocks"] if b.get("t") == "Table"]
        if not tab:
            return "no table", _txt(ast["blocks"])[:70]
        rows = [r for part in tab[0]["c"][3:6] for r in part]
        first = rows[0][0] if rows and isinstance(rows[0], list) else (rows[0] if rows else [])
        cells = first["c"][0] if isinstance(first, dict) else first
        return "Table %dr" % len(rows), _txt(cells)[:70]


def _txt(node):
    if isinstance(node, dict):
        if node.get("t") in ("Str", "Space", "SoftBreak", "LineBreak", "Math"):
            c = node["c"]
            return c[0] + " " if isinstance(c, list) else c
        return "".join(_txt(v) for v in node.values())
    if isinstance(node, list):
        return " ".join(_txt(v) for v in node).replace("  ", " ").strip()
    return ""


def main():
    for label, cell in CELLS.items():
        kind, txt = read(TPL % cell)
        print("%-16s -> %-9s | %s" % (label, kind, txt))


if __name__ == "__main__":
    main()
