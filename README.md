# math — 工作目录

这里是一台把 arXiv 数学论文的 LaTeX 转成 Typst/CeTz 的流水线，加上它的全部量具、探针和台账。
724 篇论文，一轮全库重跑 500 秒，产物逐页对过作者自己的 pdflatex 控制页。
**当前状态（2026-11 复核）**：库内 706 篇 `typst/`，706/706 编译通过；14 篇缺图位图隔离在
`_quarantine/`；4 篇空壳/重复删除（`REJECTED.csv`）。前后数字与复现边界见 [`QUALITY.md`](QUALITY.md)，
逐篇索引见 [`MANIFEST.csv`](MANIFEST.csv)。

目录是 `github.com/openai/math` 的一份工作副本（Apache-2.0，原文本留在 `README.openai-math.md`
和 `LICENSE.apache-2.0.txt`）。本仓库只发布我们自己产出的部分；上游的 Lean 形式化与 arXiv 原文
不在里面，见文末「不含」。

## 各目录做什么

| 目录 | 内容 |
| --- | --- |
| `tools/` | 流水线本体。`t2t/prep.py` 打标记、`convert.py` 走 pandoc AST、`mathconv.py` 管数学、`cetz.py` 把 TikZ 语义逐条翻译成 CeTz、`emit.py` 落 Typst。外面四个入口：`inventory.py` 展平语料、`batch_typst.py` 全库跑批、`summarize_typst.py` 汇总报告、`verify_typst.py` 逐篇核对 |
| `tools/test_t2t.py` | 170 条单测。每条断言后面都写着它是拿哪把尺、在哪个源语句上量出来的，包括负结果 |
| `.tools/` | 笔记侧修补脚本（本体侧闸门、KaTeX 检查、禁词清理那一套） |
| `typst/` | 每篇一个目录，`main.typ` 是产物，`main.pdf` 已清、由跑批重生；当前 706 篇，全部编译通过 |
| `_work/` | 探针与读数。`probe<轮次><腿>.py` 一支一条腿，输出 `label<...>.txt` 留在同目录；`community.md` 是三个 agent 的留言板与台账 |
| `研究笔记/`、`被引笔记/` | 中文研究笔记：主线 1（Lean 队列素材重述）、主线 2（全库队列）、被引笔记 C 稿 |
| `preprints/`、`lean/`、`reasoning_traces/`、`被引素材/` | 第三方与上游内容，本仓库不含 |

`_work/flat/` 是 724 篇展平后的 `.tex`，几乎所有量具都从这里取输入。它是原文的拷贝，236MB，
不发布；重建：`python tools/inventory.py`。

## 跑一遍

前置：Python 3.13、`typst`、`pdflatex`、PyMuPDF（`import fitz`）、pandoc。

```bash
python tools/inventory.py            # preprints 的 \input 树展平成 _work/flat/<篇>.tex（需要 preprints/，本仓库不含）
python tools/batch_typst.py          # 全库转换 + 编译，724 篇约 500s（同上，需要上游源）
python tools/verify_typst.py         # 只按库内 main.typ 重编译，重写 report.json / main.pdf（706 篇可跑）
python tools/summarize_typst.py      # 文档数、编译失败、回退数
python tools/corpus_audit.py         # 静态审计 + MANIFEST.csv（编码/空壳/重复/缺图/来源）
PYTHONIOENCODING=utf-8 python -m unittest tools.test_t2t
```

从 clone 出发可复核的是 `verify_typst.py` + `corpus_audit.py` + 单测；`inventory.py` / `batch_typst.py`
需要 `preprints/` 与 `_work/flat/`（均被 `.gitignore` 排除），属于不可复现环节，见 `QUALITY.md`。

图这一侧的验收是六组数加三联尺：

```bash
PYTHONIOENCODING=utf-8 python _work/residue.py <run>          # 残留与整体引号化的段
PYTHONIOENCODING=utf-8 python _work/probe_canvas_population.py
PYTHONIOENCODING=utf-8 python _work/probe_canvas_all_origin.py
PYTHONIOENCODING=utf-8 python _work/probe_gate_all.py         # built / refused / compile-failed
PYTHONIOENCODING=utf-8 python _work/probe81_label_box_face.py render       # 普查：页上的画布
PYTHONIOENCODING=utf-8 python _work/probe84_control_face.py - control<run>_rows.json
PYTHONIOENCODING=utf-8 python _work/probe85b_emitter_face.py 3 control<run>_rows.json
```

