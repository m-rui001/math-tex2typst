r"""Does the existing macro expander remove \cts in that paper, and where does it stop?

Run: python _work/probe_macro.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import prep  # noqa: E402

src = sorted((ROOT / "_work" / "flat").glob("A-rational-obstruction-to-strong*.tex"))[0]
text = src.read_text(encoding="utf-8", errors="replace")
pre, body = prep.split_document(text)
p = prep.parse_preamble(pre)
print("parsed macros:", len(p.macros), " skipped defs:", len(p.skipped_defs))
print("cts in table:", p.macros.get("\\cts"))
print("cts among skipped:", [d for d in p.skipped_defs if "cts" in d][:2])

out = prep.expand_macros(body, p.macros)
print("raw '\\cts' before:", len(re.findall(r"\\cts\b", body)), " after:", len(re.findall(r"\\cts\b", out)))
i = out.find("\\cts")
print("first survivor:", repr(out[max(0, i - 100):i + 40]) if i >= 0 else "(none)")
