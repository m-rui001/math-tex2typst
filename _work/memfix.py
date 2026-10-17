# -*- coding: utf-8 -*-
# Repair the three spans in the project memory file that bash command substitution ate
# when the append went through `python -c` with backticks in the string.
import io
import re

SEP = chr(92)
P = SEP.join([u'C:' + SEP, 'Users', 'hp', '.qoder-cn', 'projects', 'E--math', 'memory',
              'body-side-note-gate-fixes.md'])
BT = chr(96)
WS = chr(92) + u's*'
raw = io.open(P, 'rb').read()
t = raw.decode('utf-8')
HEAD = u'### 2026-10-15 \u4e0a\u6bb5\u4fee\u817f\u96f6\u843d\u76d8\u4e0e\u63a7\u5236\u4fa7\u6267\u884c'
FIXES = [
    (u'\u90a3\u6761\u817f\u53ea\u56e0' + WS + u'\u4e00\u6b21\u5e72\u6d3b\u91cc\u6362\u4e86\u4e09\u8f6e',
     u'\u90a3\u6761\u817f\u53ea\u56e0 ' + BT + u'.tools/inflight.txt' + BT +
     u' \u5728\u4e00\u6b21\u5e72\u6d3b\u91cc\u6362\u4e86\u4e09\u8f6e'),
    (u'\u52d8\u8bef\u884c\u91cc\u5f15\u7684' + WS + u'\uff0c\u6b63\u6587\u65e9\u5c31\u662f\u597d\u5f62',
     u'\u52d8\u8bef\u884c\u91cc\u5f15\u7684 ' + BT + u'08-n-locking.tex:331' + BT +
     u'\uff0c\u6b63\u6587\u65e9\u5c31\u662f\u597d\u5f62'),
    (u'\u6253\u6210\u300c\u5b57\u7b26\u300d\uff0c' + WS + u'\u5f53\u573a\u62a5\u9519',
     u'\u6253\u6210\u300c\u5b57\u7b26\u300d\uff0c' + BT +
     u'assert len(new_bytes)-b0==total_delta' + BT + u'\u5f53\u573a\u62a5\u9519'),
]
for pat, new in FIXES:
    assert len(re.findall(pat, t)) == 1, pat
    t = re.sub(pat, new, t, count=1)
    assert t.count(new) == 1, new
marker = u'- \u4fee\u817f\u7684\u505c\u8f66\u5224\u636e\u8981\u70b9\u540d'
assert t.count(marker) == 1
t = t.replace(marker, HEAD + u'\n' + marker, 1)
out = t.encode('utf-8')
assert out.count(chr(13).encode()) == 0
io.open(P, 'wb').write(out)
rows = [u'bytes %d -> %d' % (len(raw), len(out)),
        u'backtick-spans-restored %d' % len(FIXES),
        u'head_inserted %s' % HEAD.encode('utf-8')]
io.open(u'E:' + chr(92) + u'math' + chr(92) + u'_work' + chr(92) + u'memfix.txt', 'wb') \
    .write((u'\n'.join(rows) + u'\n').encode('utf-8'))
print(len(raw), len(out))
