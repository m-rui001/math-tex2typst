import sys
sys.path.insert(0, "tools")
sys.stdout.reconfigure(errors="replace")
from t2t import prep

src = r"""
\begin{figure}[!htb]
  \centering
  \begin{minipage}[t]{0.48\linewidth}
    \begin{tikzpicture}[x=0.205\linewidth,y=0.205\linewidth,font=\scriptsize]
      \node[text width=0.5\linewidth] at (0,0) {hi};
      \draw (0,0) -- (\linewidth, 1);
    \end{tikzpicture}
  \end{minipage}
  \begin{minipage}[t]{0.5\linewidth}
    \begin{tikzpicture}[x=\textwidth]
      \draw (0,0) -- (1,1);
    \end{tikzpicture}
  \end{minipage}
\end{figure}
\begin{tikzpicture}[x=0.3\linewidth]
  \draw (0,0) -- (1,1);
\end{tikzpicture}
"""
out = prep.scale_linewidth_in_minipages(src)
for line in out.splitlines():
    if "linewidth" in line or "textwidth" in line:
        print(line.strip())
