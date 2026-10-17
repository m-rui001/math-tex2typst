# -*- coding: utf-8 -*-
r"""
workorder_census.py -- census of the defect lists the note authors (sub-agent 写手) wrote into
their own notes under 研究笔记/D*.md, classified so the main session can execute only the
genuinely mechanical ones.

READ-ONLY over 研究笔记/.  No PDF is opened, no preprints/*/typst/* or README.md is treated as a
source, no git command is run.  Paper sources are consulted only under
preprints/<dir>/build/**/<file>.tex, and only to confirm a `.tex:line` citation the author gave.

Outputs (all in _work/):
  workorders.tsv          one row per declared item
  _wo_order_review.txt    ORDER rows with located site + defect signature, for human read
  _wo_stats.txt           section/item/category/family census

CATEGORY RUBRIC (decided per item, exactly one label)
  ORDER     the author hands over a unique mechanical fix: a named target form, a measured truth
            that replaces a wrong self-report, a typo whose correct spelling is given (usually with
            a `file.tex:line` citation), or an explicit go-ahead to delete.  Nothing has to be
            invented to apply it.
  WAIVER    the item only registers that an automated checker will see a false positive (literal
            glob/`$`/`**` in code spans, a non-ledger table, a counting 口径 difference).  The fix
            belongs to the measuring tool, not to the note.
  JUDGMENT  the item asks for prose work (补一句桥 / 措辞残缺 / 归位整块 / 禁串命中) without giving
            the wording, or asks whether a phrase counts as a defect at all.
  KEEP      the item's own text quotes the bad form as evidence and says the quoting line must be
            left alone / exempted.  Such lines are never cleaned.
  EXCLUDED  not a defect in the landed text at all: process registers (取证调用/手数/首块字节/取材
            覆盖), open questions, or repairs the author already applied in place.
Tie-breaks: defect+target beats everything (ORDER); a line that quotes the bad form beats WAIVER
(KEEP); a register with no defect noun is EXCLUDED, never ORDER.
"""
import io, os, re, glob, sys, collections

ROOT = r"E:\math"
NOTES = os.path.join(ROOT, u"\u7814\u7a76\u7b14\u8bb0")
WORK = os.path.join(ROOT, "_work")
LEDGER_NAME = u"\u961f\u5217\u53f0\u8d26.md"                     # 队列台账.md -- excluded from scan
TEXROOT = os.path.join(ROOT, "preprints")

SEC_KEYS = [u"\u52d8\u8bef", u"\u7533\u62a5", u"\u8865\u8bb0", u"\u81ea\u68c0", u"\u4ea4\u672c\u4f53\u4fa7"]
# 勘误 申报 补记 自检 交本体侧

CN = u"\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341\u4e24\u5343\u767e\u96f6"
CN2NUM = {u"\u96f6": 0, u"\u4e00": 1, u"\u4e8c": 2, u"\u4e09": 3, u"\u56db": 4, u"\u4e94": 5,
          u"\u516d": 6, u"\u4e03": 7, u"\u516b": 8, u"\u4e5d": 9, u"\u5341": 10, u"\u4e24": 2,
          u"\u767e": 100}


def cn2int(s):
    if s.isdigit():
        return int(s)
    tot = cur = 0
    for ch in s:
        v = CN2NUM.get(ch)
        if v is None:
            return None
        if v == 100:
            tot += (cur or 1) * 100
            cur = 0
        elif v == 10:
            tot += (cur or 1) * 10
            cur = 0
        else:
            cur = v
    return tot + cur


ENUM_MID = re.compile(u"(?:^[\\uff08\\(]?|(?<=[\\u3002\\uff1b\\uff01\\uff1f\\n]))"
                      u"([" + CN + u"]{1,3}|\\d{1,2})[\\uff09\\)\\u3001\\uff1a\\uff0c:.\\u3002]")
QI = re.compile(u"[\u5176\u7b2c]([" + CN + u"]{1,2})[\uff0c\u3001\uff1a:]")     # 其一， / 第一，
LABEL_RE = re.compile(u"^[\uff08\\(]?(?:[" + CN + u"]{1,3}|\\d{1,2})[\\uff09\\)?][\\u3001\\uff1a\\uff0c:.\\u3002]?")

CODESPAN = re.compile(u"`[^`\n]{1,140}`")
QUOTE_CN = re.compile(u"[\u300c\u300d\u201c\u201d\u2018\u2019]")
TEXCITE = re.compile(u"[A-Za-z0-9_./\-\u4e00-\u9fff]{1,60}\.(?:tex|bib|sty|cls|lean)"
                     u"\s?:\s?\d{1,5}(?:\s?(?:-{1,2}|[\u2013\u2014])\s?\d{1,5})?")
STLINE = re.compile(u"\u7b2c\s*(\d{1,5})\s*\u884c")                        # 第 N 行
STLINE2 = re.compile(u"(?:\u884c\u53f7|\u884c\u53f7\u5206\u522b|\u4f4d\u7f6e)\s*[:\uff1a]?\s*(\d{1,5})")  # 行号 743
MEASURED = re.compile(u"\u5b9e\u6d4b[^\u3002\n]{0,14}?(\\d[\\d,，]{0,7})\s*"
                      u"(\u884c|\u679a|\u5904|\u5b57\u8282|\u4e2a|\u8f86|\u6761|\u5b57)")      # 实测 52 行
DELCITE = re.compile(u"\u53ef\u4ee5\u5b89\u5168\u5220\u9664|\u5efa\u8bae\u5220\u9664|\u8bf7\u5220\u9664|"
                     u"\u53ef\u76f4\u63a5\u5220\u9664|\u76f4\u63a5\u5220\u9664|\u4e00\u5e76\u5220\u9664|"
                     u"\u53ef\u5b89\u5168\u7f6e\u7a7a|\u5efa\u8bae\u7f6e\u7a7a|\u65e0\u969c\u5220\u9664")
#  可以安全删除 建议删除 请删除 可直接删除 直接删除 一并删除 可安全置空 建议置空 无障碍删除

