# -*- coding: utf-8 -*-
# C 稿收稿侧的宏回改：只改反引号代码跨度之外的站点，代码跨度里的素材宏名是逐字引用，原样保留。
# 用法：python _work/c_macro_fix.py C02 [--apply] [--root=被引笔记]
#   凭据链条一处：普查报出的拒渲宏名 -> _work/macro_defs.json（由 _work/macro_extract.py 从该篇素材
#   preamble 逐字抽）-> 定义体规范化成 KaTeX 认得的形。表里没有且无宏包凭据的一律登记，不发明。
import io, re, sys, glob, json

sys.stdout.reconfigure(encoding='utf-8')

DEFS = json.load(io.open('_work/macro_defs.json', encoding='utf-8'))
SITES = '_c_sites.jsonl'
UNRESOLVED = '_work/c_macro_unresolved.txt'

# 素材靠宏包带进来的箭头形（凭据＝素材 preamble 的 \usepackage 行，注释逐条标注）
ALIAS = {
    u'dasharrow': u'\\dashrightarrow',   # 1412.7744/main.tex:8 \usepackage[all]{xy}，xy-pic 的 \dasharrow 即虚线右箭
    u'mathds': u'\\mathbb',              # 2305.19109/NonVanishing3.tex:18 \usepackage{dsfont}，素材自己写 \mathds{Q}（L101-105），KaTeX 同族形 \mathbb
    u'llangle': u'\\langle\\!\\langle',  # mathtools 的双左角括；素材无 \newcommand 凭据时按标准形展开
    u'rrangle': u'\\rangle\\!\\rangle',
    u'ensuremath': u'\\mathord',         # KaTeX 没有 \ensuremath（它是 LaTeX 的文本/数学切换），站点全在数学模式里；
                                          # \mathord{…} 把原实参组整组带过去，渲染与素材语义同形
    u'mbox': u'\\text',                  # KaTeX 不收 \mbox，\text 是它的同职形（\mbox{Alb} -> \text{Alb}）
    u'hbox': u'\\text',
}

# 不进算子名兜底的两类：图形类（内容是一张图，换成算子名会把图吞掉）与盒子/文字外壳类
# （\mbox \text 这一族自己就是包着一段内容的壳，实参组跟着在后面，套成 \operatorname{mbox}{…} 就是坏形）
NOTOPNAME = {u'xymatrix', u'bordermatrix', u'tikzcd', u'begin', u'end',
             u'mbox', u'hbox', u'fbox', u'parbox', u'text', u'textup', u'textrm',
             u'ensuremath', u'boxed', u'mathop', u'operatorname'}

# 「字体前缀＋一个大写字母」的简写形（\bC、\cD）：同一素材里若该前缀已有 ≥2 枚兄弟宏定义成同一种字体，
# 写手沿同一约定用的其它字母就是这一族（C32 的 \bc 对素材 \bC -> \mathbb{C}）。一族两制不作数。
SHORTHAND = re.compile(r'^([a-z]{1,3})([A-Z])$')
LADFAM = re.compile(r'^\\(mathbb|mathcal|mathfrak|mathbf)\{([A-Za-z])\}$')


def shorthand_shaped(name, fam):
    """这一族的名字形：`\bC` 这类「小写前缀＋一个大写字母」，以及前缀已经是本篇成族字体前缀、只剩一个字母的
    那一形（`\bc` 对素材 `\bC`）。它们要么是同族简写、要么就是写手自己打错的字母，绝不能读成算子名。"""
    m = SHORTHAND.match(name)
    return bool(m) or (1 <= len(name) - 1 <= 3 and name[:-1] in fam)


