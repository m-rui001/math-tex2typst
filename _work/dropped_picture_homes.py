r"""For every paper whose logged cetz_converted exceeds the canvases on the page, name each
picture's home in the source: inside a display equation, inside a float, or standing in the body.
That is where a drawing that the gate produced can still fail to reach the reader.

Read-only.
"""
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DISPLAY = re.compile(r"\\begin\{(equation|align|gather|multline|displaymath|eqnarray)\*?\}|\\\[")
CLOSE = re.compile(r"\\end\{(equation|align|gather|multline|displaymath|eqnarray)\*?\}|\\\]")
FIGURE = re.compile(r"\\begin\{figure\}")
ENDFIGURE = re.compile(r"\\end\{figure\}")

ledger = json.load(open(ROOT / "_work" / "canvas_ledger.json", encoding="utf-8"))
for r in ledger:
    if r["log_conv"] - r["page_canvas"] <= 0:
        continue
    src = pathlib.Path(r["source"]).read_text(encoding="utf-8", errors="replace")
    doc = src.find("\\begin{document}")
    print("== %s  log_conv=%d canvas=%d raw=%d token=%s"
          % (r["paper"][:46], r["log_conv"], r["page_canvas"], r["page_raw"], r["token"]))
    for i, m in enumerate(PICTURE.finditer(src)):
        before = src[:m.start()]
        opens, closes = len(DISPLAY.findall(before)), len(CLOSE.findall(before))
        figs, endfigs = len(FIGURE.findall(before)), len(ENDFIGURE.findall(before))
        home = []
        if opens > closes:
            home.append("display-math")
        if figs > endfigs:
            home.append("figure-float")
        if m.start() < doc:
            home.append("preamble")
        print("   #%d %-14s env=%s head=%s"
              % (i, ",".join(home) or "body", m.group(1),
                 " ".join(src[m.start():m.start() + 70].split())))
print("done")
