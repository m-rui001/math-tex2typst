r"""Render a few converted tikzcd diagrams to a PNG so the drawings can be eyeballed.

Run: python _work/render_cd.py   (writes _work/cd_check.png)
"""
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import pymupdf
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzcd\}.*?\\end\{tikzcd\}", re.S)
WANT = {"hook": r"hook", "bend": r"bend", "equal": r"equal",
        "two-label": r'"[^"]*"\s*,\s*"[^"]*"', "diag3": r"\[ddl|\[rru"}

picked, seen = [], set()
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    for m in ENV.finditer(path.read_text(encoding="utf-8", errors="replace")):
        src = m.group(0)
        for name, pat in WANT.items():
            if name in seen or not re.search(pat, src):
                continue
            canvas = cetz.build_cd(src)
            if canvas and cetz.sane(canvas) and cetz.compiles(canvas):
                picked.append((name, src, canvas))
                seen.add(name)

print("picked:", [n for n, _s, _c in picked])
missing = [n for n in WANT if n not in seen]
if missing:
    print("not found/picked:", missing)

body = cetz.HEADER + "\n"
for name, src, canvas in picked:
    body += '#page(width: 12cm, height: 8cm)[%s\n%s\n]\n' % (name, canvas)
typ = ROOT / "_work" / "cd_check.typ"
typ.write_text(body, encoding="utf-8")
proc = subprocess.run(["typst", "compile", str(typ), str(ROOT / "_work" / "cd_check.pdf")],
                      capture_output=True, text=True)
if proc.returncode:
    print(proc.stderr[:1500])
    sys.exit(1)
with pymupdf.open(str(ROOT / "_work" / "cd_check.pdf")) as doc:
    for i, page in enumerate(doc):
        page.get_pixmap(matrix=pymupdf.Matrix(2, 2)).save(str(ROOT / "_work" / ("cd_check-%d.png" % i)))
print("pages:", len(pymupdf.open(str(ROOT / "_work" / "cd_check.pdf"))))
