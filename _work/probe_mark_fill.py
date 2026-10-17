"""Can a CeTz mark be filled, the way TikZ's named heads are?

TikZ draws `Stealth`/`Latex` solid (measured: filled paths in `_work/measure_tikz_tips.py`) while a
bare CeTz mark comes out as an outline (`_work/probe_mark_heads.py`: every head `fill=False`).
Each row puts one candidate spelling on a line and reports the head's bbox and fill.
"""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")

SPECS = [
    ('plain', 'mark: (end: ">>")'),
    ('fill black', 'mark: (end: ">>", fill: black)'),
    ('fill auto', 'mark: (end: ">>", fill: auto)'),
    ('set fill', '#set fill(black)\n  line((0, 0), (4, 0), stroke: (thickness: 0.4pt), mark: (end: ">>"))'),
]

HEAD = ('#import "@preview/cetz:0.5.0"\n'
        '#set page(width: 12cm, height: 4cm)\n'
        '#cetz.canvas({\n  import cetz.draw: *\n')


def doc(spec):
    if spec.startswith("#"):
        inner = spec.split("\n", 1)[1]
        return HEAD + inner + "\n})\n"
    return HEAD + ("  line((0, 0), (4, 0), stroke: (thickness: 0.4pt), %s)\n" % spec) + "})\n"


def head(pdf):
    import fitz
    d = fitz.open(pdf)
    got = [(round(x["rect"].width, 2), round(x["rect"].height, 2), x.get("fill") is not None,
            sorted({i[0] for i in x["items"]})) for x in d[0].get_drawings()]
    d.close()
    return [g for g in got if g[0] < 20]


def main():
    tmp = tempfile.mkdtemp()
    out = os.path.join(tmp, "f.pdf")
    for name, spec in SPECS:
        r = subprocess.run(["typst", "compile", "--format", "pdf", "-", out],
                           input=doc(spec).encode("utf-8"), capture_output=True)
        if r.returncode:
            err = (r.stderr or b"").decode("utf-8", "replace")
            line = next((l for l in err.splitlines() if "error" in l), "(no output)")
            print("%-12s FAIL %s" % (name, line[:100]))
            continue
        print("%-12s head=%s" % (name, head(out)))


if __name__ == "__main__":
    main()
