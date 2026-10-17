import pathlib

p = pathlib.Path("_work/community.md")
t = p.read_text(encoding="utf-8")


def rep(old, new):
    global t
    if t.count(old) != 1:
        raise SystemExit("anchor not unique (%d): %s" % (t.count(old), old[:60]))
    t = t.replace(old, new, 1)


rep("## 2. 审计轴（按发现顺序，现已 23 条）", "## 2. 审计轴（按发现顺序，现已 24 条）")
rep("| `tools/test_t2t.py` | 111 项测试套件 |", "| `tools/test_t2t.py` | 114 项测试套件 |")

entry = ("33. **#46（pgf 的默认 `inner sep` 被花在每一个有框节点上）— 已完成**：见轴 24。"
         "`box_args` 第一件事就是发 `inset: 0.3333em`，从不问节点自己写的量；"
         "`node_inner_sep` 明明会读，#40 把它送给了圆和空节点，`#box(` 这条路没接。"
         "typst 实测三条：`inset:` 两侧各花一次（9.5pt 字 → `inset: 5pt` 出 19.5pt 框）、"
         "**不写 `inset:` 就是零留白**、`0.3333em` 跟节点自己的字号走（10pt 上 3.33pt、9pt 里 3.00pt）"
         "——所以默认必须留在 em，不能像 §7 原议那样把 cm 的 `pad` 传进来。"
         "名单由**产物侧**驱动（1,308 行 / 235 篇）→ 重跑 235/235 → 复量还剩 74 行 / 19 篇，"
         "**逐篇打到源语句**才发现是同一个留白的**分轴拼法** `inner xsep` / `inner ysep`（27 处声明 / 11 篇）："
         "pdflatex 量出各轴只管自己、`inner sep` 写在轴键后面就盖住两轴、撑宽 `text width` 的只有横轴；"
         "typst 量出字典没写的轴拿 0 而非默认（一发就得写两轴）。并轨成 `node_padding` 一个来源、"
         "`node_inset` / `node_inner_sep` / `node_frame_width` 三个消费方。"
         "打桩 diff 279 张 / 223 篇 / 1,204 行 与 10 张 / 9 篇 / 55 行（箭端跟着框走），"
         "重跑 10/10，记号复量 **0**；测试 114。\n"
         "    **两次把量具自身当证据的代价**：`inset:` 记号第一版扫整页，把正文排版的 "
         "`inset: (left: 0.5em)` 也算进来；又给 `expand_linewidth` 传了 `line_cm=None`，"
         "于是 `\\linewidth` 定轴的图一张建不出来，`Harmonic-heights` 21 行**本来就对的**被报成残留 —— "
         "313 篇 → 14 → 10。**同一份名单，桩的基太窄会漏（#45），也会误报（#46）**：比较的基必须与批跑一致。\n")
rep("33. **再下一步**", entry + "34. **再下一步**")

old_head = "| `box_args` 把 `inset:` 写死成 pgf 的默认值 | 未普查（`#box(` 那条路的全部行） |"
i = t.find(old_head)
if i < 0:
    raise SystemExit("residual inset row not found")
start = t.rindex("\n", 0, i) + 1
end = t.index("\n", i)
t = t[:start] + ("| ~~`box_args` 把 `inset:` 写死成 pgf 的默认值~~ | ~~普查 1,207 个节点写了"
                 "自己的量 / 280 张画布 / 223 篇~~ ＋ 收口时捞出的**分轴拼法 42 个节点 / 27 处声明 / 11 篇** | "
                 "**已修（#46，见轴 24）**：`node_padding`（569）按书写顺序读 `inner sep`／`inner xsep`／"
                 "`inner ysep` 得两轴，`node_inset`（1967）打印它（两轴不同发 `inset: (x:, y:)`；字典没写的轴 "
                 "Typst 给 0 而非默认），`node_inner_sep`（595）与 `node_frame_width`（524）取横轴。律由 "
                 "`_work/measure_box_inset_gap.py`、`_work/measure_inset_axes.py`（typst＋fitz）与 "
                 "`_work/measure_tex_inset_axes.py`（pdflatex）量出 | **新暴露的不足**：样式与节点交错时"
                 "（style 带 `inner xsep`、节点随后带 `inner sep`）选项表按**键**合并，看不见两者的先后——"
                 "本库这种写法 **0 处**（`_work/probe_padding_face.py`），要改就得让 `opts()` 记下每个键的字节位置 |"
                 ) + t[end:]

p.write_text(t, encoding="utf-8")
print("patched: axis count, tests count, item 33 (#46) with old 33 -> 34, struck the residual inset row")
