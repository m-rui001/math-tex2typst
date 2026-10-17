# -*- coding: utf-8 -*-
"""Generate dialect_report.md from raw_stats.json + extra_stats.json."""
import json, re
from collections import Counter

D = "E:/math/_work/stats"
R = json.load(open(D + "/raw_stats.json", encoding="utf-8"))
E = json.load(open(D + "/extra_stats.json", encoding="utf-8"))

GREEK = set("""alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu xi omicron
pi rho sigma tau upsilon phi chi psi omega Gamma Delta Theta Lambda Xi Pi Sigma Upsilon Phi Psi
Omega varepsilon varphi vartheta varrho varpi varsigma""".split())

MAP = {  # typst 有等价物但名字/用法不同
    "le": "lt.eq(leq)", "leq": "lt.eq", "ge": "gt.eq(geq)", "geq": "gt.eq",
    "ne": "eq.not", "neq": "eq.not", "notin": "not.in",
    "infty": "infinity", "cdot": "dot.op", "cdot": "dot.op",
    "pm": "plus.minus", "mp": "minus.plus",
    "to": "arrow.r", "longrightarrow": "arrow.r.long", "Longrightarrow": "arrow.r.double.long",
    "leftarrow": "arrow.l", "rightarrow": "arrow.r", "leftrightarrow": "arrow.l.r",
    "mapsto": "mapsto(alias)", "longmapsto": "mapsto.long",
    "downarrow": "arrow.t", "uparrow": "arrow.b",
    "ldots": "dots.h", "cdots": "dots.h.c", "vdots": "dots.v", "ddots": "dots.down",
    "dots": "dots.h",
    "oplus": "circle.plus", "ominus": "circle.minus", "otimes": "circle.times",
    "odot": "circle.dot", "oslash": "circle.slash", "circ": "compose(circ)",
    "cup": "union", "cap": "inter", "bigcup": "union.big", "bigcap": "inter.big",
    "bigsqcup": "union.disj", "bigoplus": "circle.plus.big", "bigotimes": "circle.times.big",
    "setminus": "without", "subseteq": "subset.eq", "varnothing": "nothing",
    "emptyset": "nothing", "equiv": "equiv", "cong": "tilde.eq", "sim": "tilde",
    "simeq": "tilde.equiv", "asymp": "dot.tilde", "lesssim": "l.tilde.eq",
    "wedge": "and", "vee": "or", "dagger": "dagger(alias)", "perp": "tack",
    "mid": "mid(stile)", "colon": "colon", "angle": "angle",
    "langle": "angle.l(chevron.l)", "rangle": "angle.r", "lvert": "bar.v",
    "rvert": "bar.v", "lVert": "bar.v.double", "rVert": "bar.v.double",
    "lfloor": "floor.l", "rfloor": "floor.r", "lceil": "ceil.l", "rceil": "ceil.r",
    "iint": "integral.double", "iiint": "integral.triple", "oint": "integral.cont",
    "coprod": "product.co", "prod": "product",
    "hat": "hat(调用式)", "tilde": "tilde(调用式)", "dot": "dot(调用式)",
    "ddot": "dot.double", "bar": "macron", "check": "caron", "vec": "arrow.accent",
    "overline": "accent.double", "underline": "underline(调用式)",
    "frac": "frac()调用式", "dfrac": "frac", "tfrac": "frac",
    "binom": "binom()", "text": "字符串/quote", "operatorname": "op()",
    "mathrm": "upright", "mathit": "italic", "mathbf": "bold", "mathsf": "sans",
    "mathtt": "mono", "mathbb": "bb / RR", "mathcal": "cal", "mathfrak": "frak",
    "mathscr": "script", "boldsymbol": "bold", "bm": "bold",
    "quad": "h(1em)", "qquad": "h(2em)", "hspace": "h()", "vspace": "v()",
    "hbar": "hbar?", "aleph": "aleph", "wp": "weierp",
    "limsup": "lim.sup", "liminf": "lim.inf",
    "varinjlim": "arrow.r.hook.barb.long+lim", "varprojlim": "arrow.l.hook.barb.long+lim",
    "ll": "ll", "gg": "gg", "asymp": "dot.tilde",
    "widehat": "accent(sized)", "widetilde": "accent(sized)",
    "xrightarrow": "attach(arrow.r.long)", "xleftarrow": "attach(arrow.l.long)",
    "substack": "stack()/align 重写", "overset": "underover(top)", "underset": "underover(bot)",
    "stackrel": "underover / attach 重写",
    "genfrac": "frac 参数化重写", "choose": "binom", "atop": "frac/mat",
    "sideset": "attach 重写", "slashed": "strike 重写",
    "pmod": "重写为 text+paren", "restriction": "restr", "upharpoonright": "harpoon",
    "coloneqq": "colon.eq",
    "left": "改 lr(\"(...)\") 自动定尺寸", "right": "并入 lr()",
    "rm": "旧式开关→upright/文本样式", "it": "italic", "bf": "bold",
    "hbox": "内容直接嵌入或 figure 兜底", "mbox": "同上", "fbox": "block with frame",
    "raisebox": "h/move 偏移", "smash": "place 补偿", "phantom": "hide()",
    "hphantom": "hide()", "vphantom": "hide()", "rlap": "overlap.hor", "llap": "overlap.hor",
    "strut": "表格行高参数", "mathstrut": "同上", "intertext": "align 行间文本块",
    "subarray": "stack 重写", "smallmatrix": "mat(narrow:true)",
    "bordermatrix": "table 重写", "overbrace": "自定义装饰函数兜底",
    "underbrace": "同上", "middle": "拆入 lr 或 mid", "boxed": "框线重写",
    "newline": "linebreak", "linebreak": "break", "noindent": "indent 设置",
    "tikz": "重画或预渲染 PNG 兜底", "draw": "typst path/兜底", "node": "grid+cell",
    "fill": "path fill", "filldraw": "path fill+stroke", "coordinate": "let 坐标",
    "path": "path 重写", "clip": "crop", "shade": "gradient 兜底", "pic": "兜底",
    "tikzset": "样式宏先展开", "foreach": "循环需手工展开或兜底",
}
PASS = {  # typst 数学中同名可直接用（或等价标准算符名）
    "in", "sum", "int", "lim", "log", "exp", "max", "min", "sup", "det", "dim", "ker",
    "sin", "cos", "tan", "inf", "Pr", "nabla", "partial", "sqrt", "ell", "Re", "Im",
    "times", "ast", "star", "bullet", "prime", "alpha", "hbar",
} | GREEK
STRUCT = {"begin", "end", "label", "notag", "tag", "nonumber", "ref", "eqref",
          "nonumber", "centering", "item", "subeqnarray"}
