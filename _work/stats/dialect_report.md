# preprints 语料 LaTeX 方言分布报告（tex→typst 转换器语法支持依据）

- 语料：`E:/math/preprints`，722 篇论文，参与统计的 .tex 文件 **7529** 个（另有 200 个 vendored 文件被排除：build/tools、build/vendor、texmf 内的 pgf 源码树、glyphtounicode.tex 等，它们不是论文正文，会严重污染统计）。
- 处理时已剥离 LaTeX 注释。参考文献 .bib 共 501 个（本次仅统计 .tex 方言）。
- 表头约定：**次数** = 全语料出现总数；**论文数** = 至少出现一次的论文篇数（共 722）。

## 1. \usepackage 包名分布

共 10554 次加载，70 个不同包名（已处理逗号多包写法）。

| 包名 | 次数 | 论文数 | | 包名 | 次数 | 论文数 |
|---|---|---|---|---|---|---|
| hyperref | 726 | 722 | | tocbibind | 10 | 10 |
| amssymb | 725 | 721 | | hypcap | 9 | 9 |
| geometry | 723 | 720 | | aliascnt | 9 | 9 |
| amsmath | 721 | 717 | | caption | 4 | 4 |
| microtype | 719 | 717 | | enumerate | 4 | 4 |
| amsthm | 711 | 709 | | eucal | 3 | 3 |
| mathtools | 703 | 701 | | textcomp | 3 | 3 |
| fontenc | 698 | 695 | | ragged2e | 3 | 3 |
| lmodern | 667 | 664 | | esint | 3 | 3 |
| tikz | 542 | 541 | | unicode-math | 2 | 1 |
| enumitem | 495 | 494 | | upquote | 2 | 2 |
| booktabs | 458 | 458 | | courier | 2 | 2 |
| xcolor | 411 | 411 | | fp | 2 | 1 |
| array | 299 | 299 | | newtxtext | 2 | 2 |
| inputenc | 260 | 259 | | newtxmath | 2 | 2 |
| cleveref | 212 | 212 | | cite | 2 | 2 |
| graphicx | 194 | 193 | | pict2e | 2 | 2 |
| needspace | 171 | 171 | | fancyhdr | 2 | 2 |
| mathrsfs | 150 | 150 | | letltxmacro | 1 | 1 |
| natbib | 137 | 137 | | color | 1 | 1 |
| longtable | 134 | 134 | | pdfpages | 1 | 1 |
| xurl | 117 | 117 | | iftex | 1 | 1 |
| bookmark | 89 | 89 | | parskip | 1 | 1 |
| url | 72 | 72 | | newunicodechar | 1 | 1 |
| bm | 60 | 60 | | fvextra | 1 | 1 |
| tikz-cd | 55 | 54 | | adjustbox | 1 | 1 |
| flafter | 46 | 46 | | selnolig | 1 | 1 |
| placeins | 44 | 44 | | cmap | 1 | 1 |
| float | 32 | 32 | | doi | 1 | 1 |
| mathpazo | 22 | 22 | | babel | 1 | 1 |
| etoolbox | 22 | 22 | | fancyvrb | 1 | 1 |
| listings | 19 | 19 | | multicol | 1 | 1 |
| accsupp | 14 | 14 | | xspace | 1 | 1 |
| amscd | 12 | 12 | | tocloft | 1 | 1 |
| tabularx | 11 | 11 | | amsfonts | 1 | 1 |

要点：核心七件套 hyperref/amssymb/geometry/amsmath/microtype/amsthm/mathtools 覆盖几乎全部论文；
数学方言 = amsmath+mathtools+amsthm 全家桶；`bm`(60)、`mathrsfs`(150 篇)、`tikz`+`tikz-cd`(542/55 篇)、`enumitem`(495 篇)、`natbib`(137 篇)。
（另有 `\\RequirePackage` 共 0 次 / 0 种，未并入上表。）

## 2. 定理声明

`\newtheorem` 共 **4552** 次声明，34 个不同 env 名；其中共享计数器写法 `\newtheorem{x}[theorem]{X}` 共 0 次；按节编号 `...{X}[section]` 后置写法次数按 within 目标分布：[['theorem', 3747], ['lemma', 16], ['proposition', 9], ['corollary', 9], ['definition', 8], ['remark', 8], ['convention', 2], ['example', 2], ['maintheorem', 2], ['claim', 1]]。

### 声明的 env 名全表
| env | 声明次数 | 论文数 |||
|---|---|---|---|---|
| theorem | 724 | 722 | lemma | 724 | 722 | proposition | 720 | 718 |
| remark | 712 | 710 | corollary | 707 | 705 | definition | 631 | 629 |
| example | 80 | 80 | convention | 51 | 51 | assumption | 49 | 49 |
| notation | 48 | 47 | claim | 46 | 45 | hypothesis | 15 | 15 |
| conjecture | 10 | 10 | construction | 9 | 9 | maintheorem | 3 | 3 |
| thm | 2 | 1 | inputresult | 2 | 2 | procedure | 2 | 2 |
| maincorollary | 2 | 2 | lem | 1 | 1 | algorithm | 1 | 1 |
| companionresults | 1 | 1 | unnumberedproposition | 1 | 1 | inputtheorem | 1 | 1 |
| verification | 1 | 1 | principle | 1 | 1 | standinginput | 1 | 1 |
| foundation | 1 | 1 | inputthm | 1 | 1 | slogan | 1 | 1 |
| question | 1 | 1 | externalinput | 1 | 1 | auxlemma | 1 | 1 |
| auxproposition | 1 | 1 | ||| |

