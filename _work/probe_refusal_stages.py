"""Why does each refused TikZ picture refuse? Walk cetz.build stage by stage.

Read-only over _work/flat. Run only when no batch is in flight (compiles a few canvases).
"""
import collections
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, convert, prep  # noqa: E402

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)

reasons = collections.Counter()
samples = {}
refused = converted = 0
records = []


def note(key, pic, paper):
    reasons[key] += 1
    samples.setdefault(key, (paper, pic[:500]))


def classify(paper, pic, p):
    """-> stage label for why cetz.convert rejects this picture, or None when it draws.

    `p` is the parsed preamble object, exactly what production hands convert.line_cm (convert.py:176
    reads p.geometry) after prep.split_document + prep.parse_preamble (convert.py:236-237).
    """
    # production folds a `\linewidth` basis into cm before it reads the axes (cetz.py:2784), so a
    # probe that skips this reports a `transform` family that production does not refuse
    core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), convert.line_cm(p))
    if not core.startswith("\\begin{tikzpicture}"):
        return "cd" if cetz.build_cd(core) is None else None
    m = re.match(r"\\begin\{tikzpicture\}", core)
    body = core[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    if head is None:
        return "opts"
    base = cetz._transform(head)
    if base is None:
        return "transform"
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    if end < 0:
        return "fragment"
    body = body[:end]
    body = cetz.expand_def(body)
    body = cetz.expand_foreach(body)
    if body is None:
        return "foreach"
    body = cetz.expand_pgfmath(body)
    if body is None:
        return "pgfmath"
    body = cetz.expand_ifnum(body)
    if body is None:
        return "ifnum"
    # production drops the clip statements here (cetz.py:2550); without this the probe
    # counts a dropped `\clip` as a refusal and names a family that no longer exists
    body = cetz.drop_clips(body)
    got = cetz.expand_tikzset(body)
    if got is None:
        return "tikzset"
    extra, body = got
    cols = cetz._colors(body)
    if cols is None:
        return "colors"
    bad = cetz.UNSUPPORTED.search(cols[1])
    if bad:
        return "unsupported:" + bad.group(0).lstrip("\\")
    pal, body = cols
    placed = cetz.scoped(body, base)
    if placed is None:
        return "scoped"
    styles = cetz.picture_styles(head)
    styles.update(extra)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    for stmt, xf in placed:
        if cetz.translate_statement(stmt, names, xf, pal, styles) is None:
            return "statement:" + re.sub(r"\s+", " ", stmt.strip())[:60]
    canvas = cetz.build(core)
    if canvas is None:
        return "lines-empty"
    if not cetz.sane(canvas):
        return "insane"
    if not cetz.compiles(canvas):
        return "compile"
    return None


for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    # the way production builds it (convert.py:236-237): split_document then parse_preamble, once
    # per paper; convert.line_cm then reads p.geometry off that object
    pre_text, _body = prep.split_document(text)
    p = prep.parse_preamble(pre_text)
    for i, m in enumerate(PICTURE.finditer(text)):
        why = classify(tex.stem, m.group(0), p)
        rec = {"paper": tex.stem, "index": i, "stage": why, "pic": m.group(0)[:400]}
        if why is not None:
            # production lifts the picture out of the body already macro-expanded
            # (convert.py:251 prep.expand_macros), so a stage named on the unexpanded text is
            # the probe's own failure, not the gate's: \FiniteSquare{...} is not a TikZ construct
            exp = prep.expand_macros(m.group(0), p.macros)
            rec["expanded_stage"] = classify(tex.stem, exp, p)
            rec["expanded_pic"] = exp[:400]
            note(why, m.group(0), "%s#%d" % (tex.stem[:48], i))
            refused += 1
        else:
            converted += 1
        records.append(rec)

print("pictures %d  converted %d  refused %d" % (converted + refused, converted, refused))
print("\n-- refusal stages --")
for k, v in reasons.most_common():
    print("%4d  %s" % (v, k))
print("\n-- the same pictures on the macro-expanded text production actually gates --")
exp_stages = collections.Counter()
for r in records:
    if r["stage"] is None:
        continue
    exp_stages[r.get("expanded_stage") or "draws (probe-only refusal)"] += 1
for k, v in exp_stages.most_common():
    print("%4d  %s" % (v, k))
print("\n-- refused papers --")
by_paper = collections.defaultdict(list)
for r in records:
    if r["stage"]:
        by_paper[r["paper"]].append((r["index"], r["stage"], r.get("expanded_stage")))
for paper in sorted(by_paper):
    print("%s  %s" % (paper[:52], by_paper[paper]))
out = []
for k, v in reasons.most_common():
    paper, s = samples[k]
    out.append("### %s (%d) [%s]\n%s" % (k, v, paper, s))
pathlib.Path(ROOT / "_work" / "refusal_stages.txt").write_text(
    "\n\n===================\n\n".join(out), encoding="utf-8")
json.dump({"total": converted + refused, "converted": converted, "refused": refused,
           "stages": dict(reasons), "records": records},
          open(ROOT / "_work" / "refusal_stages.json", "w", encoding="utf-8"),
          ensure_ascii=False, indent=1)
print("wrote _work/refusal_stages.txt and _work/refusal_stages.json")
