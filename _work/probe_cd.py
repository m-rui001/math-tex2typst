import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzcd\}.*?\\end\{tikzcd\}", re.S)

bodies = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    bodies += ENV.findall(path.read_text(encoding="utf-8", errors="replace"))
print("tikzcd envs in sources:", len(bodies))

built = refused = compiled = 0
why = {}
for src in bodies:
    canvas = cetz.build_cd(src)
    if canvas is None:
        refused += 1
        continue
    built += 1
    if cetz.sane(canvas) and cetz.compiles(canvas):
        compiled += 1
    else:
        why.setdefault("compile", []).append(src[:80])

print("built=%d  compiled=%d  build-refused=%d" % (built, compiled, refused))
for src in why.get("compile", [])[:4]:
    print("COMPILE FAIL:", " ".join(src.split()))
first = next((c for c in (cetz.build_cd(s) for s in bodies) if c), None)
print("\n".join((first or "").splitlines()[:14]))
