r"""Print the declarations picture_scopes hands to one picture."""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import convert as conv  # noqa: E402

stem = sys.argv[1]
index = int(sys.argv[2])
text = open(os.path.join(ROOT, "_work", "flat", stem + ".tex"),
            encoding="utf-8", errors="replace").read()
body = conv.float_pictures(text, {})
scopes = conv.picture_scopes(body, {})
print("pictures:", len(scopes))
print(repr(scopes[index][1])[:1200])
