# -*- coding: utf-8 -*-
# 工单普查引擎（只读研究笔记；输出全部落在 _work/_woprep）
import io, os, re, sys, glob, json, collections

sys.path.insert(0, r"E:\math\_work")
sys.path.insert(0, r"E:\math\.tools")
from pipe_lib import bare, blocks_of          # 台账裸竖线的唯一尺子
import gate                                    # 文风禁令的唯一尺子

NOTES = r"E:\math\研究笔记"
OUTD = r"E:\math\_work\_woprep"
EXCL = {"D476", "D71"}

PATS = [u"不就地改动", u"就地改动", u"机械可修", u"属机械可修", u"不作任何就地",
        u"留给本体", u"本体侧", u"需本体", u"修法：", u"修法是", u"正确形式是",
        u"应改为", u"应予更正", u"登记不改", u"落盘后不改动", u"本笔记一律不", u"工单"]

# 申报语（defect-declaration）词表：命中行或其上下文含其一才算真申报
DECL = [u"本体侧", u"落盘", u"登记", u"申报", u"不回改", u"就地替换", u"就地改动", u"就地改字",
        u"清理通道", u"机械通道", u"sweep", u"规格", u"缺陷", u"违例", u"禁串", u"禁令",
        u"残留", u"越界", u"事故", u"交本体", u"留给本体", u"机械清理", u"闸门", u"工单",
        u"应改", u"正确形式", u"正确写法", u"应为", u"补回", u"删去", u"作废", u"不重述"]

# 派给本体侧 / 给出唯一修法 的语汇
DIRECT = [u"本体侧", u"机械通道", u"机械清理", u"sweep", u"清理通道", u"需本体", u"留给本体",
          u"交回", u"归本体侧", u"机械可修", u"工单"]
FIXVERB = [u"应改为", u"修法是", u"修法：", u"正确形式是", u"正确写法", u"应为", u"应在",
           u"应写作", u"应删", u"应换", u"改写成", u"换成", u"改写为", u"删去", u"补回",
           u"补上", u"断行", u"包裹", u"更正", u"修正", u"应予更正", u"归位", u"删除"]
WAIVER = [u"只登记", u"仅登记", u"在此登记", u"登记不改", u"登记在案", u"不改动", u"不做就地",
          u"不回改", u"不作任何就地", u"保留原样", u"维持原状", u"一字未动", u"照旧", u"仅供"]

K_CLOSER = [u"反引号", u"闭合符", u"收尾反引号", u"定界符打错", u"定界符次序", u"定界符混用",
            u"美元符", u"角括号", u"右定界符", u"左定界符", u"孤立的开定界符", u"成对行内定界符",
            u"闭合符号", u"闭合反引号"]
K_PIPE = [u"竖线", u"裸 `|`", u"裸竖线", u"lvert", u"rvert", u"lVert", u"rVert", u"分格"]
K_LATIN = [u"英文", u"未译", u"中英混排", u"拉丁", u"外文", u"西语", u"术语未落为中文",
           u"未即时中文化", u"未译成中文", u"词形残留"]
K_BAN = [u"禁串", u"禁令", u"转折", u"连读", u"套语", u"对举", u"也就是说", u"不是", u"而是",
         u"长破折号", u"长停顿号", u"破折号", u"em dash", u"戏剧化", u"聊天残留", u"免责",
         u"违例连读", u"对比句式", u"提示性插入语", u"替换句式", u"连接词"]
K_DRIFT = [u"行号换算", u"并线", u"合线", u"行号漂移", u"行号下移", u"旧坐标", u"行号与合稿",
           u"换算", u"行号对照", u"下移"]

RX = {
    u"math_closed_by_tick": re.compile(u"\\$[^`$\\n]{2,80}`"),
    u"tick_closed_by_dollar": re.compile(u"`[^`$\\n]{2,80}\\$"),
    u"lvert_rangle": re.compile(u"\\\\lvert[^$\\n]{0,60}?\\\\rangle"),
    u"langle_rvert": re.compile(u"\\\\langle[^$\\n]{0,60}?\\\\rvert"),
}

