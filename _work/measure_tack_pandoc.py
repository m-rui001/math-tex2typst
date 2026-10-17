"""What does pandoc's math channel do with the two double-barred tacks?"""
import subprocess
import sys
import tempfile
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

SRC = r"""
\begin{equation}
p \Vdash q \qquad r \vDash s \qquad t \models u \qquad v \vdash w
\end{equation}
"""

with tempfile.TemporaryDirectory() as d:
    src = Path(d, "m.tex")
    src.write_text(SRC, encoding="utf-8")
    proc = subprocess.run(["pandoc", "-f", "latex", "-t", "typst", str(src)],
                          capture_output=True, encoding="utf-8", errors="replace")
    print("rc", proc.returncode)
    print(proc.stdout)
    print("stderr:", proc.stderr[:500])
