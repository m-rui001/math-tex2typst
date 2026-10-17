# -*- coding: utf-8 -*-
# 只读探针 3：把每条缺陷行按反引号代码跨度掩掉后切成 $…$ 跨度，
# 打印每个跨度内的 \| 位置与上下文，供逐处判定 lVert/lvert/mid/upharpoonright。
import io, re, os, sys, glob

NOTE = u"E:/math/\u7814\u7a76\u7b14\u8bb0/"
CODE = re.compile(u"`[^`]*`")
DOLLAR = re.compile(u"\\$[^$]*\\$")

rows = []
for raw in io.open(u"E:/math/_work/pipe_rows_census.txt", encoding=u"utf-8"):
    raw = raw.rstrip(u"\n").rstrip(u"\r")
    if u" | line=" not in raw:
        continue
    parts = raw.split(u" | ")
    rows.append((parts[0], int(parts[1].split(u"=")[1])))

out = []
def w(s):
    out.append(s)

cache = {}
for ID, ln in rows:
    if ID not in cache:
        p = sorted(glob.glob(NOTE + ID + u"-*.md"))[0]
        cache[ID] = (p, io.open(p, encoding=u"utf-8").read().split(u"\n"))
    p, lines = cache[ID]
    L = lines[ln - 1]
    # 记录代码跨度（原样保留）
    spans = [(m.start(), m.end(), m.group(0)) for m in CODE.finditer(L)]
    def in_code(i):
        return any(a <= i < b for a, b, _ in spans)
    w(u"@@@@ %s L%d len=%d pipes=%d dollars=%d codes=%d" % (
        ID, ln, len(L), L.count(u"|"), L.count(u"$"), len(spans)))
    w(L)
    # 掩码版：代码跨度替换为同长度占位（\x01）
    masked = L
    for a, b, s in reversed(spans):
        masked = masked[:a] + (u"\x01" * (b - a)) + masked[b:]
    # 切分：$…$ 与非数学片段
    pieces = []
    pos = 0
    for m in DOLLAR.finditer(masked):
        if m.start() > pos:
            pieces.append((pos, u"TEXT", masked[pos:m.start()]))
        pieces.append((m.start(), u"DOLLAR", m.group(0)))
        pos = m.end()
    if pos < len(masked):
        pieces.append((pos, u"TEXT", masked[pos:]))
    for off, kind, segtxt in pieces:
        if u"\\|" not in segtxt and u"\x01" not in segtxt:
            continue
        cnt = segtxt.count(u"\\|")
        w(u"  [%s] off=%d npipes=%d \\|x%d" % (kind, off, segtxt.count(u"|"), cnt))
        if u"\x01" in segtxt:
            for m in re.finditer(u"\x01+", segtxt):
                w(u"     CODESPAN@%d len=%d :: %s" % (off + m.start(), m.end() - m.start(),
                  L[off + m.start():off + m.end()][:120]))
        for m in re.finditer(u"\\\\\\|", segtxt):
            a = off + m.start()
            w(u"     \\|@%d ctx=<%s>" % (a, L[max(0, a - 30):a + 32]))
io.open(u"E:/math/_work/pipe_probe3_out.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
sys.stdout.buffer.write(("written %d lines\n" % len(out)).encode(u"utf-8"))
