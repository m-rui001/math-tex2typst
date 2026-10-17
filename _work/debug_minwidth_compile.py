import os
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
from t2t import cetz  # noqa: E402

sys.stdout.reconfigure(errors="replace")

CANVAS = ('#cetz.canvas({\n  import cetz.draw: *\n'
          '  content((0, 0), [#box(width: 2cm, inset: 0.3333em, stroke: (thickness: 0.4pt), '
          '[#set text(hyphenate: false); #align(center)[A#linebreak()B]])])])\n})')

with tempfile.TemporaryDirectory() as tmp:
    src = os.path.join(tmp, "t.typ")
    with open(src, "w", encoding="utf-8") as f:
        f.write(cetz.HEADER + '#set page(width: 300pt, height: 300pt)\n' + CANVAS)
    r = subprocess.run(["typst", "compile", src, os.path.join(tmp, "t.pdf")], capture_output=True)
    print("rc", r.returncode)
    print(r.stderr.decode("utf-8", "replace")[:1500])
