r"""Which tabular preamble does pandoc still read as a float?

`array_floats` rewrites a math-array table float into a tabular so pandoc keeps the caption. Its
INLINE_ARRAY reads the array spec as `[^{}]*`, so a spec carrying an @-expression is never seen.
This feeds pandoc the same float three ways - the array untouched, a tabular whose preamble keeps
@{\qquad}, one with it dropped - and reports whether the caption and the label come back.
"""
import json
import os
import subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BODY = open(os.path.join(ROOT, "_work", "flat",
             "The-Kervaire-Invariant-Problem-at-the-Prime-Three-September-24-2026.tex"),
            encoding="utf-8", errors="replace").read()
MARK = "Universal lower and upper bounds"
_cap = BODY.index(MARK)
FLOAT = BODY[BODY.rindex(r"\begin{table}[htbp]", 0, _cap):
             BODY.index(r"\end{table}", _cap) + len(r"\end{table}")]
SPEC = r"cc|r|rrrr@{\qquad}cc|r|rrrr"
ROWS = FLOAT.split(r"\end{array}", 1)[0].split("}\n", 1)[1]

CAP = r"\caption{%s.}" % MARK
LAB = r"\label{finite:enclosures}"


def tabular(spec):
    return ("\\begin{table}[htbp]\n\\begin{tabular}{%s}\n%s\\end{tabular}\n%s\n%s\n\\end{table}"
            % (spec, ROWS, CAP, LAB))


VARIANTS = {
    "as-written": FLOAT,
    "tabular-@": tabular(SPEC),
    "tabular-no@": tabular(SPEC.replace(r"@{\qquad}", "")),
}


def walk(node):
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from walk(v)


def run(text):
    # the same invocation convert.py uses, so what pandoc reads here is what the corpus sees
    doc = ("%s\n" % text)
    tmp = os.path.join(ROOT, "_work", "_probe_array.tex")
    with open(tmp, "w", encoding="utf-8") as fh:
        fh.write(doc)
    p = subprocess.run(["pandoc", tmp, "-f", "latex", "-t", "json", "-o", "-"],
                       capture_output=True)
    if p.returncode:
        return "pandoc failed: %s" % p.stderr.decode("utf-8", "replace")[:160]
    ast = json.loads(p.stdout.decode("utf-8"))
    s = json.dumps(ast)
    caps = [json.dumps(n["c"][1])[:150] for n in walk(ast)
            if isinstance(n, dict) and n.get("t") == "Table"]
    return ("caption: %s ; label kept: %s ; tables: %s ; RawBlock: %s ; rows: %s"
            % (json.dumps(caps)[:120], "finite:enclosures" in s,
               s.count('"Table"'), s.count('"RawBlock"'),
               s.count('"RowBody"') or s.count('"TableBody"')))


def cap_first(spec):
    return ("\\begin{table}[htbp]\n%s\n%s\n\\begin{tabular}{%s}\n%s\\end{tabular}\n\\end{table}"
            % (CAP, LAB, spec, ROWS))


for name, text in list(VARIANTS.items()) + [("caption-first", cap_first(SPEC))]:
    print("---- %s" % name)
    print("  ", run(text))