REWRITE = {  # typst 无直接等价，需重写/兜底
    "left", "right", "bigl", "bigr", "big", "Big", "bigg", "Bigg", "Bigl", "Bigr",
    "biggl", "biggr", "Biggl", "Biggr", "middle",
    "hbox", "mbox", "fbox", "rm", "it", "bf", "mit",
    "overbrace", "underbrace", "substack", "phantom", "hphantom", "vphantom",
    "smash", "raisebox", "rlap", "llap", "mathstrut", "strut", "intertext",
    "subarray", "smallmatrix", "bordermatrix", "boxed",
    "tikz", "pic", "foreach", "draw", "node", "fill", "shade", "filldraw",
    "coordinate", "path", "tikzset", "clip",
    "newline", "linebreak", "noindent",
}

defined = set()
for k, v, p, dp in R["user_macros"]["used_math_defined_top"]:
    defined.add(k)
# these are standard LaTeX commands even though a handful of papers redefine them
STANDARDS = {"ne","notin","longrightarrow","mapsto","mathscr","Re","Im","mid","times","dot",
             "circ","star","ll","to","sup","max","min","log","exp","dim","det","ker","lim",
             "hbar","aleph","perp","angle","dagger","emptyset","varnothing","hat","bar",
             "dots","ldots","cdots","cong","equiv","sim","setminus","sum","int","prod"}
defined -= STANDARDS

def flag(cmd):
    if cmd in STRUCT:
        return "T", "结构命令（环境/编号/引用翻译）"
    if cmd in defined and cmd not in ("mid", "mapsto", "ll", "times"):
        return "U", "语料内自定义宏（多为 DeclareMathOperator/newcommand），转换时展开"
    if cmd in GREEK:
        return "Y", "希腊字母同名"
    if cmd in REWRITE:
        return "R", MAP.get(cmd, "无等价，需重写/兜底")
    if cmd in MAP:
        return "A", MAP[cmd]
    if cmd in PASS:
        return "Y", "同名可用"
    return "?", "低频/需人工核对"

