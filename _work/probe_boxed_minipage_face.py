r"""Corpus face of the `\fbox{\begin{minipage}…}` shape, and what a parbox rewrite would change.

`_work/probe_tabular_env_out.py` found one spelling that gives pandoc both the table and all five cell
headings: `\parbox{W}{X}` in place of `\fbox{\begin{minipage}[pos]{W}X\end{minipage}}`.  Before that
becomes a rule in `prep`, two numbers are needed:

  face   -- how many boxed minipages exist over the 724 flat sources, and in how many papers;
  gain   -- per affected paper, pandoc's Table count with the current `unwrap_fbox` versus with the
            parbox rewrite, over the same body, plus the total word count so a rewrite that buys a
            table by dropping text is visible as such.
"""
import glob
import json
import os
import re
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

from t2t import prep  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PANDOC = os.environ.get("PANDOC", "pandoc")
# a `\fbox` whose whole argument is one minipage environment
BOXED = re.compile(r"\\fbox\s*\{\s*\\begin\{minipage\}(?:\[[^\]]*\])?\{(?P<w>[^{}]*)\}"
                   r"(?P<x>.*?)\\end\{minipage\}\s*\}", re.S)


def to_parbox(text):
    return BOXED.sub(lambda m: "\\parbox{%s}{%s}" % (m.group("w"), m.group("x")), text)


def measure(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        out = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"],
                             capture_output=True).stdout
        try:
            ast = json.loads(out.decode("utf-8", "replace"))
        except Exception:                                            # noqa: BLE001
            return None
        blocks = ast["blocks"]
        text = json.dumps(blocks, ensure_ascii=False)
        tables = len([t for t in _walk(blocks) if t.get("t") == "Table"])
        return tables, len(text)


def _walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def main():
    face_total = face_papers = 0
    rows = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        hits = BOXED.findall(src)
        if not hits:
            continue
        face_total += len(hits)
        face_papers += 1
        now = measure(prep.unwrap_fbox(src))
        new = measure(to_parbox(src))
        if now != new:
            rows.append((stem, len(hits), now, new))
    print("boxed minipages in the flat sources: %d over %d papers" % (face_total, face_papers))
    print("papers whose pandoc parse the rewrite changes: %d" % len(rows))
    for stem, hits, now, new in rows:
        print("  %-64s boxes %d | tables %s->%s | ast bytes %s->%s"
              % (stem[:62], hits, now[0], new[0], now[1], new[1]))


if __name__ == "__main__":
    main()
