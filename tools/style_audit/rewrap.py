"""Reflow long source lines without touching the rendered output.

Only whitespace is changed: a space that the scanner classifies as paragraph
text or math is replaced by a newline plus indentation.  Typst collapses such
whitespace, so the typeset result is identical while the source becomes
readable.  Code, strings, raw text and comments are never touched.
"""
import re

from typstscan import mode_map, MARKUP, MATH, CODE

LIMIT = 120
FILL = 114          # aim slightly below the limit so the result is stable
MAX_INDENT = 8

NOT_LINE_START = re.compile(r'^(?:[-+=/\\>|]|\d+\.\s|[*_~]|<)')
MATH_OP_BEFORE = ('=', '+', '-', ',,', 'quad', 'wide', 'times', 'gt.eq', 'lt.eq',
                  'arrow.r', 'arrow.l', 'cdot', 'compose', ';', ':', 'equiv',
                  'approx', 'to', 'med', 'dots.h', 'mid', '/', 'and')
MARKUP_STRONG = '.!?:'
MARKUP_WEAK = ',;'


def _line_indent(line):
    k = 0
    while k < len(line) and line[k] == ' ':
        k += 1
    return k


def _safe_start(text):
    """True if `text` may open a source line inside paragraph markup."""
    if not text:
        return False
    if NOT_LINE_START.match(text):
        return False
    c = text[0]
    return c.isalnum() or c in '$#@([{"\'“‘'


def _token_before(line, pos):
    j = pos - 1
    while j >= 0 and not line[j].isspace():
        j -= 1
    return line[j + 1:pos]


def rewrap(text, limit=LIMIT, fill=FILL, stats=None):
    """Return `text` with long markup/math lines wrapped."""
    modes = mode_map(text)
    out = []
    off = 0
    breaks = 0
    for line in text.split('\n'):
        if len(line) > limit and not _block_line(line, off, modes):
            pieces, n = _wrap_line(line, off, modes, limit, fill)
            if n:
                out.extend(pieces)
                breaks += n
                off += len(line) + 1
                continue
        out.append(line)
        off += len(line) + 1
    if stats is not None:
        stats['breaks'] = breaks
    return '\n'.join(out)


def _block_line(line, off, modes):
    """Lines where a newline would change the markup structure.

    A Typst heading, table row or term item ends at the end of the source line,
    so wrapping one would reinterpret the text that moved to the next line.
    Code lines are excluded as well: they are rewritten by hand, never by
    whitespace insertion.
    """
    ind = _line_indent(line)
    if ind >= len(line):
        return True
    c = line[ind]
    md = modes[off + ind] if off + ind < len(modes) else 0
    if md == CODE:
        return True
    if c == '|':
        return True
    # the centred title/author/date block stays on one source line: it is the
    # fixed 22-line preamble that tools/corpus_audit.py measures the body from
    if line.startswith('#align(center)', ind):
        return True
    return c == '='


def _candidates(line, off, modes):
    """List of (column, score, index, depth) of legal break positions."""
    ind = _line_indent(line)
    cands = []
    depth = 0
    for i in range(ind, len(line)):
        c = line[i]
        md = modes[off + i] if off + i < len(modes) else 0
        if md == MATH:
            if c in '([':
                depth += 1
            elif c in ')]':
                depth = max(0, depth - 1)
        if c != ' ' or md not in (MARKUP, MATH):
            continue
        if i == ind or line[i - 1] in ' \\' or not _safe_start(line[i + 1:i + 40]):
            continue
        # keep simple fractions readable: never split around a lone division
        if line[i + 1:i + 3] == '/ ' or line[i + 2:i + 4] == ' / ':
            continue
        if md == MATH:
            nxt = line[i + 1:i + 2]
            if line[i - 1] in '_^' or nxt in ('_', '^'):
                continue
            word = _token_before(line, i)
            if depth == 0 and (word in MATH_OP_BEFORE or line[i - 1] in '=+-,;:'):
                score = 3
            elif depth == 0:
                score = 2
            else:
                score = 0
        else:
            prev = line[i - 1]
            score = 4 if prev in MARKUP_STRONG else (3 if prev in MARKUP_WEAK else 1)
        cands.append((i - ind, score, i, depth))
    return cands


def _wrap_line(line, off, modes, limit, fill):
    ind = _line_indent(line)
    cands = _candidates(line, off, modes)
    if not cands:
        return [line], 0
    cuts = []
    seg_start = ind
    seg_indent = ind
    while seg_indent + (len(line) - seg_start) > limit:
        win = fill - seg_indent
        avail = [c for c in cands if seg_start < c[2] and c[0] - (seg_start - ind) <= win]
        pool = [c for c in avail if c[3] == 0] or avail
        if not pool:
            # nothing inside the line width: accept a little overflow before
            # breaking inside a bracketed group
            later = [c for c in cands if seg_start < c[2]
                     and c[0] - (seg_start - ind) <= win + 40 and c[3] == 0]
            if not later:
                later = [c for c in cands if seg_start < c[2]]
            if not later or not cuts:
                break
            pick = min(later, key=lambda c: c[2])
        else:
            tail = [c for c in pool if c[0] - (seg_start - ind) >= fill * 0.5]
            pick = max(tail or pool, key=lambda c: (c[1], c[2]))
        cuts.append(pick[2])
        seg_start = pick[2] + 1
        seg_indent = min(ind + 2, MAX_INDENT)
    if not cuts:
        return [line], 0
    pieces = []
    start = 0
    cur_ind = ind
    for c in cuts:
        pieces.append(' ' * cur_ind + line[start:c].strip())
        start = c + 1
        cur_ind = min(ind + 2, MAX_INDENT)
    pieces.append(' ' * cur_ind + line[start:].strip())
    return pieces, len(cuts)
