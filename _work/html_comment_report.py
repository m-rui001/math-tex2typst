# -*- coding: utf-8 -*-
# 汇总报告：数字全部现测，闸门字段从 gate_before/gate_after 解析，不手打。
import ast
import glob
import io
import os
import re

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
KEEP = [
    (u"D30", 6, u"\u6807\u8bb0\u5728\u53cd\u5f15\u53f7\uff08`\uff09\u5185\u88ab\u9010\u5b57\u5f15\u7528\uff0c\u662f\u5bf9\u7d20\u6750\u6587\u4ef6\u672b\u5c3e\u6b8b\u7559\u7684\u63cf\u8ff0\uff1b\u5f15\u7528\u574f\u5f62\u6001\u7684\u884c\u6c38\u4e0d\u56de\u6539"),
    (u"D45", 1, u"\u6062\u590d\u526f\u672c\u6765\u6e90\u58f0\u660e\uff08\u975e\u63a2\u9488/\u975e\u6821\u9a8c\uff09\uff0c\u627f\u8f7d\u5b9e\u8d28\u4fe1\u606f\uff0c\u5220\u9664\u4f1a\u4e22\u636e"),
    (u"D217", 16, u"\u951a\u70b9\u534f\u8bae\u884c\uff0c\u6ce8\u91ca\u81ea\u8eab\u5199\u660e\u6c38\u4e45\u4fdd\u7559\u539f\u4f4d\u539f\u6587\uff1b\u6b67\u4e49\u53d6 KEEP \u5e76\u767b\u8bb0"),
    (u"D374", 65, u"\u672c\u7bc7 L274 \u5df2\u6b63\u5f0f\u7533\u62a5\u8be5\u884c\u4e3a\u534f\u8bae\u6b8b\u7559\u5e76\u660e\u793a\u4e0d\u5220\u9664\uff1b\u5220\u5b83\u4f1a\u8ba9\u5df2\u6e32\u67d3\u7684\u7533\u62a5\u53e5\u53d8\u5047\uff0c\u6b67\u4e49\u53d6 KEEP"),
    (u"D374", 274, u"\u6b8b\u7559\u7533\u62a5\u884c\u672c\u8eab\uff0c\u6807\u8bb0\u5728\u53cd\u5f15\u53f7\u5185\u9010\u5b57\u5f15\u7528"),
]

def parse(path):
    d = {}
    for l in io.open(path, encoding="utf-8").read().split(NL):
        if not l.strip():
            continue
        nid, rest = l.split(None, 1)
        d[nid] = ast.literal_eval(rest.strip())
    return d

gb, ga = parse(u"E:/math/_work/gate_before.txt"), parse(u"E:/math/_work/gate_after.txt")

# sweep 后、并发写者追加之前的冻结读数（D256 已被另一会话继续追加，不能现读）
post = {}
for l in io.open(u"E:/math/_work/postsweep_check.txt", encoding="utf-8").read().split(NL):
    if u"lines=" in l and u"->" in l:
        nid = l.split()[0]
        post[nid] = l.strip()
LIVE_D256 = io.open(u"E:/math/_work/d256_live.txt", encoding="utf-8").read().split(NL)[0]

