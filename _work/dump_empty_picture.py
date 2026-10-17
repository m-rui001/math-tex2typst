r"""Print one real picture that carries empty-content nodes, source and built canvas side by side.

The census says 108 pictures hold a `\node[…] (v) at (…) {};` and none of them refuses to build, so the
converter is doing *something* with them. Whether that something draws the dot cannot be answered by a
counting probe -- it needs the canvas in front of the eye next to the statements that produced it. Takes
a flat-source prefix and dumps the first such picture.
"""
import io
import pathlib
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
EMPTY = re.compile(r"\\node\b[^;{}]*(?:\[[^\]]*\])[^;]*\{\s*\}\s*;")

prefix = sys.argv[1]
for path in sorted((ROOT / "_work" / "flat").glob(prefix + "*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for n, pic in enumerate(PIC.findall(text)):
        hits = EMPTY.findall(pic)
        if not hits:
            continue
        print("### %s  picture %d" % (path.stem[:60], n))
        for stmt in hits:
            print("   EMPTY %s" % " ".join(stmt.split())[:100])
        built = cetz.build(pic)
        print("   built: %s" % ("None (refused)" if built is None else "%d lines"
                                % len(built.splitlines())))
        lines = built.splitlines() if built else []
        kinds = Counter(m.group(1) for m in (re.match(r"\s*([a-z_]+)\(", line) for line in lines)
                        if m)
        print("   call kinds: %s" % dict(kinds))
        for line in lines:
            s = line.strip()
            if "circle" in s or "content(" in s:
                print("     %s" % s[:130])
        sys.exit(0)
print("no picture with an empty node under %s" % prefix)