L = []
def w(s=""):
    L.append(s)

meta = R["meta"]
w("# preprints 语料 LaTeX 方言分布报告（tex→typst 转换器语法支持依据）")
w("")
w(f"- 语料：`E:/math/preprints`，{meta['papers']} 篇论文，参与统计的 .tex 文件 **{meta['tex_files']}** 个"
  f"（另有 {meta['excluded_vendored']} 个 vendored 文件被排除：build/tools、build/vendor、texmf 内的 pgf 源码树、"
  "glyphtounicode.tex 等，它们不是论文正文，会严重污染统计）。")
w(f"- 处理时已剥离 LaTeX 注释。参考文献 .bib 共 {R['bib_files']} 个（本次仅统计 .tex 方言）。")
w("- 表头约定：**次数** = 全语料出现总数；**论文数** = 至少出现一次的论文篇数（共 722）。")
w("")

# Q1
u = R["usepackage"]
w(f"## 1. \\usepackage 包名分布")
w("")
w(f"共 {u['total']} 次加载，{u['distinct']} 个不同包名（已处理逗号多包写法）。")
w("")
w("| 包名 | 次数 | 论文数 | | 包名 | 次数 | 论文数 |")
w("|---|---|---|---|---|---|---|")
rows = u["table"]
half = (len(rows) + 1) // 2
for i in range(half):
    a = rows[i]
    b = rows[i + half] if i + half < len(rows) else ("", "", "")
    w(f"| {a[0]} | {a[1]} | {a[2]} | | {b[0]} | {b[1]} | {b[2]} |")
w("")
w("要点：核心七件套 hyperref/amssymb/geometry/amsmath/microtype/amsthm/mathtools 覆盖几乎全部论文；")
w("数学方言 = amsmath+mathtools+amsthm 全家桶；`bm`(60)、`mathrsfs`(150 篇)、`tikz`+`tikz-cd`(542/55 篇)、`enumitem`(495 篇)、`natbib`(137 篇)。")
rq = R["RequirePackage"]
w(f"（另有 `\\\\RequirePackage` 共 {rq['total']} 次 / {rq['distinct']} 种，未并入上表。）")
w("")

# Q2
nt = R["newtheorem"]
w("## 2. 定理声明")
w("")
w(f"`\\newtheorem` 共 **{nt['total']}** 次声明，{nt['distinct_envs']} 个不同 env 名；"
  f"其中共享计数器写法 `\\newtheorem{{x}}[theorem]{{X}}` 共 {nt['shared_counter_decls']} 次；"
  f"按节编号 `...{{X}}[section]` 后置写法次数按 within 目标分布：{nt['within']}。")
w("")
w("### 声明的 env 名全表")
w("| env | 声明次数 | 论文数 |||")
w("|---|---|---|---|---|")
tab = nt["env_table"]
for i in range(0, len(tab), 3):
    cells = tab[i:i+3]
    s = "|"
    for c in cells:
        s += f" {c[0]} | {c[1]} | {c[2]} |"
    for _ in range(3 - len(cells)):
        s += " |||"
    w(s.rstrip("|") + "|")
w("")
w("### 声明形式 top20（原文）")
w("| 声明形式 | 次数 | 论文数 |")
w("|---|---|---|")
for f, c, p in nt["top_forms"]:
    w(f"| `{f}` | {c} | {p} |")
w("")
w("### \\theoremstyle 分布")
w("共 %d 次：" % R["theoremstyle"]["total"])
w("| 取值 | 次数 | 论文数 |")
w("|---|---|---|")
for k, v, p in R["theoremstyle"]["table"]:
    w(f"| `{k}` | {v} | {p} |")
w("")
w("`definition`/`remark` 两种风格几乎固定成对出现在 preamble（约 620+ 篇），`plain` 仅 16 篇。")
w("")

# Q3
e = R["environments"]
w("## 3. \\begin{env} 环境使用全表")
w("")
w(f"共 {e['total']} 处、{e['distinct']} 个不同环境名。全表如下（按次数降序）：")
w("")
w("| env | 次数 | 论文数 || 次数 | 论文数 || 次数 | 论文数 |")
w("|---|---|---|---|---|---|---|---|---|")
tab = e["table"]
for i in range(0, len(tab), 3):
    cells = tab[i:i+3]
    s = "|"
    for c in cells:
        s += f" `{c[0]}` | {c[1]} | {c[2]} |"
    for _ in range(3 - len(cells)):
        s += " |||"
    w(s.rstrip("|") + "|")
