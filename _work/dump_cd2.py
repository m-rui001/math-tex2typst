import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
ENV = re.compile(r"\\begin\{(tikzcd|CD)\}.*?\\end\{\1\}", re.S)

bodies = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    for m in ENV.finditer(path.read_text(encoding="utf-8", errors="replace")):
        if len(bodies) < 14:
            bodies.append(m.group(0))
            print("----", path.name[:44])
            print(m.group(0)[:520])
print("collected", len(bodies))
