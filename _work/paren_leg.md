# `Can't use function '\(' in math mode` 族腿（2026-10-17）

## 读数
`node _work/dollarmath_census2.js --sites=…`：`katex_refused` **132 → 126**（sites21 → sites22），两遍一致
（`files=734 spans=864972 katex_refused=126 files_hit=81 unclosed_spans=0`，`dollar_family=48` 不动）。
按站键去重 126 → 120，**REMOVED=6／ADDED=0**，6 站全部落在规格的 6 单上（D36:354、D62:523、D420:79、D569:113、D108:104、D108:130＝**6 站／5 篇**）。
`.tools/gate.py` 五篇全 CLEAN（`math=1784/2426/1467/1458/2668`）——本族同样不在闸门射程里。

## 两形与素材凭据
**body 形（4 站）＝式内又抄了一遍 LaTeX 定界符。** 作者已经用 `$…$` 起跨，跨里再写 `\(`／`\)`，KaTeX 在 math 模式里拒收 `\(`。
修法是删式内那一对（或落单的那一枚）`(`/`)` 前面的反斜杠，`$` 与反引号计数一根都不动：
- D420:79 `$\((\sum wF)(\sum wG)\le(\sum w)(\sum wFG)\)$` → 去 4 字节。凭据：`02-discrete.tex:208--232` 同段那条 $(\sum f)(\sum g)\le(\sum u)(\sum v)$ 就是闭式写法。
- D569:113 `$\(\cdot\)_+$` → `$\cdot_+$`（−4）。凭据：`07-simultaneous.tex:20-45` 的正部记号 `x_+=\max(x,0)`。
- D36:354 `$\(Q+[0,w])/(d-1)!$` → 只多一个反斜杠，落单开符（−1）。凭据：03-zonotope 的 (eq:zonotope) 一带，平移量并入后的体积因子。
- D62:523 `$t'=\(1-\gamma)(1-q)+\gamma(1-\nu)=1-t$` → 同上（−1）。凭据：`special:40-49` 与 `eq:channel` 核的就是这条 `t'`。

**delim 形（2 站，都在 D108）＝逐字引文里把闭符 `\)` 误打成了 `$`。** 素材 `build/main.tex:317-327` 逐字 `\(\sigma_{we}z_e\)`、
`372-378` 逐字 `\(\deg A\le N-1\)`，两处闭符都打成了 `$`。这一枚是全篇唯一的 `$`（修前 `单$=1` 奇），
于是它把后面整段中文正文拖进式内——台账 body 从引文中段一直吃到下一段的 `对固定 $w`，报错名却挂在上游的 `\(` 上。
按「正文坏形按素材回改」就地改回 `\)`：`$` 差 −1、反引号差 0、字节 +1。引文里其余的 `\[ \] \( \)` 是逐字留档，不动。

## 判形取舍与工具链
- 规格 `_work/paren_fix.py` → `_work/paren_fix.json`，每单带 `level`（body／delim），**两把尺各吃一形**：
  `node _work/fix_probe.js`（式体级，先喂修前应 ERR、替换后应 OK 并打墨）判 4 单、跳过 2 单并申报理由；
  `python _work/delim_probe.py`（定界符级）判 6 单——两形都要看这一格的 `单$` 账。DRY／APPLY／落盘后各 `异常=0`。
- 三件量具（都通用，不再逐族另抄）：族筛**用已有的** `_work/err_face.js`（`node _work/err_face.js <sites.jsonl> "<报错正则>"`，重渲 body 取面并列站），
  `_work/marks.py`（`cid:line` 的定界符逐字符位置表，含 `$`、反引号、`\[ \] \( \)` 与本行 `line_delims` 读数）、
  `_work/spec_vs_ledger.py`（规格的 old 在**行原文**与**台账 body** 里各命中几次，报「old 不在这一跨里」时用）。
  旧腿的 `_work/hash8_marks.py` 硬编码站点表已删，由 `marks.py` 取代；本腿临时新建的 `class_view.js` 与 `err_face.js` 重复，也已删。
- 判形踩坑两处：`marks.py` 打的是 `repr` 窗口，反斜杠看着成对（`\(` 印成 `\\(`），据此手抄 old 一定多写一个反斜杠；
  台账 body **不含**外层 `$`，所以 body 形的 old 必须是跨内串。两处都由 `spec_vs_ledger.py` 一跑就露：第一轮 D36 多抄了一个 `(`、D62 多了一个反斜杠，`行内命中=0` 直接把规格打回。

## 残余与下一支
126 枚：`errClass=null` 的未定义控制字族 60、`Can't use function '$'` 48（[[dollarmath-closer-veto-tiering]] 定性为被邻接律否决的合法闭符，不动）、
`Expected 'EOF', got '\right'` 5（D139:228、D155:403、D191:860、D302:59、D302:154）、`\mathbf in text mode` 2、
表格环境 `Expected & or \\ or \cr or \end` 2、余 9 枚单例。下一支＝`got '\right'` 那 5 站。
