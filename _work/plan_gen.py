# -*- coding: utf-8 -*-
import io, json, re, os, glob, collections

W = "E:/math/_work/"
ROOT = "E:/math/" + "\u7814\u7a76\u7b14\u8bb0"
B = chr(92)

# ---- fresh census numbers ----
census = json.load(io.open(W + "katexundef_fresh.json", encoding="utf-8"))

sites = []
for line in io.open(W + "katex_sites.jsonl", encoding="utf-8"):
    line = line.strip()
    if line:
        sites.append(json.loads(line))

def key_of(fn):
    return os.path.basename(fn).split("-")[0]

# ---- per-file note text cache ----
paths = {}
for fn in set(s["file"] for s in sites):
    paths[fn] = os.path.join(ROOT, fn)

textcache = {}
def lines_of(fn):
    if fn not in textcache:
        textcache[fn] = io.open(paths[fn], encoding="utf-8").read().split("\n")
    return textcache[fn]

# ---- UNDEF token adjudication table ----
# ORDER = 正确写法可由文件内既有证据导出，且替换串逐字确定。
ORDER = {
    "\\F": "\\mathbb{F}",
    "\\d": "\\mathrm{d}",
    "\\du": "\\mathrm{d}u",
    "\\dv": "\\mathrm{d}v",
    "\\diff": "\\mathrm{diff}",
    "\\OOo": "\\mathcal{O}",
    "\\T": "\\top",
    "\\asy": "\\asymp",
    "\\asypto": "\\asymp",
    "\\ot": "\\otimes",
    "\\lambdah": "\\lambda h",
    "\\alphah": "\\alpha h",
}
ORDER_REASON = {
    "\\F": "有限域记号：正文另有 \\mathbb F / \\Z 拼写，逐字补 \\mathbb{F}",
    "\\d": "积分微元：正文另有 \\mathrm d 拼写",
    "\\du": "\\mathrm{d}u 微元",
    "\\dv": "\\mathrm{d}v 微元",
    "\\diff": "\\mathrm{diff} 上标（Wh 的光滑标记，正文另有 \\mathrm 前缀）",
    "\\OOo": "结构层 \\mathcal O 双写误拼（正文另有 \\mathcal O_W）",
    "\\T": "转置上标：KaTeX 正确写法 \\top",
    "\\asy": "\\asymp 融合（正文另有 \\asymp 拼写）",
    "\\asypto": "\\asymp 吞 to：D198:289 已自更正为 \\asymp，替换去掉尾部 to",
    "\\ot": "\\otimes 融合（正文另有 \\otimes_k）",
    "\\lambdah": "\\lambda 吞 h（D125:448 已核）",
    "\\alphah": "\\alpha 吞 h（D560:149 已核）",
}
KEEP = {
    "\\DeclareMathOperator": "D18:956 台账行逐字引用该 LaTeX 定义命令，故意保留",
    "\\ltl": "D216:775 取证行逐字引用 broken 形式 $0\\ltl=...",
    "\\math": "D238:744 该行以“应为 $\\mathcal Z_{\\mathcal P}$”自我更正，broken 形式属引用",
}
JUDGMENT = {
    "\\rangleG": "D26/D231/D401 span 体内并无裸 \\rangleG：系 \\inner 宏展开后 \\rangle 与后继字母粘连，须作者核对（非机械单枚替换）",
    "\\lem": "算子名式自造记号 \\lem（引理交叉引用），按记忆规则非融合体；须作者决定是否登记",
    "\\lc": "log-canonical 简写，目标 \\mathrm{lc}? 待定",
    "\\Csum": "自造和算子，展开目标未定",
    "\\root": "\\sqrt h / 立方根，需 \\sqrt{} 结构，意图清但须新写",
    "\\two": "上标 tw/even 记号，目标 \\mathrm 拼写未定",
    "\\closedball": "两参闭球记号，需 \\overline{B}_{r}(c)",
    "\\ball": "两参保开球记号，需 \\mathbb{B}_{r}(x)",
    "\\hsSq": "HS 半范数算子，需 \\lVert\\cdot\\rVert_{\\mathrm{HS}}",
    "\\sr": "谱半径算子 \\operatorname{sr}，目标未定",
    "\\q": "四元数/量词未定",
    "\\o": "小 o 记号，\\lambda_+ 类需分隔空格，须逐处新写",
    "\\j": "多余反斜杠 \\lambda_+，须带空格改写",
    "\\g": "度量下标 \\lvert v\\rvert_g，多余反斜杠",
    "\\+": "\\lambda_+ 下标，须补空格 \\lambda_+ +",
    "\\A": "\\mathbb A / \\mathcal A 未定",
    "\\V": "\\mathbb V 未定（正文另有拼写）",
    "\\K": "裸 K 与 \\mathbb K 并存，须逐处核对",
    "\\G": "环面 \\mathbb G 未定",
    "\\D": "单位圆盘 \\mathbb D 未定",
    "\\m": "极大理想 \\mathfrak m / 裸 m 未定",
    "\\M": "\\mathcal M / 裸 M 未定",
    "\\w": "记号未定",
    "\\ar": "记号未定",
    "\\cr": "记号未定",
    "\\ldim": "左维数算子，需 \\operatorname",
    "\\stEnd": "稳定 End 算子，需 \\operatorname{stEnd} 登记",
    "\\stHom": "稳定 Hom 算子，需 \\operatorname{stHom} 登记",
    "\\wide": "\\hat E / \\widehat{} 缺帽子结构，目标未定",
    "\\Zd": "记号未定",
    "\\Zmod": "\\Z/m 算子，目标未定",
    "\\tabalign": "残片，须作者改写",
    "\\eqno": "\\eqno 非 KaTeX，需 \\tag 或删",
    "\\texttcaxe": "\\text{exact} 反写残片，意图须作者核",
    "\\textrewol": "\\text{lower} 反写残片，意图须作者核",
    "\\ellr": "R_\\ell < r_{\\ell+1} 类，融合歧义须核",
    "\\setu": "融合 \\setminus/裸 u 未定",
    "\\joinrel": "\\lhook\\joinrel\\to 记法，目标未定",
    "\\Ce": "记号未定",
    "\\Ec": "期望 E 缩写未定",
    "\\DeclareMathOperatorX": "",
}
WAIVER_UNDEF = {}  # per-file only

