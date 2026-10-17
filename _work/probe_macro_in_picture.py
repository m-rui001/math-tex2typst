r"""What changes if a picture's own macro calls are expanded before cetz sees it?

Node maths goes through cetz's hand-written symbol table, which knows no paper macros, so a
`\cD` defined by `\newcommand{\cD}{\mathcal D}` in the preamble loses its symbol. prep currently
expands user macros everywhere *except* inside a picture; this runs both versions of every picture
that names a paper macro in its maths through cetz's real route and reports where expanding helps
or hurts.
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, macros, prep  # noqa: E402

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINES = re.compile(r"\\(?:newcommand|renewcommand|def|DeclareMathOperator)\s*\{?\s*\\([a-zA-Z]+)")
MATH_SPAN = re.compile(r"\$([^$]*)\$")
COMMAND = re.compile(r"\\([a-zA-Z]+)")


def drawn(src):
    """cetz.convert's own route, so a tikzcd gets its build_cd too."""
    core = cetz.MATH_ENVELOPE.sub("", src)
    canvas = cetz.build(core) or cetz.build_cd(core)
    if canvas is None:
        return False
    return cetz.sane(canvas) and cetz.compiles(canvas)


moves, breaks, same = [], [], collections.Counter()
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    if not DEFINES.search(text):
        continue
    pre, _ = prep.split_document(text)
    table, _skipped = macros.parse_definitions(pre)
    if not table:
        continue
    for pic in PICTURE.finditer(text):
        src = pic.group(0)
        # only a picture whose *maths* names one of these macros is in scope; expanding a TikZ
        # key macro is a different question and would inflate the count
        used = { "\\" + w for span in MATH_SPAN.findall(src) for w in COMMAND.findall(span) }
        if not any(name in table for name in used):
            continue
        exp = macros.expand(src, table)
        if exp == src:
            same["left alone by expand"] += 1
            continue
        try:
            before, after = drawn(src), drawn(exp)
        except Exception as exc:  # a crash is itself a finding
            breaks.append("%s  raise %s" % (tex.stem[:40], exc))
            continue
        if before == after:
            same["draws either way" if before else "refused either way"] += 1
        elif after:
            moves.append("%s  %s" % (tex.stem[:40], exp[:70].replace("\n", " ")))
        else:
            breaks.append("%s  %s" % (tex.stem[:40], src[:70].replace("\n", " ")))

print("in scope: %d pictures with a paper macro in their maths"
      % (len(moves) + len(breaks) + sum(same.values())))
print("refuse->draw %d, draw->refuse %d, %s"
      % (len(moves), len(breaks), dict(same)))
print("\n-- newly drawn (max 20) --")
print("\n".join(moves[:20]))
print("\n-- newly refused (max 20) --")
print("\n".join(breaks[:20]))
