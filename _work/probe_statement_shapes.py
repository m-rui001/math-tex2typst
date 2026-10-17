"""Which statement kills each picture the builder got as far as translating?

`probe_static_families.py` ends at the family named 'statement' -- the expander chain and the scope
walk all passed, and one statement inside `build`'s translate loop returned None. That loop is
replayed here, one statement at a time, so the refusal prints the offending statement instead of the
picture it belongs to. Nothing here calls typst, so it can run beside a batch.
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

shapes = collections.Counter()
samples = collections.defaultdict(list)


def signature(stmt):
    s = " ".join(stmt.split())
    verb = re.match(r"\\(\w+)", s)
    verb = verb.group(1) if verb else s.split("{")[0][:12]
    # the shape is what generalises: keep the verb and the connective skeleton, drop coordinates
    skel = re.sub(r"\(([^()]*)\)", "(P)", s)
    skel = re.sub(r"-\*-.*", "node", skel)
    return verb, skel[:96]


for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    pal = {}
    for m in DEFINECOLOR.finditer(src):
        pal[m.group(1)] = (m.group(2), m.group(3))
    for m in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
        if cetz.build(core, pal) is not None or cetz.build_cd(core) is not None:
            continue
        if not core.startswith("\\begin{tikzpicture}"):
            continue
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None:
            continue
        base = cetz._transform(head)
        if base is None:
            continue
        body = body[pos:]
        end = body.rfind("\\end{tikzpicture}")
        if end < 0:
            continue
        body = cetz.expand_def(body[:end])
        body = cetz.expand_foreach(body)
        if body is None:
            continue
        body = cetz.expand_pgfmath(cetz.expand_def(body))
        if body is None:
            continue
        body = cetz.expand_ifnum(body)
        if body is None:
            continue
        got = cetz.expand_tikzset(cetz.drop_clips(body))
        if got is None:
            continue
        cols = cetz._colors(got[1])
        if cols is None or cetz.UNSUPPORTED.search(cols[1]):
            continue
        if cetz.scoped(cols[1], base) is None:
            continue
        # reached the statement loop: replay build's tail and report the first refusal
        placed = cetz.scoped(cols[1], base)
        pal2, body2 = cols
        styles = cetz.picture_styles(head)
        styles.update(got[0])
        names = {}
        for stmt, xf in placed:
            cetz.register(stmt, names, xf, styles)
        for stmt, xf in placed:
            if cetz.translate_statement(stmt, names, xf, pal2, styles) is not None:
                continue
            verb, skel = signature(stmt)
            shapes[verb] += 1
            if len(samples[verb]) < 4:
                samples[verb].append((paper, skel))
            break

print("pictures that die in the statement loop: %d" % sum(shapes.values()))
for k, n in shapes.most_common():
    print("%4d  %s" % (n, k))
print("---- shapes ----")
for k, n in shapes.most_common():
    print("== %s (%d)" % (k, n))
    for paper, skel in samples[k]:
        print("   %-42s %s" % (paper[:42], skel))
