# -*- coding: utf-8 -*-
"""工单判形引擎（只读研究笔记）。尺子：pipe_lib（台账裸竖线）、gate（文风禁令）、
   wrap_strict 的 mask（围栏）；闭合符类与拉丁残留类为自造尺，见报告。"""
import io, os, re, json, collections, glob, sys

sys.path.insert(0, r"E:\math\_work")
sys.path.insert(0, r"E:\math\.tools")
from pipe_lib import bare, blocks_of, code_ranges, in_code
import gate
from wo_lex import KW

NOTES = r"E:\math\研究笔记"
OUTD = r"E:\math\_work\_woprep"
EXCL = {u"D476", u"D71"}

PATS = [u"不就地改动", u"就地改动", u"机械可修", u"属机械可修", u"不作任何就地",
        u"留给本体", u"本体侧", u"需本体", u"修法：", u"修法是", u"正确形式是",
        u"应改为", u"应予更正", u"登记不改", u"落盘后不改动", u"本笔记一律不", u"工单"]
DECL = [u"本体侧", u"落盘", u"登记", u"申报", u"不回改", u"就地替换", u"就地改动", u"就地改字",
        u"清理通道", u"机械通道", u"sweep", u"规格", u"缺陷", u"违例", u"禁串", u"禁令",
        u"残留", u"越界", u"事故", u"交本体", u"留给本体", u"机械清理", u"闸门", u"工单",
        u"应改", u"正确形式", u"正确写法", u"应为", u"补回", u"删去", u"作废", u"不重述"]
# 记录型行（勘误/申报段本身）：逐字引用坏串的行，判今稿计数时剔除
DECLLIKE = PATS + [u"勘误", u"补记", u"申报", u"登记", u"照抄", u"交回", u"收工", u"交付报告",
                   u"自查", u"违例", u"缺陷", u"禁令", u"收稿注", u"逐字"]

DIRECT = [u"本体侧", u"机械通道", u"机械清理", u"sweep", u"清理通道", u"需本体", u"留给本体",
          u"交回", u"归本体侧", u"机械可修", u"工单", u"交由", u"交本"]
FIXVERB = [u"应改为", u"修法是", u"修法：", u"正确形式是", u"正确写法", u"应为", u"应在",
           u"应写作", u"应删", u"应换", u"改写成", u"换成", u"改写为", u"删去", u"补回",
           u"补上", u"断行", u"包裹", u"更正", u"修正", u"归位", u"删除", u"请本体",
           u"请在本体", u"正解是", u"应读作", u"读作", u"应予更正", u"须改"]
WAIV = [u"只登记", u"仅登记", u"仅以本节", u"在此登记", u"登记不改", u"登记在案", u"只在此",
        u"不改动", u"不做就地", u"不回改", u"不作任何就地", u"保留原状", u"维持原状",
        u"一字未动", u"照旧", u"仅供", u"以本段为准", u"以本节为准", u"登记为违例",
        u"按类别申报", u"按规矩只登记", u"不做任何就地", u"不自行", u"未做就地", u"不再动手",
        u"不再改", u"只作为", u"不动它", u"我不再", u"按规格原样"]
ALREADY = [u"已删去", u"已由", u"已逐字改写", u"照本段逐字搬正", u"本轮按字节复量",
           u"不再指向当前文件", u"实测零命中", u"零命中", u"各 0 处", u"本体侧没动它",
           u"已删", u"已收走", u"被清扫器收走", u"已由机械通道", u"现已"]
SELFREC = [u"本体侧补记", u"本体侧收稿注", u"收稿注", u"清理批落笔", u"按字节复量",
           u"此处原有一行", u"已删去"]

RX_LN = re.compile(u"第\\s*\\$?(\\d{1,4})\\$?\\s*行")
RX_TICKEQ = re.compile(u"\\$[^`$\\n]{2,80}`")
RX_EQTICK = re.compile(u"`[^`$\\n]{2,80}\\$")
RX_LR = re.compile(u"\\\\lvert[^$\\n]{0,60}?\\\\rangle")
RX_RL = re.compile(u"\\\\langle[^$\\n]{0,60}?\\\\rvert")
CLOSER_RX = [RX_TICKEQ, RX_EQTICK, RX_LR, RX_RL]
BANCHARS = [u"\u2014", u"而是", u"而不", u"，，"]

_cache = {}

def load(key):
    if key not in _cache:
        p = glob.glob(os.path.join(NOTES, key + u"-*.md"))[0]
        t = io.open(p, "rb").read().decode("utf-8", "replace")
        _cache[key] = (t, t.split(u"\n"))
    return _cache[key]

def decllike(line):
    return any(w in line for w in DECLLIKE)

def closer_count(key, strict=True):
    t, ls = load(key)
    n = 0
    where = []
    fence = False
    for i, l in enumerate(ls, 1):
        s = l.strip()
        if s.startswith(u"```"):
            fence = not fence
            continue
        if fence:
            continue
        if strict and decllike(l):
            continue
        m = 0
        masked = list(l)
        for a, b in code_ranges(l):
            for k in range(a, b + 1):
                masked[k] = u"\u0001"
        ml = u"".join(masked)
        for rx in CLOSER_RX:
            m += len(rx.findall(l)) + len(rx.findall(ml)) - len(rx.findall(l))
        if m:
            n += m
            where.append(i)
    return n, where[:6]

def ban_count(key, strict=True):
    t, ls = load(key)
    tot = 0
    for i, l in enumerate(ls, 1):
        if strict and decllike(l):
            continue
        for c in BANCHARS:
            tot += l.count(c)
        tot += len(gate.CONTRA.findall(l))
        for w in gate.BAN:
            tot += l.count(w)
    return tot

