"""Split the 18 statement-level refusals into sub-families by what their head declares.

A picture reaches 'statement' when every expansion stage passed and `cetz.build` still returned
None, so the blame is on one statement inside the body. Print the head's option keys and the first
statements, plus the CETZ line the translator gives up on, so the family names itself.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")
STMT = re.compile(r"\\(draw|node|path|fill|filldraw|clip|coordinate|scope)(?![a-zA-Z])")

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(src)}
    for m in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
        if cetz.build(core, pal) is not None or cetz.build_cd(core) is not None:
            continue
        if not core.startswith("\\begin{tikzpicture}"):
            continue
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None or cetz._transform(head) is None:
            continue
        body = cetz.expand_foreach(body[pos:])
        if body is None:
            continue
        body = cetz.expand_def(body)
        if body is None:
            continue
        got = cetz.expand_tikzset(cetz.drop_clips(body))
        if got is None:
            continue
        cols = cetz._colors(got[1])
        if cols is None or cetz.UNSUPPORTED.search(cols[1]) or \
                cetz.scoped(cols[1], cetz._transform(head)) is None:
            continue
        names = sorted(k.strip() for k in head if k.strip().endswith("/.style"))
        arrow = sorted(str(v) for k, v in head.items() if k.strip() in (">", ">=", "<"))
        print("== %-44s styles=%s arrows=%s" % (paper[:44], names, arrow))
        for stmt in [s for s in re.split(r";", cols[1]) if STMT.search(s)][:3]:
            print("     %s" % " ".join(stmt.split())[:150])
