# -*- coding: utf-8 -*-
# v9: diagnostics + broadened sweep. Counts how many accident-declaration
# lines exist, how many quoted strings they carry, how many of those are absent
# verbatim from the note (i.e. possible restatements), and how many of those
# have a damaged relative anywhere in the note.
import io, os, re, glob, difflib, sys
from collections import Counter
sys.path.insert(0, u'E:/math/_work')
import bodyside_detect as bd
from bodyside_v8 import relatives, MARK

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'


def section_flags(lines):
    """mark lines that live in a section whose heading or text talks about an
    anchor accident."""
    heads = []
    for i, l in enumerate(lines):
        if re.match(u'^#{2,6}\\s', l):
            heads.append(i)
    flags = [False] * len(lines)
    for h in heads:
        e = len(lines)
        for k in heads:
            if k > h:
                e = k
                break
        body = u'\n'.join(lines[h:e])
        if any(m in body for m in MARK) or u'\u672c\u4f53\u4fa7' in body:
            for j in range(h, e):
                flags[j] = True
    return flags


def scan(path, tag):
    lines = bd.load(path)
    txt = u'\n'.join(lines)
    flags = section_flags(lines)
    stats = {'decl': 0, 'quotes': 0, 'absent': 0, 'withrel': 0}
    res = []
    for i, l in enumerate(lines):
        if not l or not flags[i]:
            continue
        qs = bd.quotes(l)
        if not qs:
            continue
        stats['decl'] += 1
        for q in qs:
            if len(q) < 10 or not bd.CJK.search(q):
                continue
            stats['quotes'] += 1
            if q in txt:
                continue
            stats['absent'] += 1
            f = relatives(q, lines, txt, maxind=10, minr=0.72)
            if f:
                stats['withrel'] += 1
                res.append((i + 1, q, f[:4], l))
    return res, stats


if __name__ == '__main__':
    out = []
    agg = Counter()
    tot = 0
    nwith = 0
    for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
        m = re.match(u'^D([0-9]+)', os.path.basename(p))
        if not m or not (1 <= int(m.group(1)) <= 399):
            continue
        tag = u'D%03d' % int(m.group(1))
        if tag == u'D374':
            continue
        res, st = scan(p, tag)
        agg += Counter(st)
        if res:
            nwith += 1
            tot += len(res)
            out.append(u'###### %s %s' % (tag, os.path.basename(p)))
            for dl, q, f, decl in res:
                out.append(u' DECL L%d | %s' % (dl, decl[:300]))
                out.append(u'  Q(%d): %s' % (len(q), q))
                txt = u'\n'.join(bd.load(p))
                for ln, r, d, off in f:
                    out.append(u'  SITE L%d r=%.3f cnt=%d dlen=%d qlen=%d : %s' % (
                        ln, r, txt.count(d), len(d), len(q), d))
    io.open(u'E:/math/_work/bodyside_short9.txt', 'wb').write(
        (u'\n'.join(out) or u'none').encode('utf-8'))
    print('decl_lines=%d quotes=%d absent=%d with_relative=%d notes_with=%d' % (
        agg['decl'], agg['quotes'], agg['absent'], agg['withrel'], nwith))