def families(defs):
    """{前缀: 字体命令}，只收同前缀同字体、且兄弟不少于两枚的族。"""
    seen = {}
    for nm, body in defs.items():
        m = SHORTHAND.match(nm)
        if not m or nm[:len(nm) - 1] != m.group(1):
            continue
        f = LADFAM.match(normalize(body, defs)[0])
        if not f:
            continue
        seen.setdefault(m.group(1), {}).setdefault(f.group(1), []).append(nm)
    out = {}
    for pre, byfam in seen.items():
        fams = list(byfam)
        if len(fams) == 1 and len(byfam[fams[0]]) >= 2:
            out[pre] = fams[0]
    return out

# 本篇只定义了一族里的两三枚字母时，families() 那把尺对这个前缀就是瞎的（兄弟不足两枚）。
# 但「小写前缀＋一枚字母」是全库约定：量具 _work/c_gpre_table.py 实测——前缀 `c` 在 17 篇素材 preamble
# 里都有定义且 normalize 后**全部**落在 \mathcal（含小写字母形 `cc`→\mathcal c，C16/C56 两处），
# 前缀 `f` 在 6 篇里全部落在 \mathfrak。反例同样清楚：`b` 一前缀两制（\mathbb 13 篇 / \mathbf 4 篇，
# 且 C32 自己就同时写 bk→\mathbf、bN→\mathbb），所以 `b` 不作数，`\bc` 仍旧登记不发明。
# 门＝该前缀在全库只有一种字体族，且见证篇数不少于三；一篇的偶然不许当成约定。
GPRE_W = re.compile(r'^([a-z]{1,3})([A-Za-z])$')
GPRE_MIN = 3
_GPRE = None


def global_families():
    """{前缀: (字体命令, 见证篇数)}，只收全库唯一族且 ≥GPRE_MIN 篇的那一档。"""
    global _GPRE
    if _GPRE is not None:
        return _GPRE
    seen = {}
    for cid, defs in DEFS.items():
        for nm, body in defs.items():
            m = GPRE_W.match(nm)
            if not m or nm[:-1] != m.group(1):
                continue
            f = LADFAM.match(normalize(body, defs)[0])
            if not f:
                continue
            seen.setdefault(m.group(1), {}).setdefault(f.group(1), set()).add(cid)
    _GPRE = {}
    for pre, byfam in seen.items():
        if len(byfam) == 1:
            fam, ids = list(byfam.items())[0]
            if len(ids) >= GPRE_MIN:
                _GPRE[pre] = (fam, len(ids))
    return _GPRE

# 文本态算子名 → \operatorname，大小写逐字保留（素材写 \textup{Num} 就是 Num，不许换成 \ker 那种改了大小的内置形）
TXTOP = re.compile(r'^\\?(?:textup|text|textrm|mathrm|textnormal|mbox)\{([A-Za-z]+)\}$')
RMTXT = re.compile(r'^\{?\\(?:rm|it|bf|operatorname)\s*\{?([A-Za-z]+)\}?\}?$')
OPWRAP = re.compile(r'\\mathop\{([^{}]*)\}(?:\\no(?:limits|style))?')

# AMS 字体梯子：素材用 \font 声明的字体切换宏（\Bbb、\Cal、\euf，以及它们展开后的 \fam\..\ten..），
# 逐字搬进 KaTeX 一个也渲不出（C10 那 123 枚站点就是这么换成 180 枚 \fam 的）。
# 凭据＝素材 preamble 里的梯子声明本身，形如 \font\Bbb=\msbfam ... \textfont2=\tenmsb。
LADDER = [
    (re.compile(r'\\fam\\msbfam\\tenmsb\s*\{?([A-Za-z])\}?'), u'\\\\mathbb{\\1}'),
    (re.compile(r'\\fam\\Calfam\\tenCal\s*\{?([A-Za-z])\}?'), u'\\\\mathcal{\\1}'),
    (re.compile(r'\\fam\\euffam\\teneuf\s*\{?([A-Za-z])\}?'), u'\\\\mathfrak{\\1}'),
    (re.compile(r'\\Bbb(?![A-Za-z])\s*\{?([A-Za-z])\}?'), u'\\\\mathbb{\\1}'),
    (re.compile(r'\\Cal(?![A-Za-z])\s*\{?([A-Za-z])\}?'), u'\\\\mathcal{\\1}'),
    (re.compile(r'\\euf(?![A-Za-z])\s*\{?([A-Za-z])\}?'), u'\\\\mathfrak{\\1}'),
]


