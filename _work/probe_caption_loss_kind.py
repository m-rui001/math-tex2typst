"""Split the caption_check hits into whole-caption loss and partial loss.

Whole loss means the figure block never lands on a page at all.  Partial loss (the tail of a
long caption missing) is what a clipped CeTz canvas looks like: the box is unbreakable, so the
picture plus whatever follows it inside the figure is cut off at the bottom of the page.
"""
import os
import re
import sys

import fitz

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from caption_check import TYPST, bracket_block, prose_runs  # noqa: E402


def main():
    only = sys.argv[1:]
    whole, partial, clean = [], [], 0
    for name in sorted(os.listdir(TYPST)):
        if only and not any(name.startswith(p) for p in only):
            continue
        folder = os.path.join(TYPST, name)
        src = os.path.join(folder, 'main.typ')
        pdf = os.path.join(folder, 'main.pdf')
        if not (os.path.isfile(src) and os.path.isfile(pdf)):
            continue
        text = open(src, encoding='utf-8').read()
        doc = fitz.open(pdf)
        full = re.sub(r'\s+', ' ', ' '.join(p.get_text() for p in doc))
        doc.close()
        hit = False
        for m in re.finditer(r'caption:\s*\[', text):
            body = bracket_block(text, text.index('[', m.start()))
            runs = prose_runs(body)
            missing = [p for p in runs if p not in full]
            if not missing:
                continue
            hit = True
            lead = runs[0][:11] if runs else ''
            kind = 'whole' if lead and lead not in full else 'partial'
            (whole if kind == 'whole' else partial).append((name, lead, len(runs) - len(missing)))
        if not hit:
            clean += 1
    print('whole-caption loss: %d   tail-only loss: %d   papers clean: %d'
          % (len(whole), len(partial), clean))
    print('--- whole (figure block absent) ---')
    for name, lead, kept in whole[:40]:
        print('%-52s %-14s kept=%d' % (name[:52], lead, kept))
    print('--- tail only (clipped canvas) ---')
    for name, lead, kept in partial[:40]:
        print('%-52s %-14s kept=%d' % (name[:52], lead, kept))


main()
