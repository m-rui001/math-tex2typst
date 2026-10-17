"""Why do generated canvases fail typst compile? Group by the reported error."""
import collections
import pathlib
import re
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def error_of(canvas):
    with tempfile.TemporaryDirectory() as tmp:
        src = pathlib.Path(tmp) / "t.typ"
        src.write_text(cetz.HEADER + "#set page(width: 300pt, height: 300pt)\n" + canvas,
                       encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(src), str(pathlib.Path(tmp) / "t.pdf")],
                           capture_output=True)
    if r.returncode == 0:
        return None
    err = r.stderr.decode("utf-8", "replace")
    lines = [l.strip() for l in err.splitlines() if l.strip()]
    if not lines:
        return "no message"
    msg = re.sub(r"\d+", "N", lines[0])[:100]
    # typst quotes the offending expression on a later line
    snippet = next((l for l in lines[1:] if l.startswith(("│", "|", "="))), "")
    return "%s :: %s" % (msg, re.sub(r"\d+", "N", snippet)[:80])


kinds = collections.Counter()
examples = {}
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.findall(text):
        canvas = cetz.build(pic)
        if canvas is None:
            continue
        if not cetz.sane(canvas):
            kinds["insane markup"] += 1
            examples.setdefault("insane markup", (tex.name[:38], canvas[:200]))
            continue
        err = error_of(canvas)
        if err is None:
            continue
        kinds[err] += 1
        examples.setdefault(err, (tex.name[:38], canvas.replace("\n", " ")[:230]))

for k, v in kinds.most_common(20):
    print("%5d  %s" % (v, k))
    name, ex = examples.get(k, ("", ""))
    print("        %-40s %s" % (name, ex))
