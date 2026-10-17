"""Does `layout` hand a canvas the *remaining* height, which is what the clip needs?

A static cap cannot fix the paper's figure: canvas (b) at 15.3 cm is already shorter than the
18.8 cm text block and still clipped, because only ~2 cm was left under canvas (a).  So the only
candidate left is Typst's `layout`, if the size it reports is the space remaining at that point in
the flow rather than the whole region.  This distinguishes the two readings by outcome: with
remaining height the picture shrinks to fit and the caption survives; with full region height
nothing changes and the caption is lost again.
"""
import os
import re
import subprocess

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, '_work', 'canvas_block_test')
os.makedirs(OUT, exist_ok=True)
HEAD = ('#import "@preview/cetz:0.5.2"\n'
        '#set page(width: 17.8cm, height: 23.8cm, margin: 2.5cm)\n')
CAP = 'THE-CAPTION-OF-THE-TWO-PANEL-FIGURE'


def panel(w, h, body):
    """A canvas sized through layout: one unit is the largest length that fits the space."""
    return ('#layout(ly => %s(\n  length: 1cm * calc.min(ly.width / %gcm, ly.height / %gcm),\n'
            '  {\n  import cetz.draw: *\n  line((0, 0), (%g, %g), stroke: red)\n'
            '  rect((0, 0), (%g, %g))\n}))' % (body, w, h, w, h, w, h))


def canvas(w, h):
    return ('#cetz.canvas({\n  import cetz.draw: *\n  line((0, 0), (%g, %g), stroke: red)\n'
            '  rect((0, 0), (%g, %g))\n})' % (w, h, w, h))


def figure(a, b):
    return ('#figure(\n  [%s\n  Panel A text line.\n  %s\n  Panel B text line.],\n'
            '  caption: [Figure 1: %s. #lorem(40)],\n)\n' % (a, b, CAP))


def run(name, src):
    path = os.path.join(OUT, name)
    open(path, 'w', encoding='utf-8').write(src)
    pdf = os.path.join(OUT, name[:-4] + '.pdf')
    proc = subprocess.run(['typst', 'compile', path, pdf], capture_output=True)
    if proc.returncode:
        print('%-18s rc=%d %s' % (name, proc.returncode,
                                  proc.stderr.decode('utf-8', 'replace')[:200]))
        return
    doc = fitz.open(pdf)
    texts = [re.sub(r'\s+', ' ', p.get_text()) for p in doc]
    where = lambda needle: [i + 1 for i, t in enumerate(texts) if needle in t] or 'LOST'
    print('%-18s pages=%d caption=%-5s panelA=%-5s panelB=%-5s'
          % (name, doc.page_count, where(CAP), where('Panel A text line'),
             where('Panel B text line')))
    doc.close()


# `layout` turned out to report the region, not the space left: all three cases above size the
# canvases exactly as the unbounded control does, so no dynamic fit is available this way.
# LaTeX never clips a figure -- it defers the whole float to the next page.  Typst's counterpart
# is `place(float: true)`, which moves the figure as a unit.
run('float_both.typ', HEAD + '#lorem(300)\n#place(float: true, clearance: 1em, '
    + figure(canvas(10, 13.3), canvas(10, 15.3)).rstrip() + ')')
run('float_scaled.typ', HEAD + '#lorem(300)\n#place(float: true, clearance: 1em, '
    + figure(canvas(10, 8), canvas(10, 9)).rstrip() + ')')
