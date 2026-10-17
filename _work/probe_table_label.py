r"""Where does pandoc leave a \\label that follows \\caption inside a table?

The emitter registers a table label from the Table node's ident, so a label the parser
leaves somewhere else never enters the reference table and every reference to it dangles.
"""
import io
import json
import pathlib
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import convert as C, prep  # noqa: E402

KEY = sys.argv[2] if len(sys.argv) > 2 else "tab:top"
stem = sys.argv[1] if len(sys.argv) > 1 else "Snaky-in-21-Maker-moves-September-25-2026"
flat = next((ROOT / "_work" / "flat").glob(stem + "*.tex"))
text = flat.read_text(encoding="utf-8", errors="replace")
pre, body = prep.split_document(text)
p = prep.parse_preamble(pre)
body = prep.expand_macros(body, p.macros)
body = prep.fix_dialect_prose(body)
body = prep.strip_dropped(body)
body = re.sub(r"\\label\[[^\]]*\]", r"\\label", body)
tmp = ROOT / "_work" / "_one.tex"
tmp.write_text(pre + "\n\\begin{document}\n" + body, encoding="utf-8")
doc = json.loads(subprocess.run(
    ["pandoc", "-f", "latex", "-t", "json", "--wrap=none", str(tmp)],
    capture_output=True, text=True, encoding="utf-8").stdout)


def holds(node):
    return KEY in json.dumps(node, ensure_ascii=False)


def walk(node, path=""):
    """Print the outermost nodes that still contain the key, so its home is visible."""
    if isinstance(node, dict):
        t = node.get("t", "")
        c = node.get("c")
        tag = ""
        if t == "Div" and isinstance(c, list) and isinstance(c[0], list) and len(c[0]) == 3:
            tag = "  attrs=%s" % (c[0],)
        elif t == "Figure":
            tag = "  figure_ident=%s" % (c[0][0] if isinstance(c, list) and c else "",)
        kids = [x.get("t", "?") for x in c if isinstance(x, dict)] if isinstance(c, list) else []
        print("%-40s%s kids=%s" % (path + t, tag, kids)[:200])
        for x in c if isinstance(c, list) else []:
            if holds(x):
                walk(x, path + "  ")
    elif isinstance(node, list):
        for x in node:
            if holds(x):
                walk(x, path + "  ")


for b in doc["blocks"]:
    if holds(b):
        print("== block %s" % b.get("t"))
        walk(b)
print("--- raw text holding the key:")
for m in re.finditer(re.escape(KEY), json.dumps(doc, ensure_ascii=False)):
    s = json.dumps(doc, ensure_ascii=False)[max(0, m.start() - 260):m.start() + 60]
    print("   ..." + s[-300:] + "...")
    if m.start() > 200000:
        break
