"""The 12 files that still carry TeX control sequences, shown in full.

residue.py counts them and truncates the line; this prints each residue line whole, longest
first, so the shapes that need a real conversion are visible rather than guessed at.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
MACRO = re.compile(r"\\[A-Za-z@]+\*?")
RAW = re.compile(r"#raw\(")


def unescape(line):
    return line.replace("\\\\", "\x00").replace("\\n", "").replace("\x00", "\\")


rows = []
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    for line in path.read_text(encoding="utf-8", errors="replace").split("\n"):
        if RAW.search(line):
            continue
        hits = MACRO.findall(unescape(line))
        if hits:
            rows.append((path.parent.name, len(hits), line.strip()))

rows.sort(key=lambda r: -len(r[2]))
print("residue lines: %d ; occurrences: %d" % (len(rows), sum(r[1] for r in rows)))
for paper, n, line in rows:
    print("\n=== %s  (%d macros, %d chars)" % (paper, n, len(line)))
    print(line[:1500])
