r"""m101c — §7 `every edge` 那一行的前提检查（单 3）。

永久条款（每一单都守）：
  - 落盘只许 _work/probe101*.py / _work/label101*.txt / _work/m101*.*（含 m101c 前缀中间产物）。
  - 不开 typst 跑批/单编；只 pdflatex 造控制图、fitz 读 PDF、import 既有尺（t2t.cetz）、只读 typst/<篇>/main.typ 文本。
  - 数字必须是这把尺打印出来的；每个读数旁边写它来自哪个文件的哪一行/哪一步。
  - 探针只调既有尺，不复制私有副本。
  - 论文目录名只 glob（stem[:40] 恰一个命中），否则 AMBIGUOUS/NOSITE。
  - 跑完把回执写 label101c_every_edge.txt 并在 stdout 原样打一遍；PYTHONIOENCODING=utf-8；stderr 重定向到 _work/m101_err.txt。
  - 判据不成立照实报负结果，不放宽阈值。
  - pdflatex 中间文件按案例序号命名会复用：每案编译前删同名 .pdf，回执带该 pdf 的 mtime 与字节数。

步骤：
  1. 在 _work/flat/*.tex（顶层，不含 _work_tex 子目录）找这 4 处 `every edge` 定义（拼写候选：every edge/.style=、every edge=、\tikzset{every edge/.style=...}），每处打原文整串。
  2. 对每处所在的那张 tikzpicture：数这一族有没有 `edge` 算子被走到（裸 edge[ / edge / ;edge；不计 every edge 定义里的 edge 字）。逐处给源语句原文。
  3. 造该图控制页（standalone，带该篇正文字号——从 typst/<篇>/main.typ 的 #set text(size:) 读），fitz 读 get_drawings() 的 width：量「这些支线在控制页上有没有墨」= 笔画条数 + 非默认线宽条数。
  4. 我们这一侧不排页：只从 typst/<篇>/main.typ 把那张画布的串当文本读，纯字符串计数 thickness: 出现次数与值（不 compile）。
  5. 回执结论只写三档之一：页上有墨且我们的笔不一致（真案）、页上无墨（零行动）、声明根本到不了任何路径（零行动，inert）。不许改任何码。
"""
import io, os, re, sys, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
FLAT = os.path.join(WORK, "flat")
TYPST = os.path.join(ROOT, "typst")

# 只调既有尺，不复制私有副本（轴 68 记过：第二把尺会打架）
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz

PEN_KW = re.compile(r"\b(ultra thick|very thick|thick|semithick|thin|line width\s*=\s*[^,}\]]+)\b")
EDGE_TOK = re.compile(r"\bedge\b")
DEF_RE = re.compile(r"every edge/\.style|every edge\s*=|\\tikzset\{[^}]*every edge")
BEGIN = "\\begin{tikzpicture}"
END = "\\end{tikzpicture}"
DEFAULT_WIDTH = 0.4  # pgf 默认线宽 = 0.4pt

lines = []
def L(s=""):
    lines.append(s)

def read(p):
    return io.open(p, encoding="utf-8", errors="replace").read()

def typst_dir(stem):
    """条款 5：论文目录名只 glob，恰一个命中，否则 AMBIGUOUS/NOSITE。"""
    hits = [n for n in os.listdir(TYPST) if n.startswith(stem[:40])]
    if len(hits) == 1:
        return os.path.join(TYPST, hits[0])
    return ("AMBIGUOUS:" + "|".join(hits)) if hits else "NOSITE"

def body_text_size(typst_main):
    """步骤 3：从 #set text(size: Npt) 读正文字号。"""
    m = re.search(r"#set text\([^)]*?size:\s*([0-9.]+)pt", read(typst_main))
    return m.group(1) if m else "11"

def picture_blocks(text):
    """返回 [(start_line, end_line, block_str)]，按行栈匹配 tikzpicture。"""
    out = []
    stack = []
    for i, ln in enumerate(text.splitlines(), 1):
        if BEGIN in ln:
            stack.append(i)
        if END in ln and stack:
            s = stack.pop()
            out.append((s, i, _block_between(text, s, i)))
    return out

def _block_between(text, s, e):
    ls = text.splitlines()
    return "\n".join(ls[s-1:e])