def _ladder(b):
    for pat, rep in LADDER:
        b = pat.sub(rep, b)
    return b


# 展开后仍带 TeX 排版内部名的一律不认作可渲形：登记不发明，绝不落盘。
INTERNAL = re.compile(r'\\(?:fam|ten[a-z]+|[a-z]+fam|textfont\d|scriptfont\d|scriptscriptfont\d'
                      r'|font|fontdimen|z@|@ne|eight[a-z]*|six[a-z]*|five[a-z]*|seven[a-z]*)')


def normalize(body, defs, depth=0):
    b = body.strip()
    while b.startswith(u'{') and b.endswith(u'}') and len(b) > 1:
        inner = b[1:-1]
        if inner.count(u'{') == inner.count(u'}'):
            b = inner.strip()
        else:
            break
    b = _ladder(b)
    if depth < 4:
        for nm in re.findall(r'\\([A-Za-z]+)', b):
            src = defs.get(nm) or ALIAS.get(nm)
            if src:
                sub, ok = normalize(src, defs, depth + 1)
                # 界定符宏（体尾带 \x00 标记）不能被嵌进别的模板里：那样实参读取次序就乱了，留给逐站点展开
                if ok and u'\x00' not in sub:
                    b = re.sub(r'\\%s(?![A-Za-z])' % nm, sub.replace(u'\\', u'\\\\'), b)
    b = _ladder(OPWRAP.sub(u'\\1', b))
    m = TXTOP.match(b) or RMTXT.match(b)
    if m:
        return u'\\operatorname{%s}' % m.group(1), True
    # 定义体是一串纯字母（素材 \DeclareMathOperator{\Int}{int} 这类）：数学模式里裸写字母串会被
    # 读成一串单字母斜体乘积，还要和前面的控制字粘成新词。算子名只能走 \operatorname。
    if re.match(r'^[A-Za-z]+$', b):
        return u'\\operatorname{%s}' % b, True
    return b, b.count(u'{') == b.count(u'}') and not INTERNAL.search(b)


# 关系/运算类控制字：粘连拆分的左半只能是这些（KaTeX 内置，逐个可用普查复量验）
REL = ['notin', 'subseteqq', 'supseteqq', 'subseteq', 'supseteq', 'subsetneq', 'supsetneq',
       'subset', 'supset', 'longmapsto', 'longrightarrow', 'leftarrow', 'rightarrow', 'mapsto',
       'setminus', 'parallel', 'perp', 'equiv', 'sim', 'cap', 'cup', 'vee', 'wedge', 'times',
       'cdot', 'mid', 'ni', 'in', 'to', 'le', 'ge', 'll', 'gg', 'lt', 'gt']


def opwords(defs):
    """本篇素材 preamble 里展开成算子名的那些词（纯字母体 + \text{X}/\rm X 族），供粘连拆分认右半。"""
    words = {}
    for nm, body in defs.items():
        dst, ok = normalize(body, defs)
        if ok:
            m = re.match(r'^\\operatorname\{([A-Za-z]+)\}$', dst)
            if m:
                words[m.group(1)] = dst
    return words