### 声明形式 top20（原文）
| 声明形式 | 次数 | 论文数 |
|---|---|---|
| `\newtheorem{theorem}{Theorem}` | 724 | 722 |
| `\newtheorem{lemma}[theorem]{Lemma}` | 711 | 709 |
| `\newtheorem{proposition}[theorem]{Proposition}` | 708 | 706 |
| `\newtheorem{remark}[theorem]{Remark}` | 701 | 699 |
| `\newtheorem{corollary}[theorem]{Corollary}` | 695 | 693 |
| `\newtheorem{definition}[theorem]{Definition}` | 620 | 618 |
| `\newtheorem{example}[theorem]{Example}` | 77 | 77 |
| `\newtheorem{convention}[theorem]{Convention}` | 49 | 49 |
| `\newtheorem{assumption}[theorem]{Assumption}` | 48 | 48 |
| `\newtheorem{notation}[theorem]{Notation}` | 48 | 47 |
| `\newtheorem{claim}[theorem]{Claim}` | 41 | 41 |
| `\newtheorem{hypothesis}[theorem]{Hypothesis}` | 14 | 14 |
| `\newtheorem{conjecture}[theorem]{Conjecture}` | 10 | 10 |
| `\newtheorem{construction}[theorem]{Construction}` | 9 | 9 |
| `\newtheorem{proposition}[proposition]{Proposition}` | 9 | 9 |
| `\newtheorem{lemma}[lemma]{Lemma}` | 9 | 9 |
| `\newtheorem{corollary}[corollary]{Corollary}` | 9 | 9 |
| `\newtheorem{definition}[definition]{Definition}` | 8 | 8 |
| `\newtheorem{remark}[remark]{Remark}` | 8 | 8 |
| `\newtheorem{lemma}{Lemma}` | 4 | 4 |

### \theoremstyle 分布
共 1263 次：
| 取值 | 次数 | 论文数 |
|---|---|---|
| `definition` | 632 | 629 |
| `remark` | 615 | 614 |
| `plain` | 16 | 16 |

`definition`/`remark` 两种风格几乎固定成对出现在 preamble（约 620+ 篇），`plain` 仅 16 篇。

## 3. \begin{env} 环境使用全表

共 114662 处、76 个不同环境名。全表如下（按次数降序）：

| env | 次数 | 论文数 || 次数 | 论文数 || 次数 | 论文数 |
|---|---|---|---|---|---|---|---|---|
| `equation` | 52246 | 719 | `proof` | 20449 | 721 | `lemma` | 12819 | 721 |
| `proposition` | 4894 | 691 | `align` | 2679 | 554 | `theorem` | 2291 | 719 |
| `enumerate` | 2024 | 511 | `split` | 1890 | 432 | `align*` | 1722 | 506 |
| `aligned` | 1500 | 395 | `corollary` | 1299 | 532 | `cases` | 1071 | 437 |
| `figure` | 1008 | 600 | `pmatrix` | 1001 | 242 | `tikzpicture` | 941 | 531 |
| `gathered` | 940 | 330 | `array` | 737 | 291 | `document` | 728 | 722 |
| `abstract` | 725 | 722 | `remark` | 608 | 309 | `definition` | 573 | 248 |
| `scope` | 391 | 139 | `tabular` | 337 | 184 | `thebibliography` | 233 | 232 |
| `center` | 208 | 125 | `itemize` | 192 | 81 | `equation*` | 145 | 12 |
| `table` | 129 | 82 | `smallmatrix` | 128 | 75 | `samepage` | 117 | 80 |
| `tikzcd` | 116 | 49 | `minipage` | 86 | 39 | `gather` | 53 | 40 |
| `gather*` | 34 | 33 | `convention` | 33 | 14 | `verbatim` | 32 | 13 |
| `assumption` | 22 | 13 | `picture` | 22 | 19 | `Verbatim` | 22 | 1 |
| `quote` | 21 | 18 | `lstlisting` | 18 | 9 | `psmallmatrix` | 15 | 8 |
| `claim` | 14 | 7 | `longtable` | 13 | 10 | `CD` | 13 | 7 |
| `foundation` | 13 | 1 | `example` | 10 | 4 | `description` | 8 | 8 |
| `hypothesis` | 8 | 3 | `auxproposition` | 8 | 1 | `auxlemma` | 7 | 1 |
| `matrix` | 5 | 3 | `notation` | 5 | 5 | `bmatrix` | 5 | 2 |
| `procedure` | 5 | 2 | `standinginput` | 5 | 1 | `maintheorem` | 4 | 3 |
| `externalinput` | 4 | 1 | `multline` | 3 | 3 | `companionresults` | 3 | 1 |
| `tabularx` | 3 | 3 | `unnumberedproposition` | 3 | 1 | `multline*` | 3 | 3 |
| `alignat` | 3 | 1 | `construction` | 3 | 1 | `verification` | 2 | 1 |
| `principle` | 2 | 1 | `maincorollary` | 2 | 2 | `fixedfigure` | 2 | 1 |
| `thm` | 1 | 1 | `chordfigure` | 1 | 1 | `subequations` | 1 | 1 |
| `small` | 1 | 1 | `tabbing` | 1 | 1 | `multicols` | 1 | 1 |
| `question` | 1 | 1 | ||| |

