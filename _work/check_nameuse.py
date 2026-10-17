"""The companion-number table in Random-coordinate-frames must read back as numbers.

Run: python _work/check_nameuse.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import macros  # noqa: E402

path = next((ROOT / "_work" / "flat").glob("Random-coordinate-frames*.tex"))
text = path.read_text(encoding="utf-8", errors="replace")
pre, body = text.split(r"\begin{document}", 1)
table, skipped = macros.parse_definitions(pre)
keys = [k for k in table if k.startswith("\\companion@")]
print("companion entries:", len(keys), "skipped defs:", len(skipped))

hits = re.findall(r"\\Lref\{([^{}]*)\}", body)[:6]
for key in hits:
    got = macros.expand("\\Lref{%s}" % key, table)
    print("  \\Lref{%-28s} -> %s" % (key, got))
    assert got != "\\Lref{%s}" % key, key
    assert "@" not in got and "nameuse" not in got, key
print("ok")
