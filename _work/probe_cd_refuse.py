r"""Which option or label makes build_cd refuse a diagram, for the survivors.

Run: python _work/probe_cd_refuse.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzcd\}.*?\\end\{tikzcd\}", re.S)
for path in sorted((ROOT / "_work" / "flat" / "_work_tex").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in ENV.finditer(text):
        src = m.group(0)
        if cetz.build_cd(src) is not None:
            continue
        print("=" * 72)
        print(path.name)
        print(" ".join(src.split()))
        for line in cetz.LINEBREAK.split(cetz.CD_ENV.search(src).group(2)):
            for spec in cetz.CD_ARROW.findall(line):
                print("   SPEC %r -> %r" % (spec, cetz.cd_arrow(spec or "")))