def ops_for(cid):
    """从普查站点表取本稿拒渲宏名，逐个按素材定义表求形；求不到登记进 UNRESOLVED。"""
    toks = set()
    for l in io.open('_work/' + SITES, encoding='utf-8'):
        if not l.strip():
            continue        # 全根零站点时普查只落一个空行：尺子要能读「零」这一形
        r = json.loads(l)
        if r['file'].startswith(cid + u'-') and r.get('tok'):
            toks.add(r['tok'])
    defs = DEFS.get(cid, {})
    words = opwords(defs)
    fam = families(defs)
    ops, miss, reg = [], [], []
    for tok in sorted(toks):
        name = tok[1:]
        if name in defs:
            dst, ok = normalize(defs[name], defs)
            if ok and dst != tok:
                ops.append((tok, dst, u'素材 preamble'))
                continue
        if name in ALIAS:
            ops.append((tok, ALIAS[name], u'宏包凭据'))
            continue
        # 粘连拆分：左半是内置关系符、右半是本篇素材的算子名（回改侧自己粘出来的那族坏形）
        split = [(u'\\' + p + u' ' + words[name[len(p):]], p) for p in REL
                 if name.startswith(p) and name[len(p):] in words]
        if split:
            dst, p = split[0]
            ops.append((tok, dst, u'粘连拆分（\\%s + 算子 %s）' % (p, name[len(p):])))
            continue
        # 同族简写梯子：素材按「前缀＋字母」定义了一族字体宏，写手用同族其它字母（C32 \bc / 素材 \bC）
        sh = SHORTHAND.match(name)
        if sh and sh.group(1) in fam:
            ops.append((tok, u'\\%s{%s}' % (fam[sh.group(1)], sh.group(2)),
                        u'同族简写（前缀 \\%s 在素材里有 ≥2 枚兄弟宏＝\\%s）' % (
                            sh.group(1), fam[sh.group(1)])))
            continue
        # 全库同族约定：本篇这个前缀没有兄弟宏，但别的素材篇里它有 ≥3 篇且唯一一种字体族（GPRE）。
        # 字母逐字保留（\cX→\mathcal{X}、\cc→\mathcal{c}），只换外壳命令，不许改大小写。
        gm = GPRE_W.match(name)
        gpre = global_families()
        if gm and gm.group(1) in gpre:
            gfam, gn = gpre[gm.group(1)]
            ops.append((tok, u'\\%s{%s}' % (gfam, gm.group(2)),
                        u'全库同族（前缀 \\%s 在 %d 篇素材里唯一展开成 \\%s）' % (gm.group(1), gn, gfam)))
            continue
        # 算子名兜底：整词是字母、长度 ≥2、又不是简写形（\Lift \relint \Conv 这类写手自己起的算子名）。
        # 裸控制字 KaTeX 渲不出（等于内容看不见），\operatorname{词} 把字母逐字原样立排发出，不增不减拼写。
        if (len(name) >= 2 and name.isalpha() and name not in NOTOPNAME
                and not shorthand_shaped(name, fam)):
            ops.append((tok, u'\\operatorname{%s}' % name, u'算子名（字母逐字保留，无素材定义）'))
            continue
        miss.append(tok)
    if miss:
        have = set()
        try:
            have = set(io.open(UNRESOLVED, encoding='utf-8').read().split('\n'))
        except IOError:
            pass
        with io.open(UNRESOLVED, 'a', encoding='utf-8') as f:
            for tok in miss:
                key = u'%s\t%s' % (cid, tok)
                if not any(h.startswith(key + u'\t') for h in have):
                    f.write(u'%s\t无 preamble 定义、无宏包凭据，登记不发明\n' % key)
    return ops, miss


# 普查把「本篇有凭据、却被全局宏表读出别义」的站点记成 tok=null 的 parse error，undef 那一族看不见它们。
# 两条成因同源：`_work/katex_macros.json` 是**全库**表（`\wt` 记成 `\widetilde{#1}`），而该篇 preamble
# 写的是 `{\rm wt}`；normalize 又常把 `{\rm quo}` 发成裸 `\operatorname{quo}`，KaTeX 里函数不能坐在
# 下标位右侧（`h_\operatorname{quo}` 报 "Got function ... as subscript"，`\wt_\xi` 报 "Expected group
# after '_'"；作为带下标的底则合法——探针 c_opside_probe.js 量过这一侧的不对称）。
# 一式解决：凡 tok=null 跨度里出现、本篇 preamble 有 0 参凭据的宏名，一律按**本篇**凭据展开并成组；
# 展开体若是裸词（`\DeclareMathOperator\red{red}` 那一族）就发 `\operatorname{词}`，直立体不算发明。
SUB_CS = re.compile(u'\\\\([A-Za-z]+)')


