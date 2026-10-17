import subprocess
import sys
import tempfile
import pathlib

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

words = sorted(w for w in cetz.ALLOWED_WORDS if w.strip())
bad = []
for w in words:
    src = "#set page(width: 100pt, height: 40pt)\n$ " + w + " $\n"
    with tempfile.TemporaryDirectory() as tmp:
        p = pathlib.Path(tmp) / "t.typ"
        p.write_text(src, encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(p), str(pathlib.Path(tmp) / "t.pdf")],
                           capture_output=True)
    if r.returncode:
        err = r.stderr.decode("utf-8", "replace")
        bad.append((w, " ".join(err.split())[:60]))
print("words accepted as-is:", len(words) - len(bad), "of", len(words))
for w, e in bad:
    print("  BAD %-10s %s" % (w, e))
