r"""Count, per paper, the figures that actually reached the page: canvases and quoted raw blocks.

A rebuild can only be called safe when every picture that was drawn is still drawn. The static
guard replays `cetz.build` and cannot see the pipeline around it, so the product itself is measured
before and after the regenerate: `#cetz.canvas(` blocks plus `#raw(block: true, lang: "latex")`
blocks account for every `\begin{tikzpicture}` in the flat source, and a drop shows up as a paper
whose two counts sum lower than it did.

Prints one line per paper listed in `_work/regen_needed.txt`; redirect to a file and diff the two
runs.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CANVAS = re.compile(r"#cetz\.canvas\(")
RAW = re.compile(r'#raw\(block: true, lang: "latex"')
PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd)\}", re.S)


def main():
    names = [l.strip() for l in open(os.path.join(ROOT, "_work", "regen_needed.txt"),
                                     encoding="utf-8") if l.strip()]
    total_c = total_r = total_p = 0
    for stem in names:
        src = os.path.join(ROOT, "_work", "flat", stem + ".tex")
        pic = len(PIC.findall(open(src, encoding="utf-8", errors="replace").read())) if os.path.exists(src) else -1
        dirs = [d for d in os.listdir(os.path.join(ROOT, "typst"))
                if d.startswith(stem[:40])] if os.path.isdir(os.path.join(ROOT, "typst")) else []
        typ = ""
        if dirs:
            path = os.path.join(ROOT, "typst", dirs[0], "main.typ")
            if os.path.exists(path):
                typ = open(path, encoding="utf-8", errors="replace").read()
        canvases = len(CANVAS.findall(typ))
        raws = len(RAW.findall(typ))
        total_c += canvases
        total_r += raws
        total_p += max(pic, 0)
        flag = "" if canvases + raws >= max(pic, 0) else "  SHORT"
        print("%-44s pics %2d canvas %2d raw %d%s" % (stem[:44], pic, canvases, raws, flag))
    print("TOTAL papers %d pics %d canvas %d raw %d" % (len(names), total_p, total_c, total_r))


if __name__ == "__main__":
    main()
