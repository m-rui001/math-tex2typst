"""Which head option makes `_transform` give up on the five pictures it refuses?

For each picture whose head the stage probe blamed on `transform`, feed the parsed options to
_transform one at a time and print the first key that returns None, with its value.
"""
import glob
import re
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

HEAD = re.compile(r"\\begin\{tikzpicture\}\s*\[")
PICS = ("Finite-generation-for-the-Kn-local-spher", "Harmonic-heights-and-the-Artin-K-pi-1-co",
        "Radius-of-comparison-equals-half-the-mea")

for path in sorted(glob.glob("_work/flat/*.tex")):
    name = path.rsplit("/", 1)[-1][:-4]
    if not name.startswith(PICS):
        continue
    src = open(path, encoding="utf-8", errors="replace").read()
    for m in HEAD.finditer(src):
        # read the head's own bracket, honouring nested braces
        depth, i = 1, m.end()
        while i < len(src) and depth:
            if src[i] == "{":
                depth += 1
            elif src[i] == "}":
                depth -= 1
            elif src[i] == "]":
                break
            i += 1
        head = src[m.end():i]
        o = cetz.opts(head)
        if cetz._transform(o) is not None:
            continue
        print("--", name)
        for key, val in o.items():
            if cetz._transform({key: val}) is None:
                print("     refuses on  %-22s = %s" % (key, str(val)[:74]))
