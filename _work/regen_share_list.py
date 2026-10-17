"""List the papers whose text actually changes under scale_linewidth_in_minipages."""
import io
import os
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import prep  # noqa: E402

ROOT = pathlib.Path(__file__).resolve().parents[1]
names = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    if "\\linewidth" not in src or "\\begin{minipage}" not in src:
        continue
    if prep.scale_linewidth_in_minipages(src) != src:
        names.append(path.stem)
(ROOT / "_work" / "regen_needed.txt").write_text("\n".join(names), encoding="utf-8")
print("changed papers: %d" % len(names))
for n in names:
    print("  ", n[:70])