w("")
w("重点分组判读：")
w("- **数学排版**：`equation`(52246/719篇) 一统天下；`align`+`align*`(4401)、`split`(1890)、`aligned`(1500)、"
  "`gathered`(940)、`cases`(1071)、`pmatrix`(1001)、`array`(737)、`smallmatrix`(128)、`gather/gather*`(87)、"
  "`multline*`(6)、`alignat`(3)、`subequations`(仅1篇)、`eqnarray` 0 次。matrix 家族 + split/aligned/cases 必须全支持；"
  "alignat/gather/multline 属可低成本兜底。")
w("- **浮动体**：`figure` 1008 次/600 篇（多为纯 TikZ/内嵌图，`\\includegraphics` 仅 30 次/16 篇），"
  "`table` 129/82，`tabular(+*)` 337/184，无 `subfigure`/`subtable`/`longtable` 使用环境本体"
  "（longtable 13 次/10 篇）。")
w("- **TikZ**：`tikzpicture` 941/531 篇，`scope` 391/139 篇，`tikzcd` 116/49 篇。")
w("- **定理类**：`proof` 20449/721 篇、`lemma` 12819、`proposition` 4894、`theorem` 2291、`corollary` 1299、"
  "`remark` 608、`definition` 573，其余自定义名均 <35 次。")
w("- **列表/其它**：`enumerate` 2024/511、`itemize` 192/81、`description` 8/8、`quote` 21、`center` 208；"
  "`verbatim` 32/13、`lstlisting` 18/9；`algorithm` 环境 0 次；`minipage` 86/39、`samepage` 117/80。")
w("")

# Q4
m = R["math_commands"]
w("## 4. 数学命令分布（$...$、\\[..\\]、数学环境内部）")
w("")
w(f"识别数学区 {m['math_regions']} 个，区内命令共 {m['total']} 次、{m['distinct']} 种。"
  "标志列含义：**Y**=typst 同名可用；**A**=typst 有等价但异名/换写法；**R**=typst 无同名命令、需重写或兜底；"
  "**U**=语料 preamble 自定义宏（转换时展开）；**T**=结构命令（环境边界/编号/标签）；**?**=需人工核对。")
w("")
w("### Top 120")
w("| # | 命令 | 次数 | 论文数 | typst | 映射/备注 |")
w("|---|---|---|---|---|---|")
for i, (k, v, p) in enumerate(m["table_top150"][:120], 1):
    fl, note = flag(k)
    w(f"| {i} | `\\{k}` | {v} | {p} | {fl} | {note} |")
w("")
# coverage computation
top = m["table_top150"][:120]
tot_top = sum(v for _, v, _ in top)
share = tot_top / m["total"]
cnt_f = Counter()
for k, v, p in top:
    cnt_f[flag(k)[0]] += v
w(f"Top120 覆盖数学命令总频次的 **{share*100:.1f}%**。按标志分组：" +
  "、".join(f"{f} 类占 {c/m['total']*100:.1f}%" for f, c in cnt_f.most_common()) + "。")
