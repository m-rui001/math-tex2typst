r"""Can the lost tabular be given back to pandoc by taking the minipages out of its cells?

The shipped path leaves A-spectral-gap's figure 1 as loose text: the array preamble prints as `c\@c`
and the cell breaks as `\&`, because pandoc returns no Table for the float in any `\fbox` spelling
(`_work/probe_fbox_cell_content.py`: `keep` gives an empty Table with 0/5 headings, `group`/`bare`
give 4/5 headings and no Table).  The one construct every cell shares is a minipage inside the box,
and pandoc's tabular reader is documented elsewhere in this repo to accept only `&` and `\\` between
cells.  So: peel the envelope, keep the words, and see what pandoc says.

  env-out    -- `\\fbox{\\begin{minipage}[c]{W} X \\end{minipage}}` -> `X`
  parbox     -- same, but `\\parbox{W}{X}` (the width survives as a TeX command pandoc may read)
  shortstack -- `\\shortstack{X}` for the cells that already use it, boxes untouched
Every variant is judged on both axes: is there a Table, and are all five cell headings INSIDE it.
"""
import json
import os
import re
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

from t2t import prep  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STEM = ("A-spectral-gap-throughout-the-high-temperature-"
        "Sherrington-Kirkpatrick-phase-September-24-2026")
FLOAT = re.compile(r"\\begin\{figure\}.*?\\end\{figure\}", re.S)
PANDOC = os.environ.get("PANDOC", "pandoc")
HEADINGS = ["Ordinary rarity", "Weighted-mean estimate", "Variance on bad paths",
            "Directional covariance estimate", "Total remaining variance"]
# `\fbox{` … `}` whose argument is exactly one minipage environment
FBOX_MINIPAGE = re.compile(
    r"\\fbox\s*\{\s*\\begin\{minipage\}(?:\[[^\]]*\])?\{[^{}]*\}"
    r"(?P<inner>.*?)\\end\{minipage\}\s*\}", re.S)


def run(src):
    ast = json.loads(_pandoc(src))
    tabs = [t for t in _walk(ast["blocks"]) if t.get("t") == "Table"]
    in_tab = _flat(tabs[0]) if tabs else ""
    everywhere = _flat(ast["blocks"])
    return ("Table %d" % len(tabs), sum(1 for h in HEADINGS if h in in_tab),
            [h for h in HEADINGS if h not in everywhere])


def _walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def _flat(node):
    return " ".join(n["c"] for n in _walk(node) if n.get("t") == "Str") \
        + " " + " ".join(n["c"][1] for n in _walk(node) if n.get("t") == "Math")


def main():
    src = open(os.path.join(ROOT, "_work", "flat", STEM + ".tex"),
               encoding="utf-8", errors="replace").read()
    f = FLOAT.search(src).group(0)
    print("fbox-wrapped minipages matched: %d of %d \\fbox"
          % (len(FBOX_MINIPAGE.findall(f)), f.count(r"\fbox")))
    variants = [
        ("group (ships now)", prep.unwrap_fbox(f)),
        ("env-out", FBOX_MINIPAGE.sub(lambda m: m.group("inner"), f)),
        ("parbox", FBOX_MINIPAGE.sub(
            lambda m: r"\parbox{0.5\linewidth}{" + m.group("inner") + "}", f)),
        ("group+env-out", FBOX_MINIPAGE.sub(lambda m: m.group("inner"), prep.unwrap_fbox(f))),
        ("env-out+mc-out", _strip_mc(FBOX_MINIPAGE.sub(lambda m: m.group("inner"), f))),
    ]
    for label, v in variants:
        kind, held, lost = run(v)
        print("  %-18s -> %-9s headings in table %d/5 | lost anywhere: %s"
              % (label, kind, held, "; ".join(h[:22] for h in lost) or "none"))


def _pandoc(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        return subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"],
                              capture_output=True).stdout.decode("utf-8", "replace")


def _strip_mc(text):
    r"""Drop `\\multicolumn{n}{spec}{X}` down to X, brace-matched so an inner `{...}` is kept."""
    out, i = [], 0
    while True:
        m = re.compile(r"\\multicolumn\{\d+\}\s*\{").search(text, i)
        if not m:
            out.append(text[i:])
            return "".join(out)
        spec_end = _match(text, m.end())          # the `{spec}` group
        open_body = re.compile(r"\s*\{").match(text, spec_end + 1)
        body_end = _match(text, open_body.end())
        out.append(text[i:m.start()])
        out.append(text[open_body.end():body_end])
        i = body_end + 1


def _match(text, j):
    """Index of the `}` closing the group whose first character is at `j`."""
    depth = 1
    while j < len(text) and depth:
        if text[j] == "{":
            depth += 1
        elif text[j] == "}":
            depth -= 1
        j += 1
    return j - 1


if __name__ == "__main__":
    main()