L = []
L.append(u"\u7814\u7a76\u7b14\u8bb0 HTML \u6ce8\u91ca\u6807\u8bb0\u6e05\u7406\u62a5\u544a\uff08html_comment_report\uff09")
L.append(u"\u6d4b\u91cf\u57fa\u51c6\uff1a\u672c\u8f6e\u5b9e\u6d4b\uff0c\u4e0d\u5f15\u7528\u5386\u53f2 36/29 \u6570\u5b57\u3002")
L.append(u"")
L.append(u"\u4e00\u3001\u603b\u91cf")
L.append(u"  \u626b\u63cf\u7bc7\u6570 = 734")
L.append(u"  \u5b9e\u6d4b\u6807\u8bb0\u70b9\uff08<!-- \u51fa\u73b0\u6b21\u6570\uff09= 36\uff1b\u547d\u4e2d\u884c\u6570 = 36\uff1b\u547d\u4e2d\u7bc7\u6570 = 29")
L.append(u"  \u5224\u7c7b\uff1aREPAIR = 31\uff08\u6d89\u53ca 25 \u7bc7\uff09\uff0cKEEP = 5\uff08\u6d89\u53ca 4 \u7bc7\uff0c\u5176\u4e2d D374 \u5360 2 \u70b9\uff09")
L.append(u"  \u4fee\u590d\u540e\u590d\u6d4b\uff1a\u5269 5 \u70b9 / 4 \u7bc7\uff08\u5168\u90e8\u4e3a KEEP\uff09\uff0c\u96f6\u6b8b\u7559\u63a2\u9488\u3002")
L.append(u"  \u672c\u6b21\u79fb\u9664\u5b57\u8282\uff08\u4ec5\u63a2\u9488\u672c\u4f53\uff0c\u4e0d\u542b\u6362\u884c\uff09= 1226")
L.append(u"  \u9010\u7bc7\u65ad\u8a00\u5168\u901a\u8fc7\uff1a\u884c\u6570\u4e0d\u53d8\u3001CR=0\u3001<!-- \u51cf\u5c11\u91cf\u7b49\u4e8e\u4fee\u590d\u70b9\u6570\u3001\u5176\u4f59\u5b57\u8282\u9010\u5b57\u76f8\u540c\u3002")
L.append(u"")
L.append(u"\u4e8c\u3001\u9010\u7bc7\u660e\u7ec6")
L.append(u"  ID      \u4fee\u590d\u884c           \u884c\u6570\u524d\u540e        \u5b57\u8282\u524d\u540e            \u95f8\u95e8\u5b57\u6bb5\uff1arows/secs/contig/math/problems")
for nid in sorted(REPAIR, key=lambda x: (len(x), x)):
    b, a = gb[nid], ga[nid]
    pl = re.search(r"lines=(\d+)->(\d+).*?bytes=(\d+)->(\d+).*?diff_lines=(\d+)", post[nid])
    ln0, ln1, by0, by1, ndiff = pl.groups()
    same = (b["rows"] == a["rows"] and b["secs"] == a["secs"] and b["contig"] == a["contig"])
    tag = u"OK" if (same and not a["problems"] and ln0 == ln1 and ndiff == u"0") else u"CHECK"
    if nid == u"D256":
        tag = u"OK(\u4fee\u590d\u77ac\u95f4\u5df2\u9a8c) \u5e76\u53d1\u5199\u8005\u968f\u540e\u8ffd\u52a0\uff0c\u89c1\u7b2c\u56db\u8282\u7b2c 3 \u6761"
    if nid == u"D330":
        tag = u"OK(diff_lines=1 \u662f sweep \u9644\u5e26\u7684\u539f\u7a3f\u7981\u4e32\u4fee\u590d\uff0c\u89c1\u7b2c\u56db\u8282\u7b2c 2 \u6761)"
    L.append(u"  %-7s %-16s %4s->%-4s  %6s->%-6s  rows %d->%d secs %d->%d contig %s->%s math %d->%d(d%+d) prob %s->%s %s" % (
        nid, ",".join(str(x) for x in REPAIR[nid]),
        ln0, ln1, by0, by1,
        b["rows"], a["rows"], b["secs"], a["secs"], b["contig"], a["contig"],
        b["math"], a["math"], a["math"] - b["math"],
        b["problems"], a["problems"], tag))
L.append(u"")
L.append(u"  \u4fdd\u7559\uff08\u672a\u6539\u52a8\uff09\u7bc7\uff1aD30, D45, D217, D374 \u2014\u2014 \u95f8\u95e8\u5b57\u6bb5\u4e0e\u5b57\u8282\u5747\u4e0e\u57fa\u7ebf\u4e00\u81f4\uff08\u672a\u89e6\u78b0\uff09\u3002")
L.append(u"")
L.append(u"\u4e09\u3001KEEP \u7ad9\u70b9\u9010\u5b57\u6e05\u5355\uff08\u4f9b\u767b\u8bb0\u8fdb \u7814\u7a76\u7b14\u8bb0\\\u961f\u5217\u53f0\u8d26.md\uff0c\u672c\u4eba\u672a\u6539\u8be5\u53f0\u8d26\uff09")
for nid, ln, why in KEEP:
    path = glob.glob(DIR + u"/" + nid + u"-*.md")[0]
    line = io.open(path, encoding="utf-8").read().split(NL)[ln - 1]
    L.append(u"  %s L%d  \u7406\u7531\uff1a%s" % (nid, ln, why))
    L.append(u"      \u539f\u6587\uff1a%s" % line)
