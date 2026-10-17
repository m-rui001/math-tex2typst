r"""Which of the #89 statements keep `rounded corners` switched on for the WHOLE path?

TikZ's key is a switch, not a per-corner option: it applies from where it is written to the end of the
path, and `sharp corners` switches it back off. This census reads the flat corpus for both shapes --
a `rounded corners` written after the first `--` (so the earlier corners stay sharp) and any
`sharp corners` at all.
"""
import io
import os
import re
import glob

root = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

sharp = []
mid = []
for path in sorted(glob.glob(os.path.join(root, "*.tex"))):
    text = io.open(path, encoding="utf-8", errors="replace").read()
    name = os.path.basename(path)
    for pic in PIC.findall(text):
        for chunk in pic.split(";"):
            flat = re.sub(r"\s+", " ", chunk.strip())
            if "sharp corners" in flat:
                sharp.append((name, flat))
            if "rounded corners" in flat and flat.count("--") >= 2 and "/.style" not in flat:
                if "rounded corners" not in flat.split("--")[0]:
                    mid.append((name, flat))

print("statements with `sharp corners`: %d" % len(sharp))
for name, flat in sharp:
    print("  %s | %s" % (name[:44], flat[:130]))
print("polyline statements whose `rounded corners` is written MID-PATH: %d" % len(mid))
for name, flat in mid:
    print("  %s | %s" % (name[:44], flat[:130]))
