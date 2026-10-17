r"""Why do three pictures that used to build now refuse?

The churn probe (`_work/probe_label_regen_guard.py`) counts a canvas LOST when a picture that built
before the `label=` fix stops building: an unseen spelling in a `label=` now refuses the whole picture
instead of drawing the text at a guess, which is the intended behaviour -- but only for spellings TeX
really places somewhere we cannot compute. Print the failing option values verbatim so the decision --
place it, or accept the refusal and its quoted page -- is made on the evidence.

Records every `label_placements` call that answers None, then rebuilds the named pictures.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
LIVE = cetz.label_placements
BAD = []


def spy(o):
    got = LIVE(o)
    if got is None:
        BAD.append(o.get("label"))
    return got


cetz.label_placements = spy
for prefix in sys.argv[1:]:
    for path in sorted((ROOT / "_work" / "flat").glob(prefix + "*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        for n, pic in enumerate(PIC.findall(text)):
            before = len(BAD)
            built = cetz.build(pic)
            if built is None and len(BAD) > before:
                print("### %s  picture %d" % (path.stem[:58], n))
                for val in BAD[before:]:
                    print("    label=%s" % str(val)[:120])
                for stmt in re.findall(r"\\node\s*\[[^\]]*label[^\]]*\][^;]*;", pic):
                    print("    stmt: %s" % " ".join(stmt.split())[:150])
print("refusing label spellings seen: %d" % len(BAD))
