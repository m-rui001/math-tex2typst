"""Faithful synthetic reproduction of the clipped figure: two canvases in one body.

The single-canvas test moved cleanly to the next page, so the paper's loss needs the real shape --
canvas (a) 13.3 cm, a text line, canvas (b) 15.3 cm, a text line, then the caption.  Three
variants, one feature apart: as emitted (both inline), both lifted into `block`, and both given a
smaller `length` so the picture is simply shorter.
"""
import os
import re
import subprocess

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, '_work', 'canvas_block_test')
os.makedirs(OUT, exist_ok=True)


def canvas(h):
    return ("#cetz.canvas({\n  import cetz.draw: *\n  line((0, 0), (10, %d), stroke: red)\n"
            "  rect((0, 0), (10, %d))\n})" % (h, h))


A, B = canvas(13.3), canvas(15.3)
HEAD = ('#import "@preview/cetz:0.5.2"\n'
        '#set page(width: 17.8cm, height: 23.8cm, margin: 2.5cm)\n')
BODY = ('#figure(\n  [%s\n  Panel A text line.\n  %s\n  Panel B text line.],\n'
        '  caption: [Figure 1: THE-CAPTION-OF-THE-TWO-PANEL-FIGURE. #lorem(40)],\n)\n')
CAP = 'THE-CAPTION-OF-THE-TWO-PANEL-FIGURE'


def run(name, src):
    path = os.path.join(OUT, name)
    open(path, 'w', encoding='utf-8').write(src)
    pdf = os.path.join(OUT, name[:-4] + '.pdf')
    proc = subprocess.run(['typst', 'compile', path, pdf], capture_output=True)
    if proc.returncode:
        print('%-16s rc=%d %s' % (name, proc.returncode,
                                  proc.stderr.decode('utf-8', 'replace')[:160]))
        return
    doc = fitz.open(pdf)
    pages = [p.number + 1 for p in doc if CAP in re.sub(r'\s+', ' ', p.get_text())]
    # where did each panel's own line end up?
    panel_b = [p.number + 1 for p in doc if 'Panel B text line' in re.sub(r'\s+', ' ', p.get_text())]
    print('%-16s pages=%2d caption on %-9s panel-B line on %-6s'
          % (name, doc.page_count, pages or 'LOST', panel_b or 'LOST'))
    doc.close()


run('two_inline.typ', HEAD + '#lorem(300)\n' + (BODY % (A, B)))
run('two_block.typ', HEAD + '#lorem(300)\n'
    + (BODY % (A, B)).replace('#cetz.canvas({', '#block(cetz.canvas({').replace('\n})', '\n}))'))
run('two_scaled.typ', HEAD + '#lorem(300)\n'
    + (BODY % (A, B)).replace('#cetz.canvas({', '#cetz.canvas(length: 0.6cm, {'))
