"""Reproduce the clipping on the real figure, then test the one-feature change.

The synthetic single-canvas case moved cleanly to the next page, so the trigger needs the real
shape: two canvases in one figure body with text lines between them.  This lifts the actual
Figure 1 block out of the paper's main.typ, compiles it three ways -- as emitted, with every
canvas wrapped in `block`, and with the canvas scaled down by `length` -- and reports which
pages the caption's prose reaches.
"""
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, '_work', 'canvas_block_test')
os.makedirs(OUT, exist_ok=True)
PAPER = next(p for p in os.listdir(os.path.join(ROOT, 'typst')) if p.startswith('Finite-angular-cylinder'))
text = open(os.path.join(ROOT, 'typst', PAPER, 'main.typ'), encoding='utf-8').read()

head = text.split('#figure(')[0]
figure = '#figure(' + text.split('#figure(')[1].split('\n) <fig:construction>')[0] + '\n)'
prose = 'The common supporting line is'
cap = 'neighboring angular sectors have distinct translated vertices'

# the preamble cites the paper's bibliography, which lives at the end of main.typ and so is not
# in this slice; Typst then refuses the whole document.  The citations are irrelevant here.
head = re.sub(r'@(?![a-z]+/)[A-Za-z0-9_:\-.]+', 'CITE', head)

print('figure block: %d chars, canvases=%d' % (len(figure), figure.count('#cetz.canvas')))


def run(name, src):
    path = os.path.join(OUT, name)
    open(path, 'w', encoding='utf-8').write(src)
    pdf = os.path.join(OUT, name.replace('.typ', '') + '.pdf')
    proc = subprocess.run(['typst', 'compile', path, pdf], capture_output=True)
    err = proc.stderr.decode('utf-8', 'replace').strip()
    if proc.returncode:
        print('%-18s rc=%d %s' % (name, proc.returncode, err[:300]))
        return
    doc = fitz.open(pdf)
    pages = [p.number + 1 for p in doc
             if cap in re.sub(r'\s+', ' ', p.get_text())]
    inside = [p.number + 1 for p in doc
              if prose in re.sub(r'\s+', ' ', p.get_text())]
    print('%-18s pages=%d caption on %s, in-figure prose on %s, stderr=%s'
          % (name, doc.page_count, pages or 'NOWHERE', inside or 'NOWHERE', err[:80] or '-'))
    doc.close()


as_emitted = head + figure
run('real_as_emitted.typ', as_emitted)

# one feature at a time: the same figure with each canvas lifted into a block.  Every canvas
# opens at "#cetz.canvas({" and closes on a lone "})" at column zero.
wrapped = figure.replace('#cetz.canvas({', '#block(cetz.canvas({').replace('\n})', '\n}))')
assert wrapped.count('#block(') == 2, wrapped.count('#block(')
run('real_block.typ', head + wrapped)

# the other candidate fix: a smaller unit length so the picture simply is shorter
run('real_scaled.typ', head + figure.replace('#cetz.canvas({', '#cetz.canvas(length: 0.55cm, {'))
sys.exit(0)
