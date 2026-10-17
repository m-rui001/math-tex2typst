# -*- coding: utf-8 -*-
# C 稿收稿量具：结构 / 定界符 / 禁串 / 位置串真实性（对照素材目录盘面行号）
import io, os, re, sys, glob
from c_code_mask import dollars, mask
sys.stdout.reconfigure(encoding='utf-8')

BAN = [u'而是', u'而非', u'而不是', u'值得注意', u'需要指出', u'换句话说', u'综上', u'总体而言', u'——']
POS = re.compile(r'([A-Za-z0-9_\-\.]+\.(?:tex|sty|cls)):(\d{1,5})(?:-(\d{1,5}))?')
MATERIAL = re.compile(u'被引素材[/\\\\]+([A-Za-z0-9_.\\-]+)')
SEP = re.compile(r'^\|[\s:|-]+\|$')
STMT = re.compile(u'^\\s*(?:\\*\\*)?(?:定理|引理|推论|命题|定义|注记|例|证明|证|问题|猜想|算法|构造|步骤|情形)')
KRANGE = re.compile(u'K 取 (\\d+)\\D+(\\d+)')
SPECPATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), u'..', u'被引笔记', u'规格.md')
REFCITE_LINE = u'不抄素材的'
SPEC_REFCITE = None
TOOL_LINE = u'内部工具词'
TOOL_MARK = u'那几枚：'
SPEC_TOOL = None


def spec_toolwords():
    r"""内部工具词名单只写在规格那一句的反引号里（「……那几枚：`x`、`y`。」）；尺子不另存一份。"""
    text = io.open(SPECPATH, encoding='utf-8').read()
    line = [l for l in text.split(u'\n') if TOOL_LINE in l]
    if not line:
        raise AssertionError(u'规格里找不到「%s」那一句：%s' % (TOOL_LINE, SPECPATH))
    seg = line[0].split(TOOL_MARK, 1)
    if len(seg) < 2:
        raise AssertionError(u'那一句里没有「%s」之后的名单段：%s' % (TOOL_MARK, line[0][:80]))
    toks = re.findall(u'`([^`]+)`', seg[1].split(u'。')[0])
    if not toks:
        raise AssertionError(u'名单段里没抽出反引号token：%s' % seg[1][:60])
    return toks


def spec_refcite():
    r"""禁抄进正文的素材记号（`\label{}` 一族）只写在规格那一句里；从句子本身取，尺子不另存一份名单。"""
    text = io.open(SPECPATH, encoding='utf-8').read()
    line = [l for l in text.split(u'\n') if REFCITE_LINE in l]
    if not line:
        raise AssertionError(u'规格里找不到「%s」那一句：%s' % (REFCITE_LINE, SPECPATH))
    names = re.findall(u'\\\\([A-Za-z]+)\\{\\}', line[0])
    if not names:
        raise AssertionError(u'那一句里没抽出反斜杠记号：%s' % line[0][:60])
    return re.compile(u'\\\\(?:%s)\\{' % u'|'.join(names))


def spec_krange():
    """正文节数区间只写在 `被引笔记/规格.md` 那一句里；读不到就报错，不许尺子里再藏一个数。"""
    text = io.open(SPECPATH, encoding='utf-8').read()
    m = KRANGE.search(text)
    if not m:
        raise AssertionError(u'规格里找不到「K 取 a–b」那一句：%s' % SPECPATH)
    return int(m.group(1)), int(m.group(2))


