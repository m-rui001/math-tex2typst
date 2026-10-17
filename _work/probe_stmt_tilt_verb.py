import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
STMT = re.compile(r"\\(draw|fill|filldraw|path|node|shade|clip)\s*\[([^\]]*)\]")
TILT = re.compile(r"(?:^|[,{\s])(rotate(?:\s+around)?)\s*[=(]")

verbs, specs = Counter(), Counter()
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if cetz.build(pic) is None:
            continue
        for m in STMT.finditer(pic):
            if not TILT.search(m.group(2)):
                continue
            verbs[m.group(1)] += 1
            specs[m.group(2)[TILT.search(m.group(2)).start():][:34]] += 1

print("rotate on a statement of a picture that draws:", dict(verbs))
for s, n in specs.most_common(14):
    print("  %2d  %s" % (n, s))