def perr_names(cid):
    """普查把「本篇有凭据、却被全局宏表遮蔽」的站点记成 parse error（tok=null），
    按 undef 那一族拿不到宏名。这里就在这些跨度里扫本篇有凭据的宏名，一律按本篇凭据展开。"""
    names = set()
    defs = DEFS.get(cid, {})
    for l in io.open('_work/' + SITES, encoding='utf-8'):
        if not l.strip():
            continue        # 全根零站点时普查只落一个空行：尺子要能读「零」这一形
        r = json.loads(l)
        if not r['file'].startswith(cid + u'-') or r.get('tok'):
            continue
        for m in SUB_CS.finditer(r['body']):
            if m.group(1) in defs:
                names.add(m.group(1))
    return names


cid = sys.argv[1].upper()
APPLY = '--apply' in sys.argv
ROOT = next((a.split('=', 1)[1] for a in sys.argv if a.startswith('--root=')), u'被引笔记')
hits = glob.glob(u'%s/%s-*.md' % (ROOT, cid))
assert len(hits) == 1, hits
path = hits[0]
raw = io.open(path, 'rb').read()
assert b'\r' not in raw, '盘上带 CR，先查上一笔'
text = raw.decode('utf-8')

ops, miss = ops_for(cid)
subs = perr_names(cid)
# 纯语法那一式（裸 \operatorname 当下标）不要凭据，看见就得补；否则这一族永远过不了闸门。
opsub = re.search(u'[_^]\\\\operatorname\\{', re.sub(r'`[^`\n]*`', '', text))
if not ops and not subs and not opsub and not re.search(u'(?<!\\\\)#\\d', re.sub(r'`[^`\n]*`', '', text)):
    print('%s 无可回改站点（普查零站点，或全部无凭据已登记） 未决=%s' % (cid, ' '.join(miss) or '无'))
    sys.exit(0)

# 参数宏的展开：模板里的 #N 是 TeX 占位符，KaTeX 不认（素材 \newcommand{\Dfunctor}[1]{\mathcal{D}_{#1}}
# 逐字发出后把 `{#1}` 印进正文）。正确的形是把实参代进 #N 位再发出，站点两形都要管：
#   宏名形      \holom{\psi}{Z}{X}
#   残模板形    \ensuremath{#1:#2 \rightarrow #3}{\psi}{Z}{X}（上一轮逐字发出的那批，C17/C32/C33 共 55 枚）
# 实参读不到（组不配平、个数不够）就原样留着，交给普查与登记表——绑不上不等于可以发明。
PLACE = re.compile(u'(?<!\\\\)(?<!#)#(\\d)')
ATOM = re.compile(u'\\\\[A-Za-z]+|[A-Za-z0-9]')


def arity(tmpl):
    ds = [int(m.group(1)) for m in PLACE.finditer(tmpl)]
    return max(ds) if ds else 0


def split_body(body):
    """拆出 macro_extract 存在体尾的界定符标记：返回 (模板, 每位实参的界定符或 None)。"""
    if u'\x00' not in body:
        return body, []
    t, d = body.split(u'\x00', 1)
    return t, [None if x == u'-' else x for x in d]


def arg_wraps(tmpl, ar):
    """模板里每个占位符被什么包住（`{#1}`、`(#1)`）；决定实参可以按哪种组形来读、代回去时长什么样。"""
    w = [None] * ar
    for m in PLACE.finditer(tmpl):
        k = int(m.group(1)) - 1
        if k >= ar:
            continue
        if w[k]:
            continue
        prev = tmpl[m.start() - 1] if m.start() else u''
        nxt = tmpl[m.end()] if m.end() < len(tmpl) else u''
        w[k] = prev if prev in u'{(' and nxt == prev.replace(u'{', u'}').replace(u'(', u')') else None
    return w


