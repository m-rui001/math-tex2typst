# -*- coding: utf-8 -*-
"""笔记定点字符串回改（一把尺、一条路）：`python _work/c_note_fix.py <C##|D###> --old <串> --new <串> [--dollars N] [--ticks N] [--apply]`

号首是 C 走 `被引笔记/`，是 D 走 `研究笔记/`，两族共用这一把尺，不留第二把同职尺。
语料文件不许 `io.open(p,'w')` 就地重写（那一刻正文已截成 0，写入失败即清零）；这里一律
temp + fsync + os.replace，落盘前后各断言一次字节/CR/`$`/反引号/行数。
"""
import glob
import io
import os
import sys

B = chr(92)
DIR = {u'C': u'被引笔记', u'D': u'研究笔记'}


def main():
    cid = sys.argv[1].upper()
    old = sys.argv[sys.argv.index('--old') + 1]
    new = sys.argv[sys.argv.index('--new') + 1]
    # 定界符族的两端都要当场申报：美元→反引号的翻转就是 -$2、+反引号 2。
    dollars = int(sys.argv[sys.argv.index('--dollars') + 1]) if '--dollars' in sys.argv else 0
    # 删掉整个代码跨度（例如正文里的内部工具路径）会带走偶数枚反引号，所以差值要当场申报。
    ticks = int(sys.argv[sys.argv.index('--ticks') + 1]) if '--ticks' in sys.argv else 0
    apply_ = '--apply' in sys.argv
    fs = glob.glob(u'%s/%s-*.md' % (DIR[cid[0]], cid))
    assert len(fs) == 1, fs
    p = fs[0]
    raw = io.open(p, 'rb').read()
    assert b'\r' not in raw, u'掺 CR，先用 crlf_fix 归位'
    text = raw.decode('utf-8')
    n = text.count(old)
    lines = len(text.split(u'\n'))
    print(u'%s 命中=%d 字节=%d 行=%d' % (os.path.basename(p)[:40], n, len(raw), lines))
    if n == 0:
        print(u'零命中：不动盘（先怀疑自己的串——bash 吃一层反斜杠）')
        return
    assert n <= 4, u'命中 %d 处超一枚定点修补的范围，先看形状再决定' % n
    # 新串可能把旧串包在里面（`main.tex:797-` → `main.tex:797-817`），直接 replace 后
    # count(old) 永远不为 0。所以先送进哨兵、再换形；哨兵本身不许出现在正文里。
    S = u'\x00'
    assert S not in text, u'正文含 NUL，哨兵不可用'
    sent = text.replace(old, S)
    assert sent.count(S) == n, u'哨兵数与命中数不符'
    fixed = sent.replace(S, new)
    assert fixed.count(new) >= n and S not in fixed
    dd = fixed.count(u'$') - text.count(u'$')
    assert dd == dollars, u'美元差 %+d，申报的是 %+d' % (dd, dollars)
    dt = fixed.count(u'`') - text.count(u'`')
    assert dt == ticks, u'反引号差 %+d，申报的是 %+d' % (dt, ticks)
    assert len(fixed.split(u'\n')) == lines, u'行数变了'
    nb = len(fixed.encode('utf-8'))
    if not apply_:
        print(u'DRY-RUN 字节 %d->%d' % (len(raw), nb))
        return
    tmp = p + u'.fix'
    with io.open(tmp, 'wb') as f:
        f.write(fixed.encode('utf-8'))
        f.flush()
        os.fsync(f.fileno())
    os.replace(tmp, p)
    chk = io.open(p, 'rb').read()
    assert len(chk) == nb and chk.count(b'\r') == 0, u'落盘复量不符'
    print(u'APPLIED bytes=%d 命中新形=%d' % (len(chk), chk.count(new.encode('utf-8'))))


main()
