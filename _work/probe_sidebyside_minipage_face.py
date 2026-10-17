# -*- coding: utf-8 -*-
"""Face census for §7 '并排 minipage 子图竖排': floats whose *top-level* content holds
two or more sibling minipages with a fractional width (LaTeX side-by-side columns).

Read-only. Prints per-file hits + a global count, so the 12-paper figure can be
re-measured independently (board rule: numbers must be re-measured, not quoted).
"""
import io, os, re, sys

FLAT = r'E:/math/_work/flat'
FLOAT_BEGIN = re.compile(r'\\begin\{(figure\*?|table\*?)\}')
FLOAT_END = re.compile(r'\\end\{(figure\*?|table\*?)\}')
MP_BEGIN = re.compile(r'\\begin\{minipage\}(?:\[[^\]]*\])?\s*\{([0-9.]*)\\(?:linewidth|textwidth)\}')


def top_minipages(block):
    """(width, body) of top-level minipages inside `block` (nested ones ignored)."""
    out = []
    i = 0
    depth = 0
    start = None
    while i < len(block):
        mb = MP_BEGIN.match(block, i)
        if mb:
            if depth == 0:
                start = mb.end()
            depth += 1
            i = mb.end()
            continue
        if block.startswith(r'\begin{minipage}', i):
            if depth == 0:
                start = i + len(r'\begin{minipage}')
            depth += 1
            i += len(r'\begin{minipage}')
            continue
        if block.startswith(r'\end{minipage}', i):
            depth = max(0, depth - 1)
            if depth == 0 and start is not None:
                out.append((None, block[start:i]))
                start = None
            i += len(r'\end{minipage}')
            continue
        i += 1
    return out


PICTURE = re.compile(r'\\begin\{tikzpicture\}|\\includegraphics|\\begin\{tikzcd\}')


def pair_has_pictures(bodies):
    """True if some side-by-side pair of minipages each holds a picture."""
    pics = [bool(PICTURE.search(b)) for _, b in bodies]
    for a in range(len(pics)):
        for b in range(a + 1, len(pics)):
            if pics[a] and pics[b]:
                return True
    return False


def floats(text):
    """Yield (env, body) for each float region, outermost pairing."""
    for m in FLOAT_BEGIN.finditer(text):
        env = m.group(1)
        j = m.end()
        depth = 1
        while j < len(text) and depth:
            b = FLOAT_BEGIN.match(text, j)
            e = FLOAT_END.match(text, j)
            if b:
                depth += 1
                j = b.end()
                continue
            if e:
                depth -= 1
                j = e.end()
                if depth == 0:
                    yield env, text[m.end():e.start()]
                continue
            j += 1


def has_side_by_side_pair(widths):
    """True if two *top-level* fractional minipages form a side-by-side pair
    (their declared shares sum to ~1).  This is the strict §7 shape: a float
    whose two columns were meant to sit next to each other."""
    frac = [w for w in widths if w is not None and w < 0.95]
    for a in range(len(frac)):
        for b in range(a + 1, len(frac)):
            if 0.85 <= frac[a] + frac[b] <= 1.05:
                return True
    return False


def main():
    sys.stdout.reconfigure(errors='replace')
    loose, strict, withpics = [], [], []
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith('.tex'):
            continue
        p = os.path.join(FLAT, name)
        try:
            text = io.open(p, encoding='utf-8', errors='replace').read()
        except Exception as ex:
            print('READ-FAIL', name, ex)
            continue
        for env, body in floats(text):
            bodies = top_minipages(body)
            # widths straight from the source (top-level only, via a depth counter)
            top_widths = []
            i = 0
            depth = 0
            while i < len(body):
                mb = MP_BEGIN.match(body, i)
                if mb:
                    if depth == 0:
                        top_widths.append(float(mb.group(1)) if mb.group(1) else None)
                    depth += 1
                    i = mb.end()
                    continue
                if body.startswith(r'\begin{minipage}', i):
                    depth += 1
                    i += len(r'\begin{minipage}')
                    continue
                if body.startswith(r'\end{minipage}', i):
                    depth = max(0, depth - 1)
                    i += len(r'\end{minipage}')
                    continue
                i += 1
            frac = [w for w in top_widths if w is not None and w < 0.95]
            if len(frac) >= 2:
                loose.append((name, env, top_widths))
                if has_side_by_side_pair(top_widths):
                    strict.append((name, env, top_widths))
                    if pair_has_pictures(bodies):
                        withpics.append((name, env, top_widths))
                break
    print('LOOSE files_with_sibling_frac_minipages=%d' % len(loose))
    print('STRICT files_with_side_by_side_pair=%d' % len(strict))
    print('WITH-PICTURES files_with_two_picture_minipages=%d' % len(withpics))
    print('--- with-pictures list ---')
    for name, env, widths in withpics:
        print('  %-70s %s widths=%s' % (name[:70], env, widths))


if __name__ == '__main__':
    main()
