"""Does pandoc read `longtable` as a float itself, or does it need to be renamed first?

Feeds three minimal documents to pandoc -t json and prints the block types, so the promotion can be
built on what pandoc actually does rather than on a guess.
"""
import json
import subprocess
import tempfile
import pathlib

CASES = {
    "longtable": r"""
\documentclass{article}
\usepackage{longtable}
\begin{document}
\begin{longtable}{cc}
\caption{Cap one}\label{tab:a}\\
a & b \\
1 & 2 \\
\end{longtable}
\end{document}
""",
    "fixedfigure": r"""
\documentclass{article}
\begin{document}
\newenvironment{fixedfigure}{\begin{figure}}{\end{figure}}
\begin{fixedfigure}
\begin{tabular}{cc}a&b\end{tabular}
\caption{Cap two}\label{fig:b}
\end{fixedfigure}
\end{document}
""",
}

for name, doc in CASES.items():
    with tempfile.TemporaryDirectory() as tmp:
        src = pathlib.Path(tmp) / "t.tex"
        src.write_text(doc, encoding="utf-8")
        r = subprocess.run(["pandoc", str(src), "-f", "latex", "-t", "json"],
                           capture_output=True, text=True, encoding="utf-8")
    if r.returncode:
        print("%s: pandoc failed %s" % (name, r.stderr[:120]))
        continue
    ast = json.loads(r.stdout)
    types = [b["t"] for b in ast["blocks"]]
    print("%-12s blocks: %s" % (name, types))
    for b in ast["blocks"]:
        if b["t"] == "Table":
            cap = b["c"][1]
            txt = json.dumps(cap)[:80]
            print("    Table caption: %s" % txt)
