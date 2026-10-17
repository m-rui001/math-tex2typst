"""Ask texmath, one span at a time, what token it gave up on.

The residue in main.typ is the cleaned LaTeX the batch was handed, so feeding each span
back through the same call names the exact failure. Run: python _work/probe_residue_token.py
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

QUOTED = re.compile(r'"((?:[^"\\]|\\.)*)"')
ENV = re.compile(r"\\begin\{([a-zA-Z@*][a-zA-Z0-9@*]*)\}")
FAIL = re.compile(r"unexpected (control sequence \\\S+|(.{0,24}))")
PICTURE = re.compile(r"\\begin\{(?:tikzpicture|tikzcd|CD|array)\}")


def unescape(s):
    """A Typst quoted string -> the text it holds; \\n is a newline, \\\\ is one backslash."""
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


reasons = collections.Counter()
examples = {}
spans = 0
for path in sorted((ROOT / "typst").glob("*/main.typ")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in QUOTED.finditer(text):
        body = unescape(m.group(1))
        if not re.search(r"\\[a-zA-Z@]", body) or len(body) < 25:
            continue
        head = text[max(0, m.start() - 200):m.start()]
        if head.rfind("#raw(") > head.rfind("$"):
            continue  # a code block, not a formula
        spans += 1
        got = ENV.search(body)
        if got and PICTURE.search(body):
            key = "picture:" + got.group(1)
        else:
            _out, err = mathconv.run_pandoc(mathconv.build_batch([body], {})[0])
            why = " ".join((err or "").split())
            got = re.search(r"unexpected (control sequence \\\w+|.{1,30}?) expecting \"([^\"]+)\"", why)
            key = ("token:" + got.group(1).strip()) if got else (
                "no-error" if not why.strip() else "other:" + why[:60])
        reasons[key] += 1
        if reasons[key] <= 2:
            examples.setdefault(key, (path.parent.name, " ".join(body.split())[:110]))

print("residue spans with an environment: %d" % spans)
for key, count in reasons.most_common(24):
    name, snippet = examples[key]
    print("  %-42s %3d  %s" % (key, count, snippet[:88]))
