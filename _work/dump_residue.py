"""Print the first residue formulas in full and test pandoc on them."""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402
sys.path.insert(0, str(ROOT / "_work"))
from probe_residue_replay import unescape  # noqa: E402

TeXSTR = re.compile(r'"((?:[^"\\]|\\.)*)"')
HAS = re.compile(r"\\[A-Za-z@]+")

picked = []
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    for line in path.read_text(encoding="utf-8", errors="replace").split("\n"):
        if line.lstrip().startswith("#raw("):
            continue
        for m in TeXSTR.finditer(line):
            s = unescape(m.group(1))
            if HAS.search(s):
                picked.append((path.parent.name, s))
    if len(picked) >= 4:
        break

for name, s in picked[:4]:
    print("### %s\n%s\n" % (name, s))
    batch, skipped = mathconv.build_batch([s])
    out, err = mathconv.run_pandoc(batch)
    print("--- after build_batch:\n" + "\n".join(
        l for l in batch.split("\n") if not l.startswith("%"))[:600])
    print("--- pandoc out:\n" + out[:300])
    print("--- pandoc err:\n" + " ".join(err.split())[:300] + "\n")
