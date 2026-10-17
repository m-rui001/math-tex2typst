r"""#99: what made each zero-length `line((x, y), (x, y))` that shipped on run147's products?

§7's open row says pgf answers a zero-length subpath with a blob of ink when the pen has a round cap,
while Typst answers it with nothing at all -- but the 24 emissions the face counts are not all that
shape. Some sit on calls that paint only (`stroke: none`), where neither engine puts ink and the row is
not their account; some come from a `\draw` that restarts a subpath, where the author never wrote a
zero-length path and our walker resolved two different points onto the same one.

Attribution goes through the emitter, not through text: `convert.convert_paper` runs on a scratch
output directory (`typst/` is not written) with `cetz.build` wrapped, so each picture arrives exactly
as the batch hands it -- macro-expanded and linewidth-folded already. A captured core is split by
`cetz.split_statements`, the splitter the walker itself uses, and rebuilt statement by statement; a
degenerate call is charged to the step whose rebuild first grows it. The full-length rebuild must
reproduce the picture's own count, else the canvas is reported unattributed.

  python _work/probe99_degenerate_split.py      # -> _work/label99_degen_split.txt
"""
import collections
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TMP = os.path.join(WORK, "_m99out")
OUT = os.path.join(WORK, "label99_degen_split.txt")
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, WORK)

from t2t import cetz, convert  # noqa: E402
from probe98_loop_face import DEGEN, shipped_lines, source_of  # noqa: E402

END = "\\end{tikzpicture}"
VERB = re.compile(r"\\(draw|path|fill|filldraw|shade|node|coordinate|useasboundingbox)\b")
CAP = re.compile(r"line cap\s*=\s*(round|rect|butt|square)|cap:\s*\"(round|square|butt)\"")

_caught = []
_real_build = cetz.build


def _spy(tikz, colors=None, line_cm=None):
    out = _real_build(tikz, colors, line_cm)
    _caught.append((tikz, out))
    return out


def degen_calls(emission):
    """The emitted lines holding a zero-length `line(...)`; probe98's own criterion per line."""
    return [ln.strip() for ln in (emission or "").splitlines() if DEGEN.search(ln)]


def faces():
    """{stem: degenerate lines} read off the products with probe98's scanner."""
    out = collections.OrderedDict()
    for stem in sorted(os.listdir(os.path.join(ROOT, "typst"))):
        full = os.path.join(ROOT, "typst", stem, "main.typ")
        if not os.path.isfile(full):
            continue
        n = len(shipped_lines(full))
        if n:
            out[stem] = n
    return out


def attribute(core, emission):
    """([(statement, [new degenerate calls], canvas_of_that_step)], count_reproduced)."""
    m = re.match(r"\\begin\{tikzpicture\}", core)
    if not m or END not in core:
        return [], False
    stmts = cetz.split_statements(core[m.end():core.index(END)])
    target = collections.Counter(degen_calls(emission))
    if not target:
        return [], False
    seen, hits = collections.Counter(), []
    for k in range(1, len(stmts) + 1):
        pic = "\\begin{tikzpicture}" + "".join(s + ";" for s in stmts[:k]) + END
        got = _real_build(pic)
        now = collections.Counter(degen_calls(got))
        grew = now - seen
        if grew:
            hits.append((stmts[k - 1], sorted(grew.elements()), got))
        seen = now
    return hits, seen == target


def describe(line, stmt, core):
    verb = VERB.search(stmt)
    return dict(verb=verb.group(1) if verb else "?",
                stroke=("stroke: none" not in line),
                fill=("fill:" in line),
                mark=("mark:" in line),
                cycle=("cycle" in stmt),
                cap=("statement" if CAP.search(stmt) else
                     "picture head" if CAP.search(core.split(END)[0][:400]) else "-"))


def main():
    if not os.path.isdir(TMP):
        os.makedirs(TMP)
    cetz.build = _spy
    counter = faces()
    print("face: %d degenerate emissions over %d papers" % (sum(counter.values()), len(counter)))
    rows, per_paper = [], []
    for stem, want in counter.items():
        src = source_of(stem)
        if not src:
            per_paper.append("%s  no flat source" % stem)
            continue
        del _caught[:]
        try:
            convert.convert_paper(src, os.path.join(TMP, stem), stem)
        except Exception as exc:                                  # noqa: BLE001
            per_paper.append("%s  pipeline raised %r" % (stem, exc))
            continue
        pics, seen_core = [], set()
        for core, emission in _caught:
            if emission and core not in seen_core and degen_calls(emission):
                seen_core.add(core)
                pics.append((core, emission))
        got_n = 0
        for core, emission in pics:
            hits, ok = attribute(core, emission)
            for stmt, lines, canvas in hits:
                info = describe(lines[0], stmt, core)
                rows.append((stem, info, lines[0], stmt.replace("\n", " ")[:200], ok))
                got_n += len(lines)
            if not ok and not hits:
                rows.append((stem, dict(verb="?", stroke=None, fill=None, mark=None,
                                        cycle=None, cap="?"), "(unattributed picture)",
                             core[:200], False))
        per_paper.append("%-56s face=%d attributed=%d pictures=%d%s"
                         % (stem[:56], want, got_n, len(pics),
                            "" if got_n == want else "   <<< gap"))
    cetz.build = _real_build

    buckets = collections.Counter()
    for stem, info, line, stmt, ok in rows:
        buckets[(info["stroke"], info["fill"], info["cycle"], info["verb"])] += 1
    out = ["", "== buckets: (stroked, filled, `cycle` in statement, verb) -> count"]
    for key, n in sorted(buckets.items(), key=lambda kv: (-kv[1], str(kv[0]))):
        out.append("  %-46s %d" % (str(key), n))
    out.append("")
    out.append("== per paper")
    out += per_paper
    out.append("")
    out.append("== per emission (stroked first)")
    for stem, info, line, stmt, ok in sorted(rows, key=lambda r: (r[1]["stroke"] is not True, r[0])):
        out.append("%-56s %-9s stroke=%s fill=%s mark=%s cycle=%s cap=%s%s"
                   % (stem[:56], info["verb"], info["stroke"], info["fill"], info["mark"],
                      info["cycle"], info["cap"], "" if ok else "   UNATTRIBUTED"))
        out.append("    emitted %s" % line[:120])
        out.append("    stmt    %s" % stmt[:190])
    text = "\n".join(out) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
