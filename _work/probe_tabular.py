"""What does pandoc make of a tabular whose column spec uses @{} and p{0.28\\linewidth}?

Writes each variant into its own .tex, runs pandoc latex->json, and prints the block types
plus a short dump of the node that carries the row text.
"""
import json
import os
import subprocess
import sys

VARIANTS = {
    "at-p-linewidth": r"\begin{tabular}{@{}p{0.28\linewidth}p{0.66\linewidth}@{}}"
                      r"\hline Construction & Estimate \\ \hline Total & Seven \\ \end{tabular}",
    "plain-p": r"\begin{tabular}{p{0.28\linewidth}p{0.66\linewidth}}"
               r"Construction & Estimate \\ Total & Seven \\ \end{tabular}",
    "at-brace": r"\begin{tabular}{@{}p{4cm}@{}}Construction & Estimate \\ Total & Seven \\ \end{tabular}",
    "bare": r"\begin{tabular}{ll}Construction & Estimate \\ Total & Seven \\ \end{tabular}",
    "booktabs": r"\begin{tabular}{@{}p{0.28\linewidth}p{0.66\linewidth}@{}}"
                r"\toprule Construction & Estimate \\ \midrule Total & Seven \\ \bottomrule \end{tabular}",
    "multi-at": r"\begin{tabular}{@{}p{0.28\linewidth}p{0.66\linewidth}@{}}"
                r"Construction & Estimate \\ \multicolumn{2}{@{}l}{The prior} \\ Total & Seven \\ \end{tabular}",
    "multi-plain": r"\begin{tabular}{@{}p{0.28\linewidth}p{0.66\linewidth}@{}}"
                   r"Construction & Estimate \\ \multicolumn{2}{l}{The prior} \\ Total & Seven \\ \end{tabular}",
    "newline": r"\begin{tabular}{@{}p{0.28\linewidth}p{0.66\linewidth}@{}}"
               r"Construction & Estimate \\ Maximum\newline (Section~3) & Seven \\ \end{tabular}",
    "emph-cell": r"\begin{tabular}{@{}p{0.28\linewidth}p{0.66\linewidth}@{}}"
                 r"Construction & Estimate \\ \multicolumn{2}{@{}l}{\emph{The prior}} \\ Total & Seven \\ \end{tabular}",
    "small-float": r"\begin{table}[!ht]\small\begin{tabular}{@{}p{0.28\linewidth}p{0.66\linewidth}@{}}"
                   r"Construction & Estimate \\ \end{tabular}\end{table}",
}

os.makedirs("_work/tabprobe", exist_ok=True)
for name, tex in VARIANTS.items():
    path = "_work/tabprobe/%s.tex" % name
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(tex + "\n")
    out = path[:-4] + ".json"
    proc = subprocess.run([os.environ.get("PANDOC", "pandoc"), path, "-f", "latex",
                           "-t", "json", "-o", out],
                          capture_output=True, text=True, encoding="utf-8", timeout=120)
    if not os.path.exists(out):
        print("%-16s pandoc failed: %s" % (name, (proc.stderr or "").strip()[:160]))
        continue
    ast = json.load(open(out, encoding="utf-8"))
    types = [b["t"] for b in ast["blocks"]]
    print("%-16s blocks=%s" % (name, types))
    for block in ast["blocks"]:
        if block["t"] == "Table":
            _cap, cols, head, rows, foot = block["c"][1:]
            print("                 cols=%s head_rows=%d rows=%d" % (cols, len(head[1]), len(rows)))
        else:
            print("                 %s" % json.dumps(block, ensure_ascii=False)[:200])
