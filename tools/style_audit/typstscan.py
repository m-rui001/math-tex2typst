"""Minimal Typst mode scanner.

The corpus is machine generated, so the scanner only has to be right about the
things that decide whether inserting a newline is safe: raw blocks, strings,
comments, math and code regions.  A newline may only be inserted where the
scanner reports MARKUP (paragraph text) or MATH, never inside code, strings,
raw text or comments.

Bias: when in doubt the scanner stays in CODE, which means "no break here".
That is the safe direction - a missed break only leaves a long line.
"""
import re

MARKUP, MATH, CODE, STRING, RAW, COMMENT = 0, 1, 2, 3, 4, 5
NAMES = {MARKUP: 'markup', MATH: 'math', CODE: 'code', STRING: 'string',
         RAW: 'raw', COMMENT: 'comment'}

STMT_WORDS = ('let', 'set', 'show', 'import', 'include', 'context')
WORD = re.compile(r'[A-Za-z]+')
TRACE = None        # set to a list to record (offset, mode, stack depth, char)


def mode_map(t, report=None):
    """Return a bytearray with the mode of every character of `t`.

    When `report` is a dict it receives 'stack' (frames left open at EOF) and
    'mode' (mode at EOF), so callers can detect a mis-modelled file.
    """
    n = len(t)
    m = bytearray(n)
    # frame = [mode, depth, stmt, close]
    stack = [[MARKUP, 0, False, None]]
    cur, depth, stmt, close = stack[0]
    i = 0
    while i < n:
        c = t[i]
        if TRACE is not None and len(TRACE) < 20000:
            TRACE.append((i, cur, len(stack), c))
        if cur == MARKUP:
            m[i] = MARKUP
            if c == '`':
                k = 1
                while i + k < n and t[i + k] == '`':
                    k += 1
                j = t.find('`' * k, i + k)
                end = n if j < 0 else j + k
                for p in range(i, end):
                    m[p] = RAW
                i = end
                continue
            if c == '/' and i + 1 < n and t[i + 1] in '/*':
                if t[i + 1] == '/' and i and t[i - 1] == ':':
                    i += 1          # part of a URL such as https://
                    continue
                if t[i + 1] == '*':
                    j = t.find('*/', i + 2)
                    end = n if j < 0 else j + 2
                else:
                    j = t.find('\n', i)
                    end = n if j < 0 else j
                for p in range(i, end):
                    m[p] = COMMENT
                i = end
                continue
            if c == '$':
                stack.append([cur, depth, stmt, close])
                cur, close = MATH, None
                i += 1
                continue
            if c == '#':
                w = WORD.match(t, i + 1)
                stmt = bool(w and w.group(0) in STMT_WORDS)
                stack.append([cur, depth, stmt, close])
                cur, depth, close = CODE, 0, None
                i += 1
                continue
            if c == '\\':
                m[i] = MARKUP
                if i + 1 < n:
                    m[i + 1] = MARKUP
                i += 2
                continue
            if c == ']' and close == ']':
                cur, depth, stmt, close = stack.pop()
                i += 1
                continue
            if c == '[':
                stack.append([cur, depth, stmt, close])
                cur, close = MARKUP, ']'
                i += 1
                continue
            i += 1
            continue

        if cur == MATH:
            m[i] = MATH
            if c == '$':
                cur, depth, stmt, close = stack.pop()
                i += 1
                continue
            if c == '\\':
                for p in range(i, min(i + 2, n)):
                    m[p] = MATH
                i += 2
                continue
            if c == '"':
                j = i + 1
                while j < n and t[j] != '"':
                    j += 2 if t[j] == '\\' else 1
                for p in range(i, min(j + 1, n)):
                    m[p] = STRING
                i = j + 1
                continue
            if c == '#':
                # code island inside math, e.g. #h(2em) or #scale(...)[...]
                w = WORD.match(t, i + 1)
                stmt = bool(w and w.group(0) in STMT_WORDS)
                stack.append([cur, depth, stmt, close])
                cur, depth, close = CODE, 0, None
                i += 1
                continue
            i += 1
            continue

        if cur == CODE:
            # code stays code; only brackets change the mode
            if c == '"':
                j = i + 1
                while j < n and t[j] != '"':
                    j += 2 if t[j] == '\\' else 1
                for p in range(i, min(j + 1, n)):
                    m[p] = STRING
                i = j + 1
                continue
            if c == '/' and i + 1 < n and t[i + 1] == '/':
                j = t.find('\n', i)
                end = n if j < 0 else j
                for p in range(i, end):
                    m[p] = COMMENT
                i = end
                continue
            if c == '/' and i + 1 < n and t[i + 1] == '*':
                j = t.find('*/', i + 2)
                end = n if j < 0 else j + 2
                for p in range(i, end):
                    m[p] = COMMENT
                i = end
                continue
            m[i] = CODE
            if c in '({':
                depth += 1
                i += 1
                continue
            if c in ')}':
                if depth == 0:
                    cur, depth, stmt, close = stack.pop()
                else:
                    depth -= 1
                    if depth == 0 and not stmt and cur == CODE:
                        nxt = t[i + 1] if i + 1 < n else '\n'
                        if nxt not in '._([{':
                            cur, depth, stmt, close = stack.pop()
                            continue
                i += 1
                continue
            if c == ';' and stmt and depth == 0:
                cur, depth, stmt, close = stack.pop()
                i += 1
                continue
            if c == '[':
                stack.append([cur, depth, stmt, close])
                cur, depth, stmt, close = MARKUP, 0, False, ']'
                i += 1
                continue
            if c == ']':
                if depth == 0:
                    cur, depth, stmt, close = stack.pop()
                    if cur == MARKUP and close == ']':
                        # this bracket closes the enclosing content block as well
                        cur, depth, stmt, close = stack.pop()
                else:
                    depth -= 1
                i += 1
                continue
            if c == '\n':
                if depth == 0:
                    cur, depth, stmt, close = stack.pop()
                i += 1
                continue
            if c in ' \t' and depth == 0 and not stmt:
                cur, depth, stmt, close = stack.pop()
                # the space belongs to the parent mode; do not consume it
                continue
            if c in '$#' and depth == 0 and not stmt:
                cur, depth, stmt, close = stack.pop()
                continue
            i += 1
            continue

        # STRING / RAW / COMMENT are only produced in bulk above; keep a fallback
        m[i] = MARKUP
        i += 1
    if report is not None:
        report['stack'] = [list(f) for f in stack]
        report['mode'] = cur
        report['depth'] = depth
    return m


def segments(t):
    """Yield (start, end, mode) runs of a uniform mode."""
    m = mode_map(t)
    if not m:
        return
    s = 0
    for i in range(1, len(m)):
        if m[i] != m[s]:
            yield s, i, m[s]
            s = i
    yield s, len(m), m[s]


def self_test():
    cases = [
        ('plain text with $x$ inline', [(0, 'markup')]),
        ('$ a = b $', [(0, 'markup')]),
    ]
    t = '#thm([A.])\n[\n  body $x$ text\n]'
    print(list(segments(t)))
    t2 = '#let f(a) = a + b\n\nText #cite(label("k")) more.\n\n$ x = y $ <eq:a>'
    print([(s, e, NAMES[md]) for s, e, md in segments(t2)])


if __name__ == '__main__':
    self_test()
