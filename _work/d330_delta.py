# -*- coding: utf-8 -*-
# 精确定位 D330 L237 的差异字符，并确认 sweep 改的是原稿自带的禁串（非我引入）。
import glob
import io

NL = chr(10)
FEI = u"\u800c\u975e"        # 而非
BC = u"\u800c\u4e0d\u662f"   # 而不是
NO = u"\uff0c\u5e76\u975e"    # ，并非

snap = io.open(u"E:/math/_work/pre_edit/D330.md", encoding="utf-8").read()
path = glob.glob(u"E:/math/\u7814\u7a76\u7b14\u8bb0/D330-*.md")[0]
cur = io.open(path, encoding="utf-8").read()

out = []
out.append(u"snap contains FEI(而非)=%d BC(而不是)=%d" % (snap.count(FEI), snap.count(BC)))
out.append(u"cur  contains FEI(而非)=%d BC(而不是)=%d NO(，并非)=%d" % (
    cur.count(FEI), cur.count(BC), cur.count(NO)))
# 我删掉的那一行里有没有禁串
probe = snap.split(NL)[60]
out.append(u"probe line L61 = %r  hasFEI=%s" % (probe[:60], FEI in probe))

sl, cl = snap.split(NL), cur.split(NL)
for j in range(len(sl)):
    if j >= len(cl):
        break
    a, b = sl[j], cl[j]
    if a != b and j != 60:      # 跳过被清空的探针行
        k = 0
        while k < min(len(a), len(b)) and a[k] == b[k]:
            k += 1
        out.append(u"DIFF L%d at char %d" % (j + 1, k))
        out.append(u"   OLD %r" % a[max(0, k - 30):k + 30])
        out.append(u"   NEW %r" % b[max(0, k - 30):k + 30])
io.open(u"E:/math/_work/d330_delta.txt", "wb").write((NL.join(out) + NL).encode("utf-8"))
