# -*- coding: utf-8 -*-
# Execute D535's author-declared untranslated-residue workorder. The writer listed the
# expected Chinese word per class (hops->跳数, Case->情形, disjoint->互不相交,
# incidences->入射数据); only those classes are touched. 'medial' and 'sup' were not
# declared, so they stay and get registered instead.
import io
import os

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
PAIRS = [
    (u'\u4e24 Case \u90fd\u53ea\u7528', u'\u4e24\u60c5\u5f62\u90fd\u53ea\u7528'),
    (u'\u652f\u6491 hops;', u'\u652f\u6491\u8df3\u6570;'),
    (u'\u56db\u4e2a hops \u5927\u81f4', u'\u56db\u4e2a\u8df3\u6570\u5927\u81f4'),
    (u'\u7528 disjoint \u7684\u7ec6\u8d70\u5eca', u'\u7528\u4e92\u4e0d\u76f8\u4ea4\u7684\u7ec6\u8d70\u5eca'),
    (u'\u518d\u7528 disjoint \u7684\u5c0f\u9876\u70b9\u90bb\u57df', u'\u518d\u7528\u4e92\u4e0d\u76f8\u4ea4\u7684\u5c0f\u9876\u70b9\u90bb\u57df'),
    (u'\u8fde\u901a\u7684 incidences \u5c0f\u90bb\u57df', u'\u8fde\u901a\u7684\u5165\u5c04\u6570\u636e\u5c0f\u90bb\u57df'),
]
APPLY = '--apply' in __import__('sys').argv
cand = [f for f in os.listdir(NOTES) if f.startswith('D535-')]
assert len(cand) == 1, cand
p = os.path.join(NOTES, cand[0])
raw = io.open(p, 'rb').read()
assert raw.count(chr(13).encode()) == 0
t = raw.decode('utf-8')
out = t
for old, new in PAIRS:
    assert out.count(old) == 1, (old, out.count(old))
    out = out.replace(old, new)
for old, _ in PAIRS:
    assert out.count(old) == 0
buf = out.encode('utf-8')
assert buf.count(chr(13).encode()) == 0
assert buf.count(chr(10).encode()) == raw.count(chr(10).encode())
for ch in (chr(96), chr(36)):
    assert out.count(ch) == t.count(ch), ch
print('mode', 'APPLY' if APPLY else 'DRY', 'bytes', len(raw), '->', len(buf), 'delta', len(buf) - len(raw))
if APPLY:
    io.open(p, 'wb').write(buf)
    print('written')
