"""Every string the CeTz gate is handed for one paper, in call order.

Two paths ask for a drawing: the token path substitutes a hidden picture, the maths path
converts a formula that carries one. Wrapping both entry points and their two builders shows
which call produced the collapsed canvas, and what text that call actually received.
Run: python _work/spy_cetz.py <paper-prefix>
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, convert  # noqa: E402

NODES = re.compile(r"\\node\b")
CALLS = []


def wrap(name, fn):
    def spy(*args, **kwargs):
        got = fn(*args, **kwargs)
        CALLS.append((name, args[0] if args else "", got))
        return got
    return spy


def main():
    paper = sys.argv[1]
    flat = next((ROOT / "_work" / "flat").glob(paper + "*.tex"))
    out = ROOT / "_work" / "_spy_cetz" / flat.stem
    out.mkdir(parents=True, exist_ok=True)
    for name in ("convert", "build", "build_cd"):
        setattr(cetz, name, wrap(name, getattr(cetz, name)))
    convert.convert_paper(str(flat), str(out), flat.stem)
    for name, text, got in CALLS:
        if name != "convert" and not text.startswith("\\begin{tikzpicture}"):
            continue
        print("== %s | in=%d nodes=%d complete=%s | out=%s" % (
            name, len(text), len(NODES.findall(text)),
            text.rstrip().endswith("\\end{tikzpicture}"),
            "none" if not got else "%d chars" % len(got)))
        print("   " + " ".join(text.split())[:700])
        if got and name == "convert":
            print("   CANVAS " + " ".join(got.split())[:400])


main()
