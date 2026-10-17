r"""Check every number the sandbox canvas prints against the point TeX drew.

The three meas_abs_*.txt dumps are `\pgfextractx/\pgfextracty` readouts of zero-size nodes placed
with the papers' own expressions, so they carry the picture's axes and scope shifts; only
Finite-cylinder's head [scale=0.95] is applied later by pgf, at output, which is why its anchors read
back as the unscaled cm and the canvas multiplies them. 1pt = 1/28.45274 cm is the whole conversion
between the two files.

Usage: python verify_abs.py
"""
import re
import sys

sys.path.insert(0, r"E:\math\_work\pic-pgfmath")
from t2t import cetz, convert, prep  # noqa: E402

PT = 1.0 / 28.45274
FLAT = r"E:\math\_work\flat\%s*.tex"
PREFIXES = ("Finite-cylinder-approximation-of-ruled-sets",
            "Universal-Tensor-Squares-for-Symmetric-Groups",
            "Critical-strip-crossing-mass-on-the-honeycomb-lattice")
PAIR = r"\((-?[\d.]+)pt,(-?[\d.]+)pt\)"


def canvas_of(prefix, index):
    """One of the paper's pictures, through the production path (minus the typst gate).

    The index is the one _work/refused_pic_detail.txt names for the refused drawing; a paper's other
    pictures convert with the live tree already and say nothing about this family.
    """
    import glob
    path = glob.glob(FLAT % prefix)[0]
    src = open(path, encoding="utf-8", errors="replace").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", body, re.S)
    pic = prep.expand_macros(pics[index], p.macros)
    core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), cm)
    return cetz.build(core)


def points(canvas):
    """Every (x, y) the canvas emits, as floats."""
    out = []
    for m in re.finditer(r"\((-?[\d.]+), (-?[\d.]+)\)", canvas):
        out.append((float(m.group(1)), float(m.group(2))))
    return out


def expect(label, pairs, canvas):
    """How far the nearest emitted point is from each point TeX drew."""
    pts = points(canvas)
    worst = 0.0
    misses = []
    for (x, y) in pairs:
        near, best = 9e9, None
        for a, b in pts:
            d = max(abs(a - x), abs(b - y))
            if d < near:
                near, best = d, (a, b)
        if near > 1e-3:
            misses.append((x, y, best, near))
        worst = max(worst, near)
    print("%-10s %3d points TeX drew, worst gap %.6f cm, over 1e-3: %d" %
          (label, len(pairs), worst, len(misses)))
    for x, y, best, d in misses[:8]:
        print("           tex (%.6f, %.6f) -> canvas %s at %.6f" % (x, y, best, d))
    return len(misses)


def dump(name):
    return open(r"E:\math\_work\pic-pgfmath\%s" % name, encoding="utf-8").read()


missing = 0

# centre, lo corner and hi corner of all 81 cells, times the head's own [scale=0.95]
finite = canvas_of(PREFIXES[0], 0)
pairs = []
for line in dump("meas_abs_finite.txt").splitlines():
    for x, y in re.findall(PAIR, line):
        pairs.append((float(x) * PT * 0.95, float(y) * PT * 0.95))
missing += expect("finite", pairs, finite)

# the two corners of every staircase cell, on the picture's flipped axes x=.31cm, y=-.31cm
universal = canvas_of(PREFIXES[1], 0)
pairs = []
for line in dump("meas_abs_universal.txt").splitlines():
    for x, y in re.findall(r"(-?[\d.]+)pt,(-?[\d.]+)pt", line):
        pairs.append((float(x) * PT, float(y) * PT))
missing += expect("universal", pairs, universal)
blue = sum(1 for l in dump("meas_abs_universal.txt").splitlines() if "BLUE" in l)
orange = sum(1 for l in dump("meas_abs_universal.txt").splitlines() if "ORANGE" in l)
print("           TeX fills %d cells blue, %d orange -- canvas %d, %d"
      % (blue, orange, universal.count('fill: rgb("#d9d9ff")'),
         universal.count('fill: rgb("#ffd68c")')))

# the strip: the cell box, the label under it and the strand the cell's own \ifnum branch took. The
# probe plants the near strand node at (-.25,0) in every cell, and the picture only draws from there
# when the branch starts on the left (meas_strip.txt names the branch per cell); the far node always
# sits on the branch's own endpoint, and cell 0's stays at the off-canvas seed because all eight of
# its tests fail. Cells 5 and 8 arc over to (.25,0): a node placed on the cell floor reads back as
# the centre of its own text box, a whole cm up, so those two probes were parked at the control
# height .5 instead and their points are handles rather than vertices -- measure_arc_cell.py reads
# that arc's drawn endpoints off the PDF instead.
def cms(text):
    """One `xpt,ypt` readout in cm."""
    x, y = text.split(",")
    return float(x.rstrip("pt")) * PT, float(y.rstrip("pt")) * PT


LEFT_START = {1, 3, 5, 7, 8}
HANDLES = {5, 8}
strip = canvas_of(PREFIXES[2], 1)
rows = re.findall(r"ABS (\d+) wt=(\S+) box=\(([^)]*)\)--\(([^)]*)\) label=\(([^)]*)\) "
                  r"strand=\(([^)]*)\)--\(([^)]*)\)", dump("meas_abs_strip.txt"))
pairs = []
for j, wt, box_lo, box_hi, label, near, far in rows:
    j = int(j)
    for text in (box_lo, box_hi, label):
        pairs.append(cms(text))
    if j in LEFT_START:
        pairs.append(cms(near))
    if j not in HANDLES and abs(cms(far)[0]) < 90:
        pairs.append(cms(far))
missing += expect("strip", pairs, strip)
strands = sum(1 for row in rows if abs(cms(row[6])[0]) < 90)
print("           TeX takes a \\\\ifnum branch in %d of the %d cells -- canvas %d line(), %d bezier()"
      % (strands, len(rows), strip.count("line("), strip.count("bezier(")))
print("POINTS TEX DREW THAT THE CANVAS DOES NOT CARRY:", missing)
for name, canvas in (("finite", finite), ("universal", universal), ("strip", strip)):
    print("%-10s sane(): %s" % (name, cetz.sane(canvas)))
