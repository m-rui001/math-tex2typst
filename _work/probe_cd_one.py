"""Why does the one diagram the corpus still prints as LaTeX refuse to draw?

The float path in convert.py quotes a picture the gate refused, so the last tikzcd in
main.typ is a measured refusal, not a missed call: this reads it back out of the generated
file and walks the same stages convert() runs.

Usage: python _work/probe_cd_one.py
"""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz

typ = (ROOT / "typst" / "Termination-for-projective-log-canonical-fourfolds-with-rational-"
                "boundary-September-24-2026" / "main.typ").read_text(encoding="utf-8", errors="replace")
m = re.search(r'#raw\(block: true, lang: "latex", ("(?:[^"\\]|\\.)*")\)', typ)
src = json.loads(m.group(1))
print("len %d\n%s\n" % (len(src), src))

core = cetz.MATH_ENVELOPE.sub("", src)
print("PICTURE:", bool(cetz.PICTURE.search(src)), " PICTURE_ENV:", bool(cetz.PICTURE_ENV.search(core)))
print("build:", bool(cetz.build(core)))
cd = cetz.build_cd(core)
print("build_cd:", "ok" if cd else None)
if cd:
    print("  sane:", cetz.sane(cd), " compiles:", cetz.compiles(cd))
    print(cd[:400])
