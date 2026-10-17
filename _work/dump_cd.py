import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
TeXSTR = re.compile(r'"((?:[^"\\]|\\.)*)"')


def unescape(s):
    out, i = [], 0
    while i < len(s):
        if s[i] == "\\" and i + 1 < len(s):
            out.append({"n": "\n", "t": "\t"}.get(s[i + 1], s[i + 1]))
            i += 2
        else:
            out.append(s[i])
            i += 1
    return "".join(out)


seen = []
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    for line in path.read_text(encoding="utf-8", errors="replace").split("\n"):
        for m in TeXSTR.finditer(line):
            if "tikzcd" not in m.group(1) and "\\begin{CD}" not in m.group(1):
                continue
            got = unescape(m.group(1))
            if len(seen) < 12 and got not in seen:
                seen.append(got)
                print("----", path.name[:40])
                print(got[:600])
print("collected", len(seen))
