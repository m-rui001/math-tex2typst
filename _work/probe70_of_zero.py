r"""Which part of the BSD diagram makes every node land on (0, 0)?

The picture is `\node (lower) {\(U_-\)};` plus three `[above right=of lower]`-style relatives and a
`node distance=8mm and 16mm` picture option.  Four variants, each one feature away from the original,
print the coordinates CeTz gives the nodes: `node distance` alone, `\( \)` vs `$ $` for the node text,
and a single unpositioned first node.
"""
import io
import re
import sys

sys.path.insert(0, r"E:\math\tools")
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

HEAD = r"\begin{tikzpicture}[%s]\n"
VARIANTS = {
    "as authored (8mm and 16mm, \\( \\) text)": (
        ">=Stealth,node distance=8mm and 16mm",
        "\\node (lower) {\\(U_-\\)};\n"
        "\\node (finite) [above right=of lower] {\\(U_f\\)};\n"
        "\\node (upper) [below right=of finite] {\\(U_+\\)};\n"),
    "node distance=1cm single": (
        ">=Stealth,node distance=1cm",
        "\\node (lower) {\\(U_-\\)};\n"
        "\\node (finite) [above right=of lower] {\\(U_f\\)};\n"),
    "8mm and 16mm, $ $ text": (
        ">=Stealth,node distance=8mm and 16mm",
        "\\node (lower) {$U_-$};\n"
        "\\node (finite) [above right=of lower] {$U_f$};\n"),
    "plain text, 8mm and 16mm": (
        ">=Stealth,node distance=8mm and 16mm",
        "\\node (lower) {U-};\n"
        "\\node (finite) [above right=of lower] {Uf};\n"),
    "no node distance, \\( \\) text": (
        ">=Stealth",
        "\\node (lower) {\\(U_-\\)};\n"
        "\\node (finite) [above right=of lower] {\\(U_f\\)};\n"),
}

for label, (opts, body) in VARIANTS.items():
    src = (HEAD % opts + body + "\\end{tikzpicture}\n")
    canvas = cetz.convert(src)
    where = re.findall(r"\(([-\d.,]+)\)", canvas or "")
    print("%-45s -> %s" % (label, "None" if canvas is None else where[:6]))
