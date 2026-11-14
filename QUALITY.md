# QUALITY — math-tex2typst（2026-11 整改）

本文件只引用脚本输出：数字来自 `tools/verify_typst.py`、`tools/summarize_typst.py`、
`tools/corpus_audit.py` 与 `python -m unittest tools.test_t2t`。没有手写估计。

## 结论

- 整改前仓库里的 724 份 `main.typ` 没有一份自带 PDF，`report.json` 全写 `compile_ok: true`，
  但那是清 PDF 之前的读数，无法复核。重跑编译后 **710/724 通过，14 份因缺图位图失败**。
- 整改后 `typst/` 下 **706 份文档，706/706 编译通过**；另有 **14 份隔离**在
  `_quarantine/typst/`（可读、缺 27 张图位图，无法修复），**4 份删除**（1 个空壳 + 3 个字节级重复），
  逐条记入根目录 `REJECTED.csv`。
- 单测 170/170 通过。公式回退 109 条（保留 LaTeX 文本，不冒充原生公式），
  `latex_literals_remaining` 0，`dangling_ref` 0，`figure_content_unhandled` 0，编译警告 0。

## 环境

```
typst 0.15.1 (9dfd3a08)   pandoc 3.8.3   pdfTeX 3.141592653-2.6-1.40.28   Python 3.13.5   PyMuPDF 1.28.2
```

## 闸门命令（按序）

```bash
python tools/verify_typst.py                 # 逐篇重编译，重写 report.json 与 main.pdf
python tools/summarize_typst.py              # 汇总 summary.json / batch-report.json / INDEX.md
python tools/corpus_audit.py                 # 静态审计 + MANIFEST.csv
PYTHONIOENCODING=utf-8 python -m unittest tools.test_t2t
```

`main.pdf` 与 `*.png` 不进版本库，`verify_typst.py` 会重生。`tools/inventory.py && tools/batch_typst.py`
是从上游 `.tex` 重跑全库的入口，见下节「复现边界」。

## 基线（整改前，本次实测）

| 项 | 数 | 来源 |
| --- | --- | --- |
| `typst/` 下的文档目录 | 724（另有 `_qa/` 1 个夹具目录） | `ls typst/*/report.json` |
| 声称编译通过 | 724 | 旧 `report.json`（不可复核：PDF 已清） |
| 实测编译通过 / 失败 | 710 / 14 | `verify_typst.py` |
| 失败原因 | 缺 `fig/*.png`，27 处引用 | `corpus_audit.py` |
| 空壳文档 | 1（只有标题，0 公式/定理/图） | `corpus_audit.py` |
| 字节级重复 | 3 组（`-alternate-1` 与主文档 sha1 相同） | `corpus_audit.py` |
| 编译警告 | 0 | `report.json:compile_warnings` |
| 公式数 / 回退数 | 761,830 / 109 | `corpus_audit.py` / `summarize_typst.py` |
| 总行数 / 总字符 | 946,688 / 127,305,740 | `corpus_audit.py` |
| 缺资源文档 | 14（27 张图） | `corpus_audit.py` |
| U+FFFD / BOM / 超短 / 无来源 | 0 / 0 / 0 / 0 | `corpus_audit.py` |

## 处理明细

**删除 4 篇（`REJECTED.csv` 共 8 行：4 个 `main.typ` + 随文档删除的 4 个 `refs*.bib`；`report.json` 随目录删除），git 历史即备份**

| 原因 | 数 |
| --- | --- |
| 空壳：仅标题，源文件是 `pdfpages` 包壳（`summary.pdf`），转换器无法内联 | 1 |
| 与主文档字节级相同（sha1 一致），保留更短路径 | 3 |

**隔离 14（`_quarantine/typst/<name>/`）**

这些文档正文完整（20,526 行、2,788,540 字符、17,455 条公式），唯一缺陷是 `main.typ` 引用的
`fig/*.png` 从未进过版本库：旧 `.gitignore` 的 `*.png` 把所有图位图挡在库外，而上游
`preprints/<name>/build/figures/` 在这台机器上已为空，无法重生成。逐篇原因与 sha1 见
`_quarantine/README.md` 与 `MANIFEST.csv`（`quality=quarantined`、`defect=missing_images`）。
已把 `.gitignore` 改为放行 `typst/*/fig/*.png`，未来重生成的图可以直接入库。

