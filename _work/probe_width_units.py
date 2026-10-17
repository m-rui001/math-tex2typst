"""Why the fix moved 65 canvases when `_work/textwidth_needed.txt` named 94 papers.

Every `text width=` / `minimum width=` / `minimum size=` / `inner sep=` value written in the corpus is
put through the reader the fix actually uses (`cetz._length`) -- a value it refuses is a measure that
still reaches the page without a `width:`, and the shapes it refuses are the §7 row to file.
"""
import io
import pathlib
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

KEY = re.compile(r"(text width|minimum width|minimum size|inner sep)\s*=\s*"
                 r"([^,;\]\[]+)")

read = Counter()
refused = Counter()
papers_refused = set()
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for pic in re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", text, re.S):
        for key, val in KEY.findall(pic):
            val = val.strip().rstrip("}").strip()
            if cetz._length(val, cetz.IDENT) is None:
                refused["%s = %s" % (key, val[:28])] += 1
                papers_refused.add(path.stem)
            else:
                read[key] += 1

print("measures the fix reads:", dict(read))
print("measures it still cannot read: %d spellings over %d papers"
      % (sum(refused.values()), len(papers_refused)))
for shape, n in refused.most_common(20):
    print("  %3d  %s" % (n, shape))
