r"""Compare the emitted canvases with the numbers TeX wrote out for the same pictures.

meas_finite.txt / meas_universal.txt / meas_strip.txt are \write dumps of the real loops compiled
with pdflatex in this folder. Everything between those numbers and the canvas is either the
picture's own head transform (scale 0.95 for the ruled-set lattice, x=.31cm,y=-.31cm for the
tensor grid) or rounding in the emitter's %.4g, so the checks below are against TeX, not against
what cetz happens to print.
"""
import re

FLAT = 1e-4
ok = True


def check(label, got, want, tol=FLAT):
    global ok
    good = abs(got - want) <= tol
    ok = ok and good
    print("%-46s got=%-12s tex=%-12s %s" % (label, got, want, "OK" if good else "MISMATCH"))


# ---- 1. Finite-cylinder: 81 square centres and corners, head [scale=0.95] ----
SCALE = 0.95
tex_cells = []
for line in open("meas_finite.txt", encoding="utf-8"):
    m = re.search(r"cx=(-?[\d.]+) cy=(-?[\d.]+) lo=(-?[\d.]+),(-?[\d.]+) hi=(-?[\d.]+),(-?[\d.]+)",
                  line)
    if m:
        tex_cells.append([float(v) * SCALE for v in m.groups()])
canvas = open("canvas_finite.txt", encoding="utf-8").read()
centres = [tuple(float(v) for v in m.groups())
           for m in re.finditer(r"circle\(\((-?[\d.eE+-]+), (-?[\d.eE+-]+)\)", canvas)]
rects = [tuple(float(v) for v in m.groups())
         for m in re.finditer(r"rect\(\((-?[\d.eE+-]+), (-?[\d.eE+-]+)\), "
                              r"\((-?[\d.eE+-]+), (-?[\d.eE+-]+)\)", canvas)]
print("finite: tex cells %d, drawn dots %d, rects %d" % (len(tex_cells), len(centres), len(rects)))
worst = 0.0
for n, (cx, cy, lx, ly, hx, hy) in enumerate(tex_cells):
    got_c, got_r = centres[n], rects[n]
    worst = max(worst, abs(got_c[0] - cx), abs(got_c[1] - cy),
                abs(got_r[0] - lx), abs(got_r[1] - ly), abs(got_r[2] - hx), abs(got_r[3] - hy))
print("finite: worst deviation from TeX over all 81 cells: %g (emitter prints 4 digits)" % worst)
check("finite: first dot x (-5.4*0.95)", centres[0][0], -5.13)
check("finite: last dot x (5.4*0.95)", centres[80][0], 5.13)
check("finite: last dot y", centres[80][1], 5.13)
# the emitter writes 4 significant digits, so a deviation under half a unit in the 4th is the
# printer, not the arithmetic: 5.13 vs 5.1300 is exact here
check("finite: first rect low x ((-5.4-.5)*0.95)", rects[0][0], -5.605)
check("finite: first rect high y ((-5.4+.5)*0.95)", rects[0][3], -4.655)

# ---- 2. Universal tensor squares: which cells are the blue staircase ----
blue = []
orange = []
for line in open("meas_universal.txt", encoding="utf-8"):
    m = re.match(r"CELL (\d+)/(\d+)staircase=(\d)(BLUE|ORANGE)", line)
    if m:
        (blue if m.group(4) == "BLUE" else orange).append((int(m.group(1)), int(m.group(2))))
canvas = open("canvas_universal.txt", encoding="utf-8").read()
fills = re.findall(r'rect\(\(([-\d.eE+]+), ([-\d.eE+]+)\), \(([-\d.eE+]+), ([-\d.eE+]+)\), '
                   r'fill: rgb\("(#[0-9a-f]{6})"\)', canvas)
BLUE, ORANGE = "#d9d9ff", "#ffd68c"   # blue!15 and orange!45, as cetz mixes them
seen = [(float(a), float(b), c) for a, b, _x, _y, c in fills]
print("universal: tex blue %d orange %d, canvas filled rects %d"
      % (len(blue), len(orange), len(fills)))
check("universal: blue staircase cells (tex)", len(blue), 45)
check("universal: orange complement (tex)", len(orange), 4)
# the fills come out in the loop's own order: walk the tex dump line by line
mismatches = 0
k = 0
for line in open("meas_universal.txt", encoding="utf-8"):
    m = re.match(r"CELL (\d+)/(\d+)staircase=(\d)(BLUE|ORANGE)", line)
    if not m:
        continue
    row, col, want = int(m.group(1)), int(m.group(2)), m.group(4)
    x0, y0 = seen[k][0], seen[k][1]
    if seen[k][2] != (BLUE if want == "BLUE" else ORANGE):
        mismatches += 1
    # x=.31cm, y=-.31cm: the cell's own (column-1,row-1)..(column,row) lands scaled and flipped
    if abs(x0 - 0.31 * (col - 1)) > 1e-4 or abs(y0 + 0.31 * (row - 1)) > 1e-4:
        mismatches += 1
        print("  cell %d/%d placed at %s, tex would put it at %.4f,%.4f"
              % (row, col, (x0, y0), 0.31 * (col - 1), -0.31 * (row - 1)))
    k += 1
check("universal: colour+place mismatches against the tex dump", mismatches, 0, 1e-9)

# ---- 3. Critical strip: the scope shifts the nine cells sit on ----
shifts = {}
for line in open("meas_strip.txt", encoding="utf-8"):
    m = re.match(r"J (\d+) wt=(\S+) xshift=(-?[\d.]+)cm yshift=(-?[\d.]+)cm branch=(\S+)", line)
    if m:
        shifts[int(m.group(1))] = (float(m.group(3)), float(m.group(4)), m.group(5))
canvas = open("canvas_critical.txt", encoding="utf-8").read()
frame = [tuple(float(v) for v in m.groups())
         for m in re.finditer(r"rect\(\((-?[\d.eE+-]+), (-?[\d.eE+-]+)\), "
                              r"\((-?[\d.eE+-]+), (-?[\d.eE+-]+)\)", canvas)]
print("critical: frames drawn %d (tex draws 9 cells)" % len(frame))
for j in (0, 1, 3, 5, 8):
    sx, sy, branch = shifts[j]
    lo = frame[j]
    # the cell's own box is (-.45,0)--(.45,1) inside the scope, and the scope is at (sx, sy)
    check("critical j=%d low x = xshift-0.45" % j, lo[0], sx - 0.45, 1e-3)
    check("critical j=%d low y = yshift" % j, lo[1], sy, 1e-3)
    check("critical j=%d high x = xshift+0.45" % j, lo[2], sx + 0.45, 1e-3)
    check("critical j=%d high y = yshift+1" % j, lo[3], sy + 1, 1e-3)

print()
print("ALL CHECKS AGREE WITH TEX" if ok else "SOMETHING DISAGREES")
