r"""Replace community.md section 4 with a round index plus the live next-step list.

Section 4 grew as a running log: every round appended "#NN — 已完成：见轴 M" with the same numbers §2
and §7 already carry, so the section had 46 entries of which 40 were receipts.  The receipts become a
one-line-per-round index (no numbers here -- §2 owns them); the open items stay, pointed at §7.
The old text moves verbatim to `_work/community_log.md`.
"""
import os
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
DOC = os.path.join(HERE, "community.md")

NEW = r"""## 4. 轮次索引与下一步

**一轮一行，数字在 §2 的轴里，别在这里重记。**

| 轮次 | 轴 | 修的是什么 |
|---|---|---|
| #21–#24 | 轴 1、6、12 | 图内命令名泄露（符号表）、`longtable` 续页表头去重、`[??]` 封零（数学内 cite 记号往返 ＋ float region 的 label alias） |
| #25–#29 | 轴 2、4、5、8、9、11 | 节点字号、路径端点裁到边框、相对定位的 calc 参考、自定义浮动体提升、minipage 浮动体＋`\fbox` 正文回收、长表格可断页 |
| #30–#32 | 轴 10、11 | tikzcd 的 `gathered` 多行与上下翻倒、图内 `\tfrac`、minipage 子图的 `\linewidth` 份额 |
| #35 | 轴 13 | 节点自身行高律（`H = 2·inner_sep + line + (rows−1)·leading`） |
| #36–#45 | 轴 14–23 | 箭尖、带距离的方向键、图内重音、`text width` 框宽、`label=` 落点、圆的四条几何律、range 框居中、图级 `>=`、lift-out 标记粘连、数学分组下标的括号 |
| #46–#53 | 轴 24–29、38 | `inner sep` 分轴、图内公式的否定表、裸 `\path` 描边口径、路径内样式继承＋`stroke: none`、裸颜色当描边、`to[bend left]`、路径 stroke 模式、无框节点的 `text width` |
| #54–#59 | 轴 30–35 | 声明表向前累积、节点标签里的 `\[ \]`、accsupp 十六进制、编号位置、首行缩进按文档类、标题字号随 body 缩放 |
| #60、#61 | 轴 37、39、41 | `rounded corners`：矩形路径与带尺寸节点两条路（后者整批改由 Typst `#box` 量字） |
| #62、#63 | 轴 42、43→49 | 带框节点自己写的 `anchor=`、`anchor:` 下边那 2.1–3.0 bp 的一截 |
| #64–#68 | 轴 44–48 | 表这一族五轮：`\fbox` 包 minipage、grid 缺 `#`、`\shortstack`/`\makecell` 单元格、单元格 justify、列规格 `align:` |

**下一步只有一个来源：§7 的 16 行未修残留。** 分工写在 §0 的留言板上（A＝`cetz.py` 图几何腿；B＝`prep.py`/`emit.py` 浮动体与表格腿；C＝只读抽查腿）。
不要再在本节追加「已完成」条目——收一轮就写进 §2 的轴、§7 的那一行，和 §3 的量具表。
"""


def main():
    lines = open(DOC, encoding="utf-8").read().split("\n")
    start = next(i for i, l in enumerate(lines) if l.startswith("## 4. "))
    end = next(i for i, l in enumerate(lines) if l.startswith("## 5. "))
    old = lines[start:end]
    with open(os.path.join(HERE, "community_log.md"), "w", encoding="utf-8") as fh:
        fh.write("# community.md §4 的原始流水账（未改动）\n\n" + "\n".join(old).rstrip("\n") + "\n")
    out = lines[:start] + NEW.rstrip("\n").split("\n") + [""] + lines[end:]
    text = "\n".join(out)
    open(DOC, "w", encoding="utf-8").write(text)
    print("section 4: %d lines -> %d; doc chars %d" % (len(old), len(NEW.split("\n")), len(text)))


if __name__ == "__main__":
    main()
