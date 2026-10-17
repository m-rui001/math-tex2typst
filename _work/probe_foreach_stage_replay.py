"""Which stage of the production chain re-introduces the `\foreach` the unroller already removed?

`probe_static_families` reports this picture as UNSUPPORTED-flagged `\foreach`, yet production's
expand_foreach returns a body for it, so the token left in the text was put back after the unroll.
The chain is replayed stage by stage, printing the count of `\foreach` after each.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

p = next(ROOT.glob("_work/flat/The-maximum-number-of-mutually-unbiased-ba*.tex"))
pal = {m.group(1): (m.group(2), m.group(3))
       for m in re.finditer(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}",
                            p.read_text(encoding="utf-8", errors="replace"))}
src = p.read_text(encoding="utf-8", errors="replace")
for pm in PICTURE.finditer(src):
    core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pm.group(0)), LC)
    body = core[len("\\begin{tikzpicture}"):].lstrip()
    head, pos = cetz._opts_at(body, 0)
    if head is None or cetz._transform(head) is None:
        continue
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    body = body[:end] if end >= 0 else body

    def n(text):
        return len(re.findall(r"\\foreach", text))

    steps = [("source", body)]
    for name, fn in (("expand_def", cetz.expand_def), ("expand_foreach", cetz.expand_foreach),
                     ("expand_def2", cetz.expand_def), ("expand_pgfmath", cetz.expand_pgfmath),
                     ("expand_ifnum", cetz.expand_ifnum)):
        got = fn(steps[-1][1])
        if got is None:
            steps.append((name + "->None", ""))
            break
        steps.append((name, got))
    for name, text in steps:
        print("%-16s foreach=%d" % (name, n(text)))
    if n(steps[-1][1]):
        m = re.search(r"\\foreach", steps[-1][1])
        print("   left: %s" % " ".join(steps[-1][1][m.start():m.start() + 170].split()))
    print("   build ->", "ok" if cetz.build(core, pal) else "refused")
