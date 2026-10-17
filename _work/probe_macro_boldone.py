"""Why do two author macros survive expansion? Parse the preamble, expand one line.

Run: python _work/probe_macro_boldone.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import macros  # noqa: E402

for macro, paper in (("\\boldone", "Uniformization"), ("\\longhookrightarrowactual", "Abundance")):
    path = next(p for p in (ROOT / "_work" / "flat").glob("%s*.tex" % paper))
    text = path.read_text(encoding="utf-8", errors="replace")
    pre, body = text.split(r"\begin{document}", 1) if r"\begin{document}" in text else (text, "")
    table, skipped = macros.parse_definitions(pre)
    hits = [line.strip() for line in pre.splitlines() if macro[1:] in line]
    print("=== %s in %s" % (macro, path.name[:50]))
    for line in hits[:3]:
        print("    def: %s" % line[:160])
    print("    in table: %s" % (macro in table,))
    if macro in table:
        mac = table[macro]
        print("    nargs=%d kind=%s body=%s" % (mac.nargs, mac.kind, mac.body[:120]))
    print("    skipped defs mentioning it: %s"
          % [s if isinstance(s, str) else s for s in skipped if macro[1:] in str(s)][:3])
    used = re.search(re.escape(macro) + r".{0,60}", body)
    if used:
        snippet = used.group(0)
        print("    use: %s" % snippet[:120])
        print("    expanded: %s" % macros.expand(snippet, table)[:160])
