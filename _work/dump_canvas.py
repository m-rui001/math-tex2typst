r"""Print the batch-basis CeTz for one `tikzpicture`, next to the source statements that made it.

The page tells you two boxes are printed on top of each other; the only way to see why is the emitted
`content((x, y), ...)` line for each of them, rebuilt exactly the way `batch_typst.py` builds it
(preamble parsed, `\linewidth` scaled, macros expanded, in-picture declarations injected).  A
keyword census over `_work/flat` cannot see any of that, which is why this goes through the package.

usage: python _work/dump_canvas.py <paper-dir-prefix> [picture-index]
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")

from t2t import convert, prep, cetz as cetzmod  # noqa: E402


def main():
    prefix = sys.argv[1]
    idx = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    hits = glob.glob(os.path.join(FLAT, prefix + ".tex"))
    if len(hits) != 1:
        print("prefix %r matches %d flat sources" % (prefix, len(hits)))
        return
    src = open(hits[0], encoding="utf-8", errors="replace").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    pics = convert.TIKZ_SPAN.findall(body)
    print("pictures: %d" % len(pics))
    scopes = convert.picture_scopes(body, p.macros)
    table, decls = scopes[idx]
    pic = convert.with_declarations(pics[idx], decls)
    pic = prep.expand_macros(pic, table)
    print("=== SOURCE (expanded) ===")
    for stmt in re.split(r";\s*\n", pic):
        if stmt.strip():
            print("  " + stmt.strip().replace("\n", "\n  ")[:400])
    print("=== BUILT ===")
    got = cetzmod.convert(pic, p.colors, convert.line_cm(p))
    if got is None:
        print("REFUSED")
        return
    for line in got.splitlines():
        if line.strip():
            print(line)


if __name__ == "__main__":
    main()