# --- verbs that hand over a target -------------------------------------------------
TARGET_VERB = (u"\u5e94\u4e3a|\u5e94\u6539|\u5e94\u5199|\u5e94\u6362|\u5e94\u8bfb\u4f5c|\u5e94\u8bb0\u4f5c|"
               u"\u6b63\u786e\u5199\u6cd5|\u6b63\u786e\u7684\u5199\u6cd5|\u6b63\u786e\u5f62\u5f0f|\u6b63\u786e\u7684\u5199\u6cd5|"
               u"\u6b63\u5199|\u6b63\u5b57|\u6b63\u5f62|\u6b63\u540d|\u8be5\u5199|\u8be5\u4f5c|\u6539\u4e3a|\u6539\u6210|\u6539\u4f5c|\u6539\u56de|"
               u"\u6362\u56de|\u6362\u6210|\u66ff\u6362\u4e3a|\u7edf\u4e00\u6210|\u7edf\u4e00\u4e3a|\u5f52\u4e00\u4e3a|\u5199\u4e3a|\u8bb0\u4f5c|"
               u"\u6539\u6b63\u4e3a|\u66f4\u6b63\u4e3a|\u6052\u7b49\u4e8e|\u6539\u5199\u4e3a|\u6539\u52a8\u4e3a")
#  应为 应改 应写 应换 应读作 应记作 正确写法 正确的写法 正确形式 正写 正字 正形 正名 该写 该作 改为 改成 改作
#  改回 换回 换成 替换为 统一成 统一为 归一为 写为 记作 更正为 改写为
MECH_NOUN = (u"\u53cd\u5f15\u53f7|\u7f8e\u5143\u7b26|\u7f8e\u5143\u53f7|\u5b9a\u754c\u7b26|\u7c7b\u76ee\u540d|\u7c7b\u522b\u540d|"
             u"\u540c\u4e00|\u539f\u6837|\u628a\u5b83\u4eec|\u90a3\u4e24\u4e2a|\u5b9e\u6d4b|\u5220\u9664|\u7f6e\u7a7a|\u7a7a\u683c")
#  反引号 美元符 美元号 定界符 类目名 类别名 同一 原样 它们 那两个 实测 删除 置空 空格
TARGET_RE = re.compile((r"(?:%s)[:\uff1a\u3001]?\s*"
                       r"((?:\u300c[^\u3002\n]{1,60}?\u300d)|(?:\u201c[^\u3002\n]{1,60}?\u201d)"
                       r"|(?:`[^`\n]{1,60}`)"
                       r"|(?:[A-Za-z\\\u00a7\d][^\u3002\uff1b\n]{0,40})"
                       r"|(?:" + MECH_NOUN + r")[^\u3002\uff1b]{0,16}"
                       r"|\u00a7?\d{1,3}(?:\s?[\u3001,\uff0c]\s?\u00a7?\s?\d{1,3}){1,6})") % TARGET_VERB)
TRUST_MEASURE = re.compile(u"\u4ee5\u5b9e\u6d4b\u4e3a\u51c6|\u4ee5\u672c\u6761\u4e3a\u51c6|\u4ee5\u672c\u8868\u4e3a\u51c6|"
                           u"\u4ee5\u672c\u8282\u4e3a\u51c6|\u4ee5\u6b63\u6587\u4e3a\u51c6|\u4ee5\u5de5\u5177\u4e3a\u51c6|"
                           u"\u8bf7\u4ee5[^\u3002]{0,10}\u4e3a\u51c6|\u4e00\u5f8b[^\u3002]{0,6}\u4e3a\u51c6|\u4ee5[\u8be5\u672c][^\u3002]{0,8}\u4e3a\u51c6")
#  以实测为准 以本条为准 以本表为准 以本节为准 以正文为准 以工具为准 请以…为准 一律…为准 以该/本…为准

# --- is the handed-over target a literal, or prose that has to be invented? ----------------
VAGUE_TG = re.compile(u"\u5199\u6cd5|\u53e5\u5f0f|\u8868\u8fbe|\u8bf4\u6cd5|\u63aa\u8f9e|\u5f62\u5f0f|\u4f53\u4f8b|\u53e3\u5f84|\u8bfb\u6cd5"
                      u"|\u610f\u601d|\u8bf4\u660e|\u63cf\u8ff0|\u7406\u89e3|\u6ce8\u610f|\u5904\u7406|\u5982\u4e0b|\u4ee5\u4e0b|\u4e0a\u8ff0|\u7ea6\u5b9a"
                      u"|\u4e3a\u51c6|\u4e0d\u52a8|\u4e0d\u53d8|\u672a\u52a8|\u4e00\u81f4|\u8981\u6c42|\u89c4\u5b9a|\u89c4\u683c|\u6062\u590d|\u4fdd\u6301"
                      u"|\u8865\u4e00\u53e5|\u8865\u4e00\u53e5\u8bdd|\u81ea\u7136\u8854\u63a5|\u8854\u63a5")
#  写法 句式 表达 说法 措辞 形式 体例 口径 读法 意思 说明 描述 理解 注意 处理 如下 以下 上述 约定 为准 不动 不变
#  未动 一致 要求 规定 规格 恢复 保持 补一句 自然衔接 衔接
PLACEHOLDER = re.compile(u"\u2026|\u67d0|\uff08\u7565|\u7701\u7565|\u4f8b\u5982|\u5982\u4e0b")
LIT_CODE = re.compile(u"`[^`\n]{1,44}`")
LIT_DCODE = re.compile(u"``[^`\n]{1,44}``")
LIT_MACRO = re.compile(r"\\[A-Za-z@]{2,}")
LIT_SEC = re.compile(u"\u00a7" + r"\s?\d{1,3}")
LIT_DIG = re.compile(r"\d[\d,\.]{0,8}")
LIT_ASCII = re.compile(r"[A-Za-z][A-Za-z0-9_\-.:/]{1,28}")
LIT_QUOTE = re.compile(u"[\u300c\u201c]([^\u300d\u201d]{1,26})[\u300d\u201d]")
MECH_LITERAL = re.compile(u"\u53cd\u5f15\u53f7|\u7f8e\u5143\u7b26|\u7f8e\u5143\u53f7|\u5b9a\u754c\u7b26|\u7f6e\u7a7a|\u5220\u9664|\u5220\u6389|"
                          u"\u53bb\u6389|\u5b9e\u6d4b|\u6210\u5bf9|\u914d\u5bf9|\u7a7a\u884c|\u591a\u4f59\u7684")
#  反引号 美元符 美元号 定界符 置空 删除 删掉 去掉 实测 成对 配对 空行 多余的