重点分组判读：
- **数学排版**：`equation`(52246/719篇) 一统天下；`align`+`align*`(4401)、`split`(1890)、`aligned`(1500)、`gathered`(940)、`cases`(1071)、`pmatrix`(1001)、`array`(737)、`smallmatrix`(128)、`gather/gather*`(87)、`multline*`(6)、`alignat`(3)、`subequations`(仅1篇)、`eqnarray` 0 次。matrix 家族 + split/aligned/cases 必须全支持；alignat/gather/multline 属可低成本兜底。
- **浮动体**：`figure` 1008 次/600 篇（多为纯 TikZ/内嵌图，`\includegraphics` 仅 30 次/16 篇），`table` 129/82，`tabular(+*)` 337/184，无 `subfigure`/`subtable`/`longtable` 使用环境本体（longtable 13 次/10 篇）。
- **TikZ**：`tikzpicture` 941/531 篇，`scope` 391/139 篇，`tikzcd` 116/49 篇。
- **定理类**：`proof` 20449/721 篇、`lemma` 12819、`proposition` 4894、`theorem` 2291、`corollary` 1299、`remark` 608、`definition` 573，其余自定义名均 <35 次。
- **列表/其它**：`enumerate` 2024/511、`itemize` 192/81、`description` 8/8、`quote` 21、`center` 208；`verbatim` 32/13、`lstlisting` 18/9；`algorithm` 环境 0 次；`minipage` 86/39、`samepage` 117/80。

## 4. 数学命令分布（$...$、\[..\]、数学环境内部）

识别数学区 1293533 个，区内命令共 1833546 次、1673 种。标志列含义：**Y**=typst 同名可用；**A**=typst 有等价但异名/换写法；**R**=typst 无同名命令、需重写或兜底；**U**=语料 preamble 自定义宏（转换时展开）；**T**=结构命令（环境边界/编号/标签）；**?**=需人工核对。