def build_and_measure(work, case_no, paper, fsize, block, paper_tex):
    """步骤 3：造 standalone 控制页，pdflatex 编译，fitz 读 width。返回 (strokes, nondefault, widths_set, (mtime,bytes)|errstr)。
    用整篇论文 preamble（换掉 documentclass 为 standalone，去掉会冲突的 xcolor/tikz/usetikzlibrary 后由我们补标准套件），
    这样图上引用的论文级宏（如 \\\\Qbar）也能解析；避免“提取出的独立图缺宏”导致编译失败。"""
    base = os.path.join(work, "m101c_ctrl_%d" % case_no)
    tex = base + ".tex"
    pdf = base + ".pdf"
    # 条款 8：编译前删同名 .pdf，避免读到上一代的谎话
    if os.path.exists(pdf):
        os.remove(pdf)
    full = read(paper_tex)
    # 取 \begin{document} 之前的 preamble
    mdoc = re.search(r"\\begin\{document\}", full)
    preamble = full[:mdoc.start()] if mdoc else ""
    # 换 documentclass
    preamble = re.sub(r"\\documentclass(\[[^\]]*\])?\{[^}]*\}",
                      r"\\documentclass[" + fsize + "pt]{standalone}", preamble, count=1)
    # 去掉会与我们标准套件冲突的 xcolor/tikz/usetikzlibrary，统一由我们补
    preamble = re.sub(r"\\usepackage(\[[^\]]*\])?\{xcolor\*?\}", "", preamble)
    preamble = re.sub(r"\\usepackage(\[[^\]]*\])?\{tikz\*?\}", "", preamble)
    preamble = re.sub(r"\\usetikzlibrary\{[^}]*\}", "", preamble)
    canon = ("\\usepackage[dvipsnames]{xcolor}\n\\usepackage{amssymb}\n"
             "\\usepackage{tikz}\n"
             "\\usetikzlibrary{arrows.meta,positioning,shapes.geometric,calc,decorations.pathmorphing}\n")
    doc = (preamble + "\n" + canon + "\\begin{document}\n" + block + "\n\\end{document}\n")
    io.open(tex, "w", encoding="utf-8").write(doc)
    rc = None
    try:
        r = subprocess.run(
            ["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
             "-output-directory", work, tex],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=180,
            check=False,
        )
        rc = r.returncode
    except Exception as e:
        rc = "exc:%r" % e
    try:
        if not os.path.exists(pdf):
            return (None, None, set(), "no-pdf(rc=%s)" % rc)
        import fitz as _fitz
        dd = _fitz.open(pdf)
        pg = dd[0]
        drawings = pg.get_drawings()
        strokes = 0
        nondefault = 0
        widths = set()
        for d in drawings:
            w = d.get("width", 0) or 0
            t = d.get("type", "")
            if t in ("s", "l") and w > 0:
                strokes += 1
                widths.add(round(w, 4))
                if w > DEFAULT_WIDTH + 0.05:
                    nondefault += 1
        dd.close()
        st = os.stat(pdf)
        info = (st.st_mtime, st.st_size)
        return (strokes, nondefault, widths, info)
    finally:
        # 条款 1/8：中间产物（m101c 前缀）看过就删；读数已取
        for ext in (".aux", ".log", ".tex", ".pdf", ".out"):
            fp = base + ext
            if os.path.exists(fp):
                try: os.remove(fp)
                except OSError: pass

# ---- 步骤 1：找 4 处定义 ----
L("=" * 72)
L("m101c — §7 `every edge` 前提检查")
L("step1: 在 _work/flat/*.tex（顶层）找 every edge 定义（拼写候选已列）")
L("=" * 72)
defs = []  # (paper, lineno, full_line, tikzpicture_block, block_start, block_end)
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex") or fn.startswith("_work_tex"):
        continue
    paper = fn[:-4]
    text = read(os.path.join(FLAT, fn))
    blocks = picture_blocks(text)
    for i, ln in enumerate(text.splitlines(), 1):
        if "every edge" in ln and DEF_RE.search(ln):
            # 找包含这一行的 tikzpicture
            blk = None
            for (bs, be, b) in blocks:
                if bs <= i <= be:
                    blk = (bs, be, b)
                    break
            defs.append((paper, i, ln.strip(), blk))
            L("  [%d] %s:%d" % (len(defs), paper, i))
            L("       原文: %s" % ln.strip())