# --- did the author already apply the repair themselves? -----------------------------------
SELF_RX = re.compile(u"(\u5df2(?:\u7ecf)?[^\u3002\n]{0,8}?(?:\u6539|\u66ff\u6362|\u4fee\u8ba2|\u4fee\u6539|\u4fee\u6b63|\u66f4\u6b63|\u6062\u590d|\u5220|\u8865|\u7edf\u4e00|\u6e05\u96f6|\u5904\u7406|\u6362)"
                     u"|\u5c31\u5730|\u539f\u4f4d|\u505a(?:\u4e86|\u8fc7)[^\u3002\n]{0,10}?(?:\u4fee\u8ba2|\u4fee\u6539|\u66ff\u6362|\u66f4\u6b63|\u642c\u8fd0|\u6539\u52a8)"
                     u"|\u6211[^\u3002\n]{0,14}?(?:\u6539\u6210|\u6539\u4e3a|\u6539\u5199\u4e3a|\u66ff\u6362\u6210|\u6362\u6210|\u4fee\u6b63\u4e3a|\u91cd\u5199\u6210|\u8865\u9f50\u4e86|\u5220\u9664\u4e86|\u7f6e\u7a7a\u4e86))")
#  已(经)…改/替换/修订/修改/修正/更正/恢复/删/补/统一/清零/处理/换 | 就地 | 原位 | 做了/做过…修订… | 我把…改成…
RESIDUAL = re.compile(u"\u4ea4\u672c\u4f53\u4fa7|\u8bf7\u672c\u4f53\u4fa7|\u79fb\u4ea4|\u4f9b\u6536\u7a3f\u65b9|\u5728\u6b64\u7533\u62a5|\u53ea\u5728\u6b64|\u4ec5\u5728\u6b64"
                      u"|\u539f\u6587\u7167\u7559|\u7167\u7559|\u4e0d\u56de\u6539|\u4e0d\u518d\u6539\u52a8|\u4e0d\u6539\u5199\u4efb\u4f55\u5df2\u843d\u76d8|\u4e0d\u505a\u6574\u6863\u91cd\u5199"
                      u"|\u5f85\u6e05\u7406|\u7531\u672c\u4f53\u4fa7|\u5f52\u672c\u4f53\u4fa7|\u8bf7\u673a\u68b0|\u8bf7\u6539\u5199|\u8bf7\u5220\u9664|\u8bf7\u8865|\u8bf7\u7edf\u4e00"
                      u"|\u4ea4\u672c\u4fa7|\u672c\u4f53\u4fa7\u673a\u68b0\u6e05\u7406|\u4ea4\u672c\u4f53\u4fa7\u673a\u68b0\u6e05\u7406|\u4e0d\u5728\u6e05\u7406\u8303\u56f4")
#  交本体侧 请本体侧 移交 供收稿方 在此申报 只在此 仅在此 原文照留 照留 不回改 不再改动 不改写任何已落盘 不做整档重写
#  待清理 由本体侧 归本体侧 请机械 请改写 请删除 请补 请统一 交本体侧机械清理
AMB = re.compile(u"(?:\u79fb\u5230|\u79fb\u81f3|\u642c\u5230|\u642c\u81f3|\u5f52\u4f4d\u5230|\u7edf\u4e00\u6210|\u6539\u5199\u4e3a|\u66ff\u6362\u4e3a)[^\u3002\n]{0,28}"
                 u"\u6216(?:\u5728|\u4fdd\u7559|\u6309|\u6539|\u6e32\u67d3|\u7f6e|\u5220|\u76f4\u63a5|\u4ea6)")
#  搬到 X 或在渲染层重排  (two structurally different routes offered -> not a unique fix)
NEGAT = re.compile(u"\u96f6\u547d\u4e2d|\u5747\u4e3a\\s?0|\u547d\u4e2d\u6570\u4e3a\\s?0|\u65e0\u7f3a\u53f7|\u9f50\u5168|\u90fd\u5b58\u5728|\u65e0\u6b8b\u7559"
                   u"|\u5747\u5df2\u5b58\u5728|\u96f6\u6b21|\u65e0\u547d\u4e2d|\u5168\u90e8\u8fbe\u6807|\u5747\u5408\u89c4|\u65e0\u8fdd\u89c4|\u65e0\u8fdd\u4ee4")
#  零命中 均为 0 命中数为 0 无缺号 齐全 都存在 无残留 均已存在 零次 无命中 全部达标 均合规 无违规 无违令
MEAS_ASK = re.compile(u"\u4e0d\u6210\u7acb|\u4e0d\u7b26|\u6709\u8bef|\u504f\u5dee|\u81ea\u8ff0|\u81ea\u62a5|\u5199\u4f5c|\u5b9e\u4e3a|\u5e94\u4ee5"
                      u"|\u8ba2\u6b63|\u66f4\u6b63|\u6539\u5199|\u8bf7\u4ee5|\u7ea0\u9519|\u4e0d\u51c6\u786e|\u4e0d\u4e00\u81f4|\u4ecd\u505c\u5728")
#  不成立 不符 有误 偏差 自述 自报 写作 实为 应以 订正 更正 改写 请以 纠错 不准确 不一致 仍停在

DEFECT_PAT = [u"\u8bef\u5199", u"\u8bef\u6253", u"\u8bef\u6562", u"\u7b14\u8bef", u"\u624b\u8bef", u"\u6253\u9519",
              u"\u7f3a\u9677", u"\u7455\u75b5", u"\u758f\u6f0b", u"\u9519\u8bef", u"\u5199\u9519", u"\u6392\u9519",
              u"\u9519\u5b57", u"\u6284\u9519", u"\u4e0d\u7b26", u"\u77db\u76fe", u"\u9519\u4f4d", u"\u843d\u9519",
              u"\u8fdd\u53cd", u"\u8fdd\u4ee4", u"\u8fdd\u89c4", u"\u8fdd\u4f8b", u"\u8d8a\u754c", u"\u4e0d\u914d\u5bf9",
              u"\u5947\u6570", u"\u66f4\u6b63", u"\u4fee\u6b63", u"\u6e05\u7406", u"\u5220\u9664", u"\u7edf\u4e00",
              u"\u5f52\u4f4d", u"\u65ad\u94fe", u"\u9057\u7559", u"\u6b8b\u7559", u"\u672a\u8bd1", u"\u5939\u6742",
              u"\u6f02\u79fb", u"\u5931\u51c6", u"\u591a\u4f59", u"\u5269\u4f59", u"\u60ac\u7a7a", u"\u60ac\u6d6e",
              u"\u52a0\u7c97", u"\u7834\u6298\u53f7", u"\u505c\u987f\u53f7", u"\u5b9a\u754c\u7b26", u"\u7a7a\u884c",
              u"\u5b64\u884c", u"\u91cd\u590d", u"\u7f3a\u5931", u"\u4e0d\u8db3", u"\u4e0d\u591f", u"\u4e0d\u8be5",
              u"\u4e0d\u5bf9", u"\u4e0d\u5999", u"\u4e89\u8bae", u"\u6df7\u6dc6", u"\u5403\u6389", u"\u8986\u76d6\u4e8b\u6545",
              u"\u4e0d\u4e00\u81f4", u"\u4e0d\u5408\u89c4", u"\u4e0d\u6210\u7acb", u"\u4e0d\u6b63\u786e", u"\u4e0d\u51c6\u786e",
              u"\u4e0d\u9f50", u"\u4e71\u5199", u"\u7f3a\u53e3", u"\u6f0f\u5199", u"\u591a\u4e86", u"\u5c11\u4e86",
              u"\u8865\u4e00\u53e5", u"\u91cd\u6392", u"\u60ac\u6d6e", u"\u547d\u4e2d", u"\u63d2\u9519", u"\u6f02\u51fa"]