### Top 120
| # | 命令 | 次数 | 论文数 | typst | 映射/备注 |
|---|---|---|---|---|---|
| 1 | `\le` | 97256 | 659 | A | lt.eq(leq) |
| 2 | `\mathcal` | 66366 | 685 | A | cal |
| 3 | `\begin` | 64395 | 722 | T | 结构命令（环境/编号/引用翻译） |
| 4 | `\label` | 57165 | 721 | T | 结构命令（环境/编号/引用翻译） |
| 5 | `\qquad` | 56443 | 722 | A | h(2em) |
| 6 | `\in` | 52992 | 722 | Y | 同名可用 |
| 7 | `\frac` | 50692 | 699 | A | frac()调用式 |
| 8 | `\ge` | 41768 | 659 | A | gt.eq(geq) |
| 9 | `\sum` | 37845 | 711 | Y | 同名可用 |
| 10 | `\delta` | 34811 | 676 | Y | 希腊字母同名 |
| 11 | `\ell` | 32746 | 681 | Y | 同名可用 |
| 12 | `\lambda` | 32218 | 665 | Y | 希腊字母同名 |
| 13 | `\alpha` | 30622 | 662 | Y | 希腊字母同名 |
| 14 | `\log` | 27084 | 533 | Y | 同名可用 |
| 15 | `\eta` | 26612 | 649 | Y | 希腊字母同名 |
| 16 | `\beta` | 24224 | 628 | Y | 希腊字母同名 |
| 17 | `\pi` | 23436 | 634 | Y | 希腊字母同名 |
| 18 | `\rho` | 23379 | 663 | Y | 希腊字母同名 |
| 19 | `\to` | 22424 | 707 | A | arrow.r |
| 20 | `\sigma` | 22077 | 628 | Y | 希腊字母同名 |
| 21 | `\mu` | 21756 | 591 | Y | 希腊字母同名 |
| 22 | `\leq` | 21500 | 445 | A | lt.eq |
| 23 | `\tau` | 21164 | 604 | Y | 希腊字母同名 |
| 24 | `\mathrm` | 19811 | 605 | A | upright |
| 25 | `\infty` | 19404 | 636 | A | infinity |
| 26 | `\nu` | 19369 | 560 | Y | 希腊字母同名 |
| 27 | `\gamma` | 19090 | 595 | Y | 希腊字母同名 |
| 28 | `\operatorname` | 18291 | 673 | A | op() |
| 29 | `\sqrt` | 17944 | 548 | Y | 同名可用 |
| 30 | `\theta` | 17796 | 554 | Y | 希腊字母同名 |
| 31 | `\left` | 17218 | 701 | R | 改 lr("(...)") 自动定尺寸 |
| 32 | `\right` | 17218 | 701 | R | 并入 lr() |
| 33 | `\mathbb` | 17038 | 587 | A | bb / RR |
| 34 | `\int` | 16772 | 495 | Y | 同名可用 |
| 35 | `\quad` | 16057 | 716 | A | h(1em) |
| 36 | `\rm` | 15979 | 362 | R | 旧式开关→upright/文本样式 |
| 37 | `\xi` | 15428 | 528 | Y | 希腊字母同名 |
| 38 | `\Delta` | 14849 | 552 | Y | 希腊字母同名 |
| 39 | `\epsilon` | 14635 | 472 | Y | 希腊字母同名 |
| 40 | `\chi` | 13473 | 475 | Y | 希腊字母同名 |
| 41 | `\kappa` | 12709 | 477 | Y | 希腊字母同名 |
| 42 | `\varepsilon` | 12408 | 506 | Y | 希腊字母同名 |
| 43 | `\text` | 12194 | 702 | A | 字符串/quote |
| 44 | `\bigl` | 12087 | 705 | R | 无等价，需重写/兜底 |
| 45 | `\bigr` | 12087 | 705 | R | 无等价，需重写/兜底 |
| 46 | `\geq` | 11861 | 448 | A | gt.eq |
| 47 | `\omega` | 11506 | 469 | Y | 希腊字母同名 |
| 48 | `\otimes` | 11491 | 449 | A | circle.times |
| 49 | `\partial` | 11282 | 441 | Y | 同名可用 |
| 50 | `\ldots` | 10661 | 687 | A | dots.h |
| 51 | `\mathfrak` | 10573 | 304 | A | frak |
| 52 | `\phi` | 10509 | 435 | Y | 希腊字母同名 |
| 53 | `\dd` | 10425 | 146 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 54 | `\mathbf` | 10404 | 486 | A | bold |
| 55 | `\cdot` | 10137 | 605 | A | dot.op |
| 56 | `\longrightarrow` | 9998 | 637 | A | arrow.r.long |
| 57 | `\E` | 9362 | 210 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 58 | `\Gamma` | 9247 | 425 | Y | 希腊字母同名 |
| 59 | `\times` | 9101 | 603 | Y | 同名可用 |
| 60 | `\widetilde` | 8877 | 521 | A | accent(sized) |
| 61 | `\widehat` | 8830 | 482 | A | accent(sized) |
| 62 | `\mathsf` | 8830 | 325 | A | sans |
| 63 | `\zeta` | 8794 | 427 | Y | 希腊字母同名 |
| 64 | `\psi` | 8687 | 422 | Y | 希腊字母同名 |
| 65 | `\Lambda` | 8485 | 409 | Y | 希腊字母同名 |
| 66 | `\Omega` | 8345 | 428 | Y | 希腊字母同名 |
| 67 | `\ne` | 8206 | 685 | A | eq.not |
| 68 | `\end` | 7821 | 682 | T | 结构命令（环境/编号/引用翻译） |
| 69 | `\subset` | 7791 | 571 | ? | 低频/需人工核对 |
| 70 | `\prod` | 7398 | 528 | A | product |
| 71 | `\Phi` | 7239 | 452 | Y | 希腊字母同名 |
| 72 | `\eps` | 7178 | 126 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 73 | `\bar` | 7127 | 342 | A | macron |
| 74 | `\nabla` | 7012 | 237 | Y | 同名可用 |
| 75 | `\overline` | 6933 | 497 | A | accent.double |
| 76 | `\R` | 6895 | 397 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 77 | `\exp` | 6874 | 458 | Y | 同名可用 |
| 78 | `\rangle` | 6694 | 452 | A | angle.r |
| 79 | `\cap` | 6566 | 588 | A | inter |
| 80 | `\norm` | 6501 | 142 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 81 | `\langle` | 6323 | 451 | A | angle.l(chevron.l) |
| 82 | `\max` | 6137 | 619 | Y | 同名可用 |
| 83 | `\mid` | 6084 | 371 | A | mid(stile) |
| 84 | `\Z` | 5863 | 298 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 85 | `\Q` | 5687 | 149 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 86 | `\min` | 5678 | 560 | Y | 同名可用 |
| 87 | `\varphi` | 5013 | 318 | Y | 希腊字母同名 |
| 88 | `\circ` | 4790 | 422 | A | compose(circ) |
| 89 | `\setminus` | 4497 | 533 | A | without |
| 90 | `\pm` | 4491 | 401 | A | plus.minus |
| 91 | `\Sigma` | 4410 | 202 | Y | 希腊字母同名 |
| 92 | `\subseteq` | 4305 | 423 | A | subset.eq |
| 93 | `\dim` | 4237 | 316 | Y | 同名可用 |
| 94 | `\C` | 4009 | 254 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 95 | `\tfrac` | 3720 | 451 | A | frac |
| 96 | `\sup` | 3352 | 423 | Y | 同名可用 |
| 97 | `\Pi` | 3351 | 242 | Y | 希腊字母同名 |
| 98 | `\Psi` | 3267 | 233 | Y | 希腊字母同名 |
| 99 | `\Theta` | 2926 | 222 | Y | 希腊字母同名 |
| 100 | `\cdots` | 2885 | 545 | A | dots.h.c |
| 101 | `\mathscr` | 2879 | 118 | A | script |
| 102 | `\ll` | 2840 | 157 | A | ll |
| 103 | `\mapsto` | 2813 | 583 | A | mapsto(alias) |
| 104 | `\det` | 2687 | 308 | Y | 同名可用 |
| 105 | `\sim` | 2603 | 327 | A | tilde |
| 106 | `\lfloor` | 2592 | 384 | A | floor.l |
| 107 | `\rfloor` | 2582 | 380 | A | floor.r |
| 108 | `\downarrow` | 2561 | 385 | A | arrow.t |
| 109 | `\cup` | 2541 | 429 | A | union |
| 110 | `\vartheta` | 2539 | 176 | Y | 希腊字母同名 |
| 111 | `\simeq` | 2521 | 210 | A | tilde.equiv |
| 112 | `\abs` | 2460 | 86 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 113 | `\F` | 2370 | 98 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 114 | `\wedge` | 2350 | 198 | A | and |
| 115 | `\tr` | 2338 | 116 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 116 | `\OO` | 2279 | 37 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |
| 117 | `\perp` | 2252 | 273 | A | tack |
| 118 | `\oplus` | 2146 | 306 | A | circle.plus |
| 119 | `\asymp` | 2132 | 186 | A | dot.tilde |
| 120 | `\PP` | 2021 | 83 | U | 语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开 |

