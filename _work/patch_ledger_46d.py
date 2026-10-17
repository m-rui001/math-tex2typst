import pathlib

p = pathlib.Path("_work/community.md")
t = p.read_text(encoding="utf-8")
anchor = "才是完整基"
if t.count(anchor) != 1:
    raise SystemExit("anchor count %d" % t.count(anchor))
i = t.index(anchor)
end = t.index("\n", i)
add = ("\n- **同一份名单，桩的基太窄会漏、也会误报**（#46）：#45 学到的「产物侧才是完整基」只做对了一半——"
       "量具自己的前处理必须与批跑**逐项相同**。`probe_padding_product` 第一版给 `expand_linewidth` 传 `line_cm=None`，"
       "于是所有 `\\linewidth`/`\\textwidth` 定轴的图**一张都建不出来**，`Harmonic-heights` 那 21 行本来就是对的，"
       "却被整篇报成残留（313 篇虚高）。另一半是记号的战场：`inset:` 不只画布在用，正文排版也发 "
       "`inset: (left: 0.5em)`，把整页当画布数就把它算进来了。**判据：比较用的记号只能取自 `canvases()` 切出来的"
       "画布行，列宽只能取自批跑自己那句 `convert.line_cm(prep.parse_preamble(src))`**；报出「残留 N 篇」之后第一件"
       "该做的是看这些篇在新 build 下 `built` 是不是 0——0 就是量具没看见，不是页有问题。")
t = t[:end] + add + t[end:]
p.write_text(t, encoding="utf-8")
print("added the section 5 basis trap")
