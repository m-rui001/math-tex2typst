"""Drop a longtable's second head block (`\\endhead`) and keep only the first, so pandoc sees one
header row instead of two. Rewrites the flat source into a scratch file and converts it.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import convert_paper  # noqa: E402

NAME = "Complex-Matrix-Multiplication-Below-2.258-and-Rectangular-Bounds-September-24-2026"
HEAD = re.compile(r"\\endfirsthead.*?\\endhead", re.S)

src = (ROOT / "_work" / "flat" / (NAME + ".tex")).read_text(encoding="utf-8", errors="replace")
print("head blocks found:", len(HEAD.findall(src)))
src = HEAD.sub(r"\\endfirsthead", src)
scratch = ROOT / "_work" / "_lt23" / (NAME + ".tex")
scratch.parent.mkdir(parents=True, exist_ok=True)
scratch.write_text(src, encoding="utf-8")
out = ROOT / "_work" / "_lt23" / NAME
out.mkdir(parents=True, exist_ok=True)
rep = convert_paper(str(scratch), str(out), NAME)
print("compile_ok", rep.get("compile_ok"))
main = (out / "main.typ").read_text(encoding="utf-8", errors="replace")
for m in re.finditer(r"table\.header\(table\.cell\(rowspan: 1, colspan: 1\)\[\$i\$\]", main):
    print("barrier header @%d: %s" % (m.start(), re.sub(r"\s+", " ", main[m.start():m.start() + 160])))
for m in re.finditer(r"caption: \[Table [^\]]*Exact coefficients[^\]]*\]", main):
    print("   caption: %s" % re.sub(r"\s+", " ", m.group(0))[:100])
