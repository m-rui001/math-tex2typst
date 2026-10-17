r"""#99j: the punched holes read on the rebuilt pages, against the same page one generation before

The twelve papers went through the batch with the `even odd rule` fix.  The generation before is
rebuilt here by swapping each product's `compound-path` line back for the shape lines the batch
replaced (its own diff receipt, `_work/label99i_regen.txt` -- `probe99i`'s aside-copies are keyed by a
24-character stem and the two `A-Torsion-Free-Group-Algebra-*` papers share theirs).  This finds every
filled path whose sub-paths sit concentrically on one another (that is what a holed statement looks
like on the page), samples a 5x5 grid inside the inner box and a 5x5 grid in the band between the two
boxes, and reads the same 50 points in both generations -- the interior because several authors draw a
dot or a label in their own hole, the band because the ring must still carry the fill.  The before page
is rendered into `_work/_m99j_before/`, never into `typst/`.

  python _work/probe99j_product_pages.py       # -> _work/label99j_pages.txt, _work/m99j_*.png
"""
import glob
import io
import os
import shutil
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "label99j_pages.txt")
KEEP = os.path.join(ROOT, "_work", "_m99j_before")
RECEIPT = os.path.join(ROOT, "_work", "label99i_regen.txt")
DPI = 600


def subpaths(drawing):
    """The bounding boxes of one path's sub-paths, split where a segment starts away from the last end."""
    boxes, pts, last = [], [], None

    def flush():
        if pts:
            box = fitz.Rect(min(p.x for p in pts), min(p.y for p in pts),
                            max(p.x for p in pts), max(p.y for p in pts))
            if box.width > 0.5 and box.height > 0.5:
                boxes.append(box)
        del pts[:]

    for item in drawing.get("items", ()):
        if item[0] == "re":
            flush()
            box = fitz.Rect(item[1])
            if box.width > 0.5 and box.height > 0.5:
                boxes.append(box)
            last = None
            continue
        found = [p for p in item[1:] if isinstance(p, fitz.Point)]
        if not found:
            continue
        if last is not None and (abs(found[0].x - last.x) > 0.02 or abs(found[0].y - last.y) > 0.02):
            flush()
        pts.extend(found)
        last = found[-1]
    flush()
    return boxes


def holes(page):
    """Every filled path on the page that carries a smaller box concentric with its largest one.

    A holed statement ships one path with two sub-paths; a rectangular one also carries the
    connector segment between the two shapes, whose box is offset, so the boxes are grouped by the
    centre they share rather than taken in size order.
    """
    out = []
    for d in page.get_drawings():
        if d.get("fill") is None or len(d.get("items", ())) < 2:
            continue
        groups = {}
        for box in subpaths(d):
            key = (round((box.x0 + box.x1) / 2.0, 1), round((box.y0 + box.y1) / 2.0, 1))
            groups.setdefault(key, []).append(box)
        for group in groups.values():
            if len(group) < 2:
                continue
            group.sort(key=lambda b: -b.get_area())
            outer, inner = group[0], group[-1]
            if (outer.x0 <= inner.x0 and outer.y0 <= inner.y0
                    and outer.x1 >= inner.x1 and outer.y1 >= inner.y1
                    and inner.get_area() < 0.98 * outer.get_area()):
                out.append((outer, inner, tuple(round(c * 255) for c in d["fill"]),
                            d.get("even_odd")))
    return out


def grid(box, n=5):
    """Points spread over the interior of a box, inset from its own edges."""
    return [(box.x0 + box.width * (i + 1) / (n + 1.0), box.y0 + box.height * (j + 1) / (n + 1.0))
            for i in range(n) for j in range(n)]


def grids(page, hole, ring):
    """Read a hole grid and a ring grid off one rendering of the page."""
    pix = page.get_pixmap(dpi=DPI)

    def at(points):
        out = []
        for x, y in points:
            ix, iy = int(round(x * DPI / 72.0)), int(round(y * DPI / 72.0))
            out.append(None if not (0 <= ix < pix.width and 0 <= iy < pix.height)
                       else pix.pixel(ix, iy))
        return out

    return at(hole), at(ring)


def paper(pixels):
    return sum(1 for p in pixels if p is not None and min(p) >= 250)


def filled(pixels, colour):
    return sum(1 for p in pixels if p is not None
               and max(abs(a - b) for a, b in zip(p, colour)) <= 3)


