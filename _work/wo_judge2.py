# -*- coding: utf-8 -*-
"""工单判形 v2：申报语命中 → kind / verdict / now_count / target。
尺子：pipe_lib+gate（复用），closer/latin 为自造尺（报告已注明）。"""
import io, os, re, json, collections, glob, sys

sys.path.insert(0, r"E:\math\_work")
sys.path.insert(0, r"E:\math\.tools")
from pipe_lib import bare, blocks_of, code_ranges
import gate
from wo_lex import KW

NOTES = r"E:\math\研究笔记"
OUTD = r"E:\math\_work\_woprep"
EXCL = {u"D476", u"D71"}
KPRI = {u"closer_char": 1, u"bare_pipe": 2, u"latin_residue": 3, u"ban_style": 4,
        u"line_number_drift": 5, u"other": 6}

PATS = [u"不就地改动", u"就地改动", u"机械可修", u"属机械可修", u"不作任何就地",
        u"留给本体", u"本体侧", u"需本体", u"修法：", u"修法是", u"正确形式是",
        u"应改为", u"应予更正", u"登记不改", u"落盘后不改动", u"本笔记一律不", u"工单"]
DECL = [u"本体侧", u"落盘", u"登记", u"申报", u"不回改", u"就地替换", u"就地改动", u"就地改字",
        u"清理通道", u"机械通道", u"sweep", u"规格", u"缺陷", u"违例", u"禁串", u"禁令",
        u"残留", u"越界", u"事故", u"交本体", u"留给本体", u"机械清理", u"闸门", u"工单",
        u"应改", u"正确形式", u"正确写法", u"应为", u"补回", u"删去", u"作废", u"不重述"]
# 行内必须有的申报标记（否则是叙述性 math 语境里的「修法」假阳）
STRONG_DECL = [u"本体侧", u"落盘", u"登记", u"申报", u"就地", u"清理通道", u"机械",
               u"sweep.py", u"本体侧 sweep", u"交回", u"工单", u"违例", u"禁串", u"缺陷", u"残留",
               u"越界", u"事故", u"作废", u"不重述", u"应改", u"正确形式", u"正确写法",
               u"规格", u"禁令", u"不回改", u"节序", u"标题行"]
DECIDE = [u"决定是否", u"判断是否", u"是否前移", u"是否豁免", u"按需", u"酌情",
          u"去留交", u"由本体侧决定", u"交本体侧决定", u"请本体侧决定", u"无法补救",
          u"留给本体侧判断", u"供本体侧复量", u"交本体侧核"]
DECLLIKE = PATS + [u"勘误", u"补记", u"申报", u"登记", u"照抄", u"交回", u"收工", u"交付报告",
                   u"自查", u"违例", u"缺陷", u"禁令", u"收稿注", u"逐字", u"节题", u"追加"]

# 强修法：申报直接交出唯一机械动作
STRONG_FIX = [u"修法：", u"修法是", u"正确形式是", u"应改为", u"应予更正", u"机械可修",
              u"唯一修法", u"正解是", u"唯一许可的就地", u"按本句改"]
# 派给本体侧的动作语
DIRECT = [u"交本体侧", u"交由本体侧", u"请本体侧", u"留给本体", u"归本体侧", u"本体侧机械",
          u"移交本体", u"等本体侧", u"由本体侧", u"待本体侧", u"交机械", u"本体侧 sweep",
          u"sweep.py", u"清理通道", u"机械通道", u"机械清理", u"本体侧处理",
          u"本体侧执行", u"本体侧统一", u"本体侧一次性", u"本体侧一并", u"交本体", u"需本体"]
# 弱修法词（不足以定 ORDER，除非同时有派单语）
WEAK_FIX = [u"应为", u"应写作", u"正确写法", u"应读作", u"读作", u"换成", u"改写成",
            u"改写为", u"删去", u"补回", u"补上", u"包裹", u"更正", u"修正", u"归位",
            u"删除", u"断行", u"应删", u"应换", u"须改"]
WAIV = [u"只登记", u"仅登记", u"在此登记", u"登记不改", u"登记在案", u"只在此", u"不改动",
        u"不做就地", u"不回改", u"不作任何就地", u"保留原样", u"维持原状", u"一字未动",
        u"照旧", u"仅供", u"以本段为准", u"以本节为准", u"登记为违例", u"按类别申报",
        u"不做任何就地", u"不自行", u"未做就地", u"不再动手", u"只作申报", u"只做类别登记",
        u"在此声明", u"按规格原样", u"一律不就地", u"不动它", u"不重排", u"不顺手修"]

