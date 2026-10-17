# dollar-in-math 定性腿（任务 40）

范围：`研究笔记/D*.md` 里 KaTeX 报 `Can't use function '$' in math mode` 的那一族。
量具：`_work/dollarmath_flip_search.js`（唯一口径，判档逻辑写在尺里，读数写在本文件）。
本腿前半是只读定性，后半经判定后执行了一批零风险定点修补；两遍读数都在下面。

## 一、机制：这一族不是「多了一个 `$`」，是「一枚合法闭符被否決」

`_work/dm_lib.js` 的 span 语法取**第一个**「前面不是空白、后面不是数字」的 `$` 作闭合符。
于是拒渲式体内出现 `$`，按构造必然是**一枚被否決的定界符**：

- `ws-before`：闭符前有空格（式内尾空格），`$=3-\frac{8x}9+... $`；
- `digit-after`：闭符后紧跟数字，`$\S$16`、`$1456$ B`。

由此三条推论，全部实测：

1. **「假阳」这一档在本族为空。** 先前立的两条假设都否证了：
   未剥的行内代码（FP-CODE）＝ 0（corrected 口径已剥，前一轮已量）；
   「相邻两式被并成一式」的 SPLIT 假阳＝ 0——把每一处内嵌 `$` 都当分界去拆，
   拆出来的边界**必定**违反同一条邻接律（它就是被这条律否決才落到式体里的），
   所以「非贪婪拆开后两边都干净」这种形状在库里不存在。放宽到「只看两边能否各自渲染」时
   曾量到 6 处，加上边界合法性后归零。
2. **位置串简写（第三族）与本族无关**：判形尺 `dollarmath_dollar_forms.py` 曾把 99 处切成
   `POS-CODE 20 / DOLLAR 1 / OTHER 78`、逐行奇偶 `EVENSPAN 68 / ODDLINE 31`——
   即 78 处（含全部 68 枚偶数行）用串形状判不出来，这正是换尺的理由。该量形脚本已删，
   口径并入本尺。
3. **能消旗标 ≠ 能修笔记。** 翻反引号／加反斜杠／删字符这三枚探针都能让 KaTeX 闭嘴，
   但它们把一枚**合法**定界符毁掉，只是把配对挪到别处。15 处只有这类探针可用，全部判人工。

## 二、读数

修前（`_work/dollarmath_sites2.jsonl`，mask=corrected digit=plain）：

    files=734 katex_refused=350 files_hit=172 本族 sites=99 files=62

（那一轮的 `spans` 读数没留档，只在 stdout 里过；本尺的 span 总数不作判据，不作对比。）

分档（`_work/dollarmath_flip_tiers.jsonl`，同一把尺的第一遍）：

| 档 | 处 | 篇 | 判语 |
|---|---|---|---|
| T1-WS-SPLIT | 53 | 34 | 可机械替换：单字符空白改动，把一式切成两式，`$`／`` ` `` 数不动 |
| T3-WS-BUT-NOT-A-SPLIT | 22 | 17 | 需人工：删空格能消旗标，但那枚空格是引文里的词间空格 |
| T3-CROSS-LINE | 13 | 12 | 需人工：拒渲式本身跨行，缺的是闭符本体（跨多行行内式族） |
| T2-ONLY-DELIM-PROBE | 10 | 10 | 需人工：只有破坏定界符才消旗标，真元凶在上游 |
| T4-NO-REPAIR | 1 | 1 | 需人工：任何单字符改动都消不掉 |

（篇数按档各自数，一篇可落进多档，所以列和大于 62。）

T1 里再切一刀，只执行**不可见**那一半：

- 48 处 DESPACE：删的是式内尾空格（TeX 本来就丢），且该 `$` 拆完确实成为闭合符
  （`spans==+1`），并断言空格落在拒渲式体内；
- 5 处 INSERTSP：要在闭符与数字之间插一个**可见**空格（`$\S$16` → `$\S$ 16`），
  属排版判断，退回工单。

## 三、执行与复量

    python -X utf8 _work/despace_bulk.py            # 干跑：FILES=31 EDITS=48
    python -X utf8 _work/despace_bulk.py --apply    # 每篇先落 _work/<号>.pre-despace.md

每篇断言：字节差 = −改动数、`$` 数不变、`` ` `` 数不变、CR 为 0、行数不变。
盘外独立复量 `_work/despace_verify.py`：31 篇全 OK，共释放 48 字节。

修后（`_work/dollarmath_sites3.jsonl`、`_work/dollarmath_flip_final.jsonl`）：

    files=734 spans=864990 katex_refused=302 本族 sites=51 files=37
    by={"T1-WS-SPLIT":5,"T3-WS-BUT-NOT-A-SPLIT":22,"T3-CROSS-LINE":13,
        "T2-ONLY-DELIM-PROBE":10,"T4-NO-REPAIR":1}

`350 − 48 = 302`、`99 − 48 = 51`，两边都对得上，说明这一批零连带：既没多修，也没新坏。
`.tools/gate.py D` 复量 734 篇全 CLEAN。

残留 51 处／37 篇的逐行工单（篇:行、探针字符、前后 30 字符窗口）在
`_work/dollarmath_residual.md`，由 `_work/dollarmath_residual.py` 从第二遍读数生成，
偏移是修后的新偏移，可直接按窗口起 Edit。

## 四、另一条线索

31 篇里仍有 13 行逐行 `$` 计数为奇：
D113:31,32／D219:49,119／D38:157／D47:191／D52:603／D59:302／D79:104／D85:50,939／D92:220,230。
奇偶改动与本批无关（本批不动 `$`），是既有形状。按 `note-inline-code-backtick-vs-dollar`
的口径：**先读那一行**——式内记号引用（把 `$` 本身当记号）＝登记不动，误写闭合符＝就地改回反引号。
