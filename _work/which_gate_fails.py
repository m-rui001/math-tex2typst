"""Canvases that build but fail the gate after the symbol table grew.

Seven pictures converted in run33 refuse in run34, so some restored label text must break
`sane()` or the typst compile. Only a canvas that mentions one of the new spellings can have
changed, so pay for a compile on those alone and print the line that looks wrong.
"""
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NEW = re.compile(r"dots\.v|\bell\b|arrow\.r\.long|arrow\.r\.double\.long|subset|nothing"
                 r"|tack\.[rl]|plus\.o|compose|partial|Phi|Gamma|Lambda|Theta|\bPi\b|Sigma"
                 r"|Chi|\bNu\b|Eta|zeta|iota|\bpsi\b|\bxi\b|\bnu\b|upsilon|<<|!=")

tried = 0
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(src):
        canvas = cetz.build(cetz.MATH_ENVELOPE.sub("", pic))
        if not canvas or not NEW.search(canvas):
            continue
        tried += 1
        ok_sane = cetz.sane(canvas)
        ok_build = cetz.compiles(canvas)
        if ok_sane and ok_build:
            continue
        print("%s | sane=%s compiles=%s" % (path.stem[:56], ok_sane, ok_build))
        for line in canvas.splitlines():
            if NEW.search(line):
                print("    " + line.strip()[:190])

print({"canvases carrying a new spelling": tried})