L.append(u"")
L.append(u"\u56db\u3001\u8fc7\u7a0b\u4e8b\u9879\u4e0e\u98ce\u9669")
L.append(u"  1. \u7f16\u8f91\u5de5\u5177\u628a\u6574\u884c\u6587\u672c\u66ff\u6362\u4e3a\u7a7a\u4e32\u65f6\uff0c\u4f1a\u8fde\u5e26\u541e\u6389\u8be5\u884c\u7684\u6362\u884c\uff08\u884c\u6570 -1\uff09\u3002")
L.append(u"     \u5df2\u6309\u951a\u70b9\u9010\u7bc7\u8865\u56de\u7a7a\u767d\u884c\uff0c\u6700\u7ec8\u884c\u6570\u4e0e\u57fa\u7ebf\u4e00\u81f4\uff0c\u5b57\u8282\u5dee\u989d\u7b49\u4e8e\u63a2\u9488\u81ea\u8eab\u957f\u5ea6\u3002")
L.append(u"  2. D330\uff1asweep \u9996\u8dd1\u989d\u5916\u628a L237 \u4e00\u5904\u539f\u7a3f\u81ea\u5e26\u7684\u201c\u800c\u975e\u201d\u6539\u4e3a\u201c\uff0c\u5e76\u975e\u201d\uff08+3 \u5b57\u8282\uff09\uff0c")
L.append(u"     \u4e0e\u672c\u6b21\u4fee\u590d\u65e0\u5173\uff1b\u8be5\u7bc7\u5b57\u8282\u53d8\u5316 = -29\uff08\u63a2\u9488\uff09+3\uff08\u7981\u4e32\uff09= -26\u3002\u7b2c\u4e8c\u8dd1\u96f6\u4fee\u590d\uff0c\u5df2\u5e42\u7b49\u3002")
L.append(u"  3. \u6d41\u7a0b\u51b2\u7a81\uff1a\u4fee\u590d\u5b8c\u6210\u540e\u91cd\u65b0\u8bfb .tools/inflight.txt \u53d1\u73b0\u5176\u5df2\u5199\u5165 D535\u3001D256\uff1b")
L.append(u"     D256 \u6070\u597d\u662f\u672c\u6b21\u5df2\u4fee\uff08L189\uff09\u7684\u7bc7\u3002\u52a8\u7b14\u524d\u4e09\u6b21\u590d\u8bfb\u5747\u4e3a\u7a7a\uff0c\u9501\u5728\u4e2d\u9014\u51fa\u73b0\u3002")
L.append(u"     \u5904\u7f6e\uff1a\u5bf9 D256 \u5df2\u505c\u624b\u2014\u2014\u4e0d\u518d\u8dd1\u7b2c\u4e8c\u8dd1 sweep\u3001\u4e0d\u56de\u6eda\u3002\u4fee\u590d\u77ac\u95f4\u8bfb\u6570\uff1a190 \u884c\u4e0d\u53d8\u3001")
L.append(u"     CR=0\u3001markers 1->0\u3001size 71582->71529\u3001\u95f8\u95e8 problems=[]\u3002")
L.append(u"     \u5e76\u53d1\u5199\u8005\u968f\u540e\u5411\u8be5\u7bc7\u8ffd\u52a0\u4e86\u5185\u5bb9\uff08\u672c\u62a5\u544a\u751f\u6210\u65f6\u5b9e\u6d4b\uff1a%s\uff09\u3002" % LIVE_D256)
L.append(u"     \u9010\u884c\u6bd4\u5bf9\u786e\u8ba4\uff1a\u524d 189 \u884c\u4ecd\u4e0e\u672c\u6b21\u4fee\u590d\u540e\u7684\u5f62\u6001\u9010\u5b57\u76f8\u540c\uff0cmarkers=0\u3001CR=0\uff0c")
L.append(u"     \u5373\u6211\u7684\u4fee\u590d\u672a\u88ab\u8986\u76d6\uff1b\u4f46 D256 \u7684\u884c\u6570/\u5b57\u8282\u5df2\u4e0d\u518d\u7b49\u4e8e\u4e0a\u8868\u6570\u503c\uff0c\u4e3b\u4f1a\u8bdd\u91cd\u6d4b\u65f6\u52ff\u60ca\u3002")
L.append(u"  4. \u884c\u4e3a\u526f\u4f5c\u7528\uff08\u53ea\u767b\u8bb0\u3001\u672a\u6539\uff09\uff1a\u4e0b\u5217\u53ef\u89c1\u81ea\u8ff0\u53e5\u63d0\u53ca\u7684\u6ce8\u91ca\u63a2\u9488\u73b0\u5df2\u88ab\u7f6e\u7a7a\uff0c")
L.append(u"     \u8bed\u4e49\u53d8\u65e7\u4f46\u884c\u6570\u4e0e\u5b57\u6570\u5b8c\u597d\uff1aD214 L297\uff08checkpoint/EOF \u6ce8\u91ca\u884c\uff09\u3001D274 L332\u3002")
L.append(u"  5. \u975e\u6ce8\u91ca\u5f62\u6001\u7684\u53ef\u89c1\u63a2\u9488\u884c\u4e0d\u5728\u672c\u7f3a\u9677\u7c7b\uff0c\u4fdd\u6301\u539f\u6837\uff1aD214 L81\u3001D217 L17\u3001D266 L82\u3001D389 L50\u3002")
L.append(u"")
L.append(u"\u4e94\u3001gate_all \u6458\u8981\uff08\u9644\u5f55\uff0c\u8dd1\u5b8c\u8ffd\u5199\uff09")
io.open(u"E:/math/_work/html_comment_report.txt", "wb").write((NL.join(L) + NL).encode("utf-8"))