#  (see rubric) 误写 误打 误敲 笔误 手误 打错 缺陷 瑕疵 疏漏 错误 写错 排错 错字 抄错 不符 矛盾 错位 落错
#  违反 违令 违规 违例 越界 不配对 奇数 更正 修正 清理 删除 统一 归位 断链 遗留 残留 未译 夹杂 漂移 失准
#  多余 剩余 悬空 悬浮 加粗 破折号 停顿号 定界符 空行 孤行 重复 缺失 不足 不够 不该 不对 不妥 争议 混淆
#  吃掉 覆盖事故 不一致 不合规 不成立 不正确 不准 不齐 乱写 缺口 漏写 多了 少了 补一句 重排 命中 插错

PROCESS_PAT = [u"\u53d6\u8bc1", u"\u8c03\u7528", u"Write", u"\u624b\u6570", u"\u9996\u5757", u"\u843d\u76d8\u8282\u594f",
               u"\u5b57\u8282\u5dee", u"mtime", u"\u6d3e\u5355", u"\u672a\u8bfb", u"\u672a\u6253\u5f00", u"\u53d6\u6750",
               u"\u8986\u76d6\u5ea6", u"\u8bda\u5b9e", u"\u9884\u7b97", u"\u7eaa\u5f8b", u"\u8def\u7ebf", u"\u6b7b\u8def",
               u"\u672a\u7adf", u"\u8fd8\u60ac\u7740", u"\u5de5\u5177", u"\u68c0\u7d22", u"\u672a\u6267\u884c",
               u"\u6ca1\u6709\u6267\u884c", u"\u672a\u4f7f\u7528", u"\u6ca1\u6709\u4f7f\u7528", u"PDF", u"typst",
               u"\u5f00\u5de5\u524d", u"\u672c\u7b14", u"\u6d41\u7a0b", u"\u89c4\u683c\u5141\u8bb8", u"\u9884\u671f"]
#  取证 调用 Write 手数 首块 落盘节奏 字节差 mtime 派单 未读 未打开 取材 覆盖度 诚实 预算 纪律 路线 死路
#  未竟 还悬着 工具 检索 未执行 没有执行 未使用 没有使用 PDF typst 开工前 本笔 流程 规格允许 预期

FP_PAT = [u"\u5047\u9633", u"\u5047\u6027", u"\u8bef\u5224", u"\u8c41\u514d", u"\u52ff\u6309", u"\u8bf7\u52ff",
          u"\u4e0d\u8981\u6309", u"\u4e0d\u53c2\u4e0e", u"\u5c5e\u6b63\u5e38", u"\u4e0d\u6784\u6210\u7f3a\u9677",
          u"\u4e0d\u6784\u6210\u8fdd", u"\u91cf\u5177", u"\u68c0\u67e5\u5668", u"\u6821\u9a8c", u"\u626b\u63cf",
          u"\u9010\u884c\u5947\u5076", u"\u8bfb\u6570", u"\u4e0d\u89e6\u53d1", u"\u53ea\u9488\u5bf9", u"\u5ffd\u7565",
          u"\u8df3\u8fc7", u"\u53e3\u5f84", u"\u65e0\u5173", u"\u6b63\u5e38\u7528\u6cd5", u"\u4e0d\u8981\u628a"]
#  假阳 假性 误判 豁免 勿按 请勿 不要按 不参与 属正常 不构成缺陷 不构成违 量具 检查器 校验 扫描 逐行奇偶
#  读数 不触发 只针对 忽略 跳过 口径 无关 正常用法 不要把

DONE_PAT = [u"\u5df2\u5c31\u5730\u6539", u"\u5df2\u6539\u56de", u"\u5df2\u6539\u6b63", u"\u5df2\u66f4\u6b63",
            u"\u5df2\u6e05\u96f6", u"\u4fee\u5b8c", u"\u5df2\u4fee\u590d", u"\u5df2\u5b8c\u6210", u"\u5df2\u843d\u5730",
            u"\u5df2\u6309\u89c4\u683c\u539f\u5730\u6539", u"\u6539\u6b63\u540e", u"\u4e0d\u518d\u6d89\u53ca",
            u"\u5df2\u9010\u5b57\u590d\u539f", u"\u5df2\u6062\u590d"]
#  已就地改 已改回 已改正 已更正 已清零 修完 已修复 已完成 已落地 已按规格原地改 改正后 不再涉及 已逐字恢复 已恢复

QUOTE_PAT = [u"\u9010\u5b57\u6284", u"\u6284\u4e86\u51fa\u6765", u"\u539f\u6837\u5199\u8fdb", u"\u539f\u6837\u4fdd\u7559",
             u"\u81ea\u6307", u"\u6307\u4ee3", u"\u5b57\u9762\u5b57\u7b26", u"\u5b57\u9762", u"\u4ec5\u4f5c\u7c7b\u76ee\u540d",
             u"\u4e0d\u91cd\u8ff0", u"\u4e0d\u5199\u51fa", u"\u6284\u51fa", u"\u5f15\u6587", u"\u7167\u6284",
             u"\u90a3\u4e2a\u5b57\u7b26", u"\u8be5\u5b57\u7b26", u"\u90a3\u679a\u5b57\u7b26", u"\u8be5\u7b26\u53f7",
             u"\u63cf\u8ff0\u8be5", u"\u6307\u7684\u662f\u8fd9\u4e2a\u5b57\u7b26", u"\u5f15\u7528\u5730\u4f4d",
             u"\u4e0d\u5728\u6e05\u7406\u8303\u56f4", u"\u52ff\u6e05\u7406", u"\u4e0d\u8981\u6e05\u7406"]
