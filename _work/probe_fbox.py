import subprocess, sys, textwrap
sys.stdout.reconfigure(errors="replace")

BODIES = {
"raw": r"""\begin{figure}
\centering
\setlength{\fboxsep}{8pt}
\fbox{\begin{minipage}{.88\linewidth}\centering
\begin{minipage}[t]{.47\linewidth}\centering
Fixed network on arbitrary roles\\[2pt]
Strict saving and exact batches
\end{minipage}\hfill
\begin{minipage}[t]{.47\linewidth}\centering
Exact-width Fourier words\\[2pt]
Proposition 1
\end{minipage}\\[5pt]
\makebox[.47\linewidth]{$\searrow$}\hfill
\makebox[.47\linewidth]{$\swarrow$}\\[5pt]
Sector packing and synchronization
\end{minipage}}
\caption{The quantitative proof.}
\label{fig:proof-map}
\end{figure}
""",
"unwrapped": r"""\begin{figure}
\centering
\begin{minipage}{.88\linewidth}\centering
\begin{minipage}[t]{.47\linewidth}\centering
Fixed network on arbitrary roles\\[2pt]
Strict saving and exact batches
\end{minipage}\hfill
\begin{minipage}[t]{.47\linewidth}\centering
Exact-width Fourier words\\[2pt]
Proposition 1
\end{minipage}\\[5pt]
\makebox[.47\linewidth]{$\searrow$}\hfill
\makebox[.47\linewidth]{$\swarrow$}\\[5pt]
Sector packing and synchronization
\end{minipage}
\caption{The quantitative proof.}
\label{fig:proof-map}
\end{figure}
""",
"nomini": r"""\begin{figure}
\centering
Fixed network on arbitrary roles

Strict saving and exact batches

Exact-width Fourier words

Proposition 1

Sector packing and synchronization
\caption{The quantitative proof.}
\label{fig:proof-map}
\end{figure}
""",
}

for name, body in BODIES.items():
    p = subprocess.run(["pandoc", "-f", "latex", "-t", "native"],
                       input=body, capture_output=True, text=True, encoding="utf-8")
    print("=====", name)
    print(p.stdout[:1500])
    print("--- stderr:", p.stderr[:300])
