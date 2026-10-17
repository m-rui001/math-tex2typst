## 21:08 增量（宏腿第三档：单 token 实参 397 处；自带卫生＋恒等式守卫）

**把「实参没有花括号」那一族收进展开器**：`_work/param_macro_expand.py` 原先只认 `\mac{...}`，实参写成 TeX 的「下一枚 token」（`\norm x`、`\abs S`、`\Zmod2`、`\degT A`、`\proj0`）时全部记在 `noargs` 账上，于是残留在正文里的泄漏从 568 处停在那儿。新增 `--single` 档：`take_args` 在花括号失败后按 TeX 词法取一枚 token（控制序列 `\theta` 或单个字母数字），代入定义体。**全库 dry→apply：`notes=47 expanded=397 noargs=96 leftarg=0 taut=3 bytes=+3,526`**。

**两条守卫是被样本逼出来的，不是预防性装饰**：
- **恒等式守卫（`taut`）**：`\Zmod` 的定义体是 `\Z/#1\Z`，而 D63 第 6 行写的是记号定义句 `$\Zmod m=\Z/m\Z$`——展开后收成 `$\Z/m\Z=\Z/m\Z$`，把「m 是元变量」这句定义吃掉了。判据取「展开产物已在同一行原文中出现」，命中就退回登记不改（全库 3 处，D63 那 1 处就在其中）。这条比「实参是不是单个字母」可靠：D87 的 `\degT A`→`[A]_T` 同样是单字母实参，但那是真自变量，必须展开。
- **上下标相邻就放弃**：token 形实参若紧跟 `_` 或 `^`（`\norm x_i`），忠实展开会把下标挂到闭符上（`\left\lvert x \right\rVert_i`），与作者本意可能分叉，这类连同「实参不是 token 形」「素材查无定义」一起留在 `noargs` 账上（96 处，未再细分成因）。

**落地不变量逐篇复核（47 份 vs 各自的 `.pre-single` 备份）**：行数、`$` 数、反引号数三项 **全部不变**（`line_or_dollar_changed=0`），字节只涨不缩（+3,526 净，D87 一份因定义体短于命令名而 −2）。这正是通改的两条形式判据，所以 `cite_audit` 的位置串账面不受影响。
- **展开产物落地前统一补空格**（`FUSE`）：素材的定义体常写 `\left\lvert#1\right\rvert`（无空格），代入实参就直接融合成 `\lvertq`。本腿第一版没做这层卫生，**自己造出 21 处控制字吞字母**（D31 9、D39 6、D113 3、D329 2、D72 1），靠 `_work/vsplit_probe2.py` 的「今文 vs `.pre-single` 备份」逐篇差量当场抓到（备份 old=0 → now=21，所以 21 处全属本腿），`_work/vsplit_fix.py` 补空格清零（+21 B，`tick`/`dollar`/`pipe` 三项逐篇不变）。自检 `_work/fuse_selftest.py`：`\lvertq`→`\lvert q`、`\middle|y` 一律不动。
- **`\mid` 的吞字母判据必须写成 `mid(?!dle)`**：`\middle` 是真命令。这一条同时否证了上一轮的账——上次记的「存量 9 处待授权回改」就是 `\middle` 假阳，加守卫后全库实测 **occ=0**，那笔待授权欠账并不存在，不用再做。

**残留账面（`_work/resid_split.py` 同一口径复量）**：`residual_total=419 = inline_code 232 + body 187`，其中 body `braced=38 bare=149`。上一档是 `800 = 232 + 568（braced 124 + bare 444）`。三笔账的去处：232 处在反引号跨度内＝素材逐字引文（不许动，D143 一家占 132）；38 处有花括号但素材查无定义＝登记不发明；149 处是被两条守卫拦下的 token 形。

**宏族总账复量（同一枚 `node katex_census.js`，本腿前后各一趟）**：`files=734 spans=845,596→846,484 katex_refused=948→896 files_hit=234→236 unclosed_spans=0→0`。397 处展开只换来 −52 枚拒绝跨度，因为 census 数的是「至少含一枚未定义命令的跨度」——同一跨度里 `\Zmod2\times\Zmod2` 两枚只算一处，而 `files_hit` 反升 2 是在飞两篇的新节正在写入。**判式：展开腿的收益用 `resid_split` 的 occurrence 口径量（568→187），别用 census 的 span 口径量**；`unclosed_spans` 两趟都是 0，说明「闭符前空格」与跨行行内式两腿在 734 份上已无残留开口。`gate_all total=734 bad=1`，唯一一枚旗标落在在飞的 D280（`emDash=2`，分块落盘中），按「红旗长在写手锚位上就不动」交给收稿趟的 sweep。

**在飞三档**：D67（20:50 起）、D41（21:0x 起，`## 19` 续号）、D280（21:0x 起，`## §16` 续号）。`inflight.txt` = `D67 D41 D280`。
