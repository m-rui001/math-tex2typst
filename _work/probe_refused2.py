"""Ask the real pipeline, with the paper's own macro table, which formulas come back raw.

convert_paper is called on the top papers by math_unconverted; the spy records every
refused formula as the converter saw it, plus the isolated pandoc warning.
Run: python _work/probe_refused2.py [top-n]
"""
import collections
import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import convert, mathconv  # noqa: E402

OUT = ROOT / "_work" / "refused2"
OUT.mkdir(exist_ok=True)

counts = []
for rep in (ROOT / "typst").glob("*/report.json"):
    n = (json.loads(rep.read_text(encoding="utf-8", errors="replace")).get("stats") or {}).get("math_unconverted", 0)
    if n:
        counts.append((n, rep.parent.name))
counts.sort(reverse=True)
top = counts[:int(sys.argv[1]) if len(sys.argv) > 1 else 4]
print("papers with math_unconverted: %d ; total %d" % (len(counts), sum(c[0] for c in counts)))

kinds = collections.Counter()
orig = mathconv.convert_formulas
state = {"paper": None, "seen": {}}


def spy(formulas, refs=None):
    converted, refused, err = orig(formulas, refs)
    mine = state["seen"].setdefault(state["paper"], {})
    for idx in sorted(refused):
        tex = formulas[idx]
        if tex in mine:
            continue  # _bisect retries the same formula in smaller batches
        cleaned = mathconv.clean(tex, refs)
        first = collections.Counter(
            m.group(1) for m in __import__("re").finditer(r"\\([a-zA-Z]+)", cleaned)).most_common(4)
        for name, _n in first:
            kinds[name] += 1
        batch, skipped = mathconv.build_batch([tex], refs)
        _out, e = mathconv.run_pandoc(batch)
        mine[tex] = ("REFUSED %s\n  raw:      %s\n  cleaned:  %s\n  warn: %s"
                     % (skipped, " ".join(tex.split())[:150], " ".join(cleaned.split())[:150],
                        " ".join((e or "").split())[-190:]))
    return converted, refused, err


mathconv.convert_formulas = spy
convert.mathconv.convert_formulas = spy

for n, name in top:
    state["paper"] = name
    src = ROOT / "_work" / "flat" / (name + ".tex")
    # a private copy of the flat source keeps this probe's _work_tex out of the batch's way
    mine = OUT / "flat"
    mine.mkdir(exist_ok=True)
    (mine / src.name).write_bytes(src.read_bytes())
    convert.convert_paper(mine / src.name, OUT / name, name, keep_work=True)
    got = state["seen"].get(name, {})
    print("  %s report=%d refused=%d" % (name[:44], n, len(got)))
    for tex, block in list(got.items())[:6]:
        print(block)

print("\nmost frequent control sequences inside refused maths:")
for k, v in kinds.most_common(25):
    print("  %-22s %d" % (k, v))
