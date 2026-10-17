# -*- coding: utf-8 -*-
# 只读探针：核对清单行与当前文件是否逐字一致，定位每行所属表格（表头/列数/期望竖线数），
# 并统计非代码跨度内 \| 的位置与配对情况。输出 E:\math\_work\pipe_probe_out.txt
import io, re, os, glob

CENSUS = u"E:/math/_work/pipe_rows_census.txt"
NOTE = u"E:/math/\u7814\u7a76\u7b14\u8bb0/"  # 研究笔记

def find_file(ID):
    hits = sorted(glob.glob(os.path.join(NOTE, ID + u"-*.md").encode('utf-8').decode('utf-8')))
    return hits[0] if hits else None

CODE = re.compile(u"`[^`]*`")
PAIR = re.compile(u"\\\\|")

rows = []
for raw in io.open(CENSUS, encoding=u"utf-8"):
    raw = raw.rstrip(u"\n").rstrip(u"\r")
    if raw.startswith(u"#") or raw.startswith(u"===="):
        continue
    if u" | line=" not in raw:
        continue
    # D25 | line=255 | vbars=12 | \PIPE=8 | dollar=even | <verbatim>
    parts = raw.split(u" | ")
    ID = parts[0]
    ln = int(parts[1].split(u"=")[1])
    vb = int(parts[2].split(u"=")[1].split(u" ")[0])
    pc = int(parts[3].split(u"=")[1].split(u" ")[0])
    dol = parts[4].split(u"=")[1].split(u" ")[0]
    line = u" | ".join(parts[5:])
    rows.append((ID, ln, vb, pc, dol, line))

out = []
def w(s):
    out.append(s)

cur = None
agg = {}
for ID, ln, vb, pc, dol, census_line in rows:
    if ID != cur:
        cur = ID
        p = find_file(ID)
        agg[ID] = (p, io.open(p, encoding=u"utf-8").read().split(u"\n"))
    p, lines = agg[ID]
    try:
        actual = lines[ln - 1]
    except IndexError:
        w(u"%s line=%d INDEXERROR" % (ID, ln)); continue
    match = (actual == census_line)
    npipe = actual.count(u"|")
    # 定位所属表格：向上找最近的以 | 开头的非本行块
    i = ln - 1
    start = i
    while i > 0 and lines[i - 1].startswith(u"|"):
        i -= 1
        start = i
    header = lines[start]
    sep = lines[start + 1] if start + 1 < len(lines) else u""
    hpipe = header.count(u"|")
    ncols = len(header[2:-1].split(u" | ")) if header.startswith(u"| ") and header.endswith(u"|") else -1
    # 非代码跨度内的 \| 出现次数（与清单核对）
    masked = CODE.sub(lambda m: u"\x00" * len(m.group(0)), actual)
    ncode_out = masked.count(u"\\|")
    ncode_in = actual.count(u"\\|") - ncode_out
    dollarn = actual.count(u"$")
    w(u"%s|%d|vbars=%d|pipe=%d|dollar=%s|MATCH=%s|npipe_now=%d|tbl_start=%d|hpipe=%d|ncols=%d|outside\\|=%d(census %d)|inside\\|=%d|$=%d" % (
        ID, ln, vb, pc, dol, "YES" if match else "NO", npipe, start + 1, hpipe, ncols, ncode_out, pc, ncode_in, dollarn))
    if not match:
        w(u"   CENSUS: " + census_line)
        w(u"   FILE  : " + actual)
    w(u"   HDR: " + header[:200])

w(u"TOTAL rows=%d files=%d" % (len(rows), len(agg)))
io.open(u"E:/math/_work/pipe_probe_out.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
print(u"\n".join(out).encode("utf-8", "replace").decode("utf-8", "replace"))
