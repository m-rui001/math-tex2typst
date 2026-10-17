r"""Every \cite command that sits inside maths in the flat corpus, and what the paper's bibliography is.

bake_refs strings a maths citation into upright("[??]") because the maths converter knows only the
label catalogue, not the .bib. Before changing that path this counts, per paper, which cite commands
appear in maths, whether the paper has a refs.bib (so #cite can be resolved at all), and whether the
key is in it.
"""
import io
import os
import re
import sys
from bisect import bisect_right

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import mathconv  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
TYPST = os.path.join(ROOT, "typst")

ENV = re.compile(r"\\begin\{((?:equation|align|alignat|gather|multline|flalign|eqnarray|displaymath|math)"
                 r"\*?)\}.*?\\end\{\1\}", re.S)
DISPLAY = re.compile(r"\\\[.*?\\\]", re.S)
INLINE_D = re.compile(r"\$[^$]*\$", re.S)
BIBKEY = re.compile(r"@\w+\s*\{\s*([^,{}\s]+)")
CMD = re.compile(r"\\([A-Za-z]+)")


def merged_spans(body):
    """Sorted, non-overlapping [(start, end)] for the regions this scanner calls maths."""
    raw = []
    for rx in (ENV, DISPLAY, INLINE_D):
        for m in rx.finditer(body):
            raw.append((m.start(), m.end()))
    raw.sort()
    out = []
    for s, e in raw:
        if out and s <= out[-1][1]:
            out[-1][1] = max(out[-1][1], e)
        else:
            out.append([s, e])
    return [tuple(x) for x in out]


def in_math(pos, spans, starts):
    """True when pos falls in a maths span, found by binary search."""
    i = bisect_right(starts, pos) - 1
    return i >= 0 and pos < spans[i][1]


def main():
    n = 0
    cmds = {}
    for fn in sorted(os.listdir(FLAT)):
        if not fn.endswith(".tex"):
            continue
        name = fn[:-4]
        body = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
        spans = merged_spans(body)
        starts = [s for s, _e in spans]
        hits = [m for m in mathconv.MATH_CITE.finditer(body) if in_math(m.start(), spans, starts)]
        if not hits:
            continue
        n += 1
        bibpath = os.path.join(TYPST, name, "refs.bib")
        keys = set()
        if os.path.exists(bibpath):
            keys = set(BIBKEY.findall(io.open(bibpath, encoding="utf-8", errors="replace").read()))
        for m in hits:
            cmd = CMD.match(m.group(0)).group(1)
            cmds[cmd] = cmds.get(cmd, 0) + 1
            opts = re.findall(r"\[([^\]]*)\]", m.group(0))
            citekeys = [k.strip() for k in m.group(1).split(",")]
            bad = [k for k in citekeys if k not in keys]
            print("%-46s refs.bib=%-5s %-11s opts=%s keys=%s%s" % (
                name[:46], bool(keys), cmd,
                "; ".join(o.encode("unicode_escape").decode() for o in opts),
                citekeys, "  NOT_IN_BIB:" + ",".join(bad) if bad else ""))
    print("papers with a cite inside maths: %d" % n)
    print("command histogram: %s" % sorted(cmds.items(), key=lambda kv: -kv[1]))


main()
