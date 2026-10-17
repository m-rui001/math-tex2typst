"""The scope options that make _walk_scopes give up on Elliptic-capacity's tilted picture."""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
f = next(iter(Path("_work/flat").glob("Elliptic-capacity-propagation-and-Fourier-re*.tex")))
for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
    if "rotate" not in pic:
        continue
    body = pic[len("\\begin{tikzpicture}"):].lstrip()
    head, pos = cetz._opts_at(body, 0)
    print("picture head:", dict(head) if head else None, "-> _transform:",
          cetz._transform(head))
    body = body[:body.rfind("\\end{tikzpicture}")][pos:]
    for m in cetz.SCOPE.finditer(body):
        o, start = cetz._opts_at(body, m.end())
        if o is None:
            continue
        got = cetz._transform(o)
        if got is None and ("rotate" in "".join(o) or True):
            print("scope %-60s -> %s" % (str(dict(o))[:60], got))
    print()
