"""How much of the residue converts now? Feed every quoted span back through the batch.

main.typ holds the cleaned LaTeX the converter gave up on, so this is the residue of the
last run measured against the rules in the tree today - no corpus run needed.
Run: python _work/probe_residue_fix.py
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


fixed = collections.Counter()
still = collections.Counter()
samples = {}
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
            still["picture (cetz gate)"] += 1
            continue
        out, err = mathconv.run_pandoc(mathconv.build_batch([body], {})[0])
        if 0 in mathconv._parse_spans(out):
            fixed["now converts"] += 1
            continue
        why = " ".join((err or "").split())
        got = re.search(r"unexpected (control sequence \S+|.{1,26}?) expecting", why)
        key = (got.group(1).strip() if got else "no error")
        still[key] += 1
        samples.setdefault(key, (path.parent.name, " ".join(body.split())[:100]))

print("spans that convert with today's rules: %d" % fixed["now converts"])
print("still refused: %d" % sum(still.values()))
for key, count in still.most_common(18):
    name, snippet = samples.get(key, ("", ""))
    print("  %-34s %3d  %s" % (key, count, snippet[:92]))
