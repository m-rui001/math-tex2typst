r"""Print the whole refused picture, next to the stage the probe named, so the construct at fault
is readable rather than guessed from a 60-character statement.

Read-only over _work/flat.
"""
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
probe = json.load(open(ROOT / "_work" / "refusal_stages.json", encoding="utf-8"))

for r in probe["records"]:
    if not r["stage"]:
        continue
    src = (ROOT / "_work" / "flat" / (r["paper"] + ".tex")).read_text(
        encoding="utf-8", errors="replace")
    pics = [m.group(0) for m in PICTURE.finditer(src)]
    pic = pics[r["index"]]
    print("### %s#%d" % (r["paper"], r["index"]))
    print("stage:     %s" % r["stage"])
    print("expanded:  %s" % r.get("expanded_stage"))
    marks = []
    for pat, name in [(r"\\foreach", "foreach"), (r"\\pgfmath", "pgfmath"),
                      (r"\\ifnum|\\ifdim", "ifnum"), (r"\\begin\{scope\}", "scope"),
                      (r"\bz=|\ba=|\bxy=|3d|tdplot", "3D-basis"),
                      (r"plot\[", "plot"), (r"ellipse", "ellipse"),
                      (r"\\draw\s*\([^)]*to=\[", "to-out-in"),
                      (r"filldraw|\\fill\(", "fill"), (r"\\node", "node"),
                      (r"circle", "circle"), (r"controls", "bezier"),
                      (r"looseness", "looseness"), (r"decorate|decoration", "decorations"),
                      (r"shading|top color|bottom color", "shading"),
                      (r"\\path", "path"), (r"preaction", "preaction"),
                      (r"\\clip", "clip"), (r"matrix", "matrix"),
                      (r"\\def|\\edef|\\newcommand", "def"), (r"\\node.*text width", "text-width")]:
        if re.search(pat, pic):
            marks.append(name)
    print("marks:     %s" % ",".join(marks))
    print("len: %d" % len(pic))
    print(pic)
    print()
