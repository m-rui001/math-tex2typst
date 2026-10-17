"""Two open questions: where does \quadf come from, and what does pandoc's caret point at?

Run: python _work/probe_two.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

QUOTED = re.compile(r'"((?:[^"\\]|\\.)*)"')


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


# 1. the source of a span that reads \quadf
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    m = re.search(r"K_\{f\^\{-1\}U\}.{0,80}", text)
    if m:
        print("flat %s\n  %s" % (path.stem[:40], repr(m.group(0)[:110])))
        break

# 2. the caret for the unexpected "\\" spans
shown = 0
for path in sorted((ROOT / "typst").glob("*/main.typ")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in QUOTED.finditer(text):
        body = unescape(m.group(1))
        if not re.search(r"\\[a-zA-Z@]", body) or len(body) < 25 or "\\begin{" not in body:
            continue
        head = text[max(0, m.start() - 200):m.start()]
        if head.rfind("#raw(") > head.rfind("$") or "\\begin{tikz" in body:
            continue
        out, err = mathconv.run_pandoc(mathconv.build_batch([body], {})[0])
        if 0 in mathconv._parse_spans(out) or "unexpected \"\\\\\"" not in (err or ""):
            continue
        shown += 1
        if shown > 3:
            sys.exit()
        lines = [x for x in err.splitlines() if x.strip()]
        print("\n%s\n  span: %s" % (path.parent.name[:44], " ".join(body.split())[:150]))
        for line in lines[-4:]:
            print("  | %s" % line.strip()[:150])