def groups(paper_name):
    """The lines the batch replaced, in file order, read off its own receipt (`label99i_regen.txt`).

    `probe99i` copies each old product aside under a 24-character stem, and the two
    `A-Torsion-Free-Group-Algebra-*` papers share that stem, so the copies cannot tell the generations
    apart -- the diff receipt is the record that can.
    """
    out, cur, active = [], [], False
    for line in io.open(RECEIPT, encoding="utf-8"):
        bare = line.strip()
        if " ok=" in bare and "compile_ok=" in bare:
            if active and cur:
                out.append(cur)
                cur = []
            active = bare.startswith(paper_name[:44])
            continue
        if not active:
            continue
        if bare.startswith("- "):
            cur.append(bare[1:])
        elif bare.startswith("+ "):
            out.append(cur)
            cur = []
    if active and cur:
        out.append(cur)
    return out


def before_text(paper_name, typ):
    """The product one generation back: every `compound-path` line swapped for the shapes it replaced."""
    want = groups(paper_name)
    have = [i for i, l in enumerate(typ.splitlines()) if l.strip().startswith("compound-path(")]
    if len(want) != len(have):
        return None, "receipt has %d replaced groups, product %d compound lines" % (len(want), len(have))
    lines = typ.splitlines()
    for index, group in zip(have, want):
        lines[index:index + 1] = group
    return "\n".join(lines) + "\n", None


def main():
    lines = ["== nested filled paths, this generation against the one before the fix",
             "   (25 points inside the inner box must read the paper; 25 in the band between the two "
             "boxes must read the fill)"]
    total = 0
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        paper_name = os.path.basename(os.path.dirname(path))
        typ = io.open(path, encoding="utf-8").read()
        if "compound-path(" not in typ:
            continue
        old_typ, problem = before_text(paper_name, typ)
        if problem:
            lines.append("\n%s  NO BEFORE PRODUCT (%s)" % (paper_name[:52], problem))
            continue
        keep_name = os.path.join(KEEP, paper_name)
        # the assets stay put between runs: Windows holds a share on a pdf fitz has open, so a
        # re-copy of the whole directory is not needed -- the before product is the only file to swap
        if not os.path.isdir(keep_name):
            os.makedirs(keep_name)
            for entry in os.listdir(os.path.dirname(path)):
                if entry == "main.typ":
                    continue
                src_entry = os.path.join(os.path.dirname(path), entry)
                dst_entry = os.path.join(keep_name, entry)
                (shutil.copytree if os.path.isdir(src_entry) else shutil.copyfile)(
                    src_entry, dst_entry)
        io.open(os.path.join(keep_name, "main.typ"), "w", encoding="utf-8", newline="").write(old_typ)
        r = subprocess.run("typst compile main.typ main.pdf", cwd=keep_name, shell=True,
                           capture_output=True, text=True, encoding="utf-8", errors="replace")
        old = None if r.returncode else fitz.open(os.path.join(keep_name, "main.pdf"))
        if r.returncode:
            lines.append("\n%s  BEFORE RENDER rc=%d (%s) -- after side still read"
                         % (paper_name[:52], r.returncode,
                            (r.stderr or "").split("error:")[-1][:80].strip()))
        after = fitz.open(os.path.join(ROOT, "typst", paper_name, "main.pdf"))
        found = 0
        for pno in range(len(after)):
            for outer, inner, colour, even_odd in holes(after[pno]):
                total += 1
                found += 1
                hole_pts, ring_pts = grid(inner), grid(ring_box(outer, inner))
                h_new, r_new = grids(after[pno], hole_pts, ring_pts)
                h_old = r_old = None
                if old is not None and pno < len(old):
                    h_old, r_old = grids(old[pno], hole_pts, ring_pts)
                clip = fitz.Rect(outer.x0 - 8, outer.y0 - 8, outer.x1 + 8, outer.y1 + 8)
                after[pno].get_pixmap(dpi=300, clip=clip).save(
                    os.path.join(ROOT, "_work", "m99j_%s_p%d_%d.png"
                                 % (paper_name[:14], pno + 1, found)))
                opened = (None if h_old is None
                          else "%d -> %d of 25" % (paper(h_old), paper(h_new)))
                lines.append("  %-44s p%-4d even_odd=%-5s fill=%-18s hole paper %-12s "
                             "ring fill after %2d/25%s%s"
                             % (paper_name[:44], pno + 1, even_odd, colour, opened, filled(r_new, colour),
                                "" if h_old is None else " (before %d/25)" % filled(r_old, colour),
                                "  OK" if (paper(h_new) >= 20 and filled(r_new, colour) >= 20) else
                                "  INK-COVERED" if paper(h_new) > (0 if h_old is None else paper(h_old))
                                else "  BAD"))
        after.close()
        if old is not None:
            old.close()
        if not found:
            lines.append("\n%s  compound path shipped but no nested fill found on the page"
                         % paper_name[:52])
    lines.append("holes read on the page: %d over 12 papers" % total)
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


def ring_box(outer, inner):
    """The band between the two boxes on the left, over the inner box's vertical extent."""
    return fitz.Rect(outer.x0, inner.y0, inner.x0, inner.y1)


if __name__ == "__main__":
    sys.exit(main())
