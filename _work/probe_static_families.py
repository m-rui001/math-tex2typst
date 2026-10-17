"""Static family census for the pictures the ledger still quotes, typed as production types them.

Unlike `probe_refusal_stages.py` this folds `\\linewidth` before reading the head (production does,
in `cetz.convert`) and it stops before `sane`/`compiles`, so it never spawns typst and can run
while a batch is in flight. `lc` is the text column the PRELUDE ships (memory: margin 2.9cm on
us-letter gives \\linewidth = 15.79cm); the census only needs a readable dimension there.
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
COLORLET = re.compile(r"\\colorlet\{([-\w]+)\}\{([^{}]*)\}")

fams = collections.Counter()
where = collections.defaultdict(list)
built = refused = 0


def note(key, paper, pic):
    fams[key] += 1
    if len(where[key]) < 3:
        where[key].append((paper, " ".join(pic.split())[:170]))


for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    # the same shape prep.py hands the pipeline: name -> (model, spec), unresolved until
    # `cetz._colors` folds it, which is also where a picture's own `\colorlet` enters
    pal = {}
    for m in DEFINECOLOR.finditer(src):
        pal[m.group(1)] = (m.group(2), m.group(3))
    for m in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
        canvas = cetz.build(core, pal)
        if canvas is None and cetz.build_cd(core) is not None:
            canvas = "cd"
        if canvas is not None:
            built += 1
            continue
        refused += 1
        if not core.startswith("\\begin{tikzpicture}"):
            note("cd", paper, core)
            continue
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None:
            note("opts", paper, core)
            continue
        if cetz._transform(head) is None:
            bad = [k for k, v in head.items() if isinstance(v, str)
                   and cetz._transform({k: v}) is None]
            note("transform:" + ",".join(sorted(k.strip() for k in bad)), paper, core)
            continue
        body = body[pos:]
        end = body.rfind("\\end{tikzpicture}")
        body = cetz.expand_def(body[:end] if end >= 0 else body)
        body = cetz.expand_foreach(body)
        if body is None:
            note("foreach", paper, core)
            continue
        body = cetz.expand_def(body)
        body = cetz.expand_pgfmath(body)
        if body is None:
            note("pgfmath", paper, core)
            continue
        body = cetz.expand_ifnum(body)
        if body is None:
            note("ifnum", paper, core)
            continue
        got = cetz.expand_tikzset(cetz.drop_clips(body))
        if got is None:
            note("tikzset", paper, core)
            continue
        cols = cetz._colors(got[1])
        if cols is None:
            note("colors", paper, core)
            continue
        bad = cetz.UNSUPPORTED.search(cols[1])
        if bad:
            note("unsupported:" + bad.group(0).lstrip("\\"), paper, core)
            continue
        if cetz.scoped(cols[1], cetz._transform(head)) is None:
            note("scoped", paper, core)
            continue
        note("statement", paper, core)

print("built statically: %d ; refused statically: %d" % (built, refused))
for k, n in fams.most_common():
    print("%4d  %s" % (n, k))
print("---- samples ----")
for k, n in fams.most_common():
    print("== %s (%d)" % (k, n))
    for paper, pic in where[k]:
        print("   %-44s %s" % (paper[:44], pic))