def undef_class(tok, filekey):
    if tok == "\\math":
        if filekey == "D238":
            return "KEEP", KEEP["\\math"]
        return "WAIVER", "$...$ 内为 Windows 路径 $E:\\math\\lean\\...，非数学，尺子过捕"
    if tok in KEEP:
        return "KEEP", KEEP[tok]
    if tok in ORDER:
        return "ORDER", ORDER_REASON[tok] + "；替换 %s -> %s" % (tok, ORDER[tok])
    if tok in JUDGMENT:
        return "JUDGMENT", JUDGMENT[tok]
    return "JUDGMENT", "自造/歧义记号，须作者判定"

# ---- OTHER class rules ----
# ---- accent-no-group detection (ORDER): \overline\mathbb X -> \overline{\mathbb X} ----
ACCENTS = ["\\overline", "\\widehat", "\\widetilde", "\\underline",
           "\\overrightarrow", "\\vec"]
SYMKW = ["\\mathbb", "\\mathcal", "\\mathrm", "\\mathbf", "\\mathsf",
         "\\mathfrak", "\\operatorname", "\\mathopen"]

def _arg_span(txt, i):
    """i points at the char right after a symbol macro (\\mathbb etc.).
    skip spaces; the argument is {..} or \\word or a single char.
    return index just past the argument, or None."""
    n = len(txt)
    while i < n and txt[i] == " ":
        i += 1
    if i >= n:
        return None
    if txt[i] == "{":
        d = 0
        for k in range(i, n):
            if txt[k] == "{":
                d += 1
            elif txt[k] == "}":
                d -= 1
                if d == 0:
                    return k + 1
        return None
    if txt[i] == B:
        k = i + 1
        while k < n and txt[k].isalpha():
            k += 1
        return k if k > i + 1 else None
    return i + 1

def accent_fix(body):
    """Return (newbody, ndiffs) if every refusal trigger is an accent directly
    followed by an arg-taking symbol macro with no group; else None."""
    diffs = 0
    new = body
    for _ in range(50):
        found = None
        for a in ACCENTS:
            j = new.find(a)
            while j >= 0:
                after = new[j + len(a):]
                stripped = after.lstrip(" ")
                hit = None
                for k in SYMKW:
                    if stripped.startswith(k):
                        hit = k
                        break
                if hit:
                    space = len(after) - len(stripped)
                    argend = _arg_span(new, j + len(a) + space + len(hit))
                    if argend:
                        found = (j, len(a), space, hit, argend)
                        break
                j = new.find(a, j + len(a))
            if found:
                break
        if not found:
            break
        j, la, space, hit, argend = found
        sym = new[j + la + space: argend]          # e.g. '\mathbb D'
        new = new[:j + la] + "{" + sym + "}" + new[argend:]
        diffs += 1
    # confirm no accent followed by symkw remains unfixed
    for a in ACCENTS:
        i = 0
        while True:
            j = new.find(a, i)
            if j < 0:
                break
            stripped = new[j + len(a):].lstrip(" ")
            for k in SYMKW:
                if stripped.startswith(k):
                    return None                     # still ambiguous, back off
            i = j + len(a)
    return (new, diffs) if diffs else None

