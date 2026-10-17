# -*- coding: utf-8 -*-
# sweep 之后复核：行数、CR、markers、以及与"探针清空"期望稿的差异行。
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
out, bad = [], []
for nid in sorted(REPAIR, key=lambda x: (len(x), x)):
    path = glob.glob(DIR + u"/" + nid + u"-*.md")[0]
    snap = io.open(u"E:/math/_work/pre_edit/" + nid + u".md", encoding="utf-8").read()
    raw = io.open(path, "rb").read()
    cur = raw.decode("utf-8")
    sl, cl = snap.split(NL), cur.split(NL)
    exp = list(sl)
    for p in REPAIR[nid]:
        exp[p - 1] = u""
    el = NL.join(exp).split(NL)
    o = u"%s lines=%s->%s cr=%d markers=%d->%d bytes=%d->%d" % (
        nid, len(sl), len(cl), raw.count(bytes([13])),
        snap.count(OPEN_MARK), cur.count(OPEN_MARK),
        len(snap.encode("utf-8")), len(raw))
    diffs = [(j + 1, el[j], cl[j]) for j in range(min(len(el), len(cl))) if el[j] != cl[j]]
    o += u" vs_expected_diff_lines=%d" % len(diffs)
    out.append(o)
    if len(sl) != len(cl) or raw.count(bytes([13])) or cur.count(OPEN_MARK) != snap.count(OPEN_MARK) - len(REPAIR[nid]):
        bad.append(nid + u" hard invariant")
    for j, e, c in diffs:
        out.append(u"    L%d EXP %s" % (j, e[:90]))
        out.append(u"    L%d CUR %s" % (j, c[:90]))
out.append(u"HARD INVARIANT FAILURES: %s" % (bad if bad else u"none"))
io.open(u"E:/math/_work/postsweep_check.txt", "wb").write((NL.join(out) + NL).encode("utf-8"))
