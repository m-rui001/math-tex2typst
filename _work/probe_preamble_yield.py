r"""Does the preamble's style and colour table change what a picture draws?

Each picture is built twice through the same stage order the batch uses: without the paper's
`\tikzset`/`\definecolor` tables, then with them. A picture that only the tables make is a
recovery; one that the tables break is the cost of merging options that were invisible before
(a style can carry a length we cannot read), so both directions are printed by paper.
"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz, prep  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

recovered, lost, changed, drawn = [], [], [], 0
for f in sorted(Path("_work/flat").glob("*.tex")):
    src = f.read_text(encoding="utf-8", errors="replace")
    pics = PIC.findall(src)
    if not pics:
        continue
    pre, _ = prep.split_document(src)
    p = prep.parse_preamble(pre)
    if not (p.colors or p.tikz_styles):
        continue
    for pic in pics:
        pic = prep.expand_macros(pic, p.macros)
        before, after = cetz.build(pic), cetz.build(pic, p.colors, p.tikz_styles)
        if before is None and after is not None:
            recovered.append(f.stem)
        elif before is not None and after is None:
            lost.append((f.stem, " ".join(str(before).split())[:100]))
        elif before is not None:
            drawn += 1
            if str(before) != str(after):
                changed.append(f.stem)

print("pictures with a preamble table: built both ways %d, changed by it %d"
      % (drawn, len(changed)))
print("recovered (refused -> builds): %d over %d papers"
      % (len(recovered), len(set(recovered))))
for name in sorted(set(recovered)):
    print("   + %s" % name[:70])
print("lost (builds -> refused): %d" % len(lost))
for name, frag in lost:
    print("   - %s :: %s" % (name[:60], frag[:80]))
print("changed papers: %d" % len(set(changed)))
for name in sorted(set(changed))[:8]:
    print("   ~ %s" % name[:70])
