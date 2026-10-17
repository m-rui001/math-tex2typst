r"""The three pictures that write `>=` somewhere other than their own option list.

450 of 453 declarations sit on `\begin{tikzpicture}[...]` (`_work/probe_tip_default_face.py`) and the
round reads exactly that place, so the handful below is what the fix leaves as it was. Print the
surrounding text so the ledger can say what they are instead of how many.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
HEAD = re.compile(r"\\begin\{tikzpicture\}\s*(\[[^\]]*\])", re.S)
GE = re.compile(r">=\s*(?:\{\s*([A-Za-z]+)\s*\}|([A-Za-z]+))")

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(src):
        vals = [a or b for a, b in GE.findall(pic)]
        if not vals:
            continue
        head = HEAD.match(pic)
        if head and ">=" in head.group(1):
            continue
        i = pic.find(">=")
        print("%s | ...%s..." % (path.stem[:44], pic[max(0, i - 90):i + 25].replace("\n", " ")))
