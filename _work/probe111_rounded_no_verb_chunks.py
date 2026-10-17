r"""What the loose #89 census counted besides the 14 true polylines: print every `rounded corners`
chunk that has two `--` but no `\draw`-class verb, so the tightened filter's drops are on the record.
"""
import io
import os
import re

root = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
VERB = re.compile(r"\\(draw|fill|filldraw|shade|path)\b")
STYLE_DEF = re.compile(r"/\w*\.style|\.style=")

for path in sorted(os.listdir(root)):
    if not path.endswith(".tex"):
        continue
    text = io.open(os.path.join(root, path), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        for chunk in pic.split(";"):
            flat = re.sub(r"\s+", " ", chunk.strip())
            if "rounded corners" not in flat or flat.count("--") < 2:
                continue
            if VERB.search(flat):
                continue
            print("%s | style-def=%s | %s" % (path[:40], bool(STYLE_DEF.search(flat)), flat[:160]))