def check(path):
    global SPEC_REFCITE, SPEC_TOOL
    if SPEC_REFCITE is None:
        SPEC_REFCITE = spec_refcite()
    if SPEC_TOOL is None:
        SPEC_TOOL = spec_toolwords()
    raw = io.open(path, 'rb').read()
    text = raw.decode('utf-8')
    lines = text.split(u'\n')
    rep = []
    size = len(raw)
    rep.append('bytes=%d lines=%d CR=%d' % (size, len(lines), raw.count(b'\r')))
    if size < 22000:
        rep.append('SIZE_BELOW_SPEC %d' % size)
    if raw.count(b'\r'):
        rep.append('CR_PRESENT')
    heads = [(i + 1, l) for i, l in enumerate(lines) if l.startswith(u'## ')]
    nums = []
    for _, h in heads:
        m = re.match(r'##\s+(?:§)?(\d+)', h)
        if m:
            nums.append(int(m.group(1)))
    contig = (nums == list(range(0, len(nums))))
    rep.append('title=%s heads=%d nums=%s..%s contig0=%s' % (
        'Y' if lines[0].startswith('# C') else 'N', len(heads),
        nums[0] if nums else '-', nums[-1] if nums else '-', contig))
    if not contig:
        rep.append('HEAD_NUMBERS_BAD %s' % nums)
    # 规格第 4 节的三条硬结构：## 0 取证边界起、正文节数在规格给的区间内、末节以「与本语料的接缝」收。
    # 区间只有一个口径来源：`被引笔记/规格.md` 那句「K 取 a–b」，尺子不自己抄第二个数。
    K = len(heads) - 1
    lo, hi = spec_krange()
    head0 = heads[0][1] if heads else u''
    seam = heads[-1][1] if heads else u''
    rep.append('spec: head0=%s K=%d(%d-%d) seam=%s' % (
        'Y' if head0.startswith(u'## 0 取证边界') else 'NO', K, lo, hi,
        'Y' if seam.endswith(u'与本语料的接缝') else (u'变体' if (u'接缝' in seam or u'本语料' in seam) else u'缺')))
    if K < lo or K > hi:
        rep.append('SECTION_COUNT_OFF_SPEC K=%d（规格 %d..%d）' % (K, lo, hi))
    if not seam.endswith(u'与本语料的接缝'):
        rep.append('SEAM_NOT_FINAL 「%s」' % seam[:40])
    d = text.count(u'$')
    odd = [(i + 1, dollars(l)) for i, l in enumerate(lines) if dollars(l) % 2]
    bt = text.count(u'`')
    rep.append('dollar=%d(%s) odd_lines=%d btick=%d(%s)' % (d, 'even' if d % 2 == 0 else 'ODD', len(odd),
                                                            bt, 'even' if bt % 2 == 0 else 'ODD'))
    for ln, c in odd[:4]:
        rep.append('   odd$ L%d c=%d' % (ln, c))
    # 数学密度（规格 4.1）。占比单看会误伤：C06 是长段落密度（占比 20.9% 却有 20 条展示式、19 行陈述），
    # 真薄的是「占比低且没有展示式」那一头（C07 占比 3.7%、展示式 1 条）。
    spans = re.findall(r'\$[^$\n]+\$', text)
    mb = sum(len(s.encode('utf-8')) for s in spans)
    pct = 100.0 * mb / size if size else 0.0
    disp = len(re.findall(r'\$\$[\s\S]*?\$\$', text))
    stmt = sum(1 for l in lines if STMT.match(l))
    rep.append('math: spans=%d disp=%d bytes=%d share=%.1f%% stmt_lines=%d' % (len(spans), disp, mb, pct, stmt))
    if pct < 25.0 and disp < 5:
        rep.append('MATH_THIN share=%.1f%% disp=%d（规格 4.1：公式级陈述缺失）' % (pct, disp))
    # 「而是」要做切分护栏：「从而是」「因而+是」里的 而是 不是转折连词，不算禁串
    bans = {}
    for b in BAN:
        n = len(re.findall(u'(?<![从因])' + b, text)) if b == u'而是' else text.count(b)
        if n:
            bans[b] = n
    rep.append('bans=%s' % (bans or 'none'))
    # 素材记号（规格那一句禁抄的一族）：代码跨度内是抄素材行号的合法引述位，掩掉再数。
    rc = sum(len(SPEC_REFCITE.findall(mask(l))) for l in lines)
    rep.append('refcite=%d' % rc)
    if rc:
        rep.append('REFCITE_IN_BODY %d 处（规格禁抄，改文字指代＋位置串）' % rc)
    # 内部工具词（规格那一句反引号里的名单）：代码跨度内也一样不许落进正文，不掩。
    tw = [(t, text.count(t)) for t in SPEC_TOOL if t in text]
    rep.append('toolwords=%d%s' % (sum(n for _, n in tw),
                                   u' %s' % tw if tw else u''))
    if tw:
        rep.append(u'TOOLWORD_IN_BODY（规格：取材边界只说「只读素材的 .tex，未读 .pdf 与编译产物」）')
    # 表格竖线：按表块自比——同块内每行竖线数须与表头一致（C 族表形状不固定，D 族「一行六枚」不是本族判据）
    blocks = []
    cur = []
    for i, l in enumerate(lines):
        if l.startswith(u'| '):
            cur.append((i + 1, l.count(u'|')))
        elif cur:
            blocks.append(cur)
            cur = []
    if cur:
        blocks.append(cur)
    wide = [(ln, c) for blk in blocks for ln, c in blk if c != blk[0][1]]
    rep.append('tables=%d rows=%d badpipe=%d' % (len(blocks), sum(len(b) for b in blocks), len(wide)))
    for ln, c in wide[:3]:
        rep.append('   badpipe L%d pipes=%d' % (ln, c))
    # 位置串
    md = MATERIAL.search(text[:8000])
    dstdir = u'被引素材/' + md.group(1) if md else None
    lc = {}
    bad = []
    if dstdir and os.path.isdir(dstdir):
        for root, sub, files in os.walk(dstdir):
            for f in files:
                if f.endswith(('.tex', '.sty', '.cls')):
                    fp = os.path.join(root, f)
                    lc[f] = io.open(fp, encoding='utf-8', errors='replace').read().count(u'\n') + 1
    for name, a, b in POS.findall(text):
        hi = int(b) if b else int(a)
        if name not in lc:
            bad.append('%s:%s NOFILE' % (name, a))
        elif hi > lc[name]:
            bad.append('%s:%s-%s OVER(%d)' % (name, a, b or a, lc[name]))
    rep.append('material=%s texfiles=%d poscites=%d bad=%d' % (dstdir, len(lc), len(POS.findall(text)), len(bad)))
    for x in sorted(set(bad))[:6]:
        rep.append('   ' + x)
    return rep


targets = sys.argv[1:]
files = []
if not targets or targets == ['ALL']:
    files = sorted(glob.glob(u'被引笔记/C*.md'))
else:
    for t in targets:
        g = sorted(glob.glob(u'被引笔记/%s*' % t))
        files += g if g else [t]
print('checking %d C notes' % len(files))
for f in files:
    print('=== %s' % os.path.basename(f))
    for r in check(f):
        print('   ' + r)
