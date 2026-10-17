r"""Size the affine-plane work: which pictures tilt the plane, and does the tilted scope hold text?

A rotation or an oblique basis is a 2x2 matrix, and cetz carries only (x scale, y scale, dx, dy),
so rotate and transform refuse for the same reason. Paths survive a matrix; text placed by a canvas
cannot be tilted, so a scope whose contents are only draws is the part that can actually be drawn.
"""
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TILT = re.compile(r"\b(rotate(?:\s+around)?|xslant|yslant|cm|transform shape)\s*=\s*([^,\]\)]*)")
BASIS = re.compile(r"\b([xy])\s*=\s*\{?\s*\(")
NODE = re.compile(r"\bnode\b")

tilt_pics = basis_pics = 0
tilt_text, tilt_clean = 0, 0
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.findall(text):
        tilts = TILT.findall(pic)
        basis = BASIS.findall(pic)
        if tilts:
            tilt_pics += 1
            if NODE.search(pic):
                tilt_text += 1
                print("TEXT  %-44s %s" % (tex.stem[:44], str(tilts[:2])[:70]))
            else:
                tilt_clean += 1
                print("CLEAN %-44s %s" % (tex.stem[:44], str(tilts[:2])[:70]))
        elif basis:
            basis_pics += 1

print("pictures: %d tilt the plane (%d with node text, %d draws only), %d set an x=/y= basis"
      % (tilt_pics, tilt_text, tilt_clean, basis_pics))
