"""Build one picture's canvas from a chosen t2t tree, for bisecting a regression.

Run it once with `tools` and once with the pre-merge backup and diff: the picture that used to
compile says which merged patch dropped the atom after a `^`.
"""
import re
import sys

tree, flat, index = sys.argv[1], sys.argv[2], int(sys.argv[3])
sys.path.insert(0, tree)
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")

src = open(flat, encoding="utf-8", errors="replace").read()
palette = {}
for match in DEFINECOLOR.finditer(src):
    palette[match.group(1)] = (match.group(2), match.group(3))
pictures = [m.group(0) for m in PICTURE.finditer(src)]
core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pictures[index]), LC)
print(cetz.build(core, palette) or "<REFUSED>")
