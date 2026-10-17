r"""#102 leg E: does a dash ever sit on the picture's OWN brackets (a scope default)?

#90 and #91 measured that a key on `\begin{tikzpicture}[...]` is pgf's scope default and that it
reaches every path and every node frame in the picture; `build` carries exactly that way for
`line cap`, `line join`, the pen and `node distance` (cetz.py:5438-5448).  A dash on the head today
reaches nobody.  Whether that is a defect with a face, or a shape this corpus never writes, decides
whether the fix has one more line -- so it is read with the emitter's own option reader
(`cetz.opts` on the head's brackets, `cetz.picture_styles` for what `every path` declares) rather than
by grepping the source.

  PYTHONIOENCODING=utf-8 python _work/probe102e_dash_head_face.py
"""
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(HERE, "flat")
OUT = os.path.join(HERE, "label102e_dash_head_face.txt")
PIC = re.compile(r"\\begin\{tikzpicture\}(\[.*?\])?", re.S)

from t2t import cetz  # noqa: E402

DASH = ("dashed", "dotted", "densely dashed", "densely dotted", "loosely dashed",
        "loosely dotted", "dash pattern", "dash dot", "dashdotted", "dashdotdotted", "solid")


def main():
    sys.stdout.reconfigure(errors="replace")
    stems = sorted(d[:-4] for d in os.listdir(FLAT) if d.endswith(".tex"))
    head_hits = []
    every_path = []
    pics = 0
    for stem in stems:
        text = io.open(os.path.join(FLAT, stem + ".tex"), encoding="utf-8",
                       errors="replace").read()
        for k, m in enumerate(PIC.finditer(text)):
            pics += 1
            head = cetz.opts((m.group(1) or "")[1:-1])
            keys = [d for d in DASH if d in head]
            if keys:
                head_hits.append((stem, k, keys, {d: head[d] for d in keys}))
            style = head.get("every path")
            if isinstance(style, dict):
                sk = [d for d in DASH if d in style]
                if sk:
                    every_path.append((stem, k, sk, {d: style[d] for d in sk}))
            elif isinstance(style, str):
                sk = [d for d in DASH if d in style]
                if sk:
                    every_path.append((stem, k, sk, style))
    lines = ["a dash written as a picture's scope default -- the head read by cetz.opts",
             "pictures scanned: %d in %d papers" % (pics, len(stems)),
             "", "HEAD brackets carrying a dash key: %d" % len(head_hits)]
    for stem, k, keys, vals in head_hits[:25]:
        lines.append("  %-52s #%d %s %s" % (stem[:52], k, keys, vals))
    lines.append("")
    lines.append("`every path` declarations carrying a dash key: %d" % len(every_path))
    for row in every_path[:25]:
        lines.append("  %-52s #%d %s %s" % (row[0][:52], row[1], row[2], row[3]))
    out = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(out)
    print(out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
