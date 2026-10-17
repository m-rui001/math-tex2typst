"""What the surviving LaTeX residue actually is.

Residue appears as a quoted formula string in main.typ, so its shape tells us which
conversion step gave up: an environment we do not draw, a formula held back from the
batch, or a macro texmath does not know.

Run: python _work/probe_residue_class.py
"""
import collections
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
QUOTED = re.compile(r'"((?:[^"\\]|\\.)*)"')
ENV = re.compile(r"\\begin\{([a-zA-Z@*][a-zA-Z0-9@*]*)\}")
CMD = re.compile(r"\\([a-zA-Z@][a-zA-Z0-9@*]*)\*?")

zones = collections.Counter()
papers = collections.Counter()
envs = collections.Counter()
cmds = collections.Counter()
examples = {}

for path in sorted((ROOT / "typst").glob("*/main.typ")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in QUOTED.finditer(text):
        body = m.group(1).replace("\\\\", "\\").replace('\\"', '"')
        if not re.search(r"\\[a-zA-Z@]", body):
            continue
        before = text[max(0, m.start() - 400):m.start()]
        zone = "math" if before.count("$") % 2 else "markup"
        zones[zone] += 1
        papers[path.parent.name] += 1
        got = ENV.search(body)
        key = "env:" + got.group(1) if got else None
        if key is None:
            found = CMD.findall(body)
            key = "cmd:" + found[0] if found else "other"
        envs[key] += 1
        for cmd in CMD.findall(body):
            cmds[cmd] += 1
        examples.setdefault(key, (path.parent.name, " ".join(body.split())[:120]))

print("quoted residue spans=%d papers=%d zones=%s"
      % (sum(zones.values()), len(papers), dict(zones)))
print("\nby first thing that is not plain LaTeX we can render:")
for key, count in envs.most_common(22):
    name, snippet = examples[key]
    print("  %-26s %4d  %s" % (key, count, snippet[:96]))
print("\ntop commands inside them:")
for cmd, count in cmds.most_common(24):
    print("  %-18s %d" % (cmd, count))