def other_class(errClass, body=""):
    e = errClass
    # --- macro-argument EOF: mostly accent-with-no-group -> ORDER ---
    if "Unexpected end of input in a macro argu" in e:
        fx = accent_fix(body)
        if fx:
            return ("ORDER",
                    "定界宏后紧跟需参宏（\\overline\\mathbb D 等）：把该符号命令并入花括号组",
                    fx[0])
        if body.rstrip().endswith("{") or ("$" in body) or body.rstrip().endswith(B):
            return ("WAIVER", "式在 $ 边界被截断 / 反引号代码跨度被并入，非完整数学式")
        return ("JUDGMENT", "宏参未闭合且非纯定界问题（\\Set、\\eqref、\\mathrm\\operatorname 等），须作者判定")
    # --- WAIVER: 尺子误报（严格 $ 文法把相邻/行内跨度粘连，或把散文/markdown 当数学） ---
    if "Can't use function '$'" in e:
        return ("WAIVER",
                "跨度内含裸 $：严格文法把两个相邻 $..$ 或含散文的一串粘连成一段"
                "（如 D100:498 $A$ 注意 $B$、D115:24 把中文行读进式）。"
                "候选尺子修复：体内出现裸 $ 时改判 IUNCLOSED 再重切，本会话不施于全库。"
                "注：此类含少量真·落单 $（作者侧定界符不配对），须待尺子修复后二次分类。")
    if "Can't use function '\\('" in e:
        return ("WAIVER", "\\(..\\) 是行内数学定界符被并入某 $ 跨度（D108/D420 见英文散文），非本式缺陷")
    if ("got '#" in e and "\n" in e) or "got '_'" in e or "got '&'" in e:
        return ("WAIVER", "跨度吞入 markdown 标题/表格分隔/裸 & 或 _，那段根本不是数学")
    if "Can't use function '\\mathbf'" in e:
        return ("WAIVER", "\\tag 里含反斜杠路径被当文本内命令；定界粘连所致")
    # --- KEEP: 逐字引用的素材/环境名/取证行 ---
    if "{equation} can be used only in display" in e or "{CD} can be used only in display" in e:
        return ("KEEP", "块引用里逐字抄 LaTeX 环境名（D134/D376），非正文数学")
    if "got '\\end'" in e and "\n" in e:
        return ("KEEP", "逐字引用素材 \\end{lemma} 片段（D101），取证保留")
    if "No such environment: tikzcd" in e:
        return ("KEEP", "逐字引用 tikzcd 素材（D444），非本文可渲数学")
    # --- JUDGMENT: 意图清楚但须作者逐处新写（括号/上下标/环境/记号歧义） ---
    if "psmallmatrix" in e:
        return ("JUDGMENT", "KaTeX 无 psmallmatrix 环境，须作者改 pmatrix/smallmatrix 并定尺寸")
    if "Expected group as argument to '\\H'" in e or "Got function '\\H'" in e:
        return ("JUDGMENT", "\\H 记号歧义（\\top 转置? \\mathbb H 上半平面/四元数?），须逐处判")
    if "Unexpected end of input in a macro argument" in e:
        return ("JUDGMENT", "宏参数未闭合（\\overline\\mathbb D、\\text{、\\Set 等）：须作者补括号/定记号")
    if "Expected 'EOF', got '}'" in e or "Extra }" in e:
        return ("JUDGMENT", "多余右括号/定界不闭合，删补点须据式意逐处判")
    if "Expected '}'" in e or "got 'EOF'" in e:
        return ("JUDGMENT", "式在 $ 边界被截断/缺右括号，补全须作者判")
    if "Mismatch: \\begin" in e:
        return ("JUDGMENT", "\\begin/\\end 环境名不匹配（pmatrix vs pm），须作者对齐")
    if "Expected '&' or" in e:
        return ("JUDGMENT", "矩阵缺行分隔 \\\\，补点位置须作者判")
    if "Expected 'EOF', got '\\right'" in e:
        return ("JUDGMENT", "\\left/\\right 不配对，定界补法须作者判")
    if "Double subscript" in e or "Double superscript" in e:
        return ("JUDGMENT", "重复上下标（_1_1、^{..}^、^^），正确归并须作者判")
    if "Expected group after '_'" in e or "Expected group after '^'" in e:
        return ("JUDGMENT", "上下标缺组，加 {} 的具体写法须作者判")
    if "Got function '\\operatorname@'" in e:
        return ("JUDGMENT", "\\per 等未登记算子，目标 \\perp? 须作者判")
    if "Got function '\\textcolor' with no argum" in e:
        return ("JUDGMENT", "\\textcolor 缺参（此处应为自造 \\red），补法须作者判")
    if "Can't use function '\\]'" in e:
        return ("JUDGMENT", "\\{..\\] 定界错配（D626），正确定界须作者判")
    return ("JUDGMENT", "其余 KaTeX 语法/记号错，须作者逐处判定")

