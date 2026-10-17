"""Does `sweeps:transfer-table` survive our own prep on the way into pandoc?

Prints the longtable region of the prepared body, and where the label sits in the source.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import prep  # noqa: E402

src = next((ROOT / "_work" / "flat").glob("Conditional-information*.tex")).read_text(
    encoding="utf-8", errors="replace")
i = src.index("\\begin{longtable}")
j = src.index("\\end{longtable}", i) + len("\\end{longtable}")
print("--- SOURCE ---")
print(src[i:i + 320])
body = src
for step in (prep.unwrap_boxes, prep.array_floats, prep.promote_custom_floats,
             prep.promote_minipage_floats, prep.unwrap_fbox, prep.lift_captions,
             prep.dedupe_longtable_heads):
    body = step(body) if step is not prep.promote_custom_floats else step("", body)
k = body.find("\\label{sweeps:transfer-table}")
print("source occurrences: %d | prepared occurrences: %d"
      % (src.count("\\label{sweeps:transfer-table}"), body.count("\\label{sweeps:transfer-table}")))
print("label present:", k >= 0)
if k >= 0:
    print(body[max(0, k - 260):k + 60])
