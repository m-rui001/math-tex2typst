"""What the pictures the gate still refuses are waiting for.

Three things a node diagram needs and we may not have: a placement written as 'right=of a',
a '/.style' table (declared inside the picture's own options, or lost in a \\tikzset the
picture was cut away from), and a box size to place. The compile gate is not run here.
"""
import collections
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
OF = re.compile(r"=\s*(?:[-+\d.]+\s*(?:cm|mm|pt|em)?\s*)?of\s+[-\w]")


def style_table(pic):
    head, _ = cetz._opts_at(pic[len("\\begin{tikzpicture}"):].lstrip(), 0)
    return cetz.picture_styles(head)


kinds = collections.Counter()
shown = collections.defaultdict(list)
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(text):
        if cetz.build(pic) is not None:
            continue
        tags = []
        if OF.search(pic):
            tags.append("of-placement")
        if style_table(pic):
            tags.append("style-table-in-picture")
        if "\\tikzset" in text or "\\node distance" in text:
            tags.append("styles-outside-picture")
        if re.search(r"text (width|height)|minimum (width|height)", pic):
            tags.append("declared-box")
        kinds["refused"] += 1
        for tag in tags or ["none of these"]:
            kinds[tag] += 1
        key = ";".join(tags) or "none of these"
        if len(shown[key]) < 2:
            shown[key].append("%s: %s" % (path.stem[:26], " ".join(pic.split())[:110]))

print("refused: %d" % kinds["refused"])
for k in ("of-placement", "declared-box", "style-table-in-picture",
          "styles-outside-picture", "none of these"):
    print("%6d  %s" % (kinds[k], k))
for key, lines in sorted(shown.items()):
    print("-- %s" % key)
    for line in lines:
        print("   " + line)
