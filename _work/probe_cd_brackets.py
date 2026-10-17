r"""Count tikzcd blocks that hold a bracket delimiter, the face strip_envelope now keeps."""
import glob
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

CD = re.compile(r"\\begin\{(tikzcd|CD)\}.*?\\end\{\1\}", re.S)
n = 0
for path in sorted(glob.glob(r"_work/flat/*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    for m in CD.finditer(src):
        if "\\[" in m.group(0) or "\\]" in m.group(0):
            n += 1
            print(path, " ".join(m.group(0).split())[:90])
print("tikzcd blocks holding a bracket delimiter:", n)
