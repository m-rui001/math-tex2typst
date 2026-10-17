"""Write every tikzcd paper into _work/regen_needed.txt (the y-direction fix reaches all of them)."""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
names = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    if re.search(r"\\begin\{(?:tikzcd|CD)\}", path.read_text(encoding="utf-8", errors="replace")):
        if (ROOT / "typst" / path.stem).is_dir():
            names.append(path.stem)
(ROOT / "_work" / "regen_needed.txt").write_text("\n".join(names), encoding="utf-8")
print("wrote %d names" % len(names))
