r"""Read cell 5's arc straight off the PDF TeX produced, in cm against the picture's own 1cm axis.

meas_arc_cell.tex is the paper's own statement for that cell, compiled with border=0pt so the page
corner is the drawing's corner. pgf strokes a rectangle as four line segments, so the cell box is
found by its four 'l' items and the curve by its single 'c'; the pdf y axis grows downward while
TeX's grows upward, so everything is reported relative to the box's own floor and centre.

What has to agree is the arc's endpoints (on the floor, +-0.25 across) and its two control points
(0.45 above the floor) -- the numbers the canvas emits for that cell.
"""
import pymupdf

# PDF user units are big points (1/72 in), not TeX points: pgf writes a 1cm axis as 28.3465 bp,
# while \pgfextractx on the same distance reads 28.45274pt. Dividing the PDF's numbers by 28.45274
# shrinks every cm by the factor 72.27/72 and fakes a 0.00093 cm bias on a curve TeX drew exactly.
BP = 72.0 / 2.54
page = pymupdf.open(r"E:\math\_work\pic-pgfmath\meas_arc_cell.pdf")[0]
box = curve = None
for path in page.get_drawings():
    items = path["items"]
    if items[0][0] == "l" and len(items) == 4:
        pts = [p for item in items for p in (item[1], item[2])]
        box = (min(p.x for p in pts), min(p.y for p in pts),
               max(p.x for p in pts), max(p.y for p in pts))
    elif items[0][0] == "c":
        curve = items[0][1:]
print("box rect (bp):", tuple(round(v, 4) for v in box))
print("cell width %.5f cm, height %.5f cm" % ((box[2] - box[0]) / BP, (box[3] - box[1]) / BP))
x0 = (box[0] + box[2]) / 2.0          # the cell's x=0 sits halfway across the box
floor = box[3]                        # the pdf's larger y is TeX's smaller one: the cell floor
for name, p in zip(("start", "ctrl 1", "ctrl 2", "stop"), curve):
    print("%-7s x=%+.5f cm  %.5f cm above the floor"
          % (name, (p.x - x0) / BP, (floor - p.y) / BP))
