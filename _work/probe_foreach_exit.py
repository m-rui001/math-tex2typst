"""Which exit does expand_foreach actually take, and on which round?

The four foreach refusals all parse their first loop fine, so the exit is reached after some
unrolling.  This is a line-for-line copy of cetz.expand_foreach with each `return None` tagged and
the round number recorded, so the family census can be read as "shape we do not support" versus
"shape we support but run out of rounds for".  Keep it in sync with cetz.py:1163.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402


def traced(body):
    for rnd in range(64):
        m = cetz.FOREACH.search(body)
        if not m:
            return ("built", rnd, "")
        vars_ = [v.strip() for v in m.group(1).split("/")]
        count = cetz._count_option(m.group(2))
        if count is False:
            return ("count", rnd, m.group(2)[:70])
        ev = cetz._evaluate_option(m.group(2))
        if ev is False:
            return ("evaluate", rnd, m.group(2)[:70])
        pos = m.end()
        if body[pos:pos + 1] != "{":
            return ("no-brace-body", rnd, body[pos:pos + 60])
        spec, pos = cetz.bracketed(body, pos)
        if spec is None:
            return ("spec-unbalanced", rnd, "")
        gap = body[pos:].lstrip()
        pos += len(body[pos:]) - len(gap)
        if gap[:1] == "{":
            open_at = pos + len(body[pos:]) - len(gap)
            loop, pos = cetz.bracketed(body, open_at)
            if loop is None:
                tail = body[open_at:]
                return ("body-unbalanced", rnd,
                        "raw brace balance %+d, escaped \\{\\}=%d, first 140: %s" % (
                            tail.count("{") - tail.count("}"),
                            len(re.findall(r"\\[{}]", tail)),
                            " ".join(tail[:140].split())))
        else:
            semi = body.find(";", pos)
            if semi < 0:
                return ("no-semicolon", rnd, body[pos:pos + 60])
            loop, pos = body[pos:semi + 1], semi + 1
        values = cetz._loop_values(spec, len(vars_))
        if values is None:
            return ("loop-values", rnd, spec[:70])
        chunks = []
        for n, vals in enumerate(values):
            piece = loop
            for var, val in zip(vars_, vals):
                piece = re.sub(r"\\%s(?!\w)" % var[1:], lambda _m, v=val: v, piece)
            if ev:
                src = ev[2].strip("{}")
                for var, val in zip(vars_, vals):
                    src = re.sub(r"\\%s(?!\w)" % var[1:], lambda _m, v=val: v, src)
                num = cetz.expr(src)
                if num is None:
                    return ("expr", rnd, src[:70])
                piece = re.sub(r"\\%s(?!\w)" % ev[1][1:], cetz._pgf_num(num), piece)
            if count:
                piece = re.sub(r"\\%s(?!\w)" % count[0], str(count[1] + n), piece)
            chunks.append(piece)
        body = body[:m.start()] + "".join(chunks) + body[pos:]
    return ("out-of-rounds", 64, "%d loops left" % len(cetz.FOREACH.findall(body)))


LC = 15.79
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    for pm in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pm.group(0)), LC)
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None or cetz._transform(head) is None:
            continue
        body = cetz.expand_def(body[pos:])
        if cetz.FOREACH.search(body) is None:
            continue
        exit_, rnd, snip = traced(body)
        if exit_ != "built" or cetz.expand_foreach(body) is None:
            print("%-42s %-14s round=%-3d %s" % (paper[:42], exit_, rnd, snip))
