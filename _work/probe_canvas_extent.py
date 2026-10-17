"""Static census of CeTz canvas heights across the corpus (no typst).

A canvas is one non-breaking block, so a drawing taller than the page body pushes its
caption off the page. The body is us-letter minus 72.3pt margins: 792 - 144.6 = 647.4pt,
and the canvas unit is CeTz's default length of 1cm = 28.4527pt.
"""
import os
import re
import glob

PT_PER_CM = 28.452753
BODY_PT = 792.0 - 2 * 72.3
BODY_CM = BODY_PT / PT_PER_CM

POINT = re.compile(r"\((-?[\d.]+(?:e[-+]?\d+)?), (-?[\d.]+(?:e[-+]?\d+)?)\)")
CANVAS = re.compile(r"#cetz\.canvas\((length: [^,]+, )?\{", re.S)


def canvases(typ):
    """Every canvas body in a main.typ, as (y-extent in units, declared length or None)."""
    out = []
    for m in CANVAS.finditer(typ):
        depth = 0
        start = m.end() - 1
        for i in range(start, len(typ)):
            if typ[i] == "{":
                depth += 1
            elif typ[i] == "}":
                depth -= 1
                if depth == 0:
                    break
        body = typ[start:i + 1]
        ys = [float(b) for _a, b in POINT.findall(body)]
        if not ys:
            continue
        length = None
        if m.group(1):
            lm = re.match(r"length: ([\d.]+)(cm|mm|pt)", m.group(1))
            if lm:
                length = float(lm.group(1)) * {"cm": 1.0, "mm": 0.1, "pt": 1 / PT_PER_CM}[lm.group(2)]
        out.append((max(ys) - min(ys), length, body.count("\n")))
    return out


def main():
    files = sorted(glob.glob(os.path.join("typst", "*", "main.typ")))
    over = []
    total = 0
    for path in files:
        typ = open(path, encoding="utf-8").read()
        for extent, length, lines in canvases(typ):
            total += 1
            cm = extent * (length if length is not None else 1.0)
            if cm > BODY_CM:
                over.append((round(cm, 1), extent, length, path.split(os.sep)[1], lines))
    over.sort(reverse=True)
    print("body height: %.1f cm  canvases: %d  papers: %d" % (BODY_CM, total, len(files)))
    print("over-full canvases: %d in %d papers" % (len(over), len(set(o[3] for o in over))))
    for o in over[:25]:
        print("  %6.1f cm  extent=%-8.2f len=%-6s lines=%-4d %s" % (o[0], o[1], o[2], o[4], o[3][:48]))


if __name__ == "__main__":
    main()