#  逐字抄 抄了出来 原样写进 原样保留 自指 指代 字面字符 字面 仅作类目名 不重述 不写出 抄出 引文 照抄
#  那个字符 该字符 那枚字符 该符号 描述该 指的就是这个字符 引用地位 不在清理范围 勿清理 不要清理

BANWORDS = [u"\u800c\u662f", u"\u800c\u4e0d\u662f", u"\u800c\u975e", u"\u3001\u4e0d\u662f", u"\u4e0d\u662f",
            u"\u503c\u5f97\u6ce8\u610f\u5230\u7684\u662f", u"\u9700\u8981\u6307\u51fa\u7684\u662f", u"\u6362\u53e5\u8bdd\u8bf4",
            u"\u7efc\u4e0a", u"\u603b\u4f53\u800c\u8a00"]
BANNED_IN_ITEM = re.compile(u"|".join(re.escape(w) for w in BANWORDS) + u"|\u2014|\\$|\\*\\*|\\bfn??")
FAM = [
    ("btick", [u"\u53cd\u5f15\u53f7", u"\u5b9a\u754c\u7b26", u"\u7f8e\u5143\u7b26", u"\u5145\u5c3e", u"\u6536\u5c3e", u"\u95ed\u5408\u7b26"]),
    ("macro", [u"\u5b8f", u"\u547d\u4ee4", u"\\", u"\u672a\u5b9a\u4e49"]),
    ("cite", [u"\u4f4d\u7f6e\u4e32", u"\u884c\u53f7\u5f15\u7528", u"\u5f15\u7528\u8303\u56f4", u"\u884c\u53f7\u4e0d\u7b26",
              u"\u4f4d\u7f6e\u5f15\u7528", u"\u8de8\u7bc7\u5f15\u7528", u"\u7f3a\u524d\u7f00", u"\u622a\u77ed"]),
    ("anchor", [u"\u4ea4\u53c9\u5f15\u7528", u"\\ref", u"\u951a\u70b9", u"\u60ac\u7a7a\u5f15\u7528", u"\u524d\u5411\u5f15\u7528"]),
    ("count", [u"\u81ea\u8ff0", u"\u5b9e\u6d4b", u"\u884c\u6570", u"\u5b57\u8282", u"\u679a\u4e3e", u"\u603b\u6570", u"\u8ba1\u6570"]),
    ("banstring", [u"\u7981\u4e32", u"\u8f6c\u6298", u"\u5957\u8bed", u"\u505c\u987f\u53f7", u"\u7834\u6298\u53f7",
                   u"\u52a0\u7c97", u"emoji", u"\u52fe\u53f7", u"\u8fdd\u7981", u"\u8fde\u8bfb", u"\u5bf9\u4e3e"]),
    ("english", [u"\u672a\u8bd1", u"\u82f1\u6587\u6b8b\u7559", u"\u4e2d\u82f1\u5939\u6742", u"\u5939\u6742", u"\u82f1\u6587\u539f\u8bcd"]),
    ("ordermove", [u"\u987a\u5e8f", u"\u843d\u9519", u"\u7269\u7406\u987a\u5e8f", u"\u91cd\u6392", u"\u642c\u79fb", u"\u5f52\u4f4d"]),
    ("table", [u"\u53f0\u8d26", u"\u8868\u5934", u"\u7ad6\u7ebf", u"\u6570\u636e\u884c", u"\u5206\u9694\u884c", u"\u7a7a\u683c"]),
    ("probe", [u"\u63a2\u9488", u"HTML \u6ce8\u91ca", u"\u6807\u8bb0", u"\u6ce8\u91ca"]),
    ("typo", [u"\u7b14\u8bef", u"\u9519\u5b57", u"\u591a\u5b57", u"\u5c11\u5b57", u"\u6253\u9519", u"\u8bef\u5199"]),
]


def has(txt, pats):
    return any(p in txt for p in pats)


def families(txt):
    out = []
    for name, pats in FAM:
        if has(txt, pats):
            out.append(name)
    return out or ["other"]


# ---------------------------------------------------------------- section + item extraction
def sections(lines):
    out = []
    for i, l in enumerate(lines):
        if re.match(r"^#{1,6}\s", l) and has(l, SEC_KEYS):
            lvl = len(l) - len(l.lstrip("#"))
            j = i + 1
            while j < len(lines):
                m = lines[j]
                if re.match(r"^#{1,6}\s", m) and (len(m) - len(m.lstrip("#"))) <= lvl:
                    break
                j += 1
            out.append((i + 1, l.strip(), i + 1, j))
    return out


def paragraphs(body):
    paras, cur = [], []
    for l in body:
        s = l.strip()
        if not s or s.startswith("|") or s.startswith("#"):
            if cur:
                paras.append(cur)
                cur = []
            continue
        cur.append(l)
    if cur:
        paras.append(cur)
    return paras


def split_items(par):
    txt = "\n".join(par)
    hits = [(m.start(), m.group(1)) for m in QI.finditer(txt)]
    if len(hits) < 2:
        hits = [(m.start(), m.group(1)) for m in ENUM_MID.finditer(txt)]
    vals = [cn2int(v) for _, v in hits]
    vals = [v for v in vals if v is not None]
    if len(hits) >= 2 and all(b > a for a, b in zip(vals, vals[1:])):
        parts, pos = [], [p for p, _ in hits]
        for k, st in enumerate(pos):
            en = pos[k + 1] if k + 1 < len(pos) else len(txt)
            parts.append(txt[st:en])
        pre = txt[:pos[0]].strip()
        if len(pre) > 12:
            parts.insert(0, pre)
        return parts
    return [txt]


def items_of(body):
    raw = []
    for p in paragraphs(body):
        if len(p) > 1 and all(x.strip().startswith(("-", "*", u"\u2022")) for x in p if x.strip()):
            buf = []
            for x in p:
                s = x.strip()
                if s.startswith(("-", "*", u"\u2022")):
                    if buf:
                        raw.append("\n".join(buf))
                    buf = [s]
                elif buf:
                    buf.append(s)
            if buf:
                raw.append("\n".join(buf))
        else:
            raw.extend(split_items(p))
    return [r.strip() for r in raw if r.strip()]


