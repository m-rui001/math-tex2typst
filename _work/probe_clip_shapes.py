r"""What do the pictures that stop at the clip stage actually write on the \clip line?

Dropping a clip is only honest if it bounds a region nothing escapes, so the first thing to know is
whether these clips are rectangles, arbitrary paths, or a scope option like `clip=true`.
"""
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
CLIP_STMT = re.compile(r"\\clip\b[^;]*;")
CLIP_OPT = re.compile(r"\bclip\s*=\s*(true|false)")

rect = other = opt = 0
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.findall(text):
        if "clip" not in pic:
            continue
        for s in CLIP_STMT.findall(pic):
            if "rectangle" in s:
                rect += 1
            else:
                other += 1
                print("PATH  %-40s %s" % (tex.stem[:40], s.strip()[:110]))
        opt += len(CLIP_OPT.findall(pic))
print("clip statements: %d rectangle, %d other path; clip= options: %d" % (rect, other, opt))
