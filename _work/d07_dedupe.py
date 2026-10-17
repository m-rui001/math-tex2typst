# -*- coding: utf-8 -*-
# Remove the 2,328-byte duplicated declaration block D07's writer handed over:
# lines 479 and 481 are verbatim copies of 473 and 475. Guarded by exact-equality,
# occurrence-count and byte/line/CR invariants; aborts and writes nothing otherwise.
import io, sys

P = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0/D07-量子Heisenberg铁磁体自发磁化.md'
raw = io.open(P, 'rb').read()
assert raw.count(b'\r') == 0, 'unexpected CR'
lines = raw.split(b'\n')
n = len(lines)
before_b = len(raw)

# 1-based -> 0-based
ORIG_A, ORIG_B = 473 - 1, 475 - 1
DUP_A, DUP_B = 479 - 1, 481 - 1
for i in (ORIG_A, ORIG_B, DUP_A, DUP_B):
    assert lines[i].strip(), 'expected non-empty paragraph at %d' % (i + 1)
assert lines[DUP_A] == lines[ORIG_A], 'line 479 is not a copy of 473'
assert lines[DUP_B] == lines[ORIG_B], 'line 481 is not a copy of 475'
assert lines[ORIG_A] != lines[ORIG_B], 'the two originals are identical, ambiguous block'
# blanks between the paragraphs
for i in (DUP_A - 1, DUP_A + 1, DUP_B + 1):
    assert lines[i] == b'', 'expected blank line at %d' % (i + 1)

cnt_a = sum(1 for l in lines if l == lines[ORIG_A])
cnt_b = sum(1 for l in lines if l == lines[ORIG_B])
assert (cnt_a, cnt_b) == (2, 2), 'occurrence counts %s, expected exactly two each' % ((cnt_a, cnt_b),)

drop = [DUP_A, DUP_A + 1, DUP_B, DUP_B + 1]
kept = [l for i, l in enumerate(lines) if i not in set(drop)]
new = b'\n'.join(kept)

removed = sum(len(lines[i]) + 1 for i in drop)
assert len(new) == before_b - removed, 'byte arithmetic mismatch'
assert len(kept) == n - 4, 'line arithmetic mismatch'
assert new.count(b'\r') == 0, 'CR introduced'
assert sum(1 for l in kept if l == lines[ORIG_A]) == 1, 'dedup left the wrong count'
assert sum(1 for l in kept if l == lines[ORIG_B]) == 1, 'dedup left the wrong count'

if '--apply' not in sys.argv:
    print('DRY ok bytes=%d->%d removed=%d lines=%d->%d' % (before_b, len(new), removed, n, len(kept)))
    sys.exit(0)
io.open(P, 'wb').write(new)
chk = io.open(P, 'rb').read()
print('APPLIED bytes=%d lines=%d cr=%d removed=%d' % (len(chk), len(chk.split(b'\n')), chk.count(b'\r'), removed))
