r"""Do the references a wrapper Div carries now resolve, on the real pipeline?

Three papers whose top dangling keys are table names, converted into a scratch directory:
the report says what the reference table holds, and compiling proves the Typst is valid.
"""
import io
import json
import pathlib
import shutil
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import convert  # noqa: E402

OUT = ROOT / "_work" / "_chk"
PAPERS = [
    "The-Kervaire-Invariant-Problem",
    "A-boundary-field-gap-for-the-spin-one-Heisen",
    "standalone-overview",
    "Uniform-marked-polygon-estimates",
]
shutil.rmtree(OUT, ignore_errors=True)
done = []
for stem in PAPERS:
    d = next((p for p in (ROOT / "_work" / "flat").glob(stem + "*.tex")), None)
    if d is None:
        print("no source for %s" % stem)
        continue
    name = d.stem
    rep = convert.convert_paper(str(d), str(OUT / name), name)
    st = rep.get("stats") or {}
    sm = rep.get("samples") or {}
    print("%-46s ok=%s dangling=%s unconv=%s split=%s" % (
        name[:46], rep.get("compile_ok"), st.get("dangling_ref", 0),
        st.get("math_unconverted", 0), st.get("cetz_split", 0)))
    print("   sample: %s" % str(sm.get("dangling_ref", ""))[:80])
    if rep.get("compile_err_full"):
        print("   ERR %s" % rep["compile_err_full"][:300])
    done.append((name, rep))

for name, rep in done:
    typ = (OUT / name / "main.typ").read_text(encoding="utf-8", errors="replace")
    marks = [l.strip()[:110] for l in typ.split("\n")
             if "[??]" in l or "\\ast" in l or "pagegoal" in l]
    print("\n%s: reader-visible marks %d" % (name[:44], len(marks)))
    for l in marks[:3]:
        print("   " + l)