# ---------------------------------------------------------------- classification
TARGET2 = re.compile(u"(\u5e94\u5199\u4f5c|\u5e94\u5199\u6210|\u5e94\u6539\u4e3a|\u5e94\u6539\u6210|\u5e94\u4e3a|\u5e94\u8bfb\u4f5c|\u5e94\u8bb0\u4f5c|"
                     u"\u6b63\u786e\u5199\u6cd5\u662f|\u6b63\u786e\u7684\u5199\u6cd5\u662f|\u5bf9\u5e94\u5199\u6cd5\u662f|\u5199\u6cd5\u662f|"
                     u"\u6539\u4e3a|\u6539\u6210|\u6539\u4f5c|\u6539\u56de|\u6362\u56de|\u6362\u6210|\u66ff\u6362\u4e3a|\u7edf\u4e00\u6210|\u7edf\u4e00\u4e3a|"
                     u"\u5199\u4e3a|\u8bb0\u4f5c|\u6052\u7b49\u4e8e|\u66f4\u6b63\u4e3a|\u6062\u590d\u4e3a|\u7f6e\u4e3a|\u8be5\u5199|\u8be5\u4f5c|\u6b63\u540d\u662f|"
                     u"\u79fb\u5230|\u79fb\u81f3|\u642c\u5230|\u642c\u81f3|\u5f52\u4f4d\u5230|\u6539\u5199\u4e3a|\u5220\u6389|\u53bb\u6389|\u7f6e\u7a7a)"
                     u"[:\uff1a\\u4e3a\\u3001\\u4f5c\\u6210\\u662f]?\\s*([^\u3002\uff1b\\n]{1,34})")
MECH2 = re.compile(u"\u53cd\u5f15\u53f7|\u7f8e\u5143|\u5b9a\u754c\u7b26|\u7c7b\u76ee\u540d|\u7c7b\u522b\u540d|\u7a7a\u683c|\u5b9e\u6d4b|"
                   u"\u5220\u9664|\u5220\u6389|\u7f6e\u7a7a|\u539f\u6837|\u6210\u5bf9|\u914d\u5bf9|\u540c\u4e00|\u6570\u5b57|\u884c\u53f7")
#  反引号 美元 定界符 类目名 类别名 空格 实测 删除 删掉 置空 原样 成对 配对 同一 数字 行号
#  应写作 应写成 应改为 应改成 应为 应读作 应记作 正确写法是 正确的写法是 对应写法是 写法是 改为 改成
#  改作 改回 换回 换成 替换为 统一成 统一为 写为 记作 恒等于 更正为 恢复为 置为 该写 该作 正名是 移到 移至
#  搬到 搬至 归位到 改写为 删掉 去掉 置空


def literal_kind(tg):
    """what kind of literal did the author actually hand over?  None = prose to be invented"""
    if PLACEHOLDER.search(tg):
        return None
    if LIT_DCODE.search(tg) or LIT_CODE.search(tg):
        return "code"
    if TEXCITE.search(tg):
        return "texcite"
    if LIT_MACRO.search(tg):
        return "macro"
    if LIT_SEC.search(tg):
        return "secno"
    m = LIT_QUOTE.search(tg)
    if m:
        return "quoted"
    if LIT_DIG.search(tg):
        return "digits"
    if LIT_ASCII.search(tg):
        return "ascii"
    if MECH_LITERAL.search(tg):
        return "mechnoun"
    if re.match(u"^\u7b2c?[" + CN + r"\d\s\u884c\u53f7\u524d\u540e\u4e4b\u6807\u9898\u8282\u672b\u6bb5\u4e0e\u548c\uff0c\u3001"
                u"\u5728\u9762\u4e0a\u4e0b\u53bb\u63d2\u5165]{2,34}$", tg):
        return "anchorline"
    return None


def target_found(txt):
    """(phrase, target) pairs where the author spells out the replacement / named form"""
    res = []
    for rx in (TARGET_RE, TARGET2):
        for m in rx.finditer(txt):
            head = m.group(0)[:14]
            tg = m.group(rx.groups).strip() if rx.groups else m.group(0).strip()
            tg = re.sub(u"^[\uff1a\u3001\u4e3a\u4f5c\u6210\u662f]+", u"", tg)[:60]
            if len(tg) < 1:
                continue
            if VAGUE_TG.search(tg) and not (LIT_CODE.search(tg) or LIT_DCODE.search(tg) or LIT_MACRO.search(tg)
                                            or LIT_SEC.search(tg) or TEXCITE.search(tg)):
                continue
            k = literal_kind(tg)
            if k is None:
                continue
            res.append((head, tg, k))
    seen, out = set(), []
    for h, t, k in res:
        if t in seen:
            continue
        seen.add(t)
        out.append((h, t, k))
    return out


def verb_pos(txt):
    """first position where a repair verb starts (splits 'bad form' from 'target form')"""
    pos = [m.start() for m in TARGET_RE.finditer(txt)] + [m.start() for m in TARGET2.finditer(txt)]
    return min(pos) if pos else len(txt)


def classify(txt):
    """return (category, kind, targets)"""
    done = has(txt, DONE_PAT) or bool(SELF_RX.search(txt))
    ask = bool(RESIDUAL.search(txt)) or bool(TRUST_MEASURE.search(txt))
    defect = has(txt, DEFECT_PAT)
    tg = target_found(txt)
    delok = bool(DELCITE.search(txt))
    meas = bool(MEASURED.search(txt)) and (bool(TRUST_MEASURE.search(txt)) or u"\u81ea\u8ff0" in txt
                                           or bool(MEAS_ASK.search(txt)))
    fp = has(txt, FP_PAT)
    quoting = has(txt, QUOTE_PAT) and bool(BANNED_IN_ITEM.search(txt))
    process = has(txt, PROCESS_PAT)
    negat = bool(NEGAT.search(txt))
    # 1 explicit delete / blank-out go-ahead
    if delok and (ask or not done):
        return "ORDER", "mechanical-delete", tg
    # 2 measured truth handed over to replace a wrong self-report
    if meas and (defect or ask):
        return "ORDER", "mechanical-count-correction", tg
    # 3 the author already applied the repair himself -> nothing left for the body side
    if done and not ask:
        return "EXCLUDED", "already-fixed-in-place", []
    # 4 named target form / spelled-out replacement
    if tg and (defect or ask or not process):
        if AMB.search(txt):
            return "EXCLUDED", "ambiguous-two-routes", tg
        return "ORDER", "mechanical-target-given", tg
    # 4b two alternative routes offered, no literal -> deliberately not counted
    if AMB.search(txt) and (defect or ask):
        return "EXCLUDED", "ambiguous-two-routes", tg
    # 5 pure process / coverage register, no word about the landed text
    if process and not defect and not fp and not quoting:
        return "EXCLUDED", "process-register", []
    if done:
        return "EXCLUDED", "already-fixed-in-place", []
    # 6 the item quotes the bad form as evidence and asks nothing be changed
    if quoting:
        return "KEEP", "quotes-bad-form", []
    # 7 registers a checker false positive
    if fp:
        return "WAIVER", "checker-false-positive", []
    # 8 clean attestation (ran the check, zero hits) -- no defect, no order
    if negat and not defect:
        return "EXCLUDED", "zero-attestation", []
    if defect:
        return "JUDGMENT", "defect-needs-wording", []
    return "EXCLUDED", "no-defect-register", []


