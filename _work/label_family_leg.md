# 标签写成控制字族：`$\lem:usable$` → `` `lem:usable` ``（2026-10-17）

## 族的形状

素材里的引理／命题用 `\label{lem:usable}` 这类标签寻址。笔记引用这些标签时有 17 枚写成了「反斜杠＋标签名」塞在一整枚数学跨度里：

| 篇 | 站数 | 形 |
| --- | --- | --- |
| D139 | 13 | `\lem:usable`(3)、`\lem:sections`(3)、`\lem:horizontal`(2)、`\lem:block-cell`、`\lem:shear`、`\lem:completion`、`\lem{sections}`、`\prop:vertical` |
| D310 | 2 | `\tree:spine-law` |
| D119 | 1 | `\dec:local_lists` |
| D317 | 1 | `\lem{tree}` |
| D441 | 1 | `\rho:1` ——**不是这一族**，那句是「局部密度锁成 $\rho:1$ 的机械字」，比例记法，合法数学 |

标签名不是宏。全库引标签的 house 形是代码跨度 `` `lem:usable` ``：1944 行在用；`` `\eqref{lem:` `` 全库 0 处，各篇自己的 `\eqref` 一律只吃 `eq:` 标签。所以补 `\eqref` 是发明，归位到代码跨度才是修法：反斜杠是错的那一笔，标签字面（`lem:usable`）一个不删。

凭据逐站查过：该篇素材目录里的 `\label{}` 全集确实含 `lem:usable`、`lem:sections`、`lem:horizontal`、`lem:block-cell`、`lem:shear`、`lem:completion`、`prop:vertical`（D139）、`tree:spine-law`（D310）、`dec:local_lists`（D119）、`lem:tree`（D317）。

## 第二把尺：拒渲尺对这一族天生失明

`_work/dollarmath_census2.js` 只抓 KaTeX 报错的跨度，而可见性取决于那个名字在不在语料宏表 `_work/katex_macros.json`（211 键，从素材 preamble 收来的全库表）：

- `\lem` 不在表里 ⇒ Undefined control sequence ⇒ 13 站全被 census 数到（`undef.\lem=13`）。
- `\tree`／`\dec`／`\prop` **在表里**，被收成 `\operatorname{tree}` 之类 ⇒ 同一形发成直立乱码、根本不拒渲，census 零记录。
- `\rho` 是 KaTeX 本名，合法。

也就是说同一族缺陷一半隐身，按拒渲数排产会漏。新尺＝`_work/label_bs_probe.js`：形状是「整枚跨度＝`$\<letters>[:{]<tail>}$`（无空格）」，再按该篇素材的 `\label` 集分 DEFECT／NEAR 两档，前缀不是该篇计数器的直接不报（否则 `$\mathcal{C}$`、`$\sqrt{2d}$` 全是噪音）。尺带 `--selftest`：把修前三形喂回同一条匹配路径，D139/D310/D119 各判成 DEFECT，报「素材标签 78/83/79 枚、前缀 sec,eq,lem,fig,prop,thm」——尺不是死的。

尺的花括号形曾经也瞎：`([A-Za-z0-9_.\-]+)` 后面必须紧跟 `\$`，`\lem{sections}$` 的 `}` 卡在中间，修前那轮因此少报 2 站（D139:356、D317:92）。补 `\}?` 后数全。

## 落地

11 单 `_work/c_note_fix.py`（每单一个 old→new 串，命中上限 4 由工具自己断言），全部走「`$` 差 −2×命中、反引号差 +2×命中」的申报口径：

```
D139  $\lem:usable$      -> `lem:usable`      --dollars -6 --ticks 6
D139  $\lem:sections$    -> `lem:sections`    --dollars -6 --ticks 6
D139  $\lem:horizontal$  -> `lem:horizontal`  --dollars -4 --ticks 4
D139  $\lem:block-cell$ / $\lem:shear$ / $\lem:completion$ / $\lem{sections}$ / $\prop:vertical$  各 --dollars -2 --ticks 2
D310  $\tree:spine-law$  -> `tree:spine-law`  --dollars -4 --ticks 4
D119  $\dec:local_lists$ -> `dec:local_lists` --dollars -2 --ticks 2
D317  $\lem{tree}$       -> `lem:tree`        --dollars -2 --ticks 2
```

第一趟 dry-run 我把申报写成「每站 −2／+2」，三处被工具自己的断言挡下（`美元差 -6，申报的是 -2`），当场按整篇差值改口径重跑，全部 APPLIED。

字节：D139 114454→114440、D310 82581→82579、D119 173293→173292、D317 70547→70545；行数与 CR 全程不变。新形复量：`` `lem:usable` `` 3、`` `lem:sections` `` 4（3 新＋1 本篇原有 house 形）、`` `lem:tree` `` 5（1 新＋4 原有）、`` `dec:local_lists` `` 2、`` `tree:spine-law` `` 2、`` `prop:vertical` `` 1。

## 复量（两次）

- `_work/dollarmath_census2.js --mask=corrected --digit=plain --sites=_work/dollarmath_sites7.jsonl`：`spans 864990→864974`、`refused 267→254`（差额 13＝`\lem` 整族）、`files_hit 152` 不变、`dollar_family 51` 不动、`undef.\lem` 13→0。
- `_work/label_bs_probe.js`：`DEFECT 0 篇 0 | NEAR 0`。
- `.tools/gate.py` D139／D310／D119／D317／D441 五篇 **CLEAN**（math 3387／2114／4449／1954／3352）。

## 遗留

1. `\rho:1`（D441:740）按合法数学 KEEP，登记不发明。
2. 拒渲残 254 枚的族形（本轮实测）：dollar 族 51（已定性，见 `_work/dollarmath_residual.md`）、`Expected 'EOF', got '}'` 27、`Unexpected end of input in a macro argument` 21、`No such environment: psmallmatrix` 12、`Expected '}', got 'EOF'` 10、`Extra }` 9、其余零星。
3. `\texttcaxe`(2)／`\textrewol`(1) 三站值得单独定性：形是 `$\eqref{ext:exact\text{-}kappa}$`，而素材标签本身是 `ext:exact-kappa`（字面连字符）。同一串我在两个口径下直调 KaTeX 都渲染通过，只有 census 报拒渲——报错名还把标签尾部印成反序（`rewol`＝`lower` 反写），高度怀疑是尺自己的宏表或掩码参与造成的假阳，不是笔记缺陷。下一支先复现再判。
4. `psmallmatrix` 12 站是一条干净的单环境族：mathtools 环境、KaTeX 不支持，展开形要看该篇素材怎么排这个矩阵。
