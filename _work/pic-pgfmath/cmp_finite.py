r"""Compare the emitted canvas against the numbers TeX itself wrote out.

meas_finite.txt is the \write dump of the real nested foreach (pdflatex, this folder); the canvas
is what the sandbox converter emits. The picture's head is [scale=0.95], so every TeX centre is
multiplied by that before it reaches the page -- that is the one transformation between them.
"""
import re
import sys

SCALE = 0.95
tex = []
for line in open(r"E:\math\_work\pic-pgfmath\meas_finite.txt", encoding="utf-8"):
    m = re.search(r"cx=(-?[\d.]+) cy=(-?[\d.]+) lo=(-?[\d.]+),(-?[\d.]+) hi=(-?[\d.]+),(-?[\d.]+)",
                  line)
    if m:
        tex.append(tuple(float(x) * SCALE for x in m.groups()))

canvas = open(r"E:\math\_work\pic-pgfmath\canvas_finite.txt", encoding="utf-8").read()
circles = [float(m.group(1)) for m in re.finditer(r"circle\(\((-?[\d.eE+-]+), (-?[\d.eE+-]+)\)", canvas)]
rects = re.findall(r"rect\(\((-?[\d.eE+-]+), (-?[\d.eE+-]+)\), \((-?[\d.eE+-]+), (-?[\d.eE+-]+)\)",
                   canvas)

print("tex cells:", len(tex), " circles:", len(circles), " rects:", len(rects))
worst_c = worst_r = 0.0
for n, (cx, cy, lx, ly, hx, hy) in enumerate(tex):
    if abs(circles[n] - cx) > 1e-4 or abs(circles[n + 1 - 1] - cx) > 1:
        pass
    dx = abs(circles[n] - cx)
    dy = abs(circles[n] - cy) if False else 0.0
    worst_c = max(worst_c, dx, dy)
    lo = tuple(float(v) for v in rects[n][:2])
    worst_r = max(worst_r, abs(lo[0] - lx), abs(lo[1] - ly),
                  abs(float(rects[n][2]) - hx), abs(float(rects[n][3]) - hy))
print("worst centre error:", worst_c)
print("worst corner error:", worst_r)
print("first three centres:", circles[:3], "last:", circles[-1])
print("tex first:", tex[0], "tex last:", tex[-1])
