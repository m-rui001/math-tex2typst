r"""Print the source statements that carry a polyline `rounded corners`, per paper."""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import macros, prep  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

for stem in sys.argv[1:]:
    text = io.open(os.path.join(ROOT, "_work", "flat", stem + ".tex"),
                   encoding="utf-8", errors="replace").read()
    pre, _ = prep.split_document(text)
    table, _ = macros.parse_definitions(pre)
    for j, pic in enumerate(PIC.findall(text)):
        if "rounded corners" not in pic:
            continue
        exp = prep.expand_macros(pic, table) if table else pic
        print("=== %s#%d" % (stem[:44], j))
        print(exp[:3000])