Top120 覆盖数学命令总频次的 **92.1%**。按标志分组：Y 类占 40.1%、A 类占 36.7%、T 类占 7.1%、R 类占 4.1%、U 类占 3.7%、? 类占 0.4%。

### 重点：typst 数学里没有同名命令的（全语料精确计数，含数学区外）

| 命令 | 次数 | 论文数 | typst 处置建议 |
|---|---|---|---|
| `\mathcal` | 67022 | 702 | 映射为 cal 字母转换（语料最高频风格命令） |
| `\mathrm` | 20453 | 637 | upright |
| `\mathbb` | 19497 | 713 | bb / 预定义 RR,NN,ZZ,QQ,CC |
| `\operatorname` | 18935 | 687 | op("name") 或自定义函数 |
| `\text` | 12236 | 702 | 数学内字符串 "..." |
| `\bigl` | 12087 | 705 | 手动指定 delimiters 或 scale；typst lr 自动定大小可整体退化 |
| `\bigr` | 12087 | 705 | 同上 |
| `\mathbf` | 10674 | 558 | bold |
| `\mathfrak` | 10618 | 311 | frak |
| `\mathsf` | 8912 | 336 | sans |
| `\overline` | 6969 | 502 |  |
| `\rangle` | 6799 | 484 | angle.r |
| `\langle` | 6428 | 483 | angle.l |
| `\mid` | 6085 | 371 |  |
| `\circ` | 4794 | 422 |  |
| `\mathscr` | 2895 | 120 | script（mathrsfs 风格） |
| `\oplus` | 2146 | 306 | circle.plus 类合成名 |
| `\substack` | 2008 | 411 | 多行限制下标：stack/align 重写 |
| `\binom` | 1969 | 324 | binom(a,b) |
| `\big` | 1920 | 253 | 同上 |
| `\boldsymbol` | 1788 | 127 | bold |
| `\varnothing` | 1730 | 370 | nothing |
| `\notin` | 1605 | 414 | not.in |
| `\hbox` | 1443 | 341 | 重写为内容嵌入 |
| `\xrightarrow` | 1384 | 180 |  |
| `\dagger` | 798 | 59 | 符号表核对（typst 有 dagger 名词） |
| `\bigoplus` | 981 | 227 | op + attach |
| `\foreach` | 685 | 210 | TikZ 循环 → 无法直译，兜底 |
| `\lVert` | 546 | 200 |  |
| `\rVert` | 546 | 200 |  |
| `\mathtt` | 312 | 8 | mono |
| `\lvert` | 384 | 168 |  |
| `\rvert` | 351 | 168 |  |
| `\Bigl` | 323 | 114 | 同上 |
| `\Bigr` | 325 | 114 | 同上 |
| `\hat` | 312 | 19 |  |
| `\Big` | 212 | 56 | 同上 |
| `\middle` | 199 | 88 | lr 内不可分段放大 → 需拆 lr 或用 mid |
| `\twoheadrightarrow` | 166 | 50 |  |
| `\filldraw` | 129 | 40 |  |
| `\varprojlim` | 104 | 33 |  |
| `\underbrace` | 90 | 36 | 同上 |
| `\coprod` | 88 | 40 |  |
| `\emptyset` | 82 | 12 |  |
| `\propto` | 47 | 19 |  |
| `\varinjlim` | 33 | 16 |  |
| `\Bbbk` | 27 | 4 | bb k 或符号兜底 |
| `\Bigg` | 26 | 11 | 同上 |
| `\overset` | 22 | 15 | underover(top:) |
| `\stackrel` | 22 | 19 | underover/attach |
| `\underset` | 18 | 7 | underover(bottom:) |
| `\choose` | 21 | 2 | binom |
| `\genfrac` | 12 | 1 | 自定义 frac 参数 |
| `\shade` | 9 | 2 | TikZ 渐变 → 兜底 |
| `\pic` | 4 | 1 | TikZ 自定义图形 → 兜底 |
| `\iiint` | 9 | 2 |  |
| `\tbinom` | 6 | 3 | binom |
| `\nearrow` | 5 | 3 |  |
| `\sideset` | 1 | 1 | attach 手工重写 |
| `\phantom` | 2 | 2 |  |
| `\ddots` | 1 | 1 |  |

### \left/\right 定界符分布（数学区内配对计数）

| `\left` 后定界符 | 次数 | | `\right` 后定界符 | 次数 |
|---|---|---|---|---|
| `(` | 10361 | | `)` | 10364 |
| `|` | 1873 | | `|` | 2047 |
| `[` | 1831 | | `]` | 1828 |
| `\{` | 1456 | | `\}` | 1461 |
| `\|` | 601 | | `\|` | 601 |
| `\lfloor` | 356 | | `\rfloor` | 356 |
| `\lceil` | 296 | | `\rceil` | 296 |
| `\langle` | 244 | | `\rangle` | 244 |
| `.` | 185 | | `\rVert` | 15 |
| `\lVert` | 15 | | `.` | 6 |

