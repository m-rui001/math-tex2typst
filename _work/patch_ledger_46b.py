import pathlib
import re

p = pathlib.Path("_work/community.md")
t = p.read_text(encoding="utf-8")

anchor = "| `_work/brace_probe{,2,3,4,5}.typ` |"
i = t.find(anchor)
if i < 0:
    raise SystemExit("brace_probe row not found")
line_end = t.index("\n", i)

rows = """
| `_work/probe_inset_face.py` | #46 普查：包住 `box_args`，按 `_length(..., IDENT)` 读不读得得分三类 → **声明了量的框节点 1,207 / 默认 195**，分布在 280 张画布 / 223 篇，另打值的直方图（`5pt` 382、`6pt` 217、`1pt` 122、`2pt` 107……） |
| `_work/measure_box_inset_gap.py` | **typst＋fitz 神谕**（#46）：`inset:` 两侧各花一次（9.5pt 的字在 `inset: 5pt` 下成 19.5pt 的框）、不写 `inset:` 就是 0 留白、`0.3333em` 跟节点自己的字号走（10pt 上 3.33pt、`#text(size: 9pt)` 里 3.00pt）。**坑**：fitz 已经返回 pt，别再乘任何换算系数；框筛选要放到 `width > 4 / height > 3`，否则窄框被读成「没有框」 |
| `_work/probe_inset_regen_guard.py` / `_work/probe_inset_discarded.py` | #46 的打桩 diff（桩＝`node_inset` 恒回 `0.3333em`）→ **changed 279 张 / 223 篇 / 1,204 行，lost 0、gained 0**；对账具逐张比「带声明的 `box_args` 叫了几次」与「非默认 `inset:` 有几行」→ **1204 == 1204、差异 0 张**（那 3 处活在最终被拒的画布上）。**坑**：数非默认行要用 `inset: (?!0\\.3333em)`，数全部 `inset:` 会把 195 处默认也算成差额 |
| `_work/probe_inset_product.py` / `_work/probe_inset_page.py` | #46 的产物侧名单（页上几行仍花默认、源里写过 `inner sep` 吗）→ 1,308 行 / 235 篇，重跑后 **74 行 / 19 篇**；`probe_inset_page` 逐篇比「页上的默认行 vs 新 build 的默认行」→ **只有 1 篇真的陈旧**，而那一篇正是分轴拼法那一族。**坑（两轮都踩）**：这类比较的基必须与批跑一致——`line_cm=None` 会让 `\\linewidth` 定轴的图一张都建不出来，把已经正确的页报成残留 |
| `_work/measure_tex_inset_axes.py` | **pdflatex 神谕**（#46 的第二条腿）：`inner xsep` / `inner ysep` 各只动自己那根轴（横 7pt 时半宽 8.811→12.478、半高 7.005 不动）；`inner sep=2pt, inner xsep=7pt` 给 x=7/y=2，**反过来写给 x=y=2**（按书写顺序执行）；撑宽 `text width` 段落框的只有横轴（46.212 / 49.879 / 仍 46.212） |
| `_work/measure_inset_axes.py` | **typst＋fitz 神谕**：`inset: (x: A, y: B)` 横竖各花各的、与 `(left:, right:, top:, bottom:)` 同读数；混排 `(x: 7pt, y: 0.3333em)` 合法；**字典没写的轴拿到 0 而不是默认**（`(x: 7pt)` 的高 == 完全不写 inset 的 6.580pt）——所以一发字典两轴都得写 |
| `_work/probe_padding_face.py` | #46 逐轴普查（包住 `node_inset`，按 `PADDING_KEYS` 的出现分类）→ 带轴键的框节点 **42**（两轴都写 30、只写横轴 12），字典落 **9 张画布 / 8 篇**；**通用键与轴键写在同一节点上的一族在本库是 0**（顺序看不见的那族空集，见轴 24） |
| `_work/probe_padding_regen_guard.py` / `_work/probe_padding_product.py` | #46 第二腿的打桩 diff（桩＝`node_padding` 只认 `inner sep`）→ **changed 10 张 / 9 篇 / 55 行、lost 0、gained 0**，箭端跟着框走；名单由「**页 vs 新 build 的 `inset:` 记号多重集**」驱动：313（针扫到正文的 `inset: (left: 0.5em)` ＋ `line_cm=None`）→ 14 → **10 篇 47 行**，重跑 10/10，复量 **0** |
| `_work/probe_inset_declared_kept.py` | 节点级判据：在 `convert` 的完整前处理基上（1,058 图 / 1,044 建）问「声明了量的节点有没有仍被回成默认」→ **spent 1,207 / 默认 195 / 漏 0**。「应该消失的串」收到 0 之后要用它把「剩下的到底是故意」说清楚 |
| `_work/dump_inset_pic.py` / `_work/dump_padding_pic.py` | 只读打印一图的 `-`/`+` 对照（不碰编译）：把某一篇的画布行与「桩下的画布行」并排出来，用于逐行核对而不是猜。**坑**：论文目录名只能 glob 出来，台账里的 44 字截断名拿去当路径必然 `FileNotFoundError` |"""
t = t[:line_end] + rows + t[line_end:]

# 1. current-status row for #46
row_anchor = "| **分组下标把花括号印到页上**（#45） |"
j = t.find(row_anchor)
if j < 0:
    raise SystemExit("row #45 not found")
row_end = t.index("\n", j)
new_row = ("\n| **pgf 的默认 `inner sep` 被花在每一个有框节点上**（#46） | 普查 **1,207 个节点写了"
           "自己的量 / 280 张画布 / 223 篇**（产物里 1,437 行发默认，其中 129 行确实没人写量）；"
           "收口时又捞出**分轴拼法 27 处声明 / 11 篇** | **已修**：typst 实测 `inset:` 两侧各花一次、"
           "不写就是 0 留白、`0.3333em` 跟节点字号走（9pt 里 3.00pt）→ 默认必须留在 em；pdflatex 实测 "
           "`inner xsep` 只撑横轴、`inner sep` 写在轴键**后面**就盖住两轴。新增 `node_padding`（按书写"
           "顺序累积两轴）一个来源，`node_inset`（发 `inset:`，两轴不同发字典）／`node_inner_sep`／"
           "`node_frame_width` 三个消费方并轨。打桩 diff **279 张 / 223 篇 / 1,204 行** 与 **10 张 / 9 篇"
           " / 55 行**、lost 0；重跑 **235/235 ＋ 10/10 compile**；产物侧「页 vs 新 build 的 `inset:` 记号"
           "」复量 **1,308 → 74 → 0**；闸门 **918/14/0**；测试 **114** |")
t = t[:row_end] + new_row + t[row_end:]
p.write_text(t, encoding="utf-8")
print("inserted %d instrument rows and the #46 status row" % (rows.count("\n| `")))
