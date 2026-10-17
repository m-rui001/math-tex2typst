# -*- coding: utf-8 -*-
"""Line inspector: show the raw line, backtick/dollar offsets, and how the shipped
census口径 (fenceMask + single-line CODE regex) pairs the '$' delimiters."""
import io, sys, re
sys.stdout.reconfigure(encoding='utf-8')

D = chr(36)
BT = chr(96)
BSL = chr(92)
ROOT = 'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0/'
CODE1 = re.compile(u'`+[^' + BT + u'\n]*`+')
FENCE = re.compile(u'^(?:`{3,}|~{3,})')


def fence_state(lines, target):
    infence = False
    tok = None
    for i, l in enumerate(lines):
        s = l.strip()
        if FENCE.match(s):
            if not infence:
                infence = True
                tok = s[0] * 3
            elif tok and s.startswith(tok):
                infence = False
                tok = None
            continue
        if i + 1 == target:
            return infence
    return infence


def show(filebase, lineno, width=400):
    # resolve file
    import glob, os
    hits = [p for p in glob.glob(ROOT + '*.md') if os.path.basename(p).startswith(filebase + '-')]
    assert len(hits) == 1, hits
    t = io.open(hits[0], encoding='utf-8').read()
    lines = t.split('\n')
    l = lines[lineno - 1]
    print('FILE %s  (bytes=%d, lines=%d)' % (os.path.basename(hits[0]), len(t.encode('utf-8')), len(lines)))
    print('L%d in fence: %s' % (lineno, fence_state(lines, lineno)))
    print('RAW  : ' + l[:width])
    print('ticks: %d  dollars: %d' % (l.count(BT), l.count(D)))
    print('tick offsets: ' + str([i for i, c in enumerate(l) if c == BT]))
    print('dollar offsets: ' + str([i for i, c in enumerate(l) if c == D]))
    m = CODE1.sub(lambda mm: u' ' * len(mm.group(0)), l)
    print('MASK : ' + m[:width])
    print('mask dollars: ' + str([i for i, c in enumerate(m) if c == D]))
    print('removed by CODE1: ' + str([l[i:i+8] for i in range(len(l)) if l[i] != m[i]][:40]))


if __name__ == u'__main__':
    show(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]) if len(sys.argv) > 3 else 400)
