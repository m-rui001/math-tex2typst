r"""Build one picture through the real pipeline and print the lines a colour names."""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import convert as conv  # noqa: E402
from t2t import cetz  # noqa: E402

stem, needle = sys.argv[1], sys.argv[2]
text = open(os.path.join(ROOT, "_work", "flat", stem + ".tex"),
            encoding="utf-8", errors="replace").read()
body = conv.float_pictures(text, {}) if hasattr(conv, "float_pictures") else text
scopes = conv.picture_scopes(body, {})
for i, pic in enumerate(re.finditer(conv.TIKZ_SPAN, body)):
    scope, decls = scopes[i]
    chunk = conv.with_declarations(pic.group(0), decls)
    got = cetz.build(chunk, {}, None)
    if got and needle in got:
        for line in got.splitlines():
            if needle in line:
                print("picture %d: %s" % (i, line.strip()[:200]))
        pal, _ = cetz._colors(chunk, {})
        print("palette has gatecore:", pal.get("gatecore"), " gatecore!12 ->",
              cetz.color("gatecore!12", pal))
        break