def read_arg(s, p, openers, delim=None):
    """从 p 起读一枚 TeX 实参，返回 (内文, 新下标)；读不到返回 None。
    delim 走界定符形（`\rfdown B.` 取到 B 并吃掉句点）；否则只认花括号组、控制字、单个字母数字。
    openers 里有 `(` 时括号组也算（模板占位符本身就坐在括号里的那形，素材里 `\\Alb(X)` 那一形）。"""
    while p < len(s) and s[p] in u' \t\n':
        p += 1
    if p >= len(s):
        return None
    if delim:
        d, e = 0, p
        while e < len(s):
            if s[e] == u'\\':
                e += 2
                continue
            if s[e] == u'{':
                d += 1
            elif s[e] == u'}':
                d -= 1
            elif s[e] == delim and d <= 0:
                return s[p:e], e + 1
            e += 1
        return None
    c = s[p]
    if c in openers:
        close = u'}' if c == u'{' else u')'
        d, e = 0, p
        while e < len(s):
            if s[e] == u'\\':
                e += 2
                continue
            if s[e] == c:
                d += 1
            elif s[e] == close:
                d -= 1
                if d == 0:
                    break
            e += 1
        return None if d else (s[p + 1:e], e + 1)
    m = re.match(u'\\\\[A-Za-z]+', s[p:])
    if m:
        return m.group(), p + m.end()
    if c.isalnum():
        return c, p + 1
    return None


def fill(tmpl, args):
    res, i = [], 0
    while i < len(tmpl):
        m = PLACE.match(tmpl, i)
        if not m:
            res.append(tmpl[i])
            i += 1
            continue
        inner = args[int(m.group(1)) - 1]
        j = m.end()
        prev = tmpl[i - 1] if i else u''
        nxt = tmpl[j] if j < len(tmpl) else u''
        if prev == u'{' and nxt == u'}':          # 整对花括号换成实参组，得 `_{X}`
            res.pop()
            j += 1
            rep = u'{' + inner + u'}' if inner else u''
        elif prev == u'(' and nxt == u')':        # 括号本来就在，只填内文
            rep = inner
        elif ATOM.fullmatch(inner):
            rep = inner
        else:
            rep = u'{' + inner + u'}'
        res.append(rep)
        i = j
    return u''.join(res)


def bind_sites(s, pat, tmpl, ar, delims, wraps, ex=None):
    """把 pat 的每个站点展开成「实参代进 #N 位」。返回 (新文本, 展开数, 绑不上的数)。"""
    out, last, n, fail = [], 0, 0, 0
    openers = [u'{', u'('] if u'(' in wraps else [u'{']
    for m in re.finditer(pat, s):
        args, p = [], m.end()
        for k in range(ar):
            r = read_arg(s, p, openers, delims[k] if delims else None)
            if r is None:
                break
            args.append(r[0])
            p = r[1]
        if len(args) != ar:
            fail += 1
            continue
        rep = fill(tmpl, args)
        if ex is not None and len(ex) < 3:
            ex.append((s[m.start():p], rep))
        out.append(s[last:m.start()])
        out.append(rep)
        last = p
        n += 1
    out.append(s[last:])
    return u''.join(out), n, fail


def par_defs(cid):
    """本篇素材 preamble 里所有带占位符的参数宏（模板已规范化），供宏名形与残模板形两条站点用。"""
    defs = DEFS.get(cid, {})
    lst = []
    for nm in sorted(defs):
        dst, ok = normalize(defs[nm], defs)
        if not ok:
            continue
        t, delims = split_body(dst)
        ar = arity(t)
        if ar:
            lst.append((u'\\' + nm.lstrip(u'*'), t, ar, delims, arg_wraps(t, ar)))
    return lst


