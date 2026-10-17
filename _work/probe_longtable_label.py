"""Where does pandoc's LaTeX reader leave a `\label` written on the caption row of a longtable?

The oracle is pandoc itself: one document, two shapes, and the Typst answer printed verbatim.
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import mathconv  # noqa: E402

CASES = {
    "longtable caption row": r"""
\begin{longtable}{@{}p{.3\linewidth}r@{}}
\caption{Sweep bounds.}\label{tbl:long}\\
\toprule
Input & Value\\
\midrule
a & 1\\
\bottomrule
\end{longtable}
""",
    "table float caption": r"""
\begin{table}\caption{Sweep bounds.}\label{tbl:float}\begin{tabular}{@{}p{.3\linewidth}r@{}}
\toprule
Input & Value\\
\midrule
a & 1\\
\bottomrule
\end{tabular}\end{table}
""",
}
for name, body in CASES.items():
    out, err = mathconv.run_pandoc(mathconv.BATCH_PREAMBLE + body + mathconv.BATCH_EPILOG,
                                   fmt_out="native")
    print("### %s" % name)
    print(out.strip()[:1400])
    if err.strip():
        print("   err:", err.strip()[:200])
    print()