# ---- classify all sites ----
recs = []
for s in sites:
    fk = key_of(s["file"])
    if s["tok"]:
        cls, why = undef_class(s["tok"], fk)
        repl = ORDER.get(s["tok"], "") if cls == "ORDER" else ""
    else:
        res = other_class(s["errClass"], s["body"])
        if len(res) == 3:
            cls, why, repl = res
        else:
            cls, why = res
            repl = ""
    # verify the line right now
    ls = lines_of(s["file"])
    verified = False
    snippet = ""
    if 1 <= s["line"] <= len(ls):
        ln = ls[s["line"] - 1]
        if s["tok"] and s["tok"] in ln:
            verified = True
        elif s["tok"] is None:
            verified = True  # other-class: line-based, body drift tolerated
        snippet = ln.strip()[:200]
    recs.append({
        "file": s["file"], "key": fk, "line": s["line"],
        "tok": s["tok"], "errClass": s["errClass"],
        "cls": cls, "why": why, "repl": repl,
        "verified": verified, "snippet": snippet,
        "body": s["body"][:160],
    })

# ---- per-macro / per-class grouping ----
bytok = collections.defaultdict(list)
byclass = collections.defaultdict(list)
for r in recs:
    (bytok if r["tok"] else byclass)[r["tok"] or r["errClass"]].append(r)

CLS_ORDER = [k for k in ("ORDER", "JUDGMENT", "KEEP", "WAIVER")]
# per-note counts
pernote = collections.defaultdict(lambda: {c: 0 for c in CLS_ORDER})
for r in recs:
    pernote[r["key"]][r["cls"]] += 1

totals = {c: sum(1 for r in recs if r["cls"] == c) for c in CLS_ORDER}

# ---- write plan ----
out = io.open(W + "katex_undef_plan.txt", "wb")
def p(x=""):
    out.write((x + "\n").encode("utf-8"))

def coord(r):
    flag = "" if r["verified"] else "  [in-flight, coordinate unverified]"
    return "%s:%d%s" % (r["key"], r["line"], flag)

p("=" * 72)
p("KaTeX 未解析长尾治理计划 (katex long-tail plan)")
p("=" * 72)
p("")
p("[FRESH CENSUS  %s]" % "re-run after D256/D278/D535 edits")
p("  spans          = %d" % census["spans"])
p("  refused        = %d   (was 514 @01:10)" % census["refused"])
p("  filesHit       = %d" % census["filesHit"])
p("  distinct undef = %d (cover %d spans)" % (len(census["undef"]), sum(census["undef"].values())))
p("  other classes  = %d (cover %d spans)" % (len(census["other"]), sum(census["other"].values())))
p("  baseline snapshot: refused 3,119 / filesHit 318 (katex_refused ~3,935 家族已闭合)")
p("")
p("[CLASS TOTALS over %d refused sites]" % len(recs))
for c in CLS_ORDER:
    p("  %-9s = %d" % (c, totals[c]))
p("  说明: ORDER=据文件内证据可导出正确写法（含精确替换串）;"
  )
p("        JUDGMENT=意图清楚但须作者新写; KEEP=故意引用/broken 形式的勘误或专名缩写;"
  )
p("        WAIVER=尺子误报（非数学 / KaTeX 实可渲）。")
p("")
p("=" * 72)
p("PART A — 未解析控制序列 (per-macro)")
p("=" * 72)
for t, rr in sorted(bytok.items(), key=lambda x: (-len(x[1]))):
    cls = rr[0]["cls"]
    p("")
    p("### %s   count=%d   class=%s" % (t, len(rr), cls))
    p("    判据: %s" % rr[0]["why"])
    if cls == "ORDER":
        p("    精确替换: %s  ->  %s" % (t, rr[0]["repl"]))
    for r in rr:
        p("    - %s" % coord(r))
        if not r["verified"]:
            p("        (期望 token 不在该行, 可能已被并发改写)")
        p("      行: %s" % r["snippet"])

