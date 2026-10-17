r"""Check the two spellings TeX rejects are still refusals here: a bare `=` and `<>`.

Usage: python check_refuse.py
pdflatex (meas_pgfmath.tex) reports pgf's own error for both, so the converter must not invent a
value for them; \ifnum's `=` is TeX's sign and lives in the same table, so the two levels differ.
"""
import sys

sys.path.insert(0, r"E:\math\_work\pic-pgfmath")
from t2t import cetz

for text in ["3=3", "1=0", "3<>3", "2==1<1", "1+2<=10", "mod(8,5)", "floor(8/5)"]:
    print(repr(text), "->", cetz.expr(text))
