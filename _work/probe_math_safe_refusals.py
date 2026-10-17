r"""Which figure formulas does the CURRENT `math_safe` still refuse, and under which of its rules?

#47 replaced the guard's allow-list ("a `_` may only follow alphanumerics or `" } ) ]`") with a
deny-list ("what cannot END an atom"), so the number that matters afterwards is not how many
formulas were rescued but how many the new rule still stops -- and whether those are the ones the
rule is there for. This replays every picture in `_work/flat` with `math_safe` wrapped, asks the
live rules one at a time which tripped, and prints the distinct formulas per bucket. Read-only:
nothing here compiles, so it can run beside a batch.
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


def rule(tex):
    """The first live clause that trips, in the order `math_safe` checks them."""
    if "#" in tex or "$" in tex:
        return "hash-or-dollar"
    for m in re.finditer(r"[\^_]", tex):
        base = tex[:m.start()].rstrip()
        if not base or base[-1] in "([{/^_":
            return "no-base"
    if re.search(r"[\^_](?:[\^_]|$)", tex):
        return "double-script"
    if re.search(r"\*/|/\*|//", tex):
        return "comment"
    if re.search(r"[A-Za-z][0-9]", tex):
        return "fused-identifier"
    if tex[:1] == "/" or tex[-1:] == "/":
        return "slash-edge"
    return "not refused"


kept = Counter()
shown = Counter()
papers = {}
_orig = cetz.math_safe


def wrap(tex):
    ok = _orig(tex)
    if not ok:
        why = rule(tex)
        kept[why] += 1
        papers.setdefault(why, set()).add(current)
        if shown[why] < 3:
            shown[why] += 1
            print("  %s> %r" % (why, tex[:90]))
    return ok


current = None
cetz.math_safe = wrap
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    current = path.stem
    source = path.read_text(encoding="utf-8", errors="replace")
    try:
        wide = line_cm(prep.parse_preamble(source))
    except Exception:
        wide = None
    for m in PIC.finditer(source):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
        cetz.build(core) or cetz.build_cd(core)
cetz.math_safe = _orig

print("== occurrences the live guard still refuses: %d" % sum(kept.values()))
for why, n in kept.most_common():
    print("  %-18s %3d occurrences / %2d papers" % (why, n, len(papers[why])))