p("")
p("=" * 72)
p("PART B — 其它 KaTeX 拒渲类 (per-class)")
p("=" * 72)
for c, rr in sorted(byclass.items(), key=lambda x: (-len(x[1]))):
    cbreak = collections.Counter(r["cls"] for r in rr)
    p("")
    p("### [%s]  count=%d  classes=%s" % (
        c, len(rr), ", ".join("%s:%d" % (k, v) for k, v in cbreak.most_common())))
    for r in rr:
        p("    - [%s] %s" % (r["cls"], coord(r)))
        p("      body: %s" % r["body"].replace("\n", "\\n"))
        if r["cls"] == "ORDER" and r["repl"]:
            p("      精确替换: %s" % r["repl"].replace("\n", "\\n"))

p("")
p("=" * 72)
p("PART C — 逐篇索引 (note -> ORDER/JUDGMENT/KEEP/WAIVER), 按 ORDER 降序")
p("=" * 72)
p("%-8s %6s %9s %5s %7s   total" % ("note", "ORDER", "JUDGMENT", "KEEP", "WAIVER"))
rows = sorted(pernote.items(),
              key=lambda x: (-x[1]["ORDER"], -(x[1]["JUDGMENT"] + x[1]["KEEP"] + x[1]["WAIVER"])))
for k, d in rows:
    tot = sum(d.values())
    p("%-8s %6d %9d %5d %7d   %d" % (k, d["ORDER"], d["JUDGMENT"], d["KEEP"], d["WAIVER"], tot))

p("")
p("=" * 72)
p("PART D — 摘要 (plan.md style)")
p("=" * 72)
p("")
p("分类分布: ORDER=%d  JUDGMENT=%d  KEEP=%d  WAIVER=%d   (合计 %d)" % (
    totals["ORDER"], totals["JUDGMENT"], totals["KEEP"], totals["WAIVER"], len(recs)))
p("")
# ORDER rollup across undef + other
order_fam = collections.Counter()
for r in recs:
    if r["cls"] != "ORDER":
        continue
    if r["tok"]:
        order_fam[r["tok"]] += 1
    else:
        order_fam["<定界宏缺组 \\overline\\mathbb X 等>"] += 1
p("主导 ORDER 家族 (可执行子集，逐字替换):")
for fam, n in order_fam.most_common(12):
    rep = ORDER.get(fam, "把该符号命令用花括号成组，如 \\overline\\mathbb D -> \\overline{\\mathbb D}")
    p("  %-42s %3d 处   -> %s" % (fam, n, rep))
p("")
p("主导 JUDGMENT 家族:")
jd = collections.Counter()
for r in recs:
    if r["cls"] != "JUDGMENT":
        continue
    jd[r["tok"] if r["tok"] else ("<" + r["errClass"][:34] + ">")] += 1
for t, n in jd.most_common(12):
    p("  %-40s %3d 处" % (t, n))
p("")
p("KEEP 家族 (逐字引用/专名，不动):")
kp = collections.Counter()
for r in recs:
    if r["cls"] == "KEEP":
        kp[r["tok"] if r["tok"] else ("<" + r["errClass"][:34] + ">")] += 1
for t, n in kp.most_common():
    p("  %-40s %3d 处" % (t, n))
p("")
p("WAIVER 家族 (尺子误报，本会话不施于全库):")
wv = collections.Counter()
for r in recs:
    if r["cls"] == "WAIVER":
        wv[r["tok"] if r["tok"] else ("<" + r["errClass"][:34] + ">")] += 1
for t, n in wv.most_common():
    p("  %-40s %3d 处" % (t, n))
p("")
p("尺子候选修复(建议、未落库): $..$..$ 相邻被粘连时应把含裸 $ 的跨度改判 IUNCLOSED 后重切，"
  "可消解绝大多数 \"$ 在数学模式\" 误报；另：围栏内 \\`code\\` 未闭合反引号会漏空，"
  "fenceMask 应支持奇偶配对回退。")
out.close()

raw = io.open(W + "katex_undef_plan.txt", "rb").read()
assert b"\r" not in raw, "CR FOUND"
print("plan written bytes=%d lines=%d cr-free" % (
    len(raw), raw.count(b"\n")))
print("totals:", totals)
print("unverified sites:", sum(1 for r in recs if not r["verified"]))