`\left`/`\right` 总计 17218 对；定界符仅 10 种：`(` `)` `|` `[` `]` `\{` `\}` `\|` `\lfloor/\lceil/\langle` 等 + 静点 `.`（半对空定界符，185 次，转换时映射为 typst lr 的 none 侧）。`\middle` 199 次/88 篇。整体可被 typst `lr()` 自动 sizing 覆盖，仅需一张定界符名映射表。

## 5. TikZ 使用画像

- `tikzpicture` 总数 **941**，使用论文 **531/722**，平均每使用篇 1.77 个（另有单篇内联 `\tikz` 命令热点一篇）。最多的一篇：`Self-dual-random-cluster-interfaces-below-one-September-23-2026` = 12 个 picture（但该篇 `A-polynomial-time-algorithm-for-three-machine-unit-job-scheduling` 有 **3829** 个内联 `\tikz` 小图（甘特图表格），是全语料 TikZ 的极端离群点）。
- **pgfplots：`\begin{axis}`/`group`/`plot` 共 0 次，0 篇** —— 可完全不支持 pgfplots。
- `tikz-cd`（`\begin{tikzcd}`）116 次/49 篇，是图表类 TikZ 的主要形态（交换图表）。

### \usetikzlibrary 分布
| library | 次数 | 论文数 |
|---|---|---|
| `arrows.meta` | 476 | 475 |
| `positioning` | 411 | 410 |
| `calc` | 338 | 334 |
| `fit` | 101 | 101 |
| `patterns` | 99 | 98 |
| `decorations.pathreplacing` | 96 | 96 |
| `backgrounds` | 28 | 28 |
| `matrix` | 9 | 9 |
| `shapes.geometric` | 7 | 7 |
| `decorations.markings` | 6 | 6 |
| `bending` | 3 | 1 |
| `decorations` | 2 | 1 |
| `lindenmayersystems` | 2 | 1 |
| `decorations.pathmorphing` | 1 | 1 |
| `snakes` | 1 | 1 |
| `animations` | 1 | 1 |
| `calendar` | 1 | 1 |
| `datavisualization` | 1 | 1 |

### tikzpicture 内命令频次（top，节选）
| 命令 | 次数 | 论文数 | 说明 |
|---|---|---|---|
| `\node` | 8221 | 530 | 文字/数学标签 |
| `\draw` | 6959 | 528 | 画线/路径 |
| `\fill` | 1607 | 295 | 填充 |
| `\foreach` | 667 | 210 | 循环（无法机械直译） |
| `\coordinate` | 428 | 78 | 坐标点 |
| `\begin` | 388 | 139 |  |
| `\end` | 388 | 139 |  |
| `\path` | 128 | 34 | 路径定义 |
| `\filldraw` | 125 | 39 | 填充+描边 |
| `(inline \tikz)` | 3829 | 1 |  |

（表中 `\x/\y/\i/\j/\k/yy` 等为论文自定义宏或小写缩写，未列入；`\small/\footnotesize/\textbf` 等是节点内文本样式。）

**可自动重画 vs 兜底判断**：library 需求集中在 arrows.meta+positioning+calc+fit+patterns+decorations.pathreplacing 六件套（合计占加载次数 ~95%）。picture 主体是 `\node`+`\draw`(带坐标/箭头/虚线) 的交换图、简单几何示意；`\foreach`(667次/210篇)、`decorations`(brace 标注)、`patterns/shade/pic/clip` 属于难以直译集。按出现量估计：**约 80% 的 tikzpicture 可用 typst 内置 grid/cell+line+curve 或简单 path 自动重画**（node+draw+-|+arrow 语法可覆盖），**15-20% 需兜底**（编译成 PNG 嵌入：tikzcd 中复杂 commutative 图可特判，patterns/shade/decorations.markings/foreach 及那篇 3829 内联图论文）。

## 6. 交叉引用写法

| 命令 | 次数 | 论文数 |
|---|---|---|
| `\eqref` | 68802 | 715 |
| `\ref` | 60108 | 696 |
| `\cite` | 29176 | 701 |
| `\Cref` | 8830 | 95 |
| `\cref` | 2648 | 43 |
| `\citep` | 1341 | 56 |
| `\citet` | 816 | 65 |
| `\Citet` | 1 | 1 |
| `\autoref` | 0 | 0 |
| `\cite*` | 0 | 0 |

`\autoref`/`\cite*`/`\nocite`/`\parencite`/`\textcite` 全为 0。`\cite` 29176 次（701 篇）为绝对主流，natbib 的 citep/citet 仅 121 篇使用，cleveref 95+43 篇。