w("")
w("### 重点：typst 数学里没有同名命令的（全语料精确计数，含数学区外）")
w("")
w("| 命令 | 次数 | 论文数 | typst 处置建议 |")
w("|---|---|---|---|")
EXTRA_NOTE = {
    "mathcal": "映射为 cal 字母转换（语料最高频风格命令）",
    "mathbb": "bb / 预定义 RR,NN,ZZ,QQ,CC",
    "mathfrak": "frak",
    "mathscr": "script（mathrsfs 风格）",
    "boldsymbol": "bold",
    "mathrm": "upright", "mathrm": "upright", "mathsf": "sans", "mathtt": "mono", "mathbf": "bold",
    "rm": "旧式开关 → upright，仅文本/数学内切换",
    "hbox": "重写为内容嵌入",
    "operatorname": "op(\"name\") 或自定义函数",
    "text": "数学内字符串 \"...\"",
    "substack": "多行限制下标：stack/align 重写",
    "overset": "underover(top:)", "underset": "underover(bottom:)", "stackrel": "underover/attach",
    "overbrace": "自定义装饰函数兜底", "underbrace": "同上",
    "binom": "binom(a,b)", "dbinom": "binom", "tbinom": "binom",
    "middle": "lr 内不可分段放大 → 需拆 lr 或用 mid",
    "bigl": "手动指定 delimiters 或 scale；typst lr 自动定大小可整体退化",
    "bigr": "同上", "Bigl": "同上", "Bigr": "同上", "biggl": "同上", "biggr": "同上",
    "Big": "同上", "big": "同上", "bigg": "同上", "Bigg": "同上",
    "langle": "angle.l", "rangle": "angle.r",
    "dagger": "符号表核对（typst 有 dagger 名词）",
    "oplus": "circle.plus 类合成名",
    "bigoplus": "op + attach",
    "varnothing": "nothing",
    "notin": "not.in",
    "subarray": "重写",
    "smallmatrix": "mat(..., narrow:true)",
    "sideset": "attach 手工重写",
    "genfrac": "自定义 frac 参数",
    "choose": "binom",
    "foreach": "TikZ 循环 → 无法直译，兜底",
    "pic": "TikZ 自定义图形 → 兜底",
    "shade": "TikZ 渐变 → 兜底",
    "Bbbk": "bb k 或符号兜底",
}
cur = E["curated"]
KEY_ORDER = ["mathcal","mathrm","mathbb","operatorname","text","bigl","bigr","mathbf","mathfrak",
 "mathsf","overline","rangle","langle","mid","circ","mathscr","oplus","substack","binom","big",
 "boldsymbol","varnothing","notin","hbox","xrightarrow","dagger","bigoplus","foreach","lVert","rVert",
 "mathtt","lvert","rvert","Bigl","Bigr","hat","Big","middle","twoheadrightarrow","filldraw","varprojlim",
 "underbrace","coprod","emptyset","propto","varinjlim","Bbbk","Bigg","overset","stackrel","underset",
 "choose","genfrac","shade","pic","iiint","tbinom","nearrow","sideset","phantom","ddots"]
for k in KEY_ORDER:
    if k in cur:
        v, p = cur[k]
        w(f"| `\\{k}` | {v} | {p} | {EXTRA_NOTE.get(k,'')} |")
w("")
w("### \\left/\\right 定界符分布（数学区内配对计数）")
w("")
w("| `\\left` 后定界符 | 次数 | | `\\right` 后定界符 | 次数 |")
w("|---|---|---|---|---|")
lt = m["left_delims"]; rt = m["right_delims"]
for i in range(max(len(lt), len(rt))):
    if i >= len(lt) and i >= len(rt):
        break
    a = lt[i] if i < len(lt) else ("", "")
    b = rt[i] if i < len(rt) else ("", "")
    w(f"| `{a[0]}` | {a[1]} | | `{b[0]}` | {b[1]} |")
w("")
w("`\\left`/`\\right` 总计 17218 对；定界符仅 10 种：`(` `)` `|` `[` `]` `\\{` `\\}` `\\|` "
  "`\\lfloor/\\lceil/\\langle` 等 + 静点 `.`（半对空定界符，185 次，转换时映射为 typst lr 的 none 侧）。"
  "`\\middle` 199 次/88 篇。整体可被 typst `lr()` 自动 sizing 覆盖，仅需一张定界符名映射表。")
w("")

# Q5
t = R["tikz"]
w("## 5. TikZ 使用画像")
w("")
w(f"- `tikzpicture` 总数 **{t['total_pictures']}**，使用论文 **{t['papers_using']}/722**，"
  f"平均每使用篇 {t['avg_per_using_paper']} 个（另有单篇内联 `\\tikz` 命令热点一篇）。"
  f"最多的一篇：`{t['max_per_paper'][0][0]}` = {t['max_per_paper'][0][1]} 个 picture（"
  "但该篇 `A-polynomial-time-algorithm-for-three-machine-unit-job-scheduling` 有 **3829** 个内联 "
  "`\\tikz` 小图（甘特图表格），是全语料 TikZ 的极端离群点）。")
w(f"- **pgfplots：`\\begin{{axis}}`/`group`/`plot` 共 0 次，0 篇** —— 可完全不支持 pgfplots。")
w(r"- `tikz-cd`（`\begin{tikzcd}`）116 次/49 篇，是图表类 TikZ 的主要形态（交换图表）。")
w("")
w("### \\usetikzlibrary 分布")
w("| library | 次数 | 论文数 |")
w("|---|---|---|")
for k, v, p in t["libs"][:18]:
    w(f"| `{k}` | {v} | {p} |")
