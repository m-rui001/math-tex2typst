r"""Three spellings of `\fbox{X}` compared on the real float AND on #28's own case.

`unwrap_fbox` today rewrites `\fbox{X}` into `{X}`, which is right for a text-level box (pandoc drops
the whole thing otherwise) but which costs A-spectral-gap's figure 1 its table.  Two alternatives are
measured side by side, and the pass criterion is both `Table >= 1` and the cell words being present:

  keep   -- `\fbox{X}` untouched
  group  -- `\fbox{X}` -> `{X}`            (what ships now)
  bare   -- `\fbox{X}` -> X               (wrapper and its braces both go)

#28 was filed on a nested `\fbox{\begin{tabular}...}` cell, so that exact string is in the matrix too;
a spelling that fixes the float by breaking #28 is not a fix.
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
FBOX = re.compile(r"\\fbox\s*\{")
#28's case: a tabular nested in a cell, and a plain text-level box
CASES = {
    "text-level box": r"Text before \fbox{hello world} after.",
    "#28 nested tabular cell": r"\begin{tabular}{cc}&\fbox{\begin{tabular}{@{}c@{}}$T_1$\\own\end{tabular}}&X\\\end{tabular}",
}


def spellings(src):
    return {"keep": src, "group": prep.unwrap_fbox(src), "bare": _bare(src)}


def _match(text, j):
    depth = 1
    while j < len(text) and depth:
        if text[j] == "{":
            depth += 1
        elif text[j] == "}":
            depth -= 1
        j += 1
    return j - 1


def _bare(src):
    """`\\fbox{X}` -> `X`, braces included, working from the first match outward."""
    while True:
        m = FBOX.search(src)
        if not m:
            return src
        end = _match(src, m.end())
        src = src[:m.start()] + src[m.end():end] + src[end + 1:]


def parse(src):
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "a.tex")
        open(p, "w", encoding="utf-8").write("\\documentclass{article}\\begin{document}\n"
                                             + src + "\n\\end{document}\n")
        proc = subprocess.run([PANDOC, p, "-f", "latex", "-t", "json"], capture_output=True)
        try:
            ast = json.loads(proc.stdout.decode("utf-8", "replace"))
        except Exception:                                            # noqa: BLE001
            return ("PARSE-FAIL", "", 0)
        tables = [t for t in _walk(ast["blocks"]) if t.get("t") == "Table"]
        # content survives only if the words pandoc should read are in the AST at all
        return ("Table %d" % len(tables), _words(ast["blocks"]),
                len(_walk_list(tables[0])) if tables else 0)


def _walk_list(node):
    return [n for n in _walk(node)]


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
        if n.get("t") == "Str":
            out.append(n["c"])
        elif n.get("t") == "Math":
            out.append("$m$")
    return " ".join(out)


def main():
    src = open(os.path.join(ROOT, "_work", "flat", STEM + ".tex"),
               encoding="utf-8", errors="replace").read()
    CASES["real float (fig.1)"] = FLOAT.search(src).group(0)
    for label, body in CASES.items():
        print("=== %s ===" % label)
        for name, variant in spellings(body).items():
            kind, words, nodes = parse(variant)
            has = ("hello world" in words) if "Text before" in body else True
            print("  %-6s -> %-8s nodes %-4d words: %s%s"
                  % (name, kind, nodes, words[:70].replace("\n", " "),
                     "" if has else "   [CONTENT LOST]"))


if __name__ == "__main__":
    main()
