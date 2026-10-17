# -*- coding: utf-8 -*-
# 编辑工具把整行探针连同换行一起删掉了；本脚本算出需要补回的空白行，
# 并为每个插入点挑一个"唯一短后缀"锚点，供 Edit 工具把空行插回去。
import glob
import io
import json

OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)
NL = chr(10)
DIR = u"E:/math/\u7814\u7a76\u7b14\u8bb0"

REPAIR = {
    u"D177": [417], u"D195": [83], u"D198": [336], u"D202": [81], u"D205": [85],
    u"D214": [80, 133, 248, 285, 299], u"D224": [21], u"D227": [69], u"D234": [256],
    u"D242": [327], u"D256": [189], u"D264": [205, 207], u"D266": [81],
    u"D274": [333, 334], u"D295": [55], u"D298": [67], u"D314": [151], u"D330": [61],
    u"D339": [56], u"D382": [40], u"D389": [49], u"D431": [226], u"D436": [362],
    u"D437": [362], u"D457": [59],
}

plan = []
problems = []
for nid in sorted(REPAIR, key=lambda x: (len(x), x)):
    path = glob.glob(DIR + u"/" + nid + u"-*.md")[0]
    snap = io.open(u"E:/math/_work/pre_edit/" + nid + u".md", encoding="utf-8").read()
    cur = io.open(path, encoding="utf-8").read()
    sl = snap.split(NL)
    need = {}                      # anchor line index (0-based) -> how many blank lines to add
    markers = set(REPAIR[nid])
    for p in sorted(REPAIR[nid]):
        a = p - 2                   # 0-based index of the line just above the marker
        # 空行与"已被删掉的探针行"都不能当锚点，继续往上找
        while a >= 0 and (sl[a].strip() == u"" or (a + 1) in markers):
            a -= 1
        if a < 0:
            problems.append(u"%s L%d has no non-empty anchor above" % (nid, p))
            continue
        need[a] = need.get(a, 0) + 1
    for a in sorted(need):
        k = need[a]
        anchor = sl[a]
        chosen = None
        for w in (6, 10, 14, 20, 28, 40, len(anchor)):
            if w > len(anchor):
                continue
            suf = anchor[len(anchor) - w:]
            if chr(13) in suf:
                continue
            if cur.count(suf) == 1 and (suf + NL) in cur:
                chosen = suf
                break
        if chosen is None:
            problems.append(u"%s anchor L%d no unique suffix (k=%d)" % (nid, a + 1, k))
            continue
        plan.append({u"nid": nid, u"path": path, u"anchor_line": a + 1, u"k": k,
                     u"old": chosen, u"new": chosen + NL * k})
    deficit = len(sl) - len(cur.split(NL))
    gained = sum(need.values())
    if deficit != gained:
        problems.append(u"%s deficit=%d planned=%d" % (nid, deficit, gained))
    plan.append({u"nid": nid, u"report": u"deficit=%d planned=%d" % (deficit, gained)})

io.open(u"E:/math/_work/restore_plan.txt", "wb").write(
    (NL.join(json.dumps(x, ensure_ascii=False) for x in plan) + NL).encode("utf-8"))
io.open(u"E:/math/_work/restore_problems.txt", "wb").write(
    ((NL.join(problems) + NL) if problems else u"no problems" + NL).encode("utf-8"))