w("")
w("### tikzpicture 内命令频次（top，节选）")
w("| 命令 | 次数 | 论文数 | 说明 |")
w("|---|---|---|---|")
NOTE = {"node": "文字/数学标签", "draw": "画线/路径", "fill": "填充",
 "foreach": "循环（无法机械直译）", "coordinate": "坐标点", "begin/end": "scope 环境",
 "path": "路径定义", "filldraw": "填充+描边", "scope": "作用域", "pic": "自定义子图（兜底）",
 "shade": "渐变（兜底）", "clip": "裁剪（兜底）", "tikzset": "样式宏（需展开）",
 "pattern": "图案填充（兜底）"}
keep = ["node","draw","fill","foreach","coordinate","begin","end","path","filldraw",
        "scope","pic","shade","shadedraw","clip","pattern","tikzset","(inline \\tikz)"]
d = dict((k, (v, p)) for k, v, p in t["cmds"])
for k in keep:
    if k in d:
        v, p = d[k]
        w(f"| `{k if k.startswith('(') else chr(92)+k}` | {v} | {p} | {NOTE.get(k,'')} |")
w("")
w(r"（表中 `\x/\y/\i/\j/\k/yy` 等为论文自定义宏或小写缩写，未列入；`\small/\footnotesize/\textbf` "
 "等是节点内文本样式。）")
w("")
w("**可自动重画 vs 兜底判断**：library 需求集中在 arrows.meta+positioning+calc+fit+patterns+decorations.pathreplacing "
  r"六件套（合计占加载次数 ~95%）。picture 主体是 `\node`+`\draw`(带坐标/箭头/虚线) 的交换图、简单几何示意；"
  r"`\foreach`(667次/210篇)、`decorations`(brace 标注)、`patterns/shade/pic/clip` 属于难以直译集。"
  "按出现量估计：**约 80% 的 tikzpicture 可用 typst 内置 grid/cell+line+curve 或简单 path 自动重画**"
  "（node+draw+-|+arrow 语法可覆盖），**15-20% 需兜底**（编译成 PNG 嵌入：tikzcd 中复杂 commutative 图可特判，"
  "patterns/shade/decorations.markings/foreach 及那篇 3829 内联图论文）。")
w("")

# Q6
rf = R["refs"]
w("## 6. 交叉引用写法")
w("")
w("| 命令 | 次数 | 论文数 |")
w("|---|---|---|")
for k, (v, p) in sorted(rf["ref_counts"].items(), key=lambda x: -x[1][0]):
    if v or k in ("autoref", "cite*"):
        w(f"| `\\{k}` | {v} | {p} |")
w("")
w("`\\autoref`/`\\cite*`/`\\nocite`/`\\parencite`/`\\textcite` 全为 0。`\\cite` 29176 次（701 篇）为绝对主流，"
  "natbib 的 citep/citet 仅 121 篇使用，cleveref 95+43 篇。")
w("")
w("### \\label 前缀分布（共 %d 个 label）" % rf["label_total"])
w("| 前缀 | 次数 | 论文数 || 前缀 | 次数 | 论文数 |")
w("|---|---|---|---|---|---|---|")
lp = rf["label_prefixes"]
for i in range(0, len(lp), 2):
    a = lp[i]; b = lp[i+1] if i+1 < len(lp) else ("", "", "")
    w(f"| `{a[0]}` | {a[1]} | {a[2]} | | `{b[0]}` | {b[1]} | {b[2]} |")
w("")
w("### 编号/标签控制")
w("| 项 | 次数 | 论文数 |")
w("|---|---|---|")
for k, (v, p) in rf["misc"].items():
    w(f"| `{k}` | {v} | {p} |")
w("")
w("`\\numberwithin{equation}{section}` 575 次/573 篇 —— 公式按节编号是默认方言，转换器必须支持"
  "（typst: `math.eq(numbering: '1.2')` 风格的全局设置）。")
w("")

