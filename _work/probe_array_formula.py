# Does the real figure formula convert now? One case: the array from fig:square, verbatim.
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
from t2t import mathconv

BODY = r"""\begin{array}{c|ccccc|l}
 &1&\cdots&b&\cdots&n&\text{row parameter}\\ \hline
 1&y_{11}&\cdots&\colorbox{blue!10}{$y_{1b}$}&\cdots&y_{1n}&E_1\\
 \vdots&\vdots&&\colorbox{blue!10}{$\vdots$}&&\vdots&\vdots\\
 b&\colorbox{green!12}{$y_{b1}$}&
   \colorbox{green!12}{$\cdots$}&
   \fcolorbox{black}{yellow!25}{$y_{bb}$}&
   \colorbox{green!12}{$\cdots$}&
   \colorbox{green!12}{$y_{bn}$}&E_b\\
 \vdots&\vdots&&\colorbox{blue!10}{$\vdots$}&&\vdots&\vdots\\
 n&y_{n1}&\cdots&\colorbox{blue!10}{$y_{nb}$}&\cdots&y_{nn}&E_n
\end{array}"""

res, fb, err = mathconv.convert_formulas([BODY])
if 0 in res:
    out = res[0]
    print("converted: %d chars" % len(out))
    print(out)
    print("leaked macros: %s" % sorted(set(re.findall(r"\\[a-zA-Z]+", out))))
else:
    print("STILL FALLS BACK")
    print((fb.get(0) or "")[:200])
if err:
    print("pandoc stderr: %s" % err[:400])