# 切成「代码跨度 / 非代码跨度」交替段，只在非代码段上替换；\Name 后紧跟字母的是另一个词，不吃
def segsplit(s):
    segs, pos = [], 0
    for m in re.finditer(r'`[^`\n]*`', s):
        segs.append((s[pos:m.start()], False))
        segs.append((s[m.start():m.end()], True))
        pos = m.end()
    segs.append((s[pos:], False))
    return segs


segs = segsplit(text)
plain = [(re.compile(re.escape(src) + u'(?![A-Za-z])'),
          dst if dst.startswith(u'\\') else u' ' + dst, why, src)
         for src, dst0, why in ops for dst in [split_body(dst0)[0]] if not arity(dst)]
pars = {}
for src, dst, why in ops:
    t, delims = split_body(dst)
    ar = arity(t)
    if ar:
        pars[src] = (re.compile(re.escape(src) + u'(?![A-Za-z])'), t, ar, delims,
                     arg_wraps(t, ar), why)
cnt = dict((src, 0) for src, _, _ in ops)
unbound = dict((src, 0) for src in pars)
EX = []                                    # DRY 时给人过目的样例（每形至多三枚）
fixed = []
for s, is_code in segs:
    if is_code:
        fixed.append(s)
        continue
    for pat, dst, why, src in plain:
        n = len(pat.findall(s))
        if n:
            cnt[src] += n
            s = pat.sub(dst.replace(u'\\', u'\\\\'), s)
    for src, (pat, t, ar, delims, wraps, why) in pars.items():
        s, n, f = bind_sites(s, pat, t, ar, delims, wraps, EX if len(EX) < 3 else None)
        cnt[src] += n
        unbound[src] += f
    fixed.append(s)
out = ''.join(fixed)

# 残模板形：正文里已经印着 `…#1…{实参}` 的那些（上一轮逐字发出模板留下的，普查把这些站点记成 tok=null，
# ops_for 拿不到宏名）。凭据仍是本篇 preamble 的定义——按模板字面串找站点，绑不上的原样留着计数登记。
nleg = 0
for nm, t, ar, delims, wraps in par_defs(cid):
    if nm in pars:
        continue                       # 宏名形那一轮已经处理过，不重复走
    pat = re.compile(re.escape(t))
    segs2 = segsplit(out)
    for i, (s, is_code) in enumerate(segs2):
        if is_code:
            continue
        s, n, _ = bind_sites(s, pat, t, ar, delims, wraps, EX if len(EX) < 3 else None)
        nleg += n
        segs2[i] = (s, is_code)
    out = ''.join(s for s, _ in segs2)
nbind = sum(cnt[src] for src in pars)

# 第三族（被全局宏表遮蔽的本篇凭据）：普查对这些跨度只报 parse error，undef 那一族拿不到宏名，
# 于是按**本篇** preamble 精确展开并成组。成组是必须的——`\wt_\xi` 里下标会绑进函数、
# `h_\operatorname{quo}` 直接把函数当参数吃掉（探针 c_opside_probe.js 量过两侧的不对称）。
nperr = 0
# 定义体展开后必须是一个不带参的「词」；`\widetilde`、`\mathfrak` 这类还要吃参的不在这里补，
# 交回普查与登记表——补了也只是把炸点换个位置。
WORD = re.compile(u'^[A-Za-z]+$')
CS_IN = re.compile(u'\\\\([A-Za-z]+|.)')
# 展开体只许是 KaTeX 认得的字体/算子族，否则不发（`\protect`、`\scalerel` 这类发了只是换个炸点）。
ALLOWED = {u'rm', u'mathrm', u'mathbf', u'mathbb', u'mathcal', u'mathfrak', u'mathsf', u'mathit',
           u'operatorname', u'text', u'textup', u'textrm', u'textbf', u'bm', u'boldsymbol'}