def measure_of(kind, p):
    """recompute an author's measured truth claim against the current file"""
    raw = io.open(p, "rb").read()
    lines = raw.decode("utf-8", "replace").split("\n")
    if kind == "bytes":
        return os.path.getsize(p)
    if kind == "lines":
        return len(lines)
    if kind == "cr":
        return raw.count(b"\r")
    if kind == "ledger_rows":
        HDR = (u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | "
               u"\u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
        best = 0
        for i, l in enumerate(lines):
            if HDR in l:
                j, n = i + 2, 0
                while j < len(lines) and lines[j].startswith("| "):
                    n += 1
                    j += 1
                best = max(best, n)
        if best == 0:                       # 宽松口径：任意 6 竖线连续块的最长 run
            run = 0
            for l in lines:
                run = run + 1 if l.count("|") == 6 else 0
                best = max(best, run)
        return best
    if kind == "secs":
        return len([l for l in lines if l.startswith("## ")])
    if kind == "dollar_lines":
        return len([l for l in lines if l.count("$") % 2 == 1])
    return None


# ---------------------------------------------------------------- ORDER verification
def body_lines(lines, decl_spans):
    bad = set()
    for _, _, a, b in decl_spans:
        bad.update(range(a, b + 1))
    return [(i + 1, l) for i, l in enumerate(lines) if (i + 1) not in bad]


STOP = [u"\u672c\u6587", u"\u5168\u6587", u"\u6b63\u6587", u"\u5df2\u843d\u76d8", u"\u5185\u5bb9", u"\u4f4d\u7f6e",
        u"\u884c\u53f7", u"\u5c0f\u8282", u"\u5f15\u7528", u"\u7f16\u53f7", u"\u95ee\u9898", u"\u7f3a\u9677"]


def sig_tokens(txt):
    """verbatim strings the author quotes -- the defect signature and/or its target"""
    toks = []
    for m in re.finditer(u"``([^`\\n]{1,60})``", txt):        # `` `:230-231$ `` style spans
        toks.append(m.group(1).strip())
    for m in CODESPAN.finditer(txt):
        s = m.group(0)[1:-1].strip()
        if 2 < len(s) <= 140 and not re.match(u"^[\u4e00-\u9fff]{2,}$", s) and not TEXCITE.search(s):
            toks.append(s)
    for m in re.finditer(u"[\u300c\u201c]([^\u300d\u201d]{2,40})[\u300d\u201d]", txt):
        if not has(m.group(1), STOP):
            toks.append(m.group(1))
    for m in re.finditer(u'"([^"\\n]{2,40})"', txt):            # straight ASCII quotes
        if not has(m.group(1), STOP):
            toks.append(m.group(1))
    for m in re.finditer(u"\\\\[A-Za-z]{2,}", txt):
        toks.append(m.group(0))
    seen, out = set(), []
    for t in sorted(set(toks), key=len, reverse=True):
        t = t.strip()
        if not t or t in seen or len(t) < 2:
            continue
        seen.add(t)
        out.append(t)
    return out


def measure_claim(txt):
    """(unit, claimed_number) for items that hand over a measured truth"""
    m = MEASURED.search(txt)
    if not m:
        return None, None
    num = m.group(1).replace(u"，", "").replace(",", "")
    return m.group(2), int(num) if num.isdigit() else None


def verify(it, path, lines, decl_spans, stated, fam):
    """locate the site by verbatim content and re-measure numeric claims.
       returns (current_line, verified(bool|None), note)"""
    bl = body_lines(lines, decl_spans)
    unit, claim = measure_claim(it)
    if claim:
        kind = None
        if unit == u"\u5b57\u8282":
            kind = "bytes"
        elif unit in (u"\u884c", u"\u6761") and u"\u53f0\u8d26" in it:
            kind = "ledger_rows"
        elif unit in (u"\u884c", u"\u6761") and u"\u5168\u6587" in it:
            kind = "lines"
        elif unit == u"\u679a" and u"\u5b9a\u754c\u7b26" in it:
            kind = "dollar_lines"
        now = measure_of(kind, path) if kind else None
        cur = stated[0] if stated else None
        if now is None:
            return cur, None, u"claim %d %s (nothing recomputed)" % (claim, unit)
        return cur, now == claim, u"re-measure %s: author=%d now=%d" % (kind, claim, now)
    toks = [t for t in sig_tokens(it)][:16]
    hits = {}
    for t in toks:
        hs = [ln for ln, l in bl if t in l]
        if hs:
            hits[t] = hs
    if hits:
        t, hs = sorted(hits.items(), key=lambda kv: (-len(kv[0]), len(kv[1])))[0]
        cur = stated[0] if stated and stated[0] in hs else hs[0]
        ver = bool(stated) and stated[0] in hs
        note = u"sig=`%s` found at %s" % (t[:38], hs[:5])
        if stated and not ver:
            note += u" ; author's line %d drifted" % stated[0]
        return cur, ver, note
    if stated and 1 <= stated[0] <= len(lines):
        return stated[0], None, u"no verbatim signature; author's line kept"
    return None, None, u"no verbatim signature"


# ---------------------------------------------------------------- tex source lookup (author-cited only)
_tex_cache = {}


def tex_file_index():
    if _tex_cache:
        return _tex_cache
    for pat in ("tex", "bib", "sty", "cls", "lean"):
        for p in glob.glob(os.path.join(TEXROOT, "*", "build", "**", "*." + pat), recursive=True):
            _tex_cache.setdefault(os.path.basename(p), []).append(p)
            _tex_cache.setdefault(os.path.splitext(os.path.basename(p))[0], []).append(p)
    return _tex_cache


def tex_evidence_lines(txt):
    """return [(citation, snippet-at-that-line)] for author-cited .tex lines that exist"""
    idx = tex_file_index()
    out = []
    for m in TEXCITE.finditer(txt):
        c = m.group(0)
        mm = re.match(u"(.*?\\.(?:tex|bib|sty|cls|lean))\\s?:\\s?(\\d{1,5})", c)
        if not mm:
            continue
        base, ln = os.path.basename(mm.group(1)), int(mm.group(2))
        cands = idx.get(base) or idx.get(os.path.splitext(base)[0]) or []
        if not cands:
            out.append((c, "NO-SUCH-FILE-UNDER-build"))
            continue
        ls = io.open(cands[0], encoding="utf-8", errors="replace").read().split("\n")
        snip = ls[ln - 1].strip()[:60] if 0 < ln <= len(ls) else "OUT-OF-RANGE(%d)" % len(ls)
        out.append((c, snip))
    return out[:4]


# ---------------------------------------------------------------- main
def build():
    files = sorted(glob.glob(os.path.join(NOTES, "D*.md")))
    files = [f for f in files if os.path.basename(f) != LEDGER_NAME]
    rows, stats = [], collections.Counter()
    fam_ct = collections.Counter()
    per_note_order = collections.Counter()
    for p in files:
        base = os.path.basename(p)
        nid = re.match(r"(D\d+)", base)
        nid = nid.group(1) if nid else base[:8]
        lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
        secs = sections(lines)
        if not secs:
            continue
        stats["notes"] += 1
        decl_spans = [(hl, ht, a, b) for hl, ht, a, b in secs]
        stats["sections"] += len(secs)
        for hl, ht, a, b in secs:
            its = items_of(lines[a:b])
            if not its:
                stats["sections_without_items"] += 1
            for k, it in enumerate(its, 1):
                stats["items_all"] += 1
                cat, kind, tg = classify(it)
                stats["cat_" + cat] += 1
                stats["kind_" + kind] += 1
                if cat == "EXCLUDED":
                    continue
                fam = families(it)
                stated = [int(x) for x in STLINE.findall(it)]
                if not stated:
                    stated = [int(x) for x in STLINE2.findall(it)]
                cur = ver = note = None
                if cat == "ORDER":
                    cur, ver, note = verify(it, p, lines, decl_spans, stated, fam)
                    per_note_order[base] += 1
                    stats["orderkind_" + kind] += 1
                    for f in fam:
                        fam_ct[f] += 1
                fix = u" / ".join(u"%s\u2192%s" % (v, t) for v, t in tg[:2])
                if not fix and DELCITE.search(it):
                    fix = DELCITE.search(it).group(0)
                cites = [m.group(0) for m in TEXCITE.finditer(it)][:4]
                if cat == "ORDER":
                    ev = u"; ".join(u"%s=>%s" % (c, s) for c, s in tex_evidence_lines(it))[:220] or u";".join(cites)
                else:
                    ev = u";".join(cites)
                rows.append({
                    "id": u"%s-L%d-I%02d" % (nid, hl, k),
                    "note": base, "sec_head": ht, "sec_line": hl, "no": k,
                    "label": label_of(it), "cat": cat, "kind": kind, "fam": ",".join(fam),
                    "stated": u";".join(str(x) for x in stated[:5]),
                    "cur": cur if cur is not None else u"",
                    "verified": {True: "yes", False: "no", None: u""}[ver],
                    "quote": quote_of(it), "fix": fix,
                    "evidence": ev,
                    "verify_note": note or u"",
                })
    return rows, stats, per_note_order, fam_ct


def label_of(txt):
    s = txt.replace("\n", u" ").strip()
    m = LABEL_RE.match(s)
    head = m.group(0) if m else u""
    rest = s[len(head):] if m else s
    lab = re.split(u"[\u3002\uff1b\uff1a:,\uff0c]", rest, 1)[0] if rest else s
    return u"%s%s" % (head, lab)[:40]


def quote_of(txt, n=120):
    return re.sub(u"\\s+", u" ", txt).strip()[:n]


def flat(v):
    s = u"" if v is None else (v if isinstance(v, type(u"")) else str(v))
    return s.replace("\t", u" ").replace("\n", u" ")


COLS = ["id", "note", "sec_line", "sec_head", "no", "label", "cat", "kind", "fam", "stated", "cur",
        "verified", "quote", "fix", "evidence", "verify_note"]


def main():
    rows, stats, per_note_order, fam_ct = build()
    with io.open(os.path.join(WORK, "workorders.tsv"), "w", encoding="utf-8", newline="\n") as f:
        f.write("\t".join(COLS) + "\n")
        for r in rows:
            f.write("\t".join(flat(r[c]) for c in COLS) + "\n")
    with io.open(os.path.join(WORK, "_wo_order_review.txt"), "w", encoding="utf-8") as f:
        for r in rows:
            if r["cat"] != "ORDER":
                continue
            f.write(u"%s | %s sec@L%d | stated=%s cur=%s verified=%s | fam=%s\n   LABEL %s\n   QUOTE %s\n   FIX %s\n   EV %s\n   NOTE %s\n\n"
                    % (r["id"], r["note"][:30], r["sec_line"], r["stated"], r["cur"], r["verified"],
                       r["fam"], r["label"], r["quote"], r["fix"], r["evidence"], r["verify_note"]))
    with io.open(os.path.join(WORK, "_wo_stats.txt"), "w", encoding="utf-8") as f:
        f.write(u"D*.md scanned=%d  notes_with_declared_sections=%d  sections=%d  items_in_sections=%d\n"
                % (len(glob.glob(os.path.join(NOTES, "D*.md"))), stats["notes"], stats["sections"],
                   stats["items_all"]))
        f.write(u"sections_without_items=%d\n" % stats["sections_without_items"])
        for k in sorted(stats):
            if k.startswith(("cat_", "kind_")):
                f.write(u"%s = %d\n" % (k, stats[k]))
        f.write(u"tsv_rows=%d\n" % len(rows))
        f.write(u"\nORDER kinds\n")
        for k, v in sorted(stats.items()):
            if k.startswith("orderkind_"):
                f.write(u"%8d %s\n" % (v, k[10:]))
        f.write(u"\nORDER items by family\n")
        for k, v in fam_ct.most_common():
            f.write(u"%8d %s\n" % (v, k))
        f.write(u"\ntop notes by ORDER items\n")
        for n, c in per_note_order.most_common(25):
            f.write(u"%4d  %s\n" % (c, n))
        f.write(u"\nORDER verification tally\n")
        t = collections.Counter(r["verified"] for r in rows if r["cat"] == "ORDER")
        for k, v in t.most_common():
            f.write(u"%6d %s\n" % (v, k or "unverifiable"))
    sys.stdout.write("notes=%d sections=%d items=%d rows=%d %s\n" % (
        stats["notes"], stats["sections"], stats["items_all"], len(rows),
        " ".join("%s:%d" % (k[4:], v) for k, v in sorted(stats.items()) if k.startswith("cat_"))))


if __name__ == "__main__":
    main()
