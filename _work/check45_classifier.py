r"""Does the #45 census classifier actually fire on the constructs it names?

`_work/census45.txt` reports 0 nodes for `limits`, `binom` and `matrix`.  Zero is a claim about the
corpus, and a regex that never matches also reports zero, so the three patterns get fed the spellings
they were written for before any of those counts is believed.
"""
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from probe45_anchor_tall_math import CLASSES, classify  # noqa: E402

SAMPLES = [
    r"$\sum_{k=1}^{n} k$",
    r"$\sum_k a_k$",
    r"$\int_0^1 f(x)\,dx$",
    r"$\max_{x \in K} \|f(x)\|$",
    r"$\lim_{n \to \infty} a_n$",
    r"$\binom{n}{k}$",
    r"$\dbinom{2n}{n}$",
    r"$\begin{pmatrix} a & b \\ c & d \end{pmatrix}$",
    r"$\begin{cases} 1 & x>0 \\ 0 & x\le 0 \end{cases}$",
    r"$\frac{a}{b}$",
    r"$\sqrt{n(p,0)}$",
    r"$A \overset{f}{\to} B$",
    r"$2R+\left\|v-w\right\|_\infty$",
    r"$A_1$\\$B_2$",
    "Abg\\\\Cde",
    r"$x_i^2$",
]
for s in SAMPLES:
    print("%-52s -> %s" % (s[:52], ",".join(classify(s))))
print()
for name, rx in CLASSES:
    print("%-11s %s" % (name, rx.pattern[:96]))