def load(p):
    raw = io.open(p, "rb").read()
    return raw.decode("utf-8", "replace")

def kind_of(text):
    ks = []
    if any(w in text for w in K_PIPE):
        ks.append(u"bare_pipe")
    if any(w in text for w in K_CLOSER):
        ks.append(u"closer_char")
    if any(w in text for w in K_LATIN):
        ks.append(u"latin_residue")
    if any(w in text for w in K_BAN):
        ks.append(u"ban_style")
    if any(w in text for w in K_DRIFT):
        ks.append(u"line_number_drift")
    return ks

def quoted_tokens(text):
    """申报里逐字抄出的可疑缺陷串：反引号跨度、「」、 “” 内容。"""
    res = []
    for m in re.finditer(u"`([^`\\n]{1,40})`", text):
        res.append(m.group(1))
    for m in re.finditer(u"[「]([^」\\n]{1,30})[」]", text):
        res.append(m.group(1))
    for m in re.finditer(u"[“]([^”\\n]{1,30})[”]", text):
        res.append(m.group(1))
    return res

def main():
    files = sorted(glob.glob(os.path.join(NOTES, "D*.md")))
    recs = []
    excluded = []
    for p in files:
        base = os.path.basename(p)
        key = base.split(u"-")[0]
        if not key[1:].isdigit():
            continue
        if key in EXCL:
            excluded.append(key)
            continue
        text = load(p)
        lines = text.split(u"\n")
        tl = [l.strip() for l in lines]
        # per-file rulers
        pipe_bad = []
        for ln, t2, w in blocks_of(lines):
            if len(bare(t2.strip())) != w:
                pipe_bad.append(ln)
        g = gate.chk(p, quiet=True)
        bansum = 0
        for lab, val in [("emDash", text.count(u"\u2014")), ("ershi", text.count(u"而是")),
                         ("bc", text.count(u"而不")), ("cc", text.count(u"，，")),
                         ("contrast", len(gate.CONTRA.findall(text)))]:
            bansum += val
        for w in gate.BAN:
            bansum += text.count(w)
        closers = 0
        for rx in RX.values():
            closers += len(rx.findall(text))
        for i, ln in enumerate(lines):
            hitp = [w for w in PATS if w in ln]
            if not hitp:
                continue
            # 上下文：前后各一段（非空行）
            prev = nxt = u""
            j = i - 1
            while j >= 0:
                if tl[j]:
                    prev = tl[j]
                    break
                j -= 1
            j = i + 1
            while j < len(lines):
                if tl[j]:
                    nxt = tl[j]
                    break
                j -= 1 if False else 1
            window = u" ".join([prev, ln.strip(), nxt])
            is_decl = any(w in window for w in DECL)
            recs.append({
                "d": key, "file": base, "line": i + 1, "pats": hitp,
                "text": ln.strip(), "prev": prev[:400], "next": nxt[:400],
                "kinds": kind_of(window) if is_decl else [],
                "decl": is_decl,
                "tokens": quoted_tokens(ln.strip())[:12],
                "file_counts": {"bare_pipe_rows": len(pipe_bad), "ban_total": bansum,
                                "closer_total": closers},
            })
    json.dump({"records": recs, "excluded": excluded,
               "nfiles": len(files)},
              io.open(os.path.join(OUTD, "auto.json"), "w", encoding="utf-8"),
              ensure_ascii=False)
    print(json.dumps({"hits": len(recs), "decl": sum(1 for r in recs if r["decl"]),
                      "nondecl": sum(1 for r in recs if not r["decl"]),
                      "excluded": excluded}))
    c = collections.Counter()
    for r in recs:
        if not r["decl"]:
            c[u"FP_mathnarr"] += 1
        elif not r["kinds"]:
            c[u"decl_nokind"] += 1
        else:
            c[u"decl_kinded"] += 1
    print(json.dumps(c))

main()
