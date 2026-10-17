r"""Count the LaTeX that reaches the page inside `#raw(...)` spans, split into verbatim and fallback.

residue.py deliberately skips every line carrying `#raw`, because a quotation is not un-converted
markup - but report.json counts ~102 formula fallbacks over 46 papers, and a fallback that prints the
author's `\alpha \le \beta` on the page is exactly the leftover the objective is about. This walks each
raw span, unescapes the Typst string quoting, and splits spans that carry TeX control sequences from
spans that are just verbatim names or listings.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SPAN = re.compile(r'#raw\(((?:[^()"]|"(?:[^"\\]|\\.)*")*)\)')
CS = re.compile(r"\\[A-Za-z@]+\*?")


def unquote(s):
    r"""Undo Typst string escaping inside one raw span."""
    return s.replace("\\\\", "\x00").replace("\\n", "\n").replace('\\"', '"').replace("\x00", "\\")


fallback = {}
verbatim = 0
tex_spans = 0
shown = []
for paper in sorted(os.listdir(os.path.join(ROOT, "typst"))):
    path = os.path.join(ROOT, "typst", paper, "main.typ")
    if not os.path.isfile(path):
        continue
    text = open(path, encoding="utf-8", errors="replace").read()
    for m in SPAN.finditer(text):
        body = unquote(m.group(1))
        if body.startswith('block: true, lang: "latex"'):
            continue          # the 16 refused pictures, counted by residue.py already
        hits = CS.findall(body)
        if not hits:
            verbatim += 1
            continue
        tex_spans += 1
        fallback[paper] = fallback.get(paper, 0) + len(hits)
        if len(shown) < 12:
            shown.append((paper, body[:110]))

print("raw spans: %d verbatim without TeX, %d carrying TeX control sequences over %d papers"
      % (verbatim, tex_spans, len(fallback)))
print("control sequences inside those spans: %d" % sum(fallback.values()))
for paper, n in sorted(fallback.items(), key=lambda kv: -kv[1])[:12]:
    print("   %5d  %s" % (n, paper[:60]))
print("\n-- examples --")
for paper, body in shown:
    print("   %-34s %s" % (paper[:34], body.replace("\n", " ").encode("unicode_escape", "replace").decode()[:110]))
