"""Replace manual `#h(<n>em)` in math with the semantic Typst spacing names.

Measured with `measure()` on typst 0.15.1 (see STYLE_AUDIT.md):
  thin = 0.16667em, thick = 0.27778em, quad = 1em, wide = 2em
Only exact (or 4-decimal rounded) values are mapped; everything else stays.
"""
import re

from typstscan import mode_map, MATH, CODE

H_CALL = re.compile(r'#h\(\s*([-+0-9.]+)\s*em\s*\)')
# value -> semantic name.  0.1667/0.2778 are the 4-decimal roundings of the
# exact thin/thick values that the converter emitted.
SPACING = {
    '0.16667': 'thin', '0.1667': 'thin', '0.166': 'thin',
    '0.27778': 'thick', '0.2778': 'thick', '0.277': 'thick',
    '0.22222': 'med', '0.2222': 'med',
    '1': 'quad', '1.0': 'quad', '1.00': 'quad',
    '2': 'wide', '2.0': 'wide', '2.00': 'wide',
}


def replace(text, stats=None):
    """Rewrite `#h(Nem)` inside math mode to thin/thick/med/quad/wide."""
    modes = mode_map(text)
    out = []
    last = 0
    count = 0
    kinds = {}
    for m in H_CALL.finditer(text):
        md = modes[m.start()]
        if md == CODE:
            # the scanner marks `#h(...)` inside math as code so that no line
            # break is inserted into the call; accept it only when the call is
            # surrounded by math
            inside_math = m.start() and modes[m.start() - 1] == MATH
            if not inside_math:
                continue
        elif md != MATH:
            continue
        name = SPACING.get(m.group(1).lstrip('+'))
        if not name:
            continue
        # do not map negative values (e.g. -0.16667em == -thin)
        out.append(text[last:m.start()])
        prev = text[m.start() - 1] if m.start() else ' '
        nxt = text[m.end()] if m.end() < len(text) else ' '
        if prev.isalnum() or prev in '_^.),\'"':
            out.append(' ')     # keep `p#h(0.1667em)` from becoming `pthin`
        out.append(name)
        if nxt.isalnum():
            out.append(' ')
        last = m.end()
        count += 1
        kinds[name] = kinds.get(name, 0) + 1
    if not count:
        if stats is not None:
            stats['hspace'] = 0
        return text
    out.append(text[last:])
    if stats is not None:
        stats['hspace'] = count
        stats['hspace_kinds'] = kinds
    return ''.join(out)
