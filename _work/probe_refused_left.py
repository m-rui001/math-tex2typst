"""Print the full text of every residue span still refused, grouped by why.

Run: python _work/probe_refused_left.py > _work/refused_left.txt
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

QUOTED = re.compile(r'"((?:[^"\\]|\\.)*)"')
PICTURE = re.compile(r"\\begin\{(?:tikzpicture|tikzcd|CD)\}")


def unescape(s):
    out, i = [], 0
    while i < len(s):
        ch = s[i]
        if ch != "\\" or i + 1 >= len(s):
            out.append(ch)
            i += 1
            continue
        nxt = s[i + 1]
        out.append({"n": "\n", "t": "\t", "r": "\r", "\\": "\\", '"': '"'}.get(nxt, ch + nxt))
        i += 2
    return "".join(out)


groups = collections.defaultdict(list)
for path in sorted((ROOT / "typst").glob("*/main.typ")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in QUOTED.finditer(text):
        body = unescape(m.group(1))
        if not re.search(r"\\[a-zA-Z@]", body) or len(body) < 25:
            continue
        head = text[max(0, m.start() - 200):m.start()]
        if head.rfind("#raw(") > head.rfind("$"):
            continue
        if PICTURE.search(body):
            groups["picture"].append((path.parent.name, body))
            continue
        out, err = mathconv.run_pandoc(mathconv.build_batch([body], {})[0])
        if 0 in mathconv._parse_spans(out):
            continue
        why = " ".join((err or "").split())
        got = re.search(r"unexpected (control sequence \S+|.{1,26}?) expecting", why)
        groups[got.group(1).strip() if got else "no error"].append((path.parent.name, body))

for key in sorted(groups, key=lambda k: -len(groups[k])):
    print("=== %s (%d)" % (key, len(groups[key])))
    for name, body in groups[key][:3]:
        print("  [%s]" % name[:40])
        for line in body.split("\\\\"):
            print("    " + " ".join(line.split())[:170])