### \label 前缀分布（共 89107 个 label）
| 前缀 | 次数 | 论文数 || 前缀 | 次数 | 论文数 |
|---|---|---|---|---|---|---|
| `eq:` | 29231 | 589 | | `lem:` | 6256 | 529 |
| `sec:` | 4884 | 671 | | `(no-prefix)` | 3336 | 37 |
| `prop:` | 2485 | 502 | | `thm:` | 1564 | 644 |
| `fig:` | 822 | 534 | | `cor:` | 775 | 389 |
| `four:` | 726 | 5 | | `geo:` | 521 | 27 |
| `l:` | 433 | 2 | | `tra:` | 425 | 2 |
| `def:` | 343 | 161 | | `c:` | 334 | 9 |
| `cert:` | 330 | 12 | | `alg:` | 323 | 17 |
| `rec:` | 317 | 10 | | `comp:` | 312 | 16 |
| `loc:` | 312 | 17 | | `geom:` | 308 | 17 |
| `subsec:` | 297 | 89 | | `ext:` | 273 | 14 |
| `g:` | 257 | 4 | | `var:` | 251 | 7 |
| `model:` | 250 | 9 | | `tree:` | 243 | 6 |
| `h:` | 237 | 5 | | `R:` | 233 | 2 |
| `intro:` | 230 | 64 | | `spec:` | 229 | 13 |

### 编号/标签控制
| 项 | 次数 | 论文数 |
|---|---|---|
| `numberwithin_eq_section` | 575 | 573 |
| `numberwithin_eq` | 575 | 573 |
| `tag` | 634 | 53 |
| `notag` | 1242 | 353 |
| `nonumber` | 265 | 89 |

`\numberwithin{equation}{section}` 575 次/573 篇 —— 公式按节编号是默认方言，转换器必须支持（typst: `math.eq(numbering: '1.2')` 风格的全局设置）。

## 7. 影响机械转换的其它结构

| 结构 | 次数 | 论文数 | 备注 |
|---|---|---|---|
| `\input` | 6972 | 700 | 分文件主流：sections/xx 命名；无 \include/\import/\subfile |
| `\include` | 0 | 0 | 不存在 |
| `\import` | 0 | 0 | 不存在 |
| `\subfile` | 0 | 0 | 不存在 |
| `\newcommand` | 5809 | 650 | 定义宏的主力 |
| `\renewcommand` | 226 | 161 |  |
| `\providecommand` | 69 | 22 |  |
| `\NewDocumentCommand` | 0 | 0 | 不存在 |
| `\DeclareMathOperator` | 4327 | 568 | 自定义算符主力（568 篇！） |
| `\DeclarePairedDelimiter` | 67 | 29 | norm/abs 类配对定界符 |
| `\newenvironment` | 2 | 2 | 几乎不用自定义环境 |
| `\def` | 4402 | 145 | 集中在少数论文（top: \def\csname…），排除 vendored pgf 后仅 4402 次/145 篇 |
| `\newsavebox` | 0 | 0 | 不存在 |
| `\sbox` | 0 | 0 | 不存在 |
| `\parbox` | 43 | 10 |  |
| `\minipage` | 86 | 39 |  |
| `\footnote` | 33 | 30 | 极少（arXiv 数学预印本特征） |
| `\footnotetext` | 0 | 0 | 不存在 |
| `\thanks` | 0 | 0 | 不存在 |
| `\maketitle` | 729 | 721 | 721/722 篇走标准 title 流水线 |
| `\tableofcontents` | 412 | 411 |  |
| `\appendix` | 158 | 158 |  |
| `\thebibliography` | 233 | 232 | 手写参考文献（bibitem 5242 条），其余 490 篇走 bibtex(.bib) |
| `\bibitem` | 5242 | 232 |  |
| `\verbatim` | 32 | 13 |  |
| `\lstlisting` | 18 | 9 |  |
| `\algorithm_env` | 0 | 0 | 不存在 |
| `\floats_fig` | 1008 | 600 |  |
| `\floats_tab` | 129 | 82 |  |
| `\tabular_star` | 337 | 184 |  |
| `\includegraphics` | 30 | 16 | 外链图片极少，图基本由 TikZ 生成 |
| `\resizebox` | 7 | 5 |  |
| `\scalebox` | 2 | 1 |  |
| `\subfigure_cmd` | 0 | 0 | 不存在 |
| `\qed` | 19 | 17 |  |
| `\allowdisplaybreaks` | 203 | 201 | 长公式跨页断行 203 次/201 篇 |
| `\numberwithin_any` | 577 | 573 |  |
| `\noindent` | 1679 | 224 |  |
| `\newline` | 106 | 25 |  |
| `\linebreak` | 2 | 2 |  |
| `\hspace` | 331 | 200 |  |
| `\emph` | 15581 | 705 | 文本强调主力 |
| `\textit` | 244 | 39 |  |
| `\textbf` | 4412 | 305 |  |
| `\item` | 6676 | 525 |  |
| `\centering_vs_center` | 0 | 0 | 不存在 |
| `\url` | 862 | 71 |  |
| `\href` | 4945 | 229 | hyperref 内联链接 |
| `\hyperref_cmd` | 17 | 9 |  |
| `\textcircled` | 0 | 0 | 不存在 |

### 宏定义规模
- `\newcommand` 家族（new/renew/provide，brace 名式）共 6012 次、660 篇；其中带参（body 含 #1..#9）**573 次（10%），涉及 258 篇 → 转换器需支持 0/1/2 参宏展开，多数是无参缩写宏（如 `\E=\mathbb{{E}}`, `\dd` 微分号, `\norm` 配对定界符）。
- 高频自定义数学宏 top（次数/论文数/定义篇数）：

