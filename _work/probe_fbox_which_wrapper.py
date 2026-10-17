r"""Name the `\fbox` whose wrapper pandoc needs, and re-check #28's premise.

`_work/probe_fbox_real_float.py` bisected A-spectral-gap's figure 1: dropping the first two `\fbox`
wrappers still gives a Table, dropping the third does not.  Three questions follow, and all three are
answered by pandoc itself rather than by inference:

1. what is the third cell, and does a minimal two-cell tabular reproduce the loss;
2. does pandoc still discard the argument of a text-level `\fbox{hello world}` -- #28 was filed on that
   measurement, and if it is false now the whole `unwrap_fbox` is the bug, not its scope;
3. with every wrapper kept, what lands on the page: the cell text or nothing?
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


def parse(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        proc = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"], capture_output=True)
        try:
            return json.loads(proc.stdout.decode("utf-8", "replace"))
        except Exception:                                            # noqa: BLE001
            return None


def brief(ast):
    if ast is None:
        return "PARSE-FAIL", ""
    n = len([t for t in _walk(ast["blocks"]) if t.get("t") == "Table"])
    return "Table %d" % n, _words(ast["blocks"])


def _walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def _words(node):
    out = []
    for n in _walk(node):
        t = n.get("t")
        if t == "Str":
            out.append(n["c"])
        elif t == "Math":
            out.append("$math$")
        elif t == "RawInline":
            out.append("<raw:" + n["c"][1][:24] + ">")
    return " ".join(out)[:120]


def main():
    src = open(os.path.join(ROOT, "_work", "flat", STEM + ".tex"),
               encoding="utf-8", errors="replace").read()
    f = FLOAT.search(src).group(0)
    print("=== the five \\fbox arguments, in document order ===")
    for i, m in enumerate(re.finditer(r"\\fbox\{", f)):
        print("  %d: %s" % (i + 1, f[m.end():m.end() + 90].replace("\n", " ")))

    # peel down to the third cell alone: keep its wrapper, drop the other four, and vice versa
    spans = _brace_spans(f)
    print("\n=== which wrapper carries the parse ===")
    only = lambda i: f[spans[i][0]:spans[i][1]]
    for i in range(len(spans)):
        body = only(i)
        cell = r"\begin{tabular}{cc}" + "\n" + body + r" & B \\" + "\n" + r"\end{tabular}"
        kept, _ = brief(parse(cell))
        unwrapped, _ = brief(parse(cell.replace(r"\fbox{", "{", 1)))
        print("  cell %d  wrapped -> %-8s | unwrapped -> %s" % (i + 1, kept, unwrapped))

    print("\n=== #28's premise, re-measured ===")
    k, w = brief(parse(r"Text before \fbox{hello world} after."))
    print("  text-level \\fbox{hello world}: %-8s | %s" % (k, w))
    k, w = brief(parse(r"Text before {hello world} after."))
    print("  bare group {hello world}     : %-8s | %s" % (k, w))

    print("\n=== the whole float, both ways ===")
    k, w = brief(parse(f))
    print("  as written : %-8s | %s" % (k, w))
    k, w = brief(parse(prep.unwrap_fbox(f)))
    print("  unwrapped  : %-8s | %s" % (k, w))


def _brace_spans(text):
    """(start, end) of every `\\fbox{...}` with balanced braces, from the front."""
    spans, i = [], 0
    while True:
        m = re.compile(r"\\fbox\{").search(text, i)
        if not m:
            return spans
        depth, j = 1, m.end()
        while j < len(text) and depth:
            if text[j] == "{":
                depth += 1
            elif text[j] == "}":
                depth -= 1
            j += 1
        spans.append((m.start(), j))
        i = j


if __name__ == "__main__":
    main()
