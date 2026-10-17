"""Which papers still carry a `#figure([], ...)` -- a caption with no body."""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
EMPTY = re.compile(r"#figure\(\s*\[\],", re.S)

total = 0
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    text = path.read_text(encoding="utf-8", errors="replace")
    n = len(EMPTY.findall(text))
    if n:
        total += n
        print("%2d  %s" % (n, path.parent.name[:64]))
        for m in list(EMPTY.finditer(text))[:n]:
            seg = re.sub(r"\s+", " ", text[m.start():m.start() + 160])
            print("      %s" % seg[:150])
print("total empty figures: %d" % total)