三联尺的意思是：一把尺在产物页上找框与字的重叠，一把在 pdflatex 控制页上量同一张图本来该是什么样，
第三把把两边接到发射器语句上，剩下的是真缺陷面。少任何一把都会把「作者自己也互压」记成我们的账。

## 口径

- **一条路径**。不加兼容壳，不留没测过的平行代码，不留没人读写的字段。一个主题只许一个口径，改阈值要把整串 grep 到的一起改。
- **律由 pdflatex 量**。每个位置、尺寸、笔宽规律都用 `\pgfpointanchor`＋`\pgfgetlastxy` 在真 TeX 上读回来，读数写进探针的 docstring 和单测注释；不猜。
- **改动面用打桩 diff 量**：同一基上把新律关掉重生成，逐行 diff，才说得出这一轮动了谁。
- **数字必须自己复量**。量具读数与写手的自报一样双向不可信；两代有差先归因再谈丢弃。
- **渲染产物看过就清**，量具重跑即覆盖上一代，要对照就先改名存档。
- **跑批期间一轮只许一个 `typst` 写者**，开跑前在 `_work/community.md` §0 登记，跑完回帖 `compiled=`。

台账的四节各自固定：§1 基线，§2 一页一条轴（律＋实测数，不写过程），§3 量具登记，§7 残留清单。

## 当前读数

编译类数字为 2026-11 复核（`verify_typst.py` + `summarize_typst.py` + `corpus_audit.py` + 单测）；
画布与闸门四行仍是 run153（2026-10-17）的读数，本次没有重跑，因为需要 `_work/flat/`。

- 文档 **706／706 编译通过**（库内 706，另 14 篇缺图隔离）；公式回退 109，`latex_literals`／`unhandled_figure_content`／`unresolved_references` 全 0
- 整改前同一把尺重跑是 **710／724**：14 篇引用的 27 张 `fig/*.png` 从未入库，已隔离；4 篇空壳/重复已删（`REJECTED.csv`）
- 闸门 **built 918／refused 14／compile-failed 0**（run153，需 `_work/flat/`）
- 画布 **1,055 张**上页（932 张源图，缺 1），全原点退化 **0**（run153）
- 残留 **0 处／0 篇**，整体引号化印上页的 LaTeX **1 段／1 篇**（run153）
- 单测 **170 全过**
- 页上有互压的画布 94 → **92 张／76 篇**；接到发射器语句上的真缺陷面 on-ink **6 行／6 张／6 篇**，foreign 10 行（去重 8）／5 张／5 篇（run153）

## 许可与不含

本仓库自己产出的部分（`tools/`、`.tools/`、`_work/` 的脚本与读数、两份笔记）用 MIT，见 `LICENSE`。
`preprints/` 里的 724 篇 `.tex`/`.bib`/`.pdf` 与 `_work/flat/` 的展平拷贝是 arXiv 作者原文，版权归各自
作者，不发布；`lean/`（含 1.48GB 的 Mathlib 快照）、`CONTENTS.md`、`overview.tex`、`reasoning_traces/`
属上游 `openai/math`（Apache-2.0），要读请直接去上游；`被引素材/` 同理是下载素材。
`_work/` 里若干取证沙盒（`pic-3d/`、`pic-authmacros/`、`refused2/`、`mg/`、`withdrawn-*/`、`cmp/`）留着
单篇论文的 `.tex`/`.bib` 片段，那是探针的输入而不是我们的产出，版权归原作者；要把它们也剔掉，
在 `.gitignore` 加一行 `_work/*/` 再补一条白名单即可。
`*.pdf`、`*.png` 和 pdflatex 的 `.aux`/`.fls` 等中间产物一律不进版本库，见 `.gitignore`——
它们随时可由上面的命令重生，台账只留读数。
