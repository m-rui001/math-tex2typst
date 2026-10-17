r"""Every in-figure formula the live `math_safe` still refuses, with its PAPER and the
source line that produced it -- the read-only first step §7's row 918 asks for
("先按族数出「作者本来想要什么」再决定").

Read-only: wraps `cetz.math_safe` exactly as `_work/probe_math_safe_refusals.py` does, but
keeps the paper name for every site and prints the nearest source spelling, so the spec can
be written per family without guessing.  No typst, no `cetz.py` edit.
"""
import pathlib
import re
import sys
from collections import defaultdict

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)


def rule(tex):
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


hits = defaultdict(list)          # family -> [(paper, formula)]
src_cache = {}
_orig = cetz.math_safe
current = None


def wrap(tex):
    if not _orig(tex):
        hits[rule(tex)].append((current, tex))
    return True                        # let the build continue so later sites are seen


cetz.math_safe = wrap
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    current = path.stem
    source = path.read_text(encoding="utf-8", errors="replace")
    src_cache[current] = source
    try:
        wide = line_cm(prep.parse_preamble(source))
    except Exception:
        wide = None
    for m in PIC.finditer(source):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
        cetz.build(core) or cetz.build_cd(core)
cetz.math_safe = _orig

for why in ("fused-identifier", "hash-or-dollar", "comment", "slash-edge"):
    rows = hits.get(why, [])
    print("\n== %s: %d sites / %d papers ==" % (why, len(rows), len({p for p, _ in rows})))
    for paper, tex in rows:
        src = src_cache.get(paper, "")
        # the nearest source spelling: the first $...$ or \(...\) holding a like token
        needle = re.sub(r"[\\{}]", "", tex)[:6]
        ctx = ""
        for mm in re.finditer(r"\$[^$]*\$|\\\(.*?\\\)", src, re.S):
            if needle[:3] and needle[:3] in re.sub(r"[\\{}]", "", mm.group(0)):
                ctx = mm.group(0)[:70]
                break
        print("   %-46s %-34s %s" % (paper[:46], tex[:34], ctx))
