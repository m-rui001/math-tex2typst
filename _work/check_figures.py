r"""Convert a handful of figure-heavy papers and report what their figures hold.

Empty `#figure([], ...)` was silent content loss, so each shape is checked here: a drawn canvas,
a refused picture quoted back as LaTeX, and a picture pandoc dropped before we ever saw it.
"""
import io
import pathlib
import shutil
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import convert  # noqa: E402

import re

OUT = ROOT / "_work" / "_figchk"
PAPERS = [
    "Buffered-comparison-and-stopping-band",
    "A-C1-Counterexample-to-the-Entropy",
    "The-Bogomolov-Pop",
    "A-Charged-Reduction-of-the-Spacetime",
    "Cylinder-amplitudes-and-logarithmic-bridge",
]
shutil.rmtree(OUT, ignore_errors=True)
EMPTY = re.compile(r"#figure\(\s*\[\],", re.S)
for stem in PAPERS:
    src = next((p for p in (ROOT / "_work" / "flat").glob(stem + "*.tex")), None)
    if src is None:
        print("no source for %s" % stem)
        continue
    name = src.stem
    rep = convert.convert_paper(str(src), str(OUT / name), name)
    st = rep.get("stats") or {}
    typ = (OUT / name / "main.typ").read_text(encoding="utf-8", errors="replace")
    print("%-46s compile=%s canvas=%d refused=%d empty_fig=%d raw=%d" % (
        name[:46], rep.get("compile_ok"), st.get("cetz_converted", 0),
        st.get("cetz_refused", 0), len(EMPTY.findall(typ)),
        len(re.findall(r"#raw\(block: true, lang: \"latex\"", typ))))
    if not rep.get("compile_ok"):
        print("   ERR %s" % (rep.get("compile_err_full") or "")[:400])
