"""Caption-slot instrument: does every figure caption in main.typ reach main.pdf?

A CeTz canvas taller than the space left on its page is one unbreakable box, so Typst clips it
and everything after it inside the same figure.  Matching caption text against the PDF's
extracted text therefore measures lost content rather than styling.  Math is the obstacle, not
the caption: a caption reads "the sides at $q$ lie on line $y=...$", so the whole string never
appears in the PDF.  The instrument therefore compares the *prose runs between* the maths.
"""
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, 'typst')
MIN_PROSE = 30  # characters; shorter runs are "the", "and", "in" and prove nothing


def bracket_block(text, start):
    """Return the balanced [...] body whose opening bracket is at text[start]."""
    depth = 0
    i = start
    while i < len(text):
        c = text[i]
        if c == '\\':
            i += 2
            continue
        if c == '[':
            depth += 1
        elif c == ']':
            depth -= 1
            if depth == 0:
                return text[start + 1:i]
        i += 1
    return ''


def prose_runs(markup):
    """The pieces of a caption that are typeset as ordinary text, longest first."""
    pieces = re.split(r'\$[^$]*\$', markup)
    out = []
    for p in pieces:
        p = re.sub(r'#[a-zA-Z_]+\(', ' ', p)
        p = re.sub(r'\\[a-zA-Z]+', ' ', p)
        p = re.sub(r'[[\]_&<>#*@|^]', ' ', p)
        p = re.sub(r'\s+', ' ', p).strip(' ,;.')
        if len(p) >= MIN_PROSE:
            out.append(p)
    return out


def main():
    only = sys.argv[1:]
    rows = []
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
        caps, lost = 0, []
        for m in re.finditer(r'caption:\s*\[', text):
            body = bracket_block(text, text.index('[', m.start()))
            caps += 1
            missing = [p for p in prose_runs(body) if p not in full]
            if missing:
                lost.append(missing)
        if lost:
            rows.append((name, caps, lost))
    print('captions with prose that never reaches the PDF: %d over %d papers'
          % (sum(len(l) for _, _, l in rows), len(rows)))
    for name, caps, lost in rows:
        print('%-50s captions=%d lost=%d' % (name[:50], caps, len(lost)))
        for ph in lost[0][:1]:
            print('      %s' % ph[:90])


if __name__ == '__main__':
    main()