| 宏 | 数学区使用 | 使用论文 | 定义论文 |
|---|---|---|---|
| `\dd` | 10425 | 146 | 166 |
| `\longrightarrow` | 9998 | 637 | 5 |
| `\E` | 9362 | 210 | 223 |
| `\ne` | 8206 | 685 | 1 |
| `\eps` | 7178 | 126 | 157 |
| `\R` | 6895 | 397 | 457 |
| `\norm` | 6501 | 142 | 184 |
| `\Z` | 5863 | 298 | 338 |
| `\Q` | 5687 | 149 | 170 |
| `\C` | 4009 | 254 | 294 |
| `\mathscr` | 2879 | 118 | 11 |
| `\mapsto` | 2813 | 583 | 15 |
| `\abs` | 2460 | 86 | 142 |
| `\F` | 2370 | 98 | 105 |
| `\tr` | 2338 | 116 | 174 |
| `\OO` | 2279 | 37 | 41 |
| `\PP` | 2021 | 83 | 98 |
| `\notin` | 1603 | 414 | 1 |
| `\longmapsto` | 1486 | 427 | 12 |
| `\cO` | 1434 | 37 | 47 |
| `\EE` | 1281 | 29 | 32 |
| `\Re` | 1226 | 82 | 2 |
| `\Tr` | 1202 | 87 | 127 |
| `\Prob` | 1101 | 69 | 76 |
| `\Id` | 1031 | 62 | 72 |
| `\ind` | 936 | 60 | 74 |
| `\T` | 918 | 66 | 58 |
| `\one` | 862 | 53 | 62 |

### \documentclass 与 title 块
| docclass | 次数 | 论文数 |
|---|---|---|
| `article` | 683 | 680 |
| `amsart` | 43 | 42 |
| `standalone` | 1 | 1 |

标题块齐全度（按篇）：`\title` 721/722、`\author` 722/722、`\date` 721（多数 `\date{}` 置空）、`\maketitle` 721。→ title 流水线完全标准化，可用单一模板转换；abstract 环境 725 次/722 篇，也齐全。

### bibliographystyle 取值
| style | 次数 | 论文数 |
|---|---|---|
| `plain` | 281 | 281 |
| `plainnat` | 122 | 122 |
| `amsplain` | 41 | 41 |
| `alpha` | 22 | 22 |
| `alphaurl` | 7 | 7 |
| `abbrvnat` | 6 | 6 |
| `abbrv` | 5 | 5 |
| `plainurl` | 2 | 2 |
| `support/alpha-linked` | 2 | 2 |
| `alpha-linked` | 2 | 2 |
| `amsalpha` | 1 | 1 |
| `astra-plain` | 1 | 1 |

492 次声明；`plain`+`plainnat` 占 82%。手写 `thebibliography` 232 篇 vs .bib 501 个文件（两种路线并存，转换器需同时支持 bib 解析与 bibitem 直译）。

## 8. 结论性摘要（供转换器取舍）

1. **覆盖 ~95% 语料的窄方言**：amsmath 子集 = `equation`(含*号) + `split/aligned/gathered/cases` + `pmatrix/smallmatrix/array`；`\left\right` 10 种定界符；希腊字母 + ~40 个关系/运算符；风格命令 6 个（mathcal 67k、mathbb 19k、mathrm 20k、mathfrak 10.6k、mathbf 10.7k、mathsf 8.9k）；spacing quad/qquad；`\text`/`\operatorname`；列表 enumerate/itemize；定理七件套 theorem/lemma/proposition/corollary/definition/remark/example + proof；交叉引用 `\ref`+`\eqref` 为主、`\cite` 为主；`\numberwithin{equation}{section}`；`\input` 分文件 + 标准 title/abstract 模板 + plain/plainnat 文献。把这一层做扎实即覆盖 95%+。
2. **长尾但必须特殊处理**：(a) `\overset/\underset/\stackrel`、`\substack`(2008次/411篇)、`\overbrace/\underbrace`、`\middle`、`bigl/Bigl` 手工定界符（bigl/bigr 12k 次——好在 typst lr 自动 sizing 可整体降级替换，只需保留配对）；(b) `\hbox`(1443/341篇) 与旧式开关 `\rm`(15979/362篇)；(c) 自定义宏体系：`\DeclareMathOperator` 4327 次/568 篇 + `\newcommand` 5.8k 次，必须先做宏展开/注册（尤其 `\E \R \Z \norm \abs \dd` 这类无参宏）；(d) `\tag/\notag`(634/1242 次)、`\subequations`(需计数器语义)、`alignat/multline`(量极小)；(e) verbatim/lstlisting(50 次)、minipage/parbox(129 次) 可用兜底框。
3. **TikZ**：pgfplots = 0，纯 TikZ 941 个 picture/531 篇 + 49 篇 tikzcd。库需求 6 件套 (arrows.meta/positioning/calc/fit/patterns/decorations.pathreplacing) 占 ~95%。结构以 node+draw(坐标/箭头/虚线) 为主 → 约 80% 可用 typst 重画（含 tikzcd 交换图特判），约 15-20% 需 PDF 兜底：`\foreach`(210 篇)、decorations.markings/brace、patterns/shade/clip/pic，以及单篇 3829 个内联 `\tikz` 甘特图的离群论文（建议整篇 figure 兜底）。
4. **可直接忽略**：autoref、subfigure、algorithm、NewDocumentCommand、xparse、import/subfile/include、thanks、newsavebox、cite*、多栏、wrapfig 等 —— 语料中为 0。

---
*生成脚本：analyze2.py + extra.py（只读扫描，无源文件修改）；明细数据见 raw_stats.json / extra_stats.json。*