def pipe_count(key):
    t, ls = load(key)
    bad = [ln for ln, txt, w in blocks_of(ls) if len(bare(txt.strip())) != w]
    return len(bad), bad[:6]

def token_count(key, toks, strict=True):
    t, ls = load(key)
    n = 0
    for tok in toks:
        for i, l in enumerate(ls, 1):
            if strict and decllike(l):
                continue
            n += l.count(tok)
    return n

def sentences(s):
    return [x.strip() for x in re.split(u"[。；]", s) if x.strip()]

def pick_fix(line):
    cand = [st for st in sentences(line)
            if any(v in st for v in FIXVERB) or any(v in st for v in DIRECT)]
    if not cand:
        cand = sentences(line)[:2]
    return u"；".join(cand)[:220]

def kinds_of(s):
    return [k for k in KW if any(w in s for w in KW[k])]

def firstpos(kind, s):
    best = 10 ** 9
    for w in KW.get(kind, []):
        i = s.find(w)
        if i >= 0 and i < best:
            best = i
    return best

def main():
    files = sorted(glob.glob(os.path.join(NOTES, u"D*.md")))
    rows = []
    fp_lines = []
    used = 0
    for p in files:
        base = os.path.basename(p)
        key = base.split(u"-")[0]
        if not key[1:].isdigit():
            continue
        if key in EXCL:
            continue
        used += 1
        t, ls = load(key)
        tl = [x.strip() for x in ls]
        pc, pc_where = pipe_count(key)
        cc_i, cc_where = closer_count(key, False)
        cc_s, _ = closer_count(key, True)
        bn_i = ban_count(key, False)
        bn_s = ban_count(key, True)
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
            is_decl = any(w in window for w in DECL)
            if not is_decl:
                fp_lines.append((key, i + 1, txt[:80]))
                continue
            kl = kinds_of(txt)
            kw_all = kl if kl else kinds_of(window)
            head = txt.startswith(u"##")
            if head and u"本体侧" in txt:
                kw_all = [u"line_number_drift"]
            kind = sorted(kw_all, key=lambda k: (firstpos(k, txt), KW_PRI[k]))[0] if kw_all else u"other"
            toks = [x for x in re.findall(u"`([^`\\n]{2,40})`", txt)]
            toks += re.findall(u"[「]([^」\\n]{2,26})[」]", txt)
            toks += re.findall(u"[“]([^”\\n]{2,26})[”]", txt)
            lat = [x for x in toks if re.search(u"[A-Za-z]{3,}", x)]
            if kind == u"bare_pipe":
                nc, nc2 = pc, pc
            elif kind == u"closer_char":
                nc, nc2 = cc_s, cc_i
            elif kind == u"ban_style":
                nc, nc2 = bn_s, bn_i
            elif kind == u"latin_residue" and lat:
                nc, nc2 = token_count(key, lat, True), token_count(key, lat, False)
            else:
                nc, nc2 = -1, -1
            nums = [int(x) for x in RX_LN.findall(txt) if 1 <= int(x) <= len(ls)]
            probe = [(n, ls[n - 1].strip()[:24]) for n in nums[:6]] if kind == u"line_number_drift" else []
            hasfix = any(a in txt for a in FIXVERB)
            hasdir = any(a in txt for a in DIRECT)
            hawaiv = any(a in txt for a in WAIV)
            already = any(a in txt for a in ALREADY)
            selfrec = any(a in txt for a in SELFREC)
            measurable = nc >= 0
            if kind == u"line_number_drift":
                verdict = u"STALE" if selfrec or already else (u"ORDER" if hasfix else u"WAIVER")
            elif measurable and nc == 0:
                verdict = u"STALE"
            elif hasfix:
                verdict = u"ORDER"
            elif hasdir and not hawaiv:
                verdict = u"ORDER"
            elif hasdir and hawaiv:
                verdict = u"ORDER" if (u"交" in txt or u"留给" in txt or u"请" in txt
                                       or u"本体侧" in txt) else u"WAIVER"
            else:
                verdict = u"WAIVER"
            rows.append({"d": key, "file": base, "line": i + 1, "kind": kind,
                         "verdict": verdict, "now_count": nc, "now_count_incl": nc2,
                         "quote": txt[:120], "fix": pick_fix(txt), "pats": hitp,
                         "kinds_all": kw_all, "selfrec": selfrec, "already": already,
                         "hasfix": hasfix, "hasdir": hasdir, "hawaiv": hawaiv,
                         "probe": probe, "prev": prev[:260], "next": nxt[:260],
                         "file_metrics": {"pipe": pc, "closer_strict": cc_s, "closer_incl": cc_i,
                                          "ban_strict": bn_s, "ban_incl": bn_i}})
    json.dump({"rows": rows, "fp": fp_lines, "files_used": used,
               "files_scanned": len(files)},
              io.open(os.path.join(OUTD, "rows.json"), "w", encoding="utf-8"),
              ensure_ascii=False)
    print(json.dumps({"used": used, "rows": len(rows), "fp": len(fp_lines)}))
    print(json.dumps(sorted(collections.Counter(r["kind"] for r in rows).items())))
    print(json.dumps(sorted(collections.Counter(r["verdict"] for r in rows).items())))
    print(json.dumps(sorted(collections.Counter((r["kind"], r["verdict"]) for r in rows).items())))
    print(json.dumps(sorted(collections.Counter(
        (r["kind"], r["now_count"] == 0) for r in rows if r["now_count"] >= 0).items())))

KW_PRI = {u"closer_char": 1, u"bare_pipe": 2, u"latin_residue": 3, u"ban_style": 4,
          u"line_number_drift": 5, u"other": 6}

main()
