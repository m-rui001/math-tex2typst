"""Which MATH_SYMBOLS values does Typst actually accept in math mode?"""
import pathlib
import re
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

bad = []
with tempfile.TemporaryDirectory() as tmp:
    tmpd = pathlib.Path(tmp)
    for src, val in sorted(cetz.MATH_SYMBOLS.items()):
        for piece in re.findall(r"[A-Za-z]{2,}", val):
            if piece in ("content", "text", "line", "circle"):
                continue
            body = cetz.HEADER + "#set page(width: 200pt, height: 40pt)\n$%s$\n" % piece
            srcp = tmpd / "t.typ"
            srcp.write_text(body, encoding="utf-8")
            r = subprocess.run(["typst", "compile", str(srcp), str(tmpd / "t.pdf")],
                               capture_output=True)
            if r.returncode != 0:
                err = re.sub(r"\s+", " ", r.stderr.decode("utf-8", "replace"))[:90]
                bad.append((src, val, piece, err))

print("%d unusable words in math mode" % len(bad))
for src, val, piece, err in bad:
    print("%-18s -> %-14s %-12s %s" % (src, val, piece, err))
