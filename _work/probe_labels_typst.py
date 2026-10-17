r"""Which Typst shapes actually bind a label? Measured one file per shape.

The emitter has to write a float's second name somewhere, so each candidate gets its own document
and its own compile: a label in running text, one at the end of a paragraph, a bare #label line,
one after a display equation, one on a zero-height spacer, a duplicate name on two floats, and the
caption-less table line the emitter already writes.
"""
import io
import os
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "_probe_labels")
os.makedirs(OUT, exist_ok=True)

LOOKUP = "page here: #context counter(page).at(<%s>).first()\n"

SHAPES = {
    "s1_text_mid": ("Hello <x> world.\n" + LOOKUP % "x"),
    "s2_text_end": ("Hello world. <x>\n" + LOOKUP % "x"),
    "s3_label_line": ('#label("y")\n\n' + LOOKUP % "y"),
    "s4_after_math": ("$ a+b $ <z>\n" + LOOKUP % "z"),
    "s5_spacer": ("text above\n#v(0pt)<w>\ntext below\n" + LOOKUP % "w"),
    "s6_bare_table": ("table(columns: 2, [a], [b])\n"),
    "s7_duplicate": ("#figure([]) <d>\n\n#figure([]) <d>\n\n" + LOOKUP % "d"),
    "s8_figure_plus_spacer": ("#figure([one], caption: [Cap]) <p>\n#v(0pt)<q>\n"
                              + LOOKUP % "p" + LOOKUP % "q"),
    "s9_box_spacer": ("#figure([one], caption: [Cap]) <p>\n#box(width: 0pt, height: 0pt)<q>\n"
                      + LOOKUP % "q"),
}

for name, text in SHAPES.items():
    typ = os.path.join(OUT, name + ".typ")
    open(typ, "w", encoding="utf-8").write(text)
    got = subprocess.run(["typst", "compile", typ, name + ".pdf"], cwd=OUT,
                         capture_output=True, text=True, encoding="utf-8", errors="replace")
    out = (got.stdout or "") + (got.stderr or "")
    mark = []
    for token in ("error", "warning"):
        for line in out.splitlines():
            if line.startswith(token):
                mark.append(line.strip()[:110])
    print("%-22s rc=%d %s" % (name, got.returncode, " | ".join(mark) or "clean"))
    if name == "s6_bare_table":
        print("     (bare table line: does it compile at all?)")
