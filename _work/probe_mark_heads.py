"""CeTz's side of the arrow-tip comparison: dump every path of one marked line.

Reads the head as the short path -- its bbox, whether it is filled, and its item kinds -- so it can
be put next to `_work/measure_tikz_tips.py` number for number. `mark:` goes on `line`, not inside
`stroke:`; a length key passed beside the mark is honoured (the line is trimmed by that much), a
length inside a per-end dict was not.
"""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")

SPECS = [
    ('">"', 'mark: (end: ">")'),
    ('">>"', 'mark: (end: ">>")'),
    ('stealth', 'mark: (end: "stealth")'),
    ('")>"', 'mark: (end: ")>")'),
    ('curved-stealth', 'mark: (end: "curved-stealth")'),
    ('"o"', 'mark: (end: "o")'),
    ('"|"', 'mark: (end: "|")'),
    ('">" len 5.68', 'mark: (end: ">", length: 5.68pt)'),
    ('">>" len 5.68', 'mark: (end: ">>", length: 5.68pt)'),
    ('">>" len 5.68 w 4', 'mark: (end: ">>", length: 5.68pt, width: 4pt)'),
    ('")>" len 5.68', 'mark: (end: ")>", length: 5.68pt)'),
]

DOC = ('#import "@preview/cetz:0.5.0"\n'
       '#set page(width: 12cm, height: 4cm)\n'
       '#cetz.canvas({\n  import cetz.draw: *\n'
       '  line((0, 0), (4, 0), stroke: (thickness: 0.4pt)%s)\n})\n')


def paths(pdf):
    import fitz
    d = fitz.open(pdf)
    got = [(round(x["rect"].width, 2), round(x["rect"].height, 2), x.get("fill") is not None,
            sorted({i[0] for i in x["items"]}), len(x["items"])) for x in d[0].get_drawings()]
    d.close()
    return got


def main():
    tmp = tempfile.mkdtemp()
    out = os.path.join(tmp, "p.pdf")
    r = subprocess.run(["typst", "compile", "--format", "pdf", "-", out],
                       input=DOC.replace("%s", "").encode("utf-8"), capture_output=True)
    if r.returncode:
        print("control failed: %s" % r.stderr.decode("utf-8", "replace")[:200])
        return
    print("control      %s" % paths(out))
    for name, spec in SPECS:
        r = subprocess.run(["typst", "compile", "--format", "pdf", "-", out],
                           input=DOC.replace("%s", ", " + spec).encode("utf-8"),
                           capture_output=True)
        if r.returncode:
            err = (r.stderr or b"").decode("utf-8", "replace")
            line = next((l for l in err.splitlines() if "error" in l), "(no output)")
            print("%-16s FAIL %s" % (name, line[:90]))
            continue
        got = paths(out)
        short = [g for g in got if g[0] < 20]
        print("%-16s head=%s  all=%d" % (name, short, len(got)))


if __name__ == "__main__":
    main()