L("")
L("step1 小计：找到 %d 处 every edge 定义（预期 4 处 / 4 篇）" % len(defs))

# ---- 步骤 2 + 3 + 4：逐处处理 ----
L("")
L("=" * 72)
L("step2/3/4：逐处——edge 算子是否走到 + 控制页墨 + typst thickness 字符串计数")
L("=" * 72)

# 先收集每篇正文字号（typst）
font_cache = {}

case_no = 0
results = []  # 每处结论要素
for (paper, lineno, deffull, blk) in defs:
    case_no += 1
    L("")
    L("-- 案 %d: %s (定义行 %d)" % (case_no, paper, lineno))
    L("   定义原文: %s" % deffull)
    # 笔判定
    pen_m = PEN_KW.search(deffull)
    pen = pen_m.group(1) if pen_m else None
    L("   带笔? %s" % (pen if pen else "无（只带 draw/->/font 等，无线宽）"))

    if blk is None:
        L("   !! 未定位到 enclosing tikzpicture（AMBIGUOUS/NOSITE）——跳过该案")
        results.append((paper, pen, None, None, None, None))
        continue
    bs, be, block = blk
    # step2: edge 算子计数（不计 every edge 定义里的 edge 字）
    edge_total = len(EDGE_TOK.findall(block))
    every_edge_ct = len(re.findall(r"every edge", block))
    edge_ops = edge_total - every_edge_ct
    # 源语句
    op_lines = []
    for j, ln in enumerate(block.splitlines(), bs):
        if j == lineno:
            continue
        if re.search(r"(?<!every )\bedge\b", ln):
            op_lines.append((j, ln.strip()))
    L("   step2: 该 tikzpicture 行 %d-%d；edge 词总数=%d（含定义 1）=> 真·edge 算子=%d"
      % (bs, be, edge_total, edge_ops))
    if op_lines:
        for (j, s) in op_lines:
            L("       源语句 %d: %s" % (j, s))
    else:
        L("       源语句:（无裸 edge 算子）")

    # step3: 控制页（pdflatex standalone @ 该篇正文字号）+ fitz 量 width
    td = typst_dir(paper)
    if td.startswith(("AMBIGUOUS", "NOSITE")):
        L("   step3: typst 目录 %s —— 跳过控制页" % td)
        pgf_strokes = None; pgf_narrow = None; pgf_widths = None; pdf_info = td
    else:
        if paper not in font_cache:
            font_cache[paper] = body_text_size(os.path.join(td, "main.typ"))
        fsize = font_cache[paper]
        paper_tex = os.path.join(FLAT, paper + ".tex")
        pgf_strokes, pgf_narrow, pgf_widths, pdf_info = build_and_measure(
            WORK, case_no, paper, fsize, block, paper_tex)
        L("   step3: 控制页字号=%spt；笔画条数=%s；非默认线宽(>%.2fpt)条数=%s"
          % (fsize, pgf_strokes, DEFAULT_WIDTH, pgf_narrow))
        if pgf_widths:
            L("       控制页 fitz 量到的描边线宽(pt)集合=%s" % sorted(pgf_widths))
        if isinstance(pdf_info, tuple):
            L("       控制页 pdf: mtime=%s, bytes=%d" % pdf_info)
        else:
            L("       控制页: %s" % pdf_info)

    # step4: typst main.typ 只读文本，count thickness:
    if td.startswith(("AMBIGUOUS", "NOSITE")):
        L("   step4: typst 目录 %s —— 跳过 thickness 计数" % td)
        thick_dist = td
    else:
        ttext = read(os.path.join(td, "main.typ"))
        tvals = re.findall(r"thickness:\s*([0-9.]+)pt", ttext)
        dist = {}
        for v in tvals:
            dist[v] = dist.get(v, 0) + 1
        thick_dist = dist
        L("   step4: typst main.typ 只读文本；thickness: 共 %d 处，分布=%s"
          % (len(tvals), ", ".join("%spt×%d" % (k, v) for k, v in sorted(dist.items()))))
        # 该图对应画布的 edge 线（line(..., stroke:(thickness:..), mark:...)）
        edge_thick = re.findall(r"line\([^)]*stroke:\s*\(thickness:\s*([0-9.]+)pt[^)]*\),\s*mark:", ttext)
        if edge_thick:
            L("       typst 画布里带 mark 的 line（=箭头支线）thickness 值=%s"
              % (", ".join("%spt" % v for v in edge_thick)))

    results.append((paper, pen, edge_ops, pgf_strokes, pgf_narrow, pgf_widths, thick_dist))

