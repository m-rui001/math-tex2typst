"""Which of expand_foreach's six exits does each refused picture hit?

expand_foreach (cetz.py:1163) returns None for six different reasons and one of them is simply
running out of its 64 unrolling rounds, so "foreach" as a refusal family says nothing about the
shape to add.  This replays the chain up to the point expand_foreach is entered (the same order
cetz.build uses: expand_def then expand_foreach) and reports, for the first FOREACH match left,
the variables, the list spec, whether the body is brace-delimited, and what _loop_values makes of
the spec.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(src)}
    for m0 in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m0.group(0)), LC)
        body = core[len("\\begin{tikzpicture}"):].lstrip() if core.startswith("\\begin{tikzpicture}") else None
        if body is None:
            continue
        head, pos = cetz._opts_at(body, 0)
        if head is None or cetz._transform(head) is None:
            continue
        body = cetz.expand_def(body[pos:])
        expanded = cetz.expand_foreach(body)
        if expanded is not None:
            continue
        n = len(cetz.FOREACH.findall(body))
        m = cetz.FOREACH.search(body)
        vars_ = [v.strip() for v in m.group(1).split("/")]
        spec_pos = m.end()
        spec, after = cetz.bracketed(body, spec_pos)
        gap = body[after:].lstrip()
        values = cetz._loop_values(spec, len(vars_))
        print("%-42s loops=%d vars=%s" % (paper[:42], n, vars_))
        print("      spec=%r  body_brace=%s  count=%s  ev=%s" %
              (spec[:90], gap[:1] == "{", cetz._count_option(spec), cetz._evaluate_option(spec)))
        print("      values=%s" % (str(values)[:110],))
