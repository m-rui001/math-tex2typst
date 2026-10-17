"""Which single command makes each refused display unconvertible.

The remaining residue is seven quoted LaTeX strings plus eight title pages. A display the batch
could not carry is written as '$ "..." $', so those strings are the refusals themselves; feed
each back through the converter with one suspect command changed at a time and see which change
lets it through.
"""
import io
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import mathconv  # noqa: E402

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
QUOTED = re.compile(r'^\$ "(.+)" \$')

FIXES = [
    ("vrule->llcorner", lambda s: re.sub(r"\\mathbin\{(?:\\vrule[^{}]+)*\}", "\u231e", s)),
    ("bare vrule->|", lambda s: re.sub(r"\\vrule[^{}]*?(?=\\vrule|\\}|\\,|\s[A-Za-z]|\}|$)", "|", s)),
    ("drop noalign", lambda s: re.sub(r"\\noalign\{[^{}]*\}", "", s)),
    ("operatorname->mathrm", lambda s: re.sub(r"\\operatorname\{([^{}]*)\}", r"\\mathrm{\1}", s)),
    ("text{rm}->mathrm", lambda s: re.sub(r"\\text\{\\mathrm\{([^{}]*)\}\}", r"\\mathrm{\1}", s)),
    ("big sizes dropped", lambda s: re.sub(r"\\(?:bigl|bigr|Bigl|Bigr|biggl|biggr|bigg|Big|big)\b", "", s)),
    ("setminus->backslash", lambda s: s.replace(r"\setminus", r"\backslash")),
    ("text->mathrm", lambda s: re.sub(r"\\text\{", r"\\mathrm{", s)),
]


def converts(latex):
    got = mathconv.convert_formulas([latex], None)[0].get(0)
    return got


spans = []
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    for line in path.read_text(encoding="utf-8", errors="replace").split("\n"):
        m = QUOTED.match(line.strip())
        if m:
            tex = m.group(1).replace("\\\\", "\\").replace("\\n", "\n").replace('\\"', '"')
            spans.append((path.parent.name, tex))

print("refused spans: %d" % len(spans))
for paper, tex in spans:
    base = converts(tex)
    print("\n=== %s  converts-as-is=%s" % (paper[:34], bool(base)))
    if base:
        print("    %s" % " ".join(base.split())[:150])
        continue
    for name, fix in FIXES:
        got = converts(fix(tex))
        if got:
            print("    FIX %-22s -> %s" % (name, " ".join(got.split())[:170]))
    all_at_once = tex
    for _name, fix in FIXES:
        all_at_once = fix(all_at_once)
    print("    ALL FIXES -> %s" % (bool(converts(all_at_once))))