RX_LN = re.compile(u"第\\s*\\$?(\\d{1,4})\\$?\\s*行")
RX_SEC = re.compile(u"[§第]\\s*\\$?(\\d{1,3})\\s*(?:节|、)?")
RX_TX = re.compile(u"[A-Za-z0-9_\\-./]+\\.(?:tex|bib|yaml|lean|typ)[:：]?\\d*")
RX_TICKEQ = re.compile(u"\\$[^`$\\n]{2,80}`")
RX_EQTICK = re.compile(u"`[^`$\\n]{2,80}\\$")
RX_CODE_DOLLAR = re.compile(u"`[^`$\\n]{1,60}\\$`")
RX_LR = re.compile(u"\\\\lvert[^$\\n]{0,60}?\\\\rangle")
RX_RL = re.compile(u"\\\\langle[^$\\n]{0,60}?\\\\rvert")
CLOSER_RX = [RX_TICKEQ, RX_EQTICK, RX_LR, RX_RL]
STRUCT_WORDS = [u"整段", u"整块", u"覆盖", u"搬", u"节序", u"标题行", u"表头", u"重复",
                u"空题", u"移除", u"挤成", u"独占一行", u"分隔行", u"锚点"]
DRIFT_WORDS = [u"换算", u"并线", u"合线", u"漂移", u"下移"]
BANCHARS = [u"\u2014", u"而是", u"而不", u"，，"]
# 本体侧自记（主代理已执行/已登账的记录，不是新工单）
SELFREC = [u"本体侧补记", u"本体侧收稿注", u"收稿注", u"清理批落笔", u"按字节复量",
           u"本体侧在本篇", u"本体侧在 2026", u"本体侧把", u"本体侧没动", u"已由机械通道"]
SELFHEAD = [u"本体侧补记", u"本体侧收稿注", u"收稿注", u"清理批落笔", u"清理补记"]
# 行尾符类申报（用字节级 crlf/cr 计量）
EOL_WORDS = [u"行尾符", u"行尾", u"回车", u"CRLF", u"换行符", u"\u843d\u76d8\u65f6\u7684\u884c\u5c3e"]
# 非六类的其它缺陷（结构性/装饰性），一律 kind=other，fix 里说明是什么
OTHER_OVERRIDE = [(u"探针", u"垃圾"), (u"加粗", None), (u"节号", u"前向"),
                  (u"前向引用", None), (u"未展开", u"宏"), (u"宏名", None),
                  (u"斜体", None), (u"下划线", None)]
RX_MACRO = re.compile(u"\\\\[A-Za-z]{2,}")

_cache = {}
_raw = {}

def load(key):
    if key not in _cache:
        p = glob.glob(os.path.join(NOTES, key + u"-*.md"))[0]
        b = io.open(p, "rb").read()
        _raw[key] = b
        t = b.decode("utf-8", "replace")
        _cache[key] = (t, t.split(u"\n"))
    return _cache[key]

def decllike(line):
    return any(w in line for w in DECLLIKE)

def metrics(key):
    t, ls = load(key)
    raw = _raw[key]
    m = {}
    m[u"crlf"] = raw.count(b"\r\n")
    m[u"cr"] = raw.count(b"\r") - m[u"crlf"]
    m[u"bom"] = 1 if raw.startswith(b"\xef\xbb\xbf") else 0
    m[u"trail_ws"] = sum(1 for l in ls if l.endswith(u" ") and l.strip())
    m[u"pipe"] = len([1 for ln, txt, w in blocks_of(ls) if len(bare(txt.strip())) != w])
    ci = cs = 0
    fence = False
    for l in ls:
        s = l.strip()
        if s.startswith(u"```"):
            fence = not fence
            continue
        if fence:
            continue
        ml = list(l)
        for a, b in code_ranges(l):
            for k in range(a, b + 1):
                ml[k] = u"\u0001"
        n = sum(len(rx.findall(u"".join(ml))) for rx in CLOSER_RX)
        n += len(RX_CODE_DOLLAR.findall(l))
        ci += n
        if not decllike(l):
            cs += n
    m[u"closer_strict"] = cs
    m[u"closer_incl"] = ci
    bi = bs = 0
    for l in ls:
        n = sum(l.count(c) for c in BANCHARS) + len(gate.CONTRA.findall(l))
        n += sum(l.count(w) for w in gate.BAN)
        bi += n
        if not decllike(l):
            bs += n
    m[u"ban_strict"] = bs
    m[u"ban_incl"] = bi
    m[u"hdr_extra"] = t.count(gate.HDR) - 1
    m[u"head_glued"] = sum(1 for l in ls if u"## " in l[1:])
    seen = collections.Counter(l.strip() for l in ls
                               if len(l.strip()) >= 90 and not l.strip().startswith(u"|"))
    m[u"dup_paras"] = sum(v - 1 for v in seen.values() if v > 1)
    return m

