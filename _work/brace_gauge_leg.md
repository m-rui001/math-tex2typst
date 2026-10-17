# 量具自己造花括号：宏展开器把 16 站balanced 式子报成 `Expected 'EOF', got '}'`（2026-10-17）

## 触发

上一腿收口后全库拒渲 244。按报错形排队时，`Expected 'EOF', got '}'` 有 27 枚，是「花括号族」的最大头。
先把这条消息的站点全部抓下来做定性（`_work/brace_eof_probe.js` → `_work/brace27_probe.js`），
一半以上是 `\norm{…}`／`\abs{…}`／`\inner …`——正文数下来 `net=0 min=0`，**括号是平衡的**。

## 机制（量具侧，不是笔记侧）

`_work/katex_macros.js` 把语料宏表编译成 KaTeX macros 时，对带参宏走的是

    ctx.consumeArgs(n).map(ts => ts.map(t => t.text).join(''))

**KaTeX 0.19.0 在这条路里把实参的 token 流反着交回来**（`_work/macro_order_probe.js` 打印
`consumeArgs(1)` 得到 `"*_t-x}}0_h{_\mu{_E\mathbb"`——正是 `\mathbb E_{\mu_{h_0}}x-t_*` 的倒写），
于是 `\norm{X}` 展开成 `\Vert <倒写X> \Vert`，展开器自己吐出多余右括号，尺子把这笔账记到笔记头上。
同一份正文手写展开 `\Vert … \Vert` 是 RENDERS 的。

修法只有一条路：带参宏也用 **KaTeX 原生字符串宏**（`{'\norm': '\Vert #1\Vert'}`，`#1..#9` 由 KaTeX
自己填），`compile()` 塌缩成一行 `macros[key] = schema[key].tex`。数组形 `["body", n]` 仍然不可用
（"tokens is not iterable"）。全库其它 18 处调用这把尺的量具都自动跟着修好，不另开第二把尺。

自测：`_work/katex_macros_selftest.js` 钉住两端——四枚带参宏必须 RENDERS，两枚真多余右括号必须照报
`Expected 'EOF', got '}'`，再加一条两槽宏 `\TT{a}{b}` vs `\TT{b}{a}` 的**顺序**断言（比较渲染文字，
不比 HTML：KaTeX 把源式写进 `<annotation>`，两形永不字节相等）。改尺必跑。

读数：全库拒渲 **244→228**，16 站消失、新增 0（`dollarmath_sites9` vs `sites10` 逐站点集合差）。
消失的 16 站全是带参宏展开形：`\norm` 5、`\abs` 4、`\inner` 3、`\eqref` 2、`\frac` 类 2。
`Expected 'EOF', got '}'` 27→17。

## 剩下 17 站是真缺陷，分三形（`_work/brace10_classify.js`＋`_work/brace10_context.js`）

1. **LITERAL（3）**：`\{` 开的字面大括号用裸 `}` 关——D132 `\max\{\lvert a\rvert,\lvert b\rvert}=`、
   D190 `\{w_{i+r}:0\le r\le L}\|`、D41 逐字等式里的 `s(g,x_i}`（素材 `03-separation.tex:196` 写作
   `s(g,x_i)`，所以这一枚是 `)` 的误打，凭据在素材）。修法：补 `\}` 或按素材回改。
2. **EXTRA（13）**：正文多打一枚右括号（D07 `_{\mathrm P}}` 两站、D291、D324、D365、D533、D66、D757
   `\text{）都有两色密度 }}`、D769、D94、D586、D84）。两枚是「缺开多闭」的另一面：D586 `\frac ir^2}`
   （同篇前半写作 `\frac{ir^2}2Df`，凭据在本篇自身）、D84 `g(B_\R^n}(0,r))`→`g(B_{\R^n}(0,r))`。
3. **SPLIT（2 站＝1 处根因×2）**：作者把中文夹进式子，`$…$` 接成两段——D303
   `$…\mathbf 1_{\{\mathcal I$ 内互相回避$}\prod…$`、D511 `$\lim_{a\to0$ 或 $\infty}X…$`。
   修法是把话搬进 `\text{}` 复原成一整段，`$` 各少两枚（D303 还要补 `\}`＋`}` 两枚闭符，
   `1_{\{…\}}` 的字面括号与下标括号各关各的）。这一形同时吃掉一枚 `Expected '}', got 'EOF'`，
   所以两处配对站点一起归零。

## 落地与复量

16 条定点修补由 `_work/brace10_apply.py` 驱动：串原文用 `r''` 写在这个文件里（Write 落盘，bash 吃不到
反斜杠；`B+B` 拼进正文会得到 `\\prod` 这种素材里不存在的形，**本篇预数=0** 就是这一格），
再用 argv 列表叫起同一把尺 `_work/c_note_fix.py`（不复制它的断言）。驱动里每条先在 python 侧
`text.count(old)` 预数一遍，与尺子的命中数并排打印——两处不一致就先怀疑传参，不怀疑正文。

读数：**228→209**（19 站消失、新增 0），`Expected 'EOF', got '}'` **17→0**，
`Expected '}', got 'EOF'` 10→8，`dollarFamily` 51 不动，spans 864974→864972，files_hit 143→128。
16 篇 `.tools/gate.py …` 全 CLEAN。

两处险些自伤，都记下来：
- D365 的多余右括号是**作者第 479 行工单授权**删的，而工单自己用 `` `$s_n=\frac{n}{2(n+1)}}$` ``
  引用了坏形。OLD 若只写式子会连工单那处一起改掉（留档被抹平），所以 OLD 带上下文「 记在」。
  同一枚坏形在正文与在工单里，地位不同。
- D303 的 OLD 起手多写一枚 `$`：`\mathbf` 前面是 `\frac1{Z_{\mathcal I}}`，整段只在最外有一对 `$`。
  零命中不是正文的问题，是串的边界画错。

## 残（下一腿的候选，按站点数）

`Can't use function '$' in math mode` 47（dollar 族 51 已判，不动）／
`Unexpected end of input in a macro argument` 21／`No such environment: psmallmatrix` 12／
`Expected '}', got 'EOF'` 8（真·缺闭符，与 SPLIT 不同形）／`Expected group after '_'` 7＋`^` 5／
`Double subscript` 7＋`Double superscript` 6／`Can't use function '\('` 6／`got '\right'` 5／
`Expected & or \\\\ or \cr` 2＋`\end` 1（表格环境）／undef 长尾（登记不发明）。
