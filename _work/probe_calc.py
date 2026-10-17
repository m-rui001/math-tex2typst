"""Check the calc-coordinate reading against the shapes the corpus actually writes."""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

names = {"A": (0.0, 0.0, 0.0, 0.0), "B": (4.0, 2.0, 0.0, 0.0), "sw": (0.0, 0.0, 0.0, 0.0),
         "nw": (0.0, 3.0, 0.0, 0.0), "Xzero": (1.5, 0.5, 0.0, 0.0)}
ok = [
    ("($(A)!.25!(B)$)", (1.0, 0.5)),
    ("($(A)!0.5!(B)$)", (2.0, 1.0)),
    ("($(A)!1!(B)$)", (4.0, 2.0)),
    ("($(A)!2!(B)$)", (8.0, 4.0)),
    ("($(sw)!.25!(nw)$)", (0.0, 0.75)),
    ("($(Xzero)+(-.76,.06)$)", (0.74, 0.56)),
    ("($(A)-(1,1)$)", (-1.0, -1.0)),
]
bad = ["($(A)!.25!(nope)$)", "$(A)!.25!(B)$", ("($(A)!2cm!(B)$)"),
       "($(A)!(B)!(C)$)", ("($(A)!0.5!(B)!0.5!(C)$)"), ("($(A)++(1,1)$)")]

for token, want in ok:
    got = cetz.point(token, None, names, cetz.IDENT)
    if got is None or max(abs(got[0] - want[0]), abs(got[1] - want[1])) > 1e-9:
        raise SystemExit("wrong: %s -> %s, want %s" % (token, got, want))
    print("ok   %-26s -> (%.3f, %.3f)" % (token, got[0], got[1]))
for token in bad:
    got = cetz.point(token, None, names, cetz.IDENT)
    if got is not None:
        raise SystemExit("should refuse: %s -> %s" % (token, got))
    print("refused %s" % token)
# a scaled axis applies to a written delta but not to a named point that already carries it
scaled = cetz.point("($(A)+(-1,0)$)", None, names, (2.0, 3.0, 0.0, 0.0))
print("scaled offset ->", scaled)