def extract_tokens(txt):
    toks = re.findall(u"`([^`\\n]{2,40})`", txt)
    toks += re.findall(u"[「]([^」\\n]{2,26})[」]", txt)
    toks += re.findall(u"[“]([^”\\n]{2,26})[”]", txt)
    toks += re.findall(u"[A-Za-z][A-Za-z0-9\\-]{3,}\\d{4}", txt)
    out = []
    for x in toks:
        x = x.strip()
        if x and x not in out:
            out.append(x)
    return out

def token_count(key, toks):
    t, ls = load(key)
    n = 0
    for tok in toks:
        for l in ls:
            if decllike(l):
                continue
            n += l.count(tok)
    return n

def sentences(s):
    return [x.strip() for x in re.split(u"[。；]", s) if x.strip()]

def pick_fix(line):
    cand = [st for st in sentences(line)
            if any(v in st for v in STRONG_FIX + WEAK_FIX + DIRECT)]
    if not cand:
        cand = sentences(line)[:2]
    return u"；".join(cand)[:200]

def target_of(txt):
    parts = []
    for m in re.finditer(u"§\\s*\\$?(\\d{1,3})", txt):
        parts.append(u"§" + m.group(1))
    for m in re.finditer(u"第\\s*(\\d{1,3})\\s*节", txt):
        parts.append(u"第" + m.group(1) + u"节")
    for m in re.finditer(u"第\\s*\\$?(\\d{1,4})\\$?\\s*(?:数据)?行", txt):
        parts.append(u"行" + m.group(1))
    for m in re.finditer(u"行\\s*(\\d{2,4})", txt):
        parts.append(u"行" + m.group(1))
    for m in RX_TX.finditer(txt):
        parts.append(m.group(0))
    seen = []
    for x in parts:
        if x not in seen:
            seen.append(x)
    return u" ".join(seen[:6])[:70]

def kinds_of(s):
    return [k for k in KW if any(w in s for w in KW[k])]

def firstpos(kind, s):
    best = 10 ** 9
    for w in KW.get(kind, []):
        i = s.find(w)
        if i >= 0 and i < best:
            best = i
    return best