**修复 1（配置）**：`.gitignore` 增加 `!typst/*/fig/*.png` 例外。

## 整改后（本次实测）

| 项 | 数 |
| --- | --- |
| `typst/` 文档 / 编译通过 | 706 / 706 |
| 隔离文档 / 删除文档 | 14 / 4 |
| 行数 / 字符（buildable 部分） | 922,233 / 123,971,757 |
| 公式 / 回退 | 740,937 / 109 |
| 单测 | 170 通过 |

`typst/summary.json`：

```json
{"documents": 706, "compiled": 706, "native_formulas_reported": 740828,
 "latex_formula_fallbacks": 109, "latex_literals_remaining": 0,
 "documents_with_formula_fallbacks": 51, "failed_documents": []}
```

## 复现边界（重要）

- **可复核**：从 clone 出发，`python tools/verify_typst.py` 能重编译 706 份并重写 `main.pdf`；
  它只在某篇旧报告说 `compile_ok: false` 时才去读 `_work/flat/`，706 份都不需要。
- **不能从本仓库复现**：`tools/batch_typst.py`（全库重转换）需要 `_work/flat/`（724 个 `.tex`，236 MB）
  与 `preprints/`（上游 arXiv 源），两者都在 `.gitignore` 里、不在仓库内；`tools/inventory.py`
  同样只能从 `preprints/` 重建 flat。因此 **「从上游 .tex 重新生成 706 份产物」这一环不可复现**，
  本次没有伪造通过：只对 `main.typ` 做了编译复核。
- 这台机器上存在原始工作副本 `E:\math`（`_work/flat` 724 个、`preprints` 720 个），本次只读使用：
  用它确认了 14 篇缺图的上游 `build/figures/` 同样为空（图确实已丢），没有用它改写任何产物。
- `report.json` 里的 `source` 字段记的是 `E:\math\_work\flat\<name>.tex`，是生成时的绝对路径；
  文件名（`<name>.tex`）是 provenance，路径前缀对 clone 无意义。`corpus_audit.py` 的
  `source_present` 按仓库内 `_work/flat/` 判定，因此恒为 0。

## 剩余已知问题

1. **14 篇缺图**（已隔离）：要恢复必须在有上游 `build/figures/*.pdf` 的机器上重跑 `prepare_assets`。
2. **109 条公式回退**：源码中显式保留 LaTeX 片段，渲染为文本，`summarize_typst.py` 计数；
   未做自动改写（会臆造数学内容）。集中在 51 篇。
3. **无上游源**：仓库不含 `preprints/` 与 `_work/flat/`，不能重新转换、不能重跑 `_work/probe*` 的读数量具。
4. **`_qa/bibprobe`** 是量具夹具（35 字节 `main.typ` + `refs.bib`），不是论文，未计入 706。
5. `typst/` 顶部还留着 `batch-report.json`、`summary.json`、`INDEX.md`、`representatives.json`、
   `转换经验总结.md`：前三个由 `summarize_typst.py` 重生成，后两个是人工台账。

## 变更文件

- `tools/corpus_audit.py`（新增）：静态审计 + `MANIFEST.csv`。
- `MANIFEST.csv`（新增）：720 行（706 ok + 14 quarantined），逐篇 sha1、行数、公式数、编译状态、缺陷。
- `REJECTED.csv`（新增）：4 条删除记录（路径、原因、字符数、sha1）。
- `_quarantine/README.md`、`_quarantine/typst/`（新增）：14 篇隔离文档。
- `.gitignore`：放行 `typst/*/fig/*.png`。
- `typst/*/report.json`（724 → 706 + 14）：`verify_typst.py` 重写的实测读数。
- `typst/summary.json`、`typst/batch-report.json`、`typst/INDEX.md`：`summarize_typst.py` 重生成。
