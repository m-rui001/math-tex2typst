r"""#30's second leg: does a diagram whose labels now clear their arrows still fit the column?

A CD canvas is placed as a block and Typst does not know its width -- the canvas reports the extent
of its *points*, not of the ink drawn at them (that is §7's own row, 画布只按点算尺寸).  Moving a
label half its width off its arrow therefore risks pushing the diagram past the text block, and the
only honest way to see it is to measure the canvas's own extent against the column it ships in,
under both label laws.

Usage: python _work/probe30_cd_width.py
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
CD_SRC = re.compile(r"\\begin\{(?:tikzcd|CD)\}.*?\\end\{(?:tikzcd|CD)\}", re.S)
POINT = re.compile(r"\(\s*(-?[\d.]+)\s*,\s*(-?[\d.]+)\s*\)")
CONTENT_T = re.compile(r"content\(\((-?[\d.]+), (-?[\d.]+)\), \[(.*?)\]\)", re.S)
LABEL_H = 0.35
QUOTED = re.compile(r'"([^"]*)"')
LONG_NAME = re.compile(r"[A-Za-z][A-Za-z.]*")
INK = re.compile(r"[A-Za-z0-9+\-*/=<>.,;:!?'|()\[\]{}^_\\@&#%]")


def ink_width(body):
    """Centimetres of ink a converted label prints; markup names print no letters."""
    rest = LONG_NAME.sub(" ", QUOTED.sub(" ", body))
    return 0.55 + 0.17 * len("".join(QUOTED.findall(body)) + "".join(INK.findall(rest)))


def extent(canvas):
    """The canvas's own width in cm: every point, and every label's box around its point."""
    xs = [float(m.group(1)) for m in POINT.finditer(canvas)]
    for m in CONTENT_T.finditer(canvas):
        half = ink_width(m.group(3)) / 2
        xs += [float(m.group(1)) - half, float(m.group(1)) + half]
    return max(xs) - min(xs) if xs else 0.0


def main():
    live = cetz.cd_label_off
    rows = []
    try:
        for name in sorted(os.listdir(FLAT)):
            if not name.endswith(".tex"):
                continue
            src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
            pre_text, body = prep.split_document(src)
            axis = convert.line_cm(prep.parse_preamble(pre_text))
            if axis is None:
                continue
            for m in CD_SRC.finditer(src):
                core = cetz.strip_envelope(m.group(0))
                cetz.cd_label_off = live
                new = cetz.build(core) or cetz.build_cd(core)
                cetz.cd_label_off = lambda label, px, py: 0.45
                old = cetz.build(core) or cetz.build_cd(core)
                if new and old:
                    rows.append((name[:-4], axis, extent(old), extent(new)))
    finally:
        cetz.cd_label_off = live
    over_old = [r for r in rows if r[2] > r[1]]
    over_new = [r for r in rows if r[3] > r[1]]
    print("== CD canvases measured against their column: %d" % len(rows))
    print("   wider than the text block before the fix: %d over %d papers"
          % (len(over_old), len({r[0] for r in over_old})))
    print("   wider than the text block after it      : %d over %d papers"
          % (len(over_new), len({r[0] for r in over_new})))
    grew = [r for r in rows if r[3] > r[2] + 0.01]
    print("   canvases that got wider                 : %d (median +%.2f cm, worst +%.2f cm)"
          % (len(grew),
             sorted([r[3] - r[2] for r in grew])[len(grew) // 2] if grew else 0.0,
             max([r[3] - r[2] for r in grew], default=0.0)))
    for r in sorted(rows, key=lambda x: x[3] - x[1], reverse=True)[:8]:
        print("   column %5.2f  old %5.2f -> new %5.2f  %s"
              % (r[1], r[2], r[3], r[0][:44]))


if __name__ == "__main__":
    main()
