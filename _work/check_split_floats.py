"""The multi-caption float split: words conserved, environments balanced, Heisenberg covered."""
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import prep

ROOT = pathlib.Path(__file__).resolve().parents[1]
CAPTION = re.compile(r"\\caption\b")
BEGIN = re.compile(r"\\begin\{(figure|table)\*?\}")
END = re.compile(r"\\end\{(figure|table)\*?\}")

touched = unbalanced = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    body = path.read_text(encoding="utf-8", errors="replace")
    lifted = prep.lift_captions(body)
    if len(CAPTION.findall(lifted)) != len(CAPTION.findall(body)):
        print("LOST CAPTION WORDS: %s" % path.stem[:44])
    # a machine-written source can carry a stray \end{table} of its own, so what matters is
    # that the rule does not change the balance, not that the balance is zero
    drift = (len(BEGIN.findall(body)) - len(END.findall(body))
             - len(BEGIN.findall(lifted)) + len(END.findall(lifted)))
    if drift:
        unbalanced += 1
        print("RULE CHANGED float balance by %d: %s" % (drift, path.stem[:44]))
    if lifted != body:
        touched += 1
print("papers the rule touches: %d ; balance changed by the rule: %d" % (touched, unbalanced))

src = (ROOT / "_work" / "flat" / "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain"
       "-September-24-2026.tex").read_text(encoding="utf-8", errors="replace")
lifted = prep.lift_captions(src)
for name in ("apptr:entry-table", "apptr:endpoint-table", "apptr:coupling-table"):
    print("%-24s before %s  after %s" % (name, src.count("\\label{%s}" % name),
                                         lifted.count("\\label{%s}" % name)))
print("floats before %d after %d" % (len(BEGIN.findall(src)), len(BEGIN.findall(lifted))))
