"""Where does production's foreach unroller give up?

The exit-tagged copy of expand_foreach is obsolete now that production reads a statement to its
top-level `;` and accepts a brace-less list, so this asks production whether a picture still
refuses, then walks the same steps with a printed reason at each one.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def walk(body, rounds=4096):
    """Unroll like expand_foreach, printing the first step that cannot be taken."""
    for _ in range(rounds):
        m = cetz.FOREACH.search(body)
        if m is None:
            return body, None
        vars_ = [v.strip() for v in m.group(1).split("/")]
        pos = m.end()
        if body[pos:pos + 1] == "{":
            spec, pos = cetz.bracketed(body, pos)
            if spec is None:
                return body, "unbalanced list spec"
        else:
            brace = body.find("{", pos)
            semi = cetz._top_semicolon(body, pos)
            if brace < 0 or (0 <= semi < brace):
                return body, "brace-less list not readable: %r" % body[pos:pos + 60]
            spec, pos = body[pos:brace].strip(), brace
        gap = body[pos:].lstrip()
        pos += len(body[pos:]) - len(gap)
        if gap[:1] == "{":
            loop, pos = cetz.bracketed(body, pos)
            if loop is None:
                return body, "unbalanced loop body"
        else:
            semi = cetz._top_semicolon(body, pos)
            if semi < 0:
                return body, "no top-level ; for a statement body"
            loop, pos = body[pos:semi + 1], semi + 1
        values = cetz._loop_values(spec, len(vars_))
        if values is None:
            return body, "list %r unreadable for %d vars" % (spec[:60], len(vars_))
        chunks = []
        for vals in values:
            piece = loop
            for var, val in zip(vars_, vals):
                piece = re.sub(r"\\%s(?!\w)" % var[1:], lambda _m, v=val: v, piece)
            chunks.append(piece)
        body = body[:m.start()] + "".join(chunks) + body[pos:]
    return body, "out of rounds"


for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    for pm in PICTURE.finditer(src):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pm.group(0)), LC)
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None or cetz._transform(head) is None:
            continue
        body = cetz.expand_def(body[pos:])
        if cetz.FOREACH.search(body) is None:
            continue
        if cetz.expand_foreach(body) is not None:
            continue
        print("== %s (%d loops)" % (paper, len(cetz.FOREACH.findall(body))))
        left, why = walk(body)
        print("   production refuses; walk says: %s" % why)
        m = cetz.FOREACH.search(left)
        if m:
            print("   survivor: %s" % " ".join(left[m.start():m.start() + 170].split()))
