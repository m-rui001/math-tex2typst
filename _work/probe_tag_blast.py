"""Blast radius of the deeper `\\tag` read: which displays in the corpus carry a tag at all, and which
of those have the nesting that the old one-level regex missed.

`_tag_of` now matches braces instead of a fixed depth, so a paper whose tag was previously invisible
switches from an auto number to the author's tag. That is what LaTeX does, but the count is what tells
us how many pages change. Static: reads `_work/flat`, never touches typst.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit  # noqa: E402

DISPLAY = re.compile(r"\\\[.*?\\\]|\\begin\{(align|equation|gather|displaymath)\*?\}.*?\\end\{\1\*?\}",
                     re.S)
OLD = re.compile(r"\\tag\{((?:[^{}]|\{[^{}]*\})*)\}")

plain = deep = 0
deep_papers = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for m in DISPLAY.finditer(src):
        chunk = m.group(0)
        new = emit._tag_of(chunk)
        if not new:
            continue
        old = OLD.search(chunk)
        if old and old.group(1) == new:
            plain += 1
        else:
            deep += 1
            if len(deep_papers) < 8:
                deep_papers.append((path.name[:-4], new[:70]))

print("tags the old regex already read: %d ; newly readable (deeper nesting): %d" % (plain, deep))
for paper, tag in deep_papers:
    print("   %-44s %s" % (paper[:44], tag))
