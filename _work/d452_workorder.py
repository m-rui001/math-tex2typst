# -*- coding: utf-8 -*-
from __future__ import print_function
import io, glob, sys

APPLY = '--apply' in sys.argv
path = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D452-*.md')[0]
raw = io.open(path, 'rb').read()
text = raw.decode('utf-8')
assert raw.count(b'\r') == 0
lines = text.split('\n')
BT = chr(96)
D = chr(36)
report = []

def L(n):
    return lines[n - 1]

# --- 其一 + 其二: install the author's verbatim replacement paragraph for line 74
decl = L(215)
ANCH = u'\u671f\u671b\u56de\u586b\u7684\u8be5\u6bb5\u5b8c\u6574\u6587\u672c\u4e3a\uff1a\u201c'
TAIL = u'\u201d\u8be5\u884c\u540c\u65f6\u6d88\u6389'
k = decl.index(ANCH) + len(ANCH)
j = decl.index(TAIL, k)
para = decl[k:j]
assert para.startswith(u'\u6211\u5408\u4e0a\u8fd9\u4e00\u8282\u65f6')
assert u'\u00a74' in para and u'\u00a73.5' not in para
assert L(74).startswith(u'\u6211\u5408\u4e0a\u8fd9\u4e00\u8282\u65f6')
assert u'\u00a73.5' in L(74)
old74 = L(74)
lines[73] = para
report.append('L74 replaced: old_len=%d new_len=%d' % (len(old74), len(para)))

# --- 其三 + 其六: phrase-level replacements, each pinned to its declared line
PAIRS = [
    (111, u'\u4e0d\u53d8\u538b\u7f29\u6591', u'\u4e0d\u53d8\u538b\u7f29\u5b50'),
    (43, u'\u76f8\u4f4d realize \u6210\u52a8\u529b\u5b66', u'\u76f8\u4f4d\u5b9e\u73b0\u4e3a\u52a8\u529b\u5b66'),
    (71, u'\u4fee\u526a\u8005 domination\uff0c', u'\u4fee\u526a\u8005\u63a7\u5236\uff0c'),
    (37, u'\u4e0e union bound \u7ed9\u51fa', u'\u4e0e\u8054\u5408\u754c\u4f30\u8ba1\u7ed9\u51fa'),
    (93, u'\u574f\u4e8b\u4ef6\u505a union bound\u201d', u'\u574f\u4e8b\u4ef6\u505a\u8054\u5408\u754c\u4f30\u8ba1\u201d'),
    (138, u'\uff1btrace \u9760\u8c31\u622a\u65ad', u'\uff1b\u8ff9\u9760\u8c31\u622a\u65ad'),
    (138, u'\u201d\u7684trace \u6bd4\u8f83', u'\u201d\u7684\u8ff9\u6bd4\u8f83'),
    (205, u'$  telescoping \u65ad', u'$ \u671b\u8fdc\u6c42\u548c\u65ad'),
    (207, u'\u5168 finite $I$ \u540c\u65f6\u6210\u7acb\u65ad', u'\u5168\u6709\u9650 $I$ \u540c\u65f6\u6210\u7acb\u65ad'),
    (223, u'\u4e24copy\u5206\u522b\u4f4d\u4e8e', u'\u4e24\u4efd\u5206\u522b\u4f4d\u4e8e'),
]
for n, old, new in PAIRS:
    l = L(n)
    assert l.count(old) == 1, (n, old, l.count(old))
    lines[n - 1] = l.replace(old, new)
    report.append('L%d fixed 1 site' % n)

# --- 其五: drop the re-typed copy of the §6 block (keep 133-141, delete 142-150)
head = u'\u6743\u91cd\u843d\u5730\uff1a'
orig = text.split('\n')
b1 = orig[132:141]
b2 = orig[141:150]
assert len(b1) == 9 and len(b2) == 9
assert b1[0].startswith(head) and b2[0].startswith(head)
assert b1[-1] == '' and b2[-1] == ''
diffs = [i for i in range(9) if b1[i] != b2[i]]
assert diffs == [7], diffs
NONTRIV = u'\u6ca1\u6709\u975e\u5e73\u51e1\u8d85\u4e0d\u53d8\u5b50\u7a7a\u95f4'
TRIV = u'\u6ca1\u6709\u5e73\u51e1\u8d85\u4e0d\u53d8\u5b50\u7a7a\u95f4'
assert b2[7].count(NONTRIV) == 1
block_D = sum(l.count(D) for l in b2)
block_BT = sum(l.count(BT) for l in b2)
assert block_D % 2 == 0 and block_BT % 2 == 0, (block_D, block_BT)
# the surviving copy lost one negation; the cited source says "no nontrivial
# hyperinvariant subspace", which the deleted copy spells correctly
assert lines[139].count(TRIV) == 1
lines[139] = lines[139].replace(TRIV, NONTRIV)
del lines[141:150]
report.append('block 142-150 deleted, D=%d BT=%d removed' % (block_D, block_BT))

