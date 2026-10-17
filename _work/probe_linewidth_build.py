"""Do the five `x=.98\linewidth` pictures build now, and what do their axes come to?

Feed each picture whose head `_transform` used to refuse through `cetz.build` with the width the
pipeline hands it (us-letter minus the margins this paper emits), and print the answer plus the first
emitted drawing call, so the number on the page can be compared with the author's intent.
"""
import re
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
BUILT = 0
for src in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = src.read_text(encoding="utf-8", errors="replace")
    if "linewidth" not in text and "textwidth" not in text:
        continue
    dst = ROOT / "typst" / src.stem / "main.typ"
    if not dst.is_file():
        continue
    pre = dst.read_text(encoding="utf-8", errors="replace")[:4000]
    page = re.search(r'#set page\((.*?)\)\n', pre)
    if not page:
        continue
    # the width convert.py passes is derived from the same margins the page line already shows
    wide = 16.51
    for m in re.finditer(r"margin: \(x: ([0-9.]+)pt, y: [0-9.]+pt\)", page.group(1)):
        wide = (612.0 - 2 * float(m.group(1))) * 2.54 / 72.0
    for pic in PICTURE.finditer(text):
        chunk = pic.group(0)
        if "linewidth" not in chunk and "textwidth" not in chunk:
            continue
        if cetz.build(chunk) is not None:
            continue
        got = cetz.build(chunk, line_cm=wide)
        tag = "BUILT" if got else "refused"
        BUILT += 1 if got else 0
        first = next((ln.strip() for ln in (got or "").splitlines() if "(" in ln and "canvas" not in ln), "")
        print("%s line=%.2fcm %-38s %s" % (tag, wide, src.stem[:38], first[:74]))
print("pictures that used to refuse on a page dimension and now build:", BUILT)
