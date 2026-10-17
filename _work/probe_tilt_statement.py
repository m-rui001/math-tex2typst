"""Which statement inside a tilt-caused refusal is the one we cannot draw?"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NAMES = ("Elliptic-capacity-propagation-and-Fourier-re",
         "The-canonical-massive-continuum-limit-of-the")

for stem in NAMES:
    f = next(iter(Path("_work/flat").glob(stem + "*.tex")))
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if "rotate" not in pic or cetz.build(pic) is not None:
            continue
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        head, pos = cetz._opts_at(pic[m.end():].lstrip(), 0)
        base = cetz._transform(head)
        body = pic[m.end():].lstrip()[pos:]
        body = body[:body.rfind("\\end{tikzpicture}")]
        pairs = cetz.scoped(body, base)
        if not pairs:
            print(f.stem[:44], "-> scoped refused the whole body")
            continue
        names, styles = {}, {}
        for stmt, xf in pairs:
            got = cetz.translate_statement(stmt, names, xf, None, styles)
            if got is None:
                print("%-44s xf=%s\n    %s" % (f.stem[:40], tuple(round(v, 3) for v in xf),
                                               stmt.strip()[:150]))
