"""Why does each `plot` statement still refuse? Read-only, no compiling.

Run only when no batch is in flight. For every statement in _work/flat that contains a `plot`,
re-run the checks plot_points makes and print the one that fires.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

STMT = re.compile(r"\\(?:draw|fill|filldraw|path|stroke)\b[^;]*plot[^;]*;", re.S)


def why(stmt):
    """-> the name of the check inside plot_points that rejects this statement."""
    body = stmt.rstrip(";").strip()
    m = re.search(r"\s*plot\s*(\[[^\]]*\])?\s*", body)
    if not m:
        return "no-plot-keyword"
    head = re.match(r"\\(?:draw|fill|filldraw|path|stroke)\s*(\[[^\]]*\])?", body)
    scope = cetz.opts(head.group(1)[1:-1]) if head and head.group(1) else {}
    po = {**scope, **cetz.opts(m.group(1)[1:-1])} if m.group(1) else dict(scope)
    keys = {str(k).strip() for k in po}
    if keys & {"only marks", "each", "mesh", "surfaces"}:
        return "marks/mesh:%s" % sorted(keys & {"only marks", "each", "mesh", "surfaces"})
    if any(k.startswith("mark") for k in keys):
        return "mark=%s" % sorted(k for k in keys if k.startswith("mark"))
    smooth = "smooth" in keys
    start = m.end()
    lit = re.match(r"\s*coordinates\s*", body[start:])
    if lit:
        inner, _end = cetz.bracketed(body, start + lit.end())
        if inner is None:
            return "coords:unbracketed"
        toks = re.findall(r"\((?:[^()]|\([^()]*\))*\)", inner)
        bad = [t for t in toks if cetz.point(t, None, {}, cetz.IDENT) is None]
        if bad:
            return "coords:unparsed %d/%d e.g.%s" % (len(bad), len(toks), bad[0][:28])
        if len(toks) < 2:
            return "coords:too-few %d" % len(toks)
        if smooth and len(toks) < cetz.PLOT_SMOOTH_MIN:
            return "coords:smooth-only %d" % len(toks)
        return "ok"
    operand, _end = cetz._plot_operand(body, start) or (None, None)
    var = str(po.get("variable") or "\\x").strip()
    dom = re.split(r"\s*:\s*", str(po.get("domain") or "").strip())
    if operand is None:
        return "sample:no-operand %r" % body[start:start + 30]
    if len(dom) != 2:
        return "sample:no-domain %r" % str(po.get("domain"))
    if not var.startswith("\\"):
        return "sample:variable %r" % var
    lo, hi = cetz.expr(dom[0].replace(" ", "")), cetz.expr(dom[1].replace(" ", ""))
    if lo is None or hi is None:
        return "sample:domain-expr %r" % (dom,)
    n = max(2, int(float(po.get("samples") or 25)))
    if smooth and n < cetz.PLOT_SMOOTH_MIN:
        return "sample:smooth-only %d" % n
    for i in range(min(n, 5)):
        t = lo + (hi - lo) * i / (n - 1)

        def value(src, _t="%.10g" % t):
            return cetz.expr(re.sub(re.escape(var) + r"(?![a-zA-Z])", _t, src))
        y = value(operand[1])
        x = t if operand[0] is None else value(operand[0])
        if x is None or y is None:
            return "sample:expr-fails %r" % (operand,)
    return "ok"


counts = {}
seen = []
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    for m in STMT.finditer(tex.read_text(encoding="utf-8", errors="replace")):
        stmt = re.sub(r"\s+", " ", m.group(0)).strip()
        got = why(stmt)
        bucket = re.sub(r"\d+", "N", got[:60])
        counts[bucket] = counts.get(bucket, 0) + 1
        if got != "ok" and len(seen) < 40:
            seen.append("%s  %s  %s" % (tex.stem[:30], got[:44], stmt[:96]))

print("plot statements by refusing check:")
for k, v in sorted(counts.items(), key=lambda kv: -kv[1]):
    print("%4d  %s" % (v, k))
print("\n-- samples --")
print("\n".join(seen))
