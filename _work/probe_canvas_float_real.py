"""Does `place(float: true)` rescue a figure whose picture is taller than the space left?

`layout` measures the region, not the remaining space, so it sizes an oversized canvas exactly as
an unbounded one does -- measured, all three earlier cases were identical to the control.  LaTeX
never clips a figure; it defers the whole float.  Typst's counterpart is `place(float: true)`.

Both candidates are tried on the real document: the affected paper's own main.typ is compiled as
it stands (the control, which must lose the caption) and again with only the figure lifted into a
float.  The test output goes to _work so the run's main.pdf is never touched.
"""
import os
import re
import shutil
import subprocess

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, '_work', 'canvas_block_test')
os.makedirs(OUT, exist_ok=True)
PAPER = next(p for p in os.listdir(os.path.join(ROOT, 'typst')) if p.startswith('Finite-angular-cylinder'))
SRC = os.path.join(ROOT, 'typst', PAPER, 'main.typ')
CAP = 'neighboring angular sectors have distinct translated vertices'
# the emitter's own figure opener for this picture
OPEN = '#figure(\n  [#strong[(a)] The zero-tilt geometry'


def compile_(name, text):
    """Compile `text` inside the paper's own folder so refs.bib and imports resolve."""
    staged = os.path.join(ROOT, 'typst', PAPER, name)
    open(staged, 'w', encoding='utf-8').write(text)
    pdf = os.path.join(OUT, name.replace('.typ', '') + '.pdf')
    try:
        proc = subprocess.run(['typst', 'compile', staged, pdf, '--root', ROOT], capture_output=True)
        err = proc.stderr.decode('utf-8', 'replace').strip()
        if proc.returncode:
            print('%-22s rc=%d %s' % (name, proc.returncode, err[:160]))
            return
        doc = fitz.open(pdf)
        pages = [p.number + 1 for p in doc if CAP in re.sub(r'\s+', ' ', p.get_text())] or 'LOST'
        print('%-22s pages=%d caption on %s   stderr=%s'
              % (name, doc.page_count, pages, (err.splitlines() or ['-'])[0][:60]))
        doc.close()
    finally:
        os.remove(staged)


text = open(SRC, encoding='utf-8').read()
assert text.count(OPEN) == 1, text.count(OPEN)
compile_('check_control.typ', text)

# one feature: the figure is a float, everything else identical
floated = text.replace(OPEN, '#place(float: true, clearance: 1em, ' + OPEN, 1)
end = floated.index(') <fig:construction>')
floated = floated[:end + len(') <fig:construction>')] + ')' + floated[end + len(') <fig:construction>'):]
assert floated.count('#place(float: true') == 1
compile_('check_float.typ', floated)

# the alternative reading of the same defect: keep the figure in place and shrink the unit length
# so the whole picture is shorter than half a text block
shrink = text
for h in ('13.31', '13.25'):
    shrink = shrink.replace('#cetz.canvas({', '#cetz.canvas(length: 0.55cm, {')
    break
shrink = re.sub(r'#cetz\.canvas\(\{', '#cetz.canvas(length: 0.55cm, {', text)
compile_('check_shrunk.typ', shrink)
print('control figure canvases: %d, bbox rect lines kept' % text.count('#cetz.canvas('))