def main(excl=None, out=u"rows2.json"):
    excl = EXCL if excl is None else excl
    files = sorted(glob.glob(os.path.join(NOTES, u"D*.md")))
    rows, fp = [], []
    used = 0
    metcache = {}
    for p in files:
        base = os.path.basename(p)
        key = base.split(u"-")[0]
        if not key[1:].isdigit():
            continue
        if key in excl:
            continue
        used += 1
        t, ls = load(key)
        tl = [x.strip() for x in ls]
        m = metrics(key)
        metcache[key] = m
        for i, ln in enumerate(ls):
            hitp = [w for w in PATS if w in ln]
            if not hitp:
                continue
            prev = nxt = u""
            j = i - 1
            while j >= 0:
                if tl[j]:
                    prev = tl[j]
                    break
                j -= 1
            j = i + 1
            while j < len(ls):
                if tl[j]:
                    nxt = tl[j]
                    break
                j += 1
            txt = ln.strip()
            window = prev + u" " + txt + u" " + nxt
            if not any(w in txt for w in STRONG_DECL):
                fp.append((key, i + 1, txt[:90]))
                continue
            kl = kinds_of(txt)
            kfrom = u"line"
            if txt.startswith(u"##") and u"本体侧" in txt and any(w in txt for w in SELFHEAD):
                kl = [u"line_number_drift"]
                kfrom = u"head"
            if not kl:
                kl = kinds_of(window)
                kfrom = u"window"
            if any(w in txt for w in DRIFT_WORDS) and kfrom == u"window":
                kl = [u"line_number_drift"]
                kfrom = u"line"
            if kfrom == u"window" and any(w in txt for w in STRUCT_WORDS):
                kl = [u"other"]
                kfrom = u"struct"
            if (u"行号" in txt or u"行位" in txt) and any(w in txt for w in DRIFT_WORDS):
                kl = [u"line_number_drift"]
                kfrom = u"line"
            if u"宏" in txt and kfrom == u"line" and u"closer_char" in kl:
                kl = [u"other"]
            eol = any(w in txt for w in EOL_WORDS)
            oth = any(a in txt and (b is None or b in txt) for a, b in OTHER_OVERRIDE)
            forced_meas = False
            if eol or oth:
                kl = [u"other"]
                kfrom = u"line"
                forced_meas = True
            base_s = txt if kfrom in (u"line", u"struct", u"head") else window
            kind = sorted(kl, key=lambda k: (firstpos(k, base_s), KPRI[k]))[0] if kl else u"other"
            toks = extract_tokens(txt)
            lat = [x for x in toks if re.search(u"[A-Za-z]{3,}", x)]
            cls_val = {u"bare_pipe": m[u"pipe"], u"closer_char": m[u"closer_strict"],
                       u"ban_style": m[u"ban_strict"],
                       u"latin_residue": token_count(key, lat) if lat else None,
                       u"line_number_drift": None, u"other": None}
            nc_any = (m[u"pipe"] + m[u"closer_strict"] + m[u"ban_strict"]
                      + (token_count(key, lat) if lat else 0))
            live = [k for k in kl if cls_val.get(k) not in (None, 0)]
            switched = False
            if kfrom in (u"window", u"struct"):
                # 本行是申报段的收束句/段首句：计数取全篇各类之和
                nc = nc_any
            else:
                if (not forced_meas) and cls_val.get(kind) == 0 and live:
                    live.sort(key=lambda k: (firstpos(k, txt), KPRI[k]))
                    kind = live[0]
                    switched = True
                if kind == u"other":
                    mac = RX_MACRO.findall(txt)
                    tk = lat + [x for x in mac if x not in lat]
                    if u"表头" in txt:
                        nc = m[u"hdr_extra"]
                    elif (u"重复" in txt and u"段" in txt) or u"整块" in txt:
                        nc = m[u"dup_paras"]
                    elif eol:
                        nc = m[u"crlf"] + m[u"cr"] + m[u"bom"]
                    elif u"尾随空格" in txt or u"行尾空格" in txt:
                        nc = m[u"trail_ws"]
                    else:
                        nc = token_count(key, tk) if tk else -1
                else:
                    v = cls_val.get(kind)
                    nc = -1 if v is None else v
            if kind == u"closer_char":
                nci = m[u"closer_incl"]
            elif kind == u"ban_style":
                nci = m[u"ban_incl"]
            elif kind == u"bare_pipe":
                nci = m[u"pipe"]
            else:
                nci = -1
            basis_zero = (nc == 0) and (kfrom in (u"window", u"struct") or not live)
            probe = []
            if kind == u"line_number_drift":
                nums = [int(x) for x in RX_LN.findall(txt) if 1 <= int(x) <= len(ls)]
                probe = [(n, ls[n - 1].strip()[:24]) for n in nums[:8]]
            hasstrong = any(a in txt for a in STRONG_FIX)
            hasdir = any(a in txt for a in DIRECT)
            hasweak = any(a in txt for a in WEAK_FIX)
            hawaiv = any(a in txt for a in WAIV)
            measurable = nc >= 0
            selfrec = kfrom == u"head" or any(a in txt for a in SELFREC)
            if basis_zero and nc == 0:
                verdict = u"STALE"
            elif selfrec:
                verdict = u"WAIVER"
            elif any(a in txt for a in DECIDE):
                verdict = u"WAIVER"
            elif hasstrong or hasdir:
                verdict = u"ORDER"
            elif hasweak and not hawaiv:
                verdict = u"ORDER"
            else:
                verdict = u"WAIVER"
            fx = pick_fix(txt)
            if kind == u"other" and kl and kfrom in (u"window", u"struct"):
                fx = (u"〔申报段收束句，逐类描述见邻段：" + u"、".join(kl) + u"〕" + fx)[:220]
            if eol:
                fx = u"〔行尾符类申报：本稿实测 CRLF=%d、裸CR=%d、BOM=%d；%s〕" % (
                    m[u"crlf"], m[u"cr"], m[u"bom"], fx)
            rows.append({"d": key, "file": base, "line": i + 1, "kind": kind,
                         "verdict": verdict, "now_count": nc, "now_count_incl": nci,
                         "quote": txt[:120], "fix": fx, "target": target_of(txt),
                         "pats": hitp, "kinds_all": kl, "kind_from": kfrom,
                         "switched": switched, "hasstrong": hasstrong,
                         "hasdir": hasdir, "hasweak": hasweak, "hawaiv": hawaiv,
                         "selfrec": selfrec, "probe": probe, "prev": prev[:300], "next": nxt[:300],
                         "metrics": m})
    json.dump({"rows": rows, "fp": fp, "files_used": used, "files_scanned": len(files),
               "metrics": metcache},
              io.open(os.path.join(OUTD, out), "w", encoding="utf-8"),
              ensure_ascii=False)
    print(json.dumps({"used": used, "rows": len(rows), "fp": len(fp)}))
    print(json.dumps(sorted(collections.Counter(r["kind"] for r in rows).items())))
    print(json.dumps(sorted(collections.Counter(r["verdict"] for r in rows).items())))
    print(json.dumps(sorted(collections.Counter((r["kind"], r["verdict"]) for r in rows).items())))

if __name__ == u"__main__":
    if u"--all" in sys.argv:
        main(excl=set(), out=u"rows_all.json")
    else:
        main()
