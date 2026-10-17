r"""What still blocks the last two quoted displays, one command at a time.

27 of the remaining residue occurrences are these two: an \begin{array} with \hline, \noalign
and nested pmatrix rows, and a \begin{split} carrying \tag, \text{\rm unit} and \operatorname.
_probe_refused_spans.py only had the cleaned text pandoc already rejected, which is a different
input than the source. Pull the display out of the flat file and try each single change.
"""
import io
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import mathconv  # noqa: E402

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FLAT = ROOT / "_work" / "flat"

WANT = ["Cylinder-loop-weights", "Exact-Birch-Swinnerton"]
QUOTED = re.compile(r'^\$ "(.+)" \$')

VARIANTS = [
    ("drop noalign", lambda s: re.sub(r"\\noalign\s*\{[^{}]*\}", "", s)),
    ("drop hline", lambda s: re.sub(r"\\hline(?![a-zA-Z])", "", s)),
    ("text->mathrm", lambda s: re.sub(r"\\text\s*\{", r"\\mathrm{", s)),
    ("operatorname->mathrm", lambda s: re.sub(r"\\operatorname\s*\{", r"\\mathrm{", s)),
    ("split->aligned", lambda s: s.replace(r"\begin{split}", r"\begin{aligned}")
                                .replace(r"\end{split}", r"\end{aligned}")),
    ("drop tag", lambda s: re.sub(r"\\tag\s*\{[^{}]*\}", "", s)),
    ("pmatrix->smallmatrix", lambda s: re.sub(r"\b([ptbdv]?matrix)\b", "smallmatrix", s)),
]


def spans_for(prefix):
    out = []
    for path in (ROOT / "typst").glob(prefix + "*/*.typ"):
        for line in path.read_text(encoding="utf-8", errors="replace").split("\n"):
            m = QUOTED.match(line.strip())
            if m:
                out.append(m.group(1).replace("\\\\", "\\").replace("\\n", "\n")
                          .replace('\\"', '"'))
    return out


for prefix in WANT:
    spans = spans_for(prefix)
    print("\n#### %s : %d quoted displays" % (prefix, len(spans)))
    for tex in spans[:2]:
        print("  source: %s" % " ".join(tex.split())[:190])
        print("  as-is converts: %s" % bool(mathconv.convert_formulas([tex], None)[0].get(0)))
        for label, fix in VARIANTS:
            got = mathconv.convert_formulas([fix(tex)], None)[0].get(0)
            if got:
                print("    UNBLOCKED by %-22s -> %s" % (label, " ".join(got.split())[:150]))
        all_at_once = tex
        for _l, fix in VARIANTS:
            all_at_once = fix(all_at_once)
        print("    all changes convert: %s"
              % bool(mathconv.convert_formulas([all_at_once], None)[0].get(0)))
