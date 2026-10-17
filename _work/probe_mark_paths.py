"""Dump every drawn path of one marked line so the head can be identified by shape, not by guess."""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")

SRC = ('#import "@preview/cetz:0.5.0"\n'
       '#set page(width: 12cm, height: 4cm)\n'
       '#cetz.canvas({\n  import cetz.draw: *\n'
       '  line((0, 0), (4, 0), stroke: (thickness: 0.4pt), mark: (end: ">"))\n})\n')


def main():
    tmp = tempfile.mkdtemp()
    out = os.path.join(tmp, "d.pdf")
    r = subprocess.run(["typst", "compile", "--format", "pdf", "-", out],
                       input=SRC.encode("utf-8"), capture_output=True)
    if r.returncode:
        print(r.stderr.decode("utf-8", "replace")[:400])
        return
    import fitz
    d = fitz.open(out)
    for x in d[0].get_drawings():
        rect = x["rect"]
        types = {}
        for item in x["items"]:
            types[item[0]] = types.get(item[0], 0) + 1
        print("rect %.2f x %.2f at (%.2f, %.2f)  fill=%s color=%s close=%s width=%s items=%s"
              % (rect.width, rect.height, rect.x0, rect.y0, x.get("fill"), x.get("color"),
                 x.get("closePath"), x.get("width"), sorted(types)))
    d.close()


if __name__ == "__main__":
    main()
