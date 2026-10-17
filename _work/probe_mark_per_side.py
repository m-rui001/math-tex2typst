"""Which per-side `mark:` dictionaries does CeTz 0.5.0 accept, and what do they draw?

`arrow_mark` has to emit a TikZ arrow spec whose two sides carry different tips, each with the
author's own `length`/`width` and, for a named TikZ tip, a fill. `mark-shapes.typ` resolves a
`start:`/`end:` value that is a dictionary against the per-side style, so a dictionary is the form
that can give one side a length without giving the other side the same one. This checks that
reading: each row compiles one line and reports the heads it leaves behind (bbox in pt + filled +
item kinds), so a spelling that silently draws nothing shows up as a missing head.
"""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")

HEADER = ('#import "@preview/cetz:0.5.0"\n'
          '#set page(width: 14cm, height: 4cm)\n'
          '#cetz.canvas({\n  import cetz.draw: *\n')

MARKS = [
    ('side dict len', 'mark: (end: (symbol: ">>", length: 2mm))'),
    ('side dict l+w', 'mark: (end: (symbol: ">>", length: 2mm, width: 1mm))'),
    ('side dict fill', 'mark: (end: (symbol: ">>", fill: black))'),
    ('str start+dict', 'mark: (start: "<", end: (symbol: ">>", length: 2mm))'),
    ('array of str', 'mark: (end: (">", "|"))'),
    ('array of dict', 'mark: (end: ((symbol: ">>", length: 2mm), (symbol: "o")))'),
    ('both dicts', 'mark: (start: (symbol: "<", length: 2mm),'
                   ' end: (symbol: ">", length: 2mm))'),
    ('dict sep', 'mark: (end: (symbol: ">>", length: 2mm, sep: 1mm))'),
    ('flat sibling', 'mark: (end: (symbol: ">>", length: 2mm), start: (symbol: "<"))'),
]


def heads(pdf):
    import fitz
    d = fitz.open(pdf)
    got = [(round(x["rect"].width, 2), round(x["rect"].height, 2), x.get("fill") is not None,
            sorted({i[0] for i in x["items"]})) for x in d[0].get_drawings()]
    d.close()
    return [g for g in got if g[0] < 20 or g[0] == 0]


def main():
    tmp = tempfile.mkdtemp()
    out = os.path.join(tmp, "m.pdf")
    for name, mark in MARKS:
        body = HEADER + ("  line((0, 0), (8, 0), stroke: (thickness: 0.4pt), %s)\n})\n" % mark)
        r = subprocess.run(["typst", "compile", "--format", "pdf", "-", out],
                           input=body.encode("utf-8"), capture_output=True)
        if r.returncode:
            err = (r.stderr or b"").decode("utf-8", "replace")
            line = next((l for l in err.splitlines() if "error" in l), "(no output)")
            print("%-16s FAIL %s" % (name, line[:110]))
            continue
        print("%-16s heads=%s" % (name, heads(out)))


if __name__ == "__main__":
    main()
