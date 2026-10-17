"""Where did the recovered figure go? Dump per-page text hits for the Finite-angular-cylinder PDF."""
import re
import sys
from pathlib import Path

import fitz

ROOT = Path(__file__).resolve().parent.parent
paper = next(p for p in (ROOT / 'typst').iterdir() if p.name.startswith('Finite-angular-cylinder'))
doc = fitz.open(paper / 'main.pdf')
needles = ['zero tilt', 'zero-tilt', 'Matching after the tilt', 'supporting line', 'Figure 1',
           'Physical coordinates', 'Radial cutoffs', 'dashed line', 'exaggerated']
for page in doc:
    text = re.sub(r'\s+', ' ', page.get_text())
    hits = [n for n in needles if n.lower() in text.lower()]
    if hits:
        print('page', page.number + 1, hits)
print('pages', doc.page_count)
print('--- page 5 raw ---')
print(re.sub(r'\s+', ' ', doc[4].get_text())[:1500])
