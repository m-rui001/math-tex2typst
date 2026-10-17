"""Is prep._tikz_styles populated, and who uses the names it returns?

`probe_draw_style_census.py` read zero, which would mean the corpus never styles a draw by a
preamble name -- or that the table is empty. This prints the table sizes and splits the uses by
statement verb, so a null result can be told apart from a dead parser.
"""
import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import prep  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
OPTS = re.compile(r"\\(node|draw|fill|filldraw|path|scope|begin)\b[^;]*?(\[[^\]]*\])?", re.S)

papers = with_styles = 0
sizes = Counter()
verbs = Counter()
shown = 0
for f in sorted(Path("_work/flat").glob("*.tex")):
    src = f.read_text(encoding="utf-8", errors="replace")
    pre, _ = prep.split_document(src)
    p = prep.parse_preamble(pre)
    papers += 1
    if p.tikz_styles:
        with_styles += 1
        sizes[len(p.tikz_styles)] += 1
        if shown < 3:
            shown += 1
            print("sample %s: %s" % (f.stem[:40], list(p.tikz_styles)[:6]))
    names = set(p.tikz_styles)
    if not names:
        continue
    for pic in PIC.findall(src):
        for m in re.finditer(r"\\(?:node|draw|fill|filldraw|path|scope)\s*(\[[^\]]*\])", pic):
            for key in m.group(1)[1:-1].split(","):
                if key.strip() in names:
                    verbs[m.group(0).split("[")[0].strip()] += 1

print("papers %d, with a non-empty style table %d, sizes %s"
      % (papers, with_styles, dict(sizes)))
print("uses by statement: %s" % dict(verbs))