# Q7
st = R["structure"]
w("## 7. 影响机械转换的其它结构")
w("")
w("| 结构 | 次数 | 论文数 | 备注 |")
w("|---|---|---|---|")
NOTE7 = {
 "input": "分文件主流：sections/xx 命名；无 \\include/\\import/\\subfile",
 "newcommand": "定义宏的主力",
 "DeclareMathOperator": "自定义算符主力（568 篇！）",
 "DeclarePairedDelimiter": "norm/abs 类配对定界符",
 "thebibliography": "手写参考文献（bibitem 5242 条），其余 490 篇走 bibtex(.bib)",
 "bibitem": "",
 "tableofcontents": "", "appendix": "",
 "footnote": "极少（arXiv 数学预印本特征）",
 "thanks": "0 —— 作者致谢走 alt text",
 "maketitle": "721/722 篇走标准 title 流水线",
 "emph": "文本强调主力",
 "textbf": "", "item": "", "href": "hyperref 内联链接",
 "noindent": "", "hspace": "", "newline": "",
 "allowdisplaybreaks": "长公式跨页断行 203 次/201 篇",
 "numberwithin_any": "",
 "minipage": "", "parbox": "", "newenvironment": "几乎不用自定义环境",
 "verbatim": "", "lstlisting": "", "algorithm_env": "0 篇使用",
 "floats_fig": "", "floats_tab": "", "tabular_star": "",
 "includegraphics": "外链图片极少，图基本由 TikZ 生成",
 "resizebox": "", "scalebox": "", "qed": "", "url": "", "hyperref_cmd": "",
 "textit": "", "vspace": "", "linebreak": "", "renewcommand": "", "providecommand": "",
 "newsavebox": "0", "sbox": "0", "subfigure": "0（无 subfigure 包/命令）",
 "centering_vs_center": "center 环境 208 次", "subfile": "0", "import": "0", "include": "0",
 "footnotetext": "0", "textcircled": "0", "NewDocumentCommand": "0（无 xparse）",
 "newtheorem_env_like": "newenvironment 同列",
}
order = ["input","include","import","subfile","newcommand","renewcommand","providecommand",
 "NewDocumentCommand","DeclareMathOperator","DeclarePairedDelimiter","newenvironment",
 "def(单独统计)","newsavebox","sbox","parbox","minipage","footnote","footnotetext","thanks",
 "maketitle","tableofcontents","appendix","thebibliography","bibitem","verbatim","lstlisting",
 "algorithm_env","floats_fig","floats_tab","tabular_star","includegraphics","resizebox","scalebox",
 "subfigure_cmd","qed","allowdisplaybreaks","numberwithin_any","noindent","newline","linebreak",
 "hspace","vspace","emph","textit","textbf","item","centering_vs_center","url","href","hyperref_cmd",
 "textcircled"]
for k in order:
    if k == "def(单独统计)":
        v, p = R["def"]["total"], R["def"]["papers"]
        w(f"| `\\def` | {v} | {p} | 集中在少数论文（top: {R['def']['top_forms'][0][0]}…）"
          "，排除 vendored pgf 后仅 4402 次/145 篇 |")
        continue
    if k not in st:
        continue
    v, p = st[k]
    if v == 0:
        w(f"| `\\{k}` | 0 | 0 | 不存在 |")
    else:
        w(f"| `\\{k}` | {v} | {p} | {NOTE7.get(k,'')} |")
w("")
w(f"### 宏定义规模")
w(f"- `\\newcommand` 家族（new/renew/provide，brace 名式）共 {R['newcommand_family']['total']} 次、"
  f"{R['newcommand_family']['papers']} 篇；其中带参（body 含 #1..#9）**{R['newcommand_family']['with_params']} 次"
  f"（{R['newcommand_family']['with_params']/R['newcommand_family']['total']*100:.0f}%），涉及 "
  f"{R['newcommand_family']['papers_with_params']} 篇 → 转换器需支持 0/1/2 参宏展开，多数是无参缩写宏"
  "（如 `\\E=\\mathbb{{E}}`, `\\dd` 微分号, `\\norm` 配对定界符）。")
w("- 高频自定义数学宏 top（次数/论文数/定义篇数）：")
w("")
w("| 宏 | 数学区使用 | 使用论文 | 定义论文 |")
w("|---|---|---|---|")
for k, v, p, dp in R["user_macros"]["used_math_defined_top"][:28]:
    w(f"| `\\{k}` | {v} | {p} | {dp} |")
