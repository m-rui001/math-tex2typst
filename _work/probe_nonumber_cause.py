"""Why would a labelled display still print nothing for its number, after the notag fix?

Reads only the flat LaTeX, no pandoc and no typst, so it can run while a batch is in flight.
It mirrors emit.py's decision: a display is numbered when its outer environment is one of
NUMBERED_ENVS without a star, carries no `\tag`, and does not put `\notag`/`\nonumber` on every
one of its depth-0 rows.  Anything labelled that fails one of those tests is a reference that
will read [??] on the page, so this prints the cause mix and the papers that hold it.
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit  # noqa: E402

MATH_ENV = "|".join(emit.NUMBERED_ENVS) + r"|equation|eqnarray|gather|multline"
DISPLAY = re.compile(r"\\\[(?:[^\[\]]|\\\[|\\\])*?\\\]|\\begin\{((?:%s)\*?)\}.*?\\end\{\1\}"
                     % MATH_ENV, re.S)
ROW = re.compile(r"\\\\")
NESTED = emit.NESTED_MATH


def cause(core):
    env_m = re.search(r"\\begin\{([a-zA-Z*]+)\}", core)
    env = env_m.group(1) if env_m else ("displaymath" if core.strip().startswith("\\[") else "math")
    if "\\label" not in core:
        return None
    if env not in emit.NUMBERED_ENVS:
        return "env:%s" % env
    if "*" in env:
        return "starred"
    if re.search(r"\\tag\s*\{", core):
        return "tag"
    if emit._all_rows_tagged(core):
        return "all-rows-tagged"
    return None


counts = collections.Counter()
where = collections.defaultdict(list)
numbered_labels = 0

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    for m in DISPLAY.finditer(src):
        core = m.group(0)
        lab = re.search(r"\\label\{([^}]*)\}", core)
        if lab is None:
            continue
        numbered_labels += 1
        why = cause(core)
        if why is None:
            counts["numbered"] += 1
            continue
        counts[why] += 1
        if len(where[why]) < 4:
            where[why].append((paper, " ".join(core.split())[:120]))

print("labelled displays:", numbered_labels)
for key, n in counts.most_common():
    print("%-20s %5d" % (key, n))
print()
for key in sorted(where):
    if key == "numbered":
        continue
    print("== %s" % key)
    for paper, snip in where[key]:
        print("   %-44s %s" % (paper[:44], snip))