subs_rules = []
done = set(src.lstrip(u'\\') for src in list(cnt) + list(pars))
for nm in sorted(subs - done):
    dst, ok = normalize(DEFS[cid][nm], DEFS[cid])
    t, dl = split_body(dst)
    if not ok or dl or arity(t) or any(g not in ALLOWED for g in CS_IN.findall(t)):
        continue
    if WORD.match(t):                    # \DeclareMathOperator\red{red} 那一族＝直立体算子名
        t = u'\\operatorname{' + t + u'}'
    if not (t.startswith(u'{') and t.endswith(u'}')):
        t = u'{' + t + u'}'
    subs_rules.append((re.compile(u'\\\\' + nm + u'(?![A-Za-z])'),
                       (lambda m, g=t: g),
                       u'\\%s＝%s（本篇 preamble）' % (nm, t)))
# 裸 \operatorname{词} 坐在下标位**右侧**才渲不出（作为底带下标是合法形，探针 c_opside_probe.js 量过）
subs_rules.append((re.compile(u'([_^])(\\\\operatorname\\{[^{}]*\\})'),
                  (lambda m: m.group(1) + u'{' + m.group(2) + u'}'),
                  u'裸 \\operatorname 当下标补组'))
segs3 = segsplit(out)
for i, (s, is_code) in enumerate(segs3):
    if is_code:
        continue
    for pat, fn, why in subs_rules:
        s, n = pat.subn(fn, s)
        nperr += n
    segs3[i] = (s, is_code)
out = ''.join(s for s, _ in segs3)
total = sum(cnt.values()) + nleg + nperr
delta = len(out.encode('utf-8')) - len(raw)

print('%s 站点=%d（平铺 %d ＋ 参数宏名形 %d ＋ 残模板形 %d ＋ 本篇凭据展开 %d）增量=%+dB' % (
    cid, total, total - nbind - nleg - nperr, nbind, nleg, nperr, delta))
if nperr:
    print('   本篇凭据展开：' + u'、'.join(why for _, _, why in subs_rules))
for src, dst, why in ops:
    t, dl = split_body(dst)
    print('   %-14s -> %-24s %-8d 凭据=%s%s' % (
        src, t, cnt[src], why, u'（实参以「%s」收尾）' % dl[-1] if dl and dl[-1] else u''))
if any(unbound.values()):
    print('   实参绑不上（保留原形、下一轮再账）：%s' %
          u' '.join(u'%s×%d' % (k, v) for k, v in sorted(unbound.items()) if v))
if miss:
    print('   未决（已登记 %s）：%s' % (UNRESOLVED, ' '.join(miss)))
assert out.count(u'$') == text.count(u'$'), '$ 数被改动'
assert out.count(u'`') == text.count(u'`'), '反引号数被改动'
assert out.count(u'\n') == text.count(u'\n'), '行数被改动'
assert u'\x00' not in out
outside = re.sub(r'`[^`\n]*`', '', out)
for src, _, _ in ops:
    left = len(re.findall(re.escape(src) + u'(?![A-Za-z])', outside))
    assert left <= unbound.get(src, 0), '%s 代码跨度外残留 %d > 绑不上 %d' % (src, left, unbound.get(src, 0))
nhash_left = len(PLACE.findall(outside))
if nhash_left or nbind or nleg:
    print('   参数绑定 %d 处；代码跨度外裸 #N 残留 %d 处' % (nbind + nleg, nhash_left))
if not APPLY:
    for old, new in EX:
        print(u'   样例 %-46s -> %s' % (old[:46], new[:60]))
    print('DRY（未落盘）')
    sys.exit(0)
if not total:
    print('%s 无可回改站点（实参全绑不上或已绑尽） 未落盘' % cid)
    sys.exit(0)
data = out.encode('utf-8')
assert len(data) == len(raw) + delta
io.open(u'_work/%s.pre-macrofix.md' % cid, 'wb').write(raw)
io.open(path, 'wb').write(data)
print('APPLIED size=%d %+dB 备份=_work/%s.pre-macrofix.md' % (len(data), delta, cid))