w("")
w("### \\documentclass 与 title 块")
w("| docclass | 次数 | 论文数 |")
w("|---|---|---|")
for k, v, p in R["documentclass"]:
    w(f"| `{k}` | {v} | {p} |")
tb = R["title_block"]
w("")
w(f"标题块齐全度（按篇）：`\\title` {tb['title']}/722、`\\author` {tb['author']}/722、"
  f"`\\date` {tb['date']}（多数 `\\date{{}}` 置空）、`\\maketitle` {tb['maketitle']}。"
  "→ title 流水线完全标准化，可用单一模板转换；abstract 环境 725 次/722 篇，也齐全。")
w("")
w("### bibliographystyle 取值")
w("| style | 次数 | 论文数 |")
w("|---|---|---|")
for k, v, p in R["bibliographystyle"]["table"]:
    w(f"| `{k}` | {v} | {p} |")
w("")
w(f"492 次声明；`plain`+`plainnat` 占 82%。手写 `thebibliography` 232 篇 vs .bib 501 个文件"
  "（两种路线并存，转换器需同时支持 bib 解析与 bibitem 直译）。")
w("")

# summary
w("## 8. 结论性摘要（供转换器取舍）")
w("")
w("1. **覆盖 ~95% 语料的窄方言**：amsmath 子集 = `equation`(含*号) + `split/aligned/gathered/cases` "
  "+ `pmatrix/smallmatrix/array`；`\\left\\right` 10 种定界符；希腊字母 + ~40 个关系/运算符；"
  "风格命令 6 个（mathcal 67k、mathbb 19k、mathrm 20k、mathfrak 10.6k、mathbf 10.7k、mathsf 8.9k）；"
  "spacing quad/qquad；`\\text`/`\\operatorname`；列表 enumerate/itemize；定理七件套 "
  "theorem/lemma/proposition/corollary/definition/remark/example + proof；"
  "交叉引用 `\\ref`+`\\eqref` 为主、`\\cite` 为主；`\\numberwithin{equation}{section}`；"
  "`\\input` 分文件 + 标准 title/abstract 模板 + plain/plainnat 文献。把这一层做扎实即覆盖 95%+。")
w("2. **长尾但必须特殊处理**：(a) `\\overset/\\underset/\\stackrel`、`\\substack`(2008次/411篇)、"
  "`\\overbrace/\\underbrace`、`\\middle`、`bigl/Bigl` 手工定界符（bigl/bigr 12k 次——好在 typst lr 自动 "
  "sizing 可整体降级替换，只需保留配对）；(b) `\\hbox`(1443/341篇) 与旧式开关 `\\rm`(15979/362篇)；"
  "(c) 自定义宏体系：`\\DeclareMathOperator` 4327 次/568 篇 + `\\newcommand` 5.8k 次，"
  "必须先做宏展开/注册（尤其 `\\E \\R \\Z \\norm \\abs \\dd` 这类无参宏）；"
  "(d) `\\tag/\\notag`(634/1242 次)、`\\subequations`(需计数器语义)、`alignat/multline`(量极小)；"
  "(e) verbatim/lstlisting(50 次)、minipage/parbox(129 次) 可用兜底框。")
w(f"3. **TikZ**：pgfplots = 0，纯 TikZ {t['total_pictures']} 个 picture/{t['papers_using']} 篇 + 49 篇 tikzcd。库需求 6 件套 "
  "(arrows.meta/positioning/calc/fit/patterns/decorations.pathreplacing) 占 ~95%。"
  "结构以 node+draw(坐标/箭头/虚线) 为主 → 约 80% 可用 typst 重画（含 tikzcd 交换图特判），"
  "约 15-20% 需 PDF 兜底：`\\foreach`(210 篇)、decorations.markings/brace、patterns/shade/clip/pic，"
  "以及单篇 3829 个内联 `\\tikz` 甘特图的离群论文（建议整篇 figure 兜底）。")
w("4. **可直接忽略**：autoref、subfigure、algorithm、NewDocumentCommand、xparse、import/subfile/include、"
  "thanks、newsavebox、cite*、多栏、wrapfig 等 —— 语料中为 0。")
w("")
w("---")
w("*生成脚本：analyze2.py + extra.py（只读扫描，无源文件修改）；明细数据见 raw_stats.json / extra_stats.json。*")

open(D + "/dialect_report.md", "w", encoding="utf-8").write("\n".join(L))
print("report written,", len(L), "lines")
