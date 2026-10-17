# -*- coding: utf-8 -*-
# 定位 current 与 expected 的第一个差异点，打印两侧上下文。
import glob
import io

NL = chr(10)
OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)
DIR = u"E:/math/\u7814\u7a76\u7b14\u8bb0"
REPAIR = {
    u"D177": [417], u"D195": [83], u"D198": [336], u"D202": [81], u"D205": [85],
    u"D214": [80, 133, 248, 285, 299], u"D224": [21], u"D227": [69], u"D234": [256],
    u"D242": [327], u"D256": [189], u"D264": [205, 207], u"D266": [81],
    u"D274": [333, 334], u"D295": [55], u"D298": [67], u"D314": [151], u"D330": [61],
    u"D339": [56], u"D382": [40], u"D389": [49], u"D431": [226], u"D436": [362],
    u"D437": [362], u"D457": [59],
}
out = []
for nid in sorted(REPAIR, key=lambda x: (len(x), x)):
    path = glob.glob(DIR + u"/" + nid + u"-*.md")[0]
    snap = io.open(u"E:/math/_work/pre_edit/" + nid + u".md", encoding="utf-8").read()
    cur = io.open(path, encoding="utf-8").read()
    exp = snap.split(NL)
    for p in REPAIR[nid]:
        exp[p - 1] = u""
    exp = NL.join(exp)
    if exp == cur:
        out.append(u"%s IDENTICAL" % nid)
        continue
    i = 0
    n = min(len(exp), len(cur))
    while i < n and exp[i] == cur[i]:
        i += 1
    el = exp.split(NL)
    cl = cur.split(NL)
    dline = None
    for j in range(min(len(el), len(cl))):
        if el[j] != cl[j]:
            dline = j + 1
            break
    out.append(u"%s first_diff_char=%d first_diff_line=%s len_exp=%d len_cur=%d" % (
        nid, i, dline, len(exp), len(cur)))
    if dline:
        for j in range(max(1, dline - 2), min(len(el), len(cl)) + 1, 1):
            if el[j - 1] != cl[j - 1]:
                out.append(u"   L%d EXP %r" % (j, el[j - 1][:80]))
                out.append(u"   L%d CUR %r" % (j, cl[j - 1][:80]))
io.open(u"E:/math/_work/diff_probe.txt", "wb").write((NL.join(out) + NL).encode("utf-8"))
