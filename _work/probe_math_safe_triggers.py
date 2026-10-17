r"""Why does a figure formula fall back to a quoted string, and how often is each reason the cause?

`_math_body` quotes a whole formula when `math_safe` trips (cetz.py:1349), and Typst then prints its
`_`, `^` and command names as typed letters -- 159 such formulas sit on figure pages over 87 papers.
The guard has four independent tests, so "which one fires" is the size of each fix: the prime case
(`P'_{u,b}` is legal Typst and the guard refuses it) may be most of the residue or none of it, and
guessing from one picture is how a round gets aimed at the wrong rule. This runs the proven full
build path over every picture that builds and records, per failing formula, which test said no --
and, for EVERY script in every formula whether it passes or not, the character that stands before
it. That second column is the one a widening has to be measured against: it says which bases Typst
must be asked about, rather than which one picture happened to complain about.
"""
import pathlib
import re
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402  the batch's own \linewidth -> cm

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
NOBASE = re.compile(r"(?:^|[^A-Za-z0-9\"}\)\]])[\^_]")
DOUBLED = re.compile(r"[\^_](?:[\^_]|$)")
FUSED = re.compile(r"\*/|/\*|//|[A-Za-z][0-9]")

STATS = Counter()
SAMPLES = {}
_orig = cetz.math_safe


def classify(tex):
    if "#" in tex or "$" in tex:
        m = NOBASE.search(tex)
        return "hash-or-dollar", (m.group(0)[-1] if m else "")
    m = NOBASE.search(tex)
    if m:
        return "script-no-base", repr(m.group(0)[-2] if len(m.group(0)) > 1 else "^start")
    m = DOUBLED.search(tex)
    if m:
        return "doubled-or-trailing-script", repr(m.group(0))
    m = FUSED.search(tex)
    if m:
        return "fused-identifier", m.group(0)[:6]
    if tex[:1] == "/" or tex[-1:] == "/":
        return "slash-edge", ""
    return "said-unsafe-for-no-reason", ""


def wrap(tex):
    ok = _orig(tex)
    for m in re.finditer(r"[\^_]", tex):
        STATS["before"] += 1
        STATS["before|%r" % (tex[m.start() - 1:m.start()] or "start")] += 1
    if not ok:
        reason, detail = classify(tex)
        STATS[reason] += 1
        STATS["%s|%s" % (reason, detail)] += 1
        if len(SAMPLES.get(reason, [])) < 4:
            SAMPLES.setdefault(reason, []).append(tex[:90])
    return ok


cetz.math_safe = wrap
total = built = 0
for typ in sorted((ROOT / "typst").glob("*/main.typ")):
    name = typ.parent.name
    src = ROOT / "_work" / "flat" / (name + ".tex")
    if not src.exists():
        continue
    source = src.read_text(encoding="utf-8", errors="replace")
    try:
        wide = line_cm(prep.parse_preamble(source))
    except Exception:
        wide = None
    for m in PIC.finditer(source):
        total += 1
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
        if cetz.build(core) or cetz.build_cd(core):
            built += 1
cetz.math_safe = _orig

print("pictures %d, built %d" % (total, built))
print("== formulas handed to math_safe that came back unsafe: %d"
      % sum(n for k, n in STATS.items() if "|" not in k and k != "before"))
for key, n in sorted(STATS.items(), key=lambda kv: (-kv[1], kv[0])):
    if "|" not in key and key != "before":
        print("  %-26s %5d" % (key, n))
        for sub, m in sorted((k, v) for k, v in STATS.items() if k.startswith(key + "|")):
            print("        %-14s %5d" % (sub.split("|", 1)[1], m))
print("== every character that stands before a script in a figure formula")
for sub, m in sorted(((k, v) for k, v in STATS.items()
                      if k.startswith("before|")), key=lambda kv: -kv[1]):
    print("  %-12s %5d" % (sub.split("|", 1)[1], m))
for reason, got in SAMPLES.items():
    for s in got[:2]:
        print("  %s> %s" % (reason, s))
