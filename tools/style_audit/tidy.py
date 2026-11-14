"""Whitespace hygiene: trailing spaces, blank runs, tabs, final newline.

Lines that live inside a raw block or a string are left untouched - there
whitespace is content, not formatting.
"""
from typstscan import mode_map, RAW, STRING, COMMENT


def tidy(text, stats=None):
    if text.startswith('\ufeff'):
        text = text[1:]
    text = text.replace('\r\n', '\n').replace('\r', '\n')
    modes = mode_map(text)
    lines = text.split('\n')
    out = []
    pos = 0
    stripped = 0
    tabbed = 0
    blanks = 0
    run = 0
    for line in lines:
        start = pos
        pos += len(line) + 1
        end = start + len(line)
        if end > start:
            protected = any(modes[p] in (RAW, STRING) for p in (start, end - 1))
        else:
            protected = start > 0 and modes[start - 1] in (RAW, STRING)
        new = line
        if not protected:
            if '\t' in new:
                tabbed += new.count('\t')
                new = new.replace('\t', '  ')
            r = new.rstrip(' \t')
            if r != new:
                stripped += 1
                new = r
        if not new.strip() and not protected:
            run += 1
            if run > 1:
                blanks += 1
                continue
        else:
            run = 0
        out.append(new)
    while out and not out[-1].strip():
        out.pop()
    if stats is not None:
        stats['trailing_ws'] = stripped
        stats['tabs'] = tabbed
        stats['blank_removed'] = blanks
    return '\n'.join(out) + '\n'