# --- body-side provenance line, inserted right after the 其六 declaration
QI6 = u'\u5176\u516d\uff0c\u672a\u8bd1\u6b8b\u7559\u7c7b'
idx = [i for i, l in enumerate(lines) if l.startswith(QI6)]
assert len(idx) == 1, idx
BUJI = (u'\u672c\u4f53\u4fa7\u5de5\u5355\u6267\u884c\u8865\u8bb0\u3002'
        u'\u00a79 \u7533\u62a5\u7684\u516d\u7c7b\u7f3a\u9677\u5df2\u7531\u672c\u4f53\u4fa7\u6309\u7533\u62a5\u9010\u7b14\u843d\u76d8\uff1a'
        u'\u5176\u4e00\u4e0e\u5176\u4e8c\u4e00\u5e76\uff0c\u7b2c 74 \u884c\u6574\u6bb5\u6362\u6210\u7533\u62a5\u7ed9\u51fa\u7684\u671f\u671b\u6587\u672c\uff0c'
        u'\u5176\u4e2d\u7684 \u00a73.5 \u968f\u4e4b\u6539\u4e3a \u00a74'
        u'\uff1b\u5176\u4e09\u7b2c 111 \u884c\u7684\u4e0d\u53d8\u538b\u7f29\u6591\u6539\u4e3a\u4e0d\u53d8\u538b\u7f29\u5b50'
        u'\uff1b\u5176\u4e94\u5220\u9664\u7b2c 142 \u81f3 150 \u884c\u7684\u91cd\u6253\u526f\u672c\u3001\u4fdd\u7559\u7b2c 133 \u81f3 141 \u884c\uff0c'
        u'\u00a76 \u7684\u590d\u76d8\u6bb5\u4e0e \u00a77 \u6807\u9898\u76f8\u63a5'
        u'\uff1b\u5176\u516d\u7684\u4e03\u5904\u82f1\u6587\u7247\u6bb5\u8fde\u540c\u91cd\u590d\u5757\u5185\u7684\u4e24\u5904 trace \u4e00\u5e76\u6539\u6389'
        u'\uff1b\u5176\u56db\u7684 17,447 \u5b57\u8282\u9996\u5757\u65e0\u6cd5\u5728\u76d8\u4e0a\u56de\u586b\uff0c\u767b\u8bb0\u4e3a\u4e0d\u53ef\u56de\u6536\u3002'
        u'\u5220\u91cd\u65f6\u4e24\u4efd\u4ec5\u5dee\u4e00\u5904\uff1a\u4fdd\u7559\u4efd\u7b2c 140 \u884c\u4f5c\u201c\u6ca1\u6709\u5e73\u51e1\u8d85\u4e0d\u53d8\u5b50\u7a7a\u95f4\u201d\uff0c'
        u'\u5220\u9664\u4efd\u4f5c\u201c\u6ca1\u6709\u975e\u5e73\u51e1\u8d85\u4e0d\u53d8\u5b50\u7a7a\u95f4\u201d\uff0c'
        u'\u6309\u7d20\u6750 `00-introduction.tex:120-126` \u7684\u539f\u53e5 nontrivial hyperinvariant subspace \u5224\u5b9a\u4fdd\u7559\u4efd\u6f0f\u4e86\u4e00\u679a\u201c\u975e\u201d\u5b57\uff0c\u5df2\u8865\u3002'
        u'\u5220\u9664 9 \u884c\u540e\u672c\u8282\u4ee5\u4e0a\u7684\u884c\u53f7\u5747\u524d\u79fb 9\uff0c'
        u'\u672c\u8282\u4e0b\u65b9\u7684\u5750\u6807\u4ee5\u6700\u540e\u5b9e\u6d4b\u4e3a\u51c6\u3002')
assert BUJI.count(BT) == 2 and BUJI.count(D) == 0
assert u'\u800c\u662f' not in BUJI and u'\u2014' not in BUJI
lines[idx[0] + 1:idx[0] + 1] = [u'', BUJI]
report.append('body-side note inserted after line %d' % (idx[0] + 1))

out = u'\n'.join(lines)
assert out.count(D) % 2 == 0 and out.count(BT) % 2 == 0
assert len(lines) == len(orig) - 9 + 2
assert u'\u00a73.5' not in lines[73]
assert out.count(u'union bound') == 1 and out.count(u'telescoping') == 1
assert out.count(u'domination') == 1 and out.count(u'\u4e24copy') == 1
assert out.count(u'\u4e0d\u53d8\u538b\u7f29\u6591') == 2
assert out.count(NONTRIV) == 2
assert out.count(TRIV) == 1

data = out.encode('utf-8')
report.append('bytes %d -> %d, lines %d' % (len(raw), len(data), len(lines)))
if APPLY:
    f = io.open(path, 'wb')
    f.write(data)
    f.close()
    chk = io.open(path, 'rb').read()
    assert chk == data and chk.count(b'\r') == 0
    report.append('APPLIED')
else:
    report.append('DRY-RUN, nothing written')

io.open('_work/d452_workorder.txt', 'wb').write(u'\n'.join(report).encode('utf-8'))
print('\n'.join(report[-3:]))
