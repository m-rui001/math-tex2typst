"""Does a tall CeTz canvas clip its own caption, and does a block wrapper save it?

cetz.canvas returns a `box`, so inside a figure body it sits in a paragraph line whose height is
the picture's height.  When the remaining page space is smaller, Typst cannot break the line and
the picture plus everything after it inside the figure disappears.  A `block` is a breakable
flow-level element, so Typst can move it to the next page instead.  This measures both shapes on
the same page: two figures with identical 15 cm canvases, distinguished only by the wrapper.
"""
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, '_work', 'canvas_block_test')
os.makedirs(OUT, exist_ok=True)

CANVAS = """#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10, 15), stroke: red)
  rect((0, 0), (10, 15))
})"""
# `#` belongs to markup mode only, so the block variant hands over the code-mode form
CANVAS_CODE = CANVAS[1:]

SRC = """#import "@preview/cetz:0.5.2"
#set page(width: 17.8cm, height: 23.8cm, margin: 2.5cm)
#lorem(340)
#figure(
  [%s
  #lorem(20)],
  caption: [Figure 1: ALPHA-CAPTION-SHOULD-SURVIVE. #lorem(30)],
)
#figure(
  [#block(%s)
  #lorem(20)],
  caption: [Figure 2: BETA-CAPTION-SHOULD-SURVIVE. #lorem(30)],
)
#lorem(200)
""" % (CANVAS, CANVAS_CODE)


def run(name, src):
    path = os.path.join(OUT, name)
    with open(path, 'w', encoding='utf-8') as fh:
        fh.write(src)
    proc = subprocess.run(['typst', 'compile', path, os.path.join(OUT, name.replace('.typ', '') + '.pdf')],
                          capture_output=True)
    err = proc.stderr.decode('utf-8', 'replace').strip()
    print('%-28s rc=%d err=%s' % (name, proc.returncode, err[:200] or '-'))
    doc = fitz.open(os.path.join(OUT, name.replace('.typ', '') + '.pdf'))
    pages = []
    for page in doc:
        text = re.sub(r'\s+', ' ', page.get_text())
        pages.append((page.number + 1, 'ALPHA' in text, 'BETA' in text,
                      'Figure 1:' in text, 'Figure 2:' in text))
    doc.close()
    print('%-28s rc=%d err=%s' % (name, proc.returncode, err[:120] or '-'))
    for number, a, b, fa, fb in pages:
        print('   page %d alpha=%s beta=%s cap1=%s cap2=%s' % (number, a, b, fa, fb))


run('both.typ', SRC)
print('---')
# the two figures are identical except for the wrapper; run each alone so the second cannot
# shift onto a fresh page because of the first
one = SRC.split('#figure(')[1].split('#figure(')[0]
two = SRC.split('#figure(')[2].split('#figure(')[0]
head = SRC.split('#figure(')[0]
run('only_inline.typ', head + '#figure(' + one + '#lorem(200)')
run('only_block.typ', head + '#figure(' + two + '#lorem(200)')
sys.exit(0)
