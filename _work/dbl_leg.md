# Double subscript／Double superscript 族腿（2026-10-17）

## 读数

`_work/dollarmath_sites19.jsonl` → `_work/dollarmath_sites20.jsonl`：
`katex_refused` **154 → 141**（−13，正好＝本站族 13 枚），`files_hit` 98→89，
`dollar_family` 49 不动（另一条已裁决的欠账，见 `_work/dollarmath_residual.md`）。
两趟复量（`sites20`／`sites20b`）读数逐字相同。
站点集合差：**REMOVED 13／ADDED 0**，残留 `Double subscript|Double superscript` **0**。
`.tools/gate.py` 11 篇全 CLEAN（math=1498…4100）。

## 形状定性：同一个报错名底下是四种不同的病

用新写的通用族筛 `_work/err_face.js`（`node _work/err_face.js <sites> "Double subscript|Double superscript"`）
取到 13 站／11 篇的 body 与行窗，逐条对素材后才分形：

1. **双打**（全库 12 站里的 8 站）：`^^`／`__` 手抖重复一枚算子——
   `D155 \lVert f\rVert_1_1`、`D296 \beta_{\mathrm{eff}}_c`、`D36 A^{1/10}^-`、
   `D486 j_t_a`（应为 `j_{t_a}`）、`D570 s_kv_d_1`（素材 `s_vd_1`，多插一枚 `k`）。
2. **撇／指数的尾部多打**：`D370 (RM')_\ell/M'_\ell'`、`D555:306 \sum_{J'_s'}`、
   `D555:317 \sigma_x\sigma'_x'`、`D489 s_t^{D\setminus A}^D(v)`、`D94 |0\rangle^n^n`（丢了 `_R`）。
   这一支最像「作者本意要撇」，凭据必须逐字给：素材 `packets.tex:40-41` 的 `\ell` 不带撇、
   `03-transfer.tex:292-295` 只有 `\sigma,\sigma'` 两份副本（`\sigma'_x'` 是第三份）。
3. **少组导致的连坐**：`D274 \norm E_{g_j}_2` —— 自定义宏 `\norm` 吃一个参，
   裸 `E_{g_j}` 让 `_2` 挂在组外；素材 `main.tex:198` 写作 `\norm{E_{g_j}}_2`，补组即愈。
4. **限制算子的下标位**：`D493 M_i^*_F`，素材 `06-cycles.tex:428` 是 `M_i^*|_F`。
   这一站坐在**表格格内**，裸竖线会切列，所以按全库 house 形发 `\rvert_F`
   （`\rvert_` 908 处／96 篇；字节 +6、`|` 计数不增）。

`D204 \mathfrm_B` 那一形（掉字宏名）在上一族已处理；本族没有宏名掉字的站。

## 工具链（一次成型，后续族直接复用）

- 规格单一来源 `_work/dbl_fix.py` → 落 `_work/dbl_fix.json`（12 单／13 站，
  每单带 cid/line/old/new/expect/dollars/ticks/cred，凭据写在生成脚本的 docstring 里）。
- `_work/fix_probe.js <spec.json> <sites.jsonl>`：按（cid, line）回台账取**修前 body 逐字**，
  先断言 old 在跨内、命中数＝期望，再渲染 修前（必须 ERR）／修法（必须 OK）并打印墨迹。
  结果：12 单全部 修前 ERR／修法 OK，异常 0。
- `_work/fix_apply.py <spec.json> [--apply]`：在飞稿跳过、同篇多单内存串行预数，
  执行仍走 `_work/c_note_fix.py`（`$`／反引号／行／字节四项不变量在落盘那一趟断言）。
  DRY 与 APPLY 都是 `单数=12 覆盖站=13 异常=0`；逐单字节差与替换长度差×命中数逐一对上
  （D155 −4＝2×2、D493 +6、D94 0……），行数全不变。
- `_work/fix_verify.py <spec.json>`：落盘后逐站断言该行含新形不含旧形、全篇旧形归零。异常 0。

## 判形取舍

- `D296` 取并入同组 `\beta_{\mathrm{eff},c}`（字母零增减），不展开成素材的 `\beff(J,\bc(J))`——
  那是重写作者的记号，不是修一枚定界。
- `D155` 同句自述「范数界为 $1$」、Lean `l2ToL1` 带 `mkContinuous 1`，
  Hölder 在概率空间上就是 `\lVert f\rVert_1\le\lVert f\rVert_2`，多打的那枚下标是重复；
  两站同串，一单覆盖。
- 本族 13 站没有落在作者登记句里的，故没有换载体（正文坏形改、登记引文进代码跨度）那一手；
  上一族的 D61／D772 已按那条律处理完。

## 残余与下一支

族已归零。`_work/dollarmath_sites20.jsonl` 的 141 枚按类排队，能动且形状已认得的候选：
`Can't use function '\(' in math mode` 6 站（pandoc 给作者字面标点加的转义，墨价在 typst 轴 76 已量：
十形全 escape、一页一形 `==`）、`Expected 'EOF', got '\right'` 5 站、表环境
`Expected & or \\ or \cr or \end` 2 站、`Can't use function '\mathbf' in text mode` 2 站，
余下是一批单例类（`got 'EOF'`／`got '_'`／`got '&'`／`\operatorname@` 无参／
`{equation} can be used only in display environment`）。dollar 族 49 枚维持不动。