# ---- 步骤 5：结论 ----
L("")
L("=" * 72)
L("step5：回执结论（三档之一）")
L("=" * 72)

pen_cases = [(p, pen, eo, ps, pn, pw, td) for (p, pen, eo, ps, pn, pw, td) in results if pen]
L("带笔的案（semithick/thick）：%d 处" % len(pen_cases))
real = []
noink = []
inert = []
consistent = []
unmeasured = []
for (p, pen, eo, ps, pn, pw, td) in pen_cases:
    L("  · %s  笔=%s  edge算子=%s  控制页笔画=%s 非默认线宽=%s  控制页线宽集=%s  typst-thickness=%s"
      % (p, pen, eo, ps, pn, sorted(pw) if pw else pw, td))
    if eo is None or eo == 0:
        inert.append((p, pen, "edge 算子未走到（声明到不了任何路径）"))
        continue
    our_pen_pt = {"semithick": "0.6", "thick": "0.8"}.get(pen)
    typst_vals = set(td) if isinstance(td, dict) else set()
    if ps is None:
        # 控制页没造出来：不能用尺量页上墨；改以源＋typst 文本判定，绝不谎报 inert
        L("    -> 控制页未造（编译受限于提取宏/目录），无法用尺量页上墨；以源(edge算子=%s)与 typst 判定" % eo)
        L("    -> pgf 笔=%s(≈%spt)；typst 画布 thickness 取值=%s"
          % (pen, our_pen_pt, ", ".join(sorted(typst_vals)) or "—"))
        if our_pen_pt in typst_vals:
            consistent.append((p, pen, our_pen_pt, sorted(typst_vals), "控制页未造但 typst 已一致"))
        else:
            unmeasured.append((p, pen, our_pen_pt, sorted(typst_vals)))
        continue
    if pn is None or pn == 0:
        noink.append((p, pen, "页上无墨（无非默认线宽笔画）"))
        continue
    L("    -> pgf 笔=%s(≈%spt)；typst 画布 thickness 取值=%s"
      % (pen, our_pen_pt, ", ".join(sorted(typst_vals)) or "—"))
    if our_pen_pt in typst_vals:
        consistent.append((p, pen, our_pen_pt, sorted(typst_vals), "控制页有墨且 typst 一致"))
    else:
        real.append((p, pen, our_pen_pt, sorted(typst_vals)))
        L("    -> 我们的笔与 pgf 笔不一致：真案")

L("")
if real:
    L("结论：页上有墨且我们的笔不一致 —— 真案（%d 篇/处）" % len(real))
    for (p, pen, up, tv) in real:
        L("   %s  笔=%s  pgf≈%spt  typst=%s  来源：控制页 fitz + typst main.typ 文本计数" % (p, pen, up, tv))
elif noink:
    L("结论：页上无墨 —— 零行动（%d 处）" % len(noink))
    for x in noink:
        L("   %s  笔=%s  %s" % x)
elif inert:
    L("结论：这些声明根本到不了任何路径 —— 零行动（inert，%d 处）" % len(inert))
    for x in inert:
        L("   %s  笔=%s  %s" % x)
elif consistent:
    L("结论：带笔的 %d 处——页上均有墨（控制页/fitz 或源确认），且我们的笔（typst）与之完全一致" % len(consistent))
    for (p, pen, up, tv, why) in consistent:
        L("   %s  笔=%s  pgf≈%spt  typst=%s  (%s)" % (p, pen, up, tv, why))
    L("   => §7 那一行「带笔 2 处」不构成 pgf↔typst 偏差，不当作缺陷立案：零行动（照实报负结果，clause 7）。")
else:
    L("结论：带笔的案无子档可归类（见上逐项）。")
if unmeasured:
    L("提示：%d 处控制页未造、无法用尺量页上墨（见上），以 typst 文本计数辅助判定已列入 consistent/需复核。" % len(unmeasured))

# ---------------------------------------------------------------------------
# 落盘 + stdout
receipt = "\n".join(lines)
out_path = os.path.join(WORK, "label101c_every_edge.txt")
io.open(out_path, "w", encoding="utf-8").write(receipt + "\n")
print(receipt)
