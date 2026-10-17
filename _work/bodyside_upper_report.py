# -*- coding: utf-8 -*-
"""本体侧重述回填（D400-D734）工单报告生成器：只读笔记，只写 _work/。

停手状态：`.tools/inflight.txt` 在干活途中新增内容（由 D535/D278/D452 变为
D452/D233/D66），按规则 5 立即停手；本轮对研究笔记零字节写入，sweep 未运行。
因此：
  - "per-file sweep and gate outputs" 只能给基线读数，并明确标注未跑 sweep 的原因；
  - REPAIR 队列以"待执行"形态逐字登记（原句、新句、行号、字节增量、坏形计数变化）。
"""
import io
import os
import re
import sys

ROOT = u'E:/math'
NS = ROOT + u'/\u7814\u7a76\u7b14\u8bb0'
PREF = u'\u7814\u7a76\u7b14\u8bb0/'
PLAN = ROOT + u'/_work/bodyside_upper_plan.txt'
INFLIGHT = ROOT + u'/.tools/inflight.txt'
GATEALL = ROOT + u'/_work/gate_all_out.txt'
OUT = ROOT + u'/_work/bodyside_upper_report.txt'

# 停手前实测的 inflight 快照（两次读取的结果）
INFL_START = [u'D535', u'D278', u'D452']
INFL_LATEST = [u'D452', u'D233', u'D66']

# REPAIR 队列：作者已在同篇勘误/申报段逐字写出该句应然形态，且盘上缺陷位可唯一定位。
# (D###, 申报行, 缺陷行, 坏形, 逐字重述（好形）, 备注)
QUEUE = [
    (u'D595', 252, 250, u'\u6b63\u6587\u524d\u4e94\u5343\u7c73',
     u'\u6b63\u6587\u524d\u4e94\u5343\u514b\u5b57\u7b26',
     u'\u91cf\u8bcd\u8bef\u7528\uff1b\u574f\u5f62\u5168\u6587\u4e24\u5904\uff08\u6b63\u6587+\u7533\u62a5\uff09\uff0c\u56de\u586b\u540e\u5e94\u843d\u4e3a 1'),
    (u'D570', 255, 137, u'\u7a7a $c_*$ \u4e0e\u5305\u542b\u4ea4\u53e0\u540c-cover',
     u'\u7a7a $c_*$ \u4e0e\u5305\u542b\u4ea4\u53e0\u540c\u6837\u8986\u76d6',
     u'残片落地（句尾以中英夹杂的 -cover 收尾）；坏形全文两处，回填后落为 1'),
    (u'D542', 308, 302, u'\u5e94\u8d8a\u8fc7\u4e03\u4e07\u4e00\u5343\u514b\u4e00\u7ebf',
     u'\u5e94\u8d8a\u8fc7\u4e03\u4e07\u4e00\u5343\u4e94\u767e\u4e00\u7ebf',
     u'\u9519\u5b57\uff1b\u62a5\u544a\u884c\u9010\u5b57\u5f15\u7528\u574f\u5f62\uff1b\u4f5c\u8005\u672c\u610f\u5168\u8bed\u53e6\u542b\u201c\u6d3e\u5355\u5e95\u7ebf\u201d\u56db\u5b57\uff0c\u91c7\u8bcd\u5185\u6700\u5c0f\u66ff\u6362'),
    (u'D494', 299, 287, u'\u5e76\u662f\u975e\u8981\u4ea4\u4ee3\u7684\u8fb9\u89d2',
     u'\u5e76\u975e\u591a\u4f59\u7684\u8fb9\u89d2\u4ea4\u4ee3',
     u'\u8bcd\u5e8f\u9519\u843d\uff1b\u574f\u5f62\u4ec5\u5728\u539f\u4f4d 1 \u5904\uff08\u7533\u62a5\u884c\u53ea\u5f15\u597d\u5f62\uff09\uff0c\u56de\u586b\u540e\u5f52 0\uff0c\u89c4\u5219 2 \u7684\u5355\u70b9\u4f8b\u5916'),
    (u'D486', 253, 174,
     u'kernel.tex:140 \u81f3 planar \u547d\u9898\u7684\u56de\u6307\u5728 kernel.tex:141',
     u'\u547d\u9898\u56de\u6307\u89c1 kernel.tex:140 \u81f3 kernel.tex:141',
     u'\u62ec\u6ce8\u6b8b\u7247\uff1b\u574f\u5f62\u4ec5\u539f\u4f4d 1 \u5904\uff0c\u56de\u586b\u540e\u5f52 0\uff1b\u540c\u6761\u53e6\u4e00\u5904\uff08\u6b63\u6587 142\uff09\u91cd\u8ff0\u9700\u6539\u7d20\u6750\u884c\u53f7 183\u2192184\uff0c\u5df2\u6539\u5224 JUDGMENT'),
    (u'D543', 268, 250, u'\u672a\u8bd1Foreign\u5f62\u6001\u8bcd',
     u'\u672a\u8bd1\u5f62\u6001\u8bcd',
     u'\u8bef\u5939\u5916\u6587\u8bcd\uff1b\u574f\u5f62\u4ec5\u539f\u4f4d 1 \u5904\uff0c\u56de\u586b\u540e\u5f52 0'),
    (u'D543', 268, 250, u'\u6240display \u4e0d\u7b49\u5f0f',
     u'\u6240\u793a\u4e0d\u7b49\u5f0f',
     u'\u6df7\u6392\u6b8b\u7247\uff1b\u574f\u5f62\u4ec5\u539f\u4f4d 1 \u5904\uff0c\u56de\u586b\u540e\u5f52 0\uff1b\u4e0e\u4e0a\u4e00\u6761\u540c\u884c\u4e0d\u540c\u4e32'),
]

# 停手前已判定为不可执行的\u4e3b\u8981\u6837\u672c\uff08\u9664 plan \u81ea\u52a8\u5224\u8bcd\u5916\u7684\u4eba\u5de5\u8865\u6ce8\uff09
LARGEST = (u'\u672a\u8bd1\u672f\u8bed\u4e0e\u8fdd\u7981\u8854\u63a5\u77ed\u8bed\uff08WAIVER\uff09',
           u'\u62a5\u544a\u884c\u53ea\u62a5\u7c7b\u522b\u4e0e\u7b14\u6570\u3001\u4e0d\u590d\u73b0\u5b57\u5f62\uff0c\u4ea4\u672c\u4f53\u4fa7\u673a\u68b0\u6e05\u7406\u901a\u9053')

CAT_ORDER = [u'REPAIR', u'KEEP', u'JUDGMENT', u'WAIVER']


def read_plan():
    rows = []
    with io.open(PLAN, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.rstrip(u'\n')
            if not line or line.startswith(u'#'):
                continue
            m = re.match(u'^(D\\d+) L(\\d+) (\\w+) (.*)$', line)
            if m:
                rows.append((m.group(1), int(m.group(2)), m.group(3), m.group(4)))
    return rows


def note_path(d):
    for fn in sorted(os.listdir(NS)):
        if fn.startswith(d + u'-'):
            return PREF + fn
    return None


def text_of(rel):
    with io.open(ROOT + u'/' + rel, 'rb') as f:
        return f.read().decode('utf-8')


def inflight_now():
    if not os.path.exists(INFLIGHT):
        return None
    with io.open(INFLIGHT, 'r', encoding='utf-8', errors='replace') as f:
        return [x.strip() for x in f if x.strip()]


def gateall_line():
    # 本轮实测（gate_all 只跑一次，读数取自其 stdout；D66 文件名在 GBK 控制台呈乱码，
    # 由本脚本另行按前缀解析）。
    return u'total=734 bad=1  [实测 stdout]', u'D66', u'ershi=2 contrast=2'


def main():
    rows = read_plan()
    per_cat = dict((c, []) for c in CAT_ORDER)
    for r in rows:
        per_cat.setdefault(r[2], []).append(r)
    files_in_range = 0
    for fn in os.listdir(NS):
        m = re.match(r'D(\d+)', fn)
        if m and 400 <= int(m.group(1)) <= 734:
            files_in_range += 1
    hit_files = sorted(set(r[0] for r in rows))
    dens = {}
    for r in rows:
        dens[r[0]] = dens.get(r[0], 0) + 1

    out = []
    w = out.append
    w(u'\u672c\u4f53\u4fa7\u91cd\u8ff0\u56de\u586b\uff08D400\u2013D734\uff09\u4fee\u8865\u62a5\u544a')
    w(u'=' * 60)
    w(u'')
    w(u'0) \u7ed3\u8bba\u4e0e\u505c\u624b\u70b9')
    w(u'   \u672c\u8f6e\u5bf9\u7b14\u8bb0\u96f6\u5b57\u8282\u5199\u5165\uff0c\u65e0\u4e00\u7b14\u56de\u586b\u6267\u884c\u3002')
    w(u'   \u505c\u624b\u539f\u56e0\uff08\u89c4\u5219 5\uff09\uff1ainflight \u6e05\u5355\u5728\u5e72\u6d3b\u9014\u4e2d\u53d8\u5316\u2014\u2014')
    w(u'   \u5f00\u5de5\u65f6\uff1a%s' % (u' / '.join(INFL_START)))
    w(u'   \u505c\u624b\u65f6\uff1a%s' % (u' / '.join(INFL_LATEST)))
    cur = inflight_now()
    w(u'   \u672c\u62a5\u544a\u751f\u6210\u65f6\u518d\u6b21\u8bfb\u53d6\uff1a%s' % (
        (u' / '.join(cur) if cur else u'\u6587\u4ef6\u4e0d\u5b58\u5728')))
    w(u'   \u505c\u624b\u53d1\u751f\u5728\uff1a\u5b8c\u6210\u666e\u67e5\u4e0e\u5f85\u6267\u884c\u961f\u5217\u5b9a\u4e49\u4e4b\u540e\u3001\u9996\u6b21\u7f16\u8f91\u811a\u672c\u5199\u76d8\u4e4b\u524d\uff1b')
    w(u'   \u505c\u624b\u540e\u672a\u518d\u5c1d\u8bd5\u4efb\u4f55\u7f16\u8f91\uff0c\u4e5f\u672a\u8fd0\u884c\u4efb\u4f55\u4f1a\u5199\u7b14\u8bb0\u7684 sweep\u3002')
    w(u'')
    w(u'1) \u666e\u67e5\uff08\u5b9e\u6d4b\uff09')
    w(u'   \u8303\u56f4\u5185\u7b14\u8bb0\u6587\u4ef6\u6570\uff1a%d' % files_in_range)
    w(u'   \u542b\u300c\u672c\u4f53\u4fa7\u300d\u7684\u6587\u4ef6\u6570\uff1a%d' % len(hit_files))
    w(u'   \u547d\u4e2d\u884c\u6570\uff1a%d' % len(rows))
    for c in CAT_ORDER:
        w(u'   %-9s\uff1a%d' % (c, len(per_cat.get(c, []))))
    top = sorted(dens.items(), key=lambda x: (-x[1], x[0]))[:12]
    w(u'   \u5bc6\u5ea6\u6700\u9ad8\u7684\u6587\u4ef6\uff1a%s' % (u', '.join(
        u'%s=%d' % (d, n) for d, n in top)))
    w(u'   \u6d41\u52a8\u6027\u63d0\u793a\uff1a\u540c\u4e00\u53f0\u67e5\u5148\u540e\u4e24\u6b21\u5b9e\u6d4b\u5206\u522b\u5f97 463 \u4e0e %d \u547d\u4e2d\u884c\u3001'
      u'213 \u4e0e %d \u547d\u4e2d\u6587\u4ef6\uff08\u540c\u671f\u8303\u56f4\u5185\u6587\u4ef6\u6570\u4ece 295 \u53d8\u5230 %d\uff09\uff0c'
      u'\u8bf4\u660e\u5176\u5b83\u5199\u624b\u6b63\u5728\u5f80\u7b14\u8bb0\u91cc\u8ffd\u5199\u672c\u4f53\u4fa7\u6bb5\u843d\uff0c\u6570\u5b57\u662f\u6d3b\u7684\u3002'
      % (len(rows), len(hit_files), files_in_range))
    w(u'')
    ga, bad_name, bad_prob = gateall_line()
    real = note_path(bad_name)
    w(u'2) \u5168\u5e93\u95f8\u95e8\uff08\u672c\u8f6e\u53ea\u8dd1\u4e00\u6b21 gate_all\uff0c\u8bfb\u6570\u53d6\u81ea\u5176 stdout\uff09')
    w(u'   %s' % ga)
    w(u'   \u552f\u4e00 bad \u6587\u4ef6\uff1a%s\uff08%s\uff0c%s\uff09\u2014\u2014\u5728\u98de\u7a3f\u4e14\u5728 D400\u2013D734 \u8303\u56f4\u5916\uff0c\u672a\u78b0\u3002' % (
        bad_name, real or u'\u6587\u4ef6\u540d\u5728 GBK \u63a7\u5236\u53f0\u4e71\u7801', bad_prob))
    w(u'')
    w(u'3) \u53ef\u6267\u884c\u961f\u5217\uff08REPAIR\uff0c\u5747\u672a\u6267\u884c\uff0c\u9010\u5b57\u767b\u8bb0\u5907\u7528\uff09')
    byfile = {}
    for d, decl, site, bad, good, note in QUEUE:
        byfile.setdefault(d, []).append((decl, site, bad, good, note))
    for d in sorted(byfile):
        rel = note_path(d)
        if not rel:
            w(u'   [\u6587\u4ef6\u7f3a\u5931] %s' % d)
            continue
        raw = io.open(ROOT + u'/' + rel, 'rb').read()
        t = raw.decode('utf-8')
        lines = t.split(u'\n')
        cr = raw.count(b'\r')
        w(u'   \u2500\u2500 %s  %s' % (d, rel))
        w(u'      \u7f16\u8f91\u524d\u5b57\u8282\uff1a%d  \u884c\u6570\uff1a%d  CR \u5b57\u8282\u6570\uff1a%d' % (
            len(raw), len(lines), cr))
        for decl, site, bad, good, note in byfile[d]:
            nb = t.count(bad)
            ng = t.count(good)
            occ = [j + 1 for j, x in enumerate(lines) if bad in x]
            delta = len(good.encode('utf-8')) - len(bad.encode('utf-8'))
            old_line = lines[site - 1] if 0 < site <= len(lines) else u''
            if bad in old_line:
                new_line = old_line.replace(bad, good, 1)
                hit = u'\u547d\u4e2d'
            else:
                new_line = old_line
                hit = (u'\u884c\u53f7\u5df2\u6f02\u79fb\uff08\u5728\u98de\u7a3f\u6b63\u5728\u88ab\u5199\uff09'
                       if not old_line else u'\u672c\u884c\u672a\u542b\u574f\u5f62\uff0c\u9700\u91cd\u5b9a\u4f4d')
            w(u'      \u5b9a\u4f4d\u6821\u9a8c\uff1a%s' % hit)
            w(u'      \u7533\u62a5\u884c L%d / \u7f3a\u9677\u884c L%d' % (decl, site))
            w(u'      \u574f\u5f62\uff1a"%s" \u5168\u6587\u8ba1\u6570=%d \u4f4d\u7f6e=%s' % (bad, nb, occ))
            w(u'      \u597d\u5f62\uff1a"%s" \u5168\u6587\u8ba1\u6570=%d' % (good, ng))
            w(u'      \u56de\u586b\u540e\u574f\u5f62\u8ba1\u6570\uff1a%d \u2192 %d\uff1b\u5b57\u8282\u589e\u91cf=%+d\uff08\u884c\u6570\u4e0d\u53d8\uff09' % (nb, nb - 1, delta))
            w(u'      \u5224\u636e\uff1a%s' % note)
            w(u'      \u539f\u53e5\uff08\u7f3a\u9677\u884c\u9010\u5b57\uff09\uff1a%s' % old_line)
            w(u'      \u65b0\u53e5\uff08\u56de\u586b\u540e\u9010\u5b57\uff0c\u672a\u5199\u76d8\uff09\uff1a%s' % new_line)
        w(u'      sweep \u8f93\u51fa\uff1a\u672a\u8dd1\u52a8\uff08sweep \u4f1a\u5199\u7b14\u8bb0\uff0c\u505c\u624b\u540e\u7981\u7528\uff09')
        w(u'')
    w(u'4) \u57fa\u7ebf\u95f8\u95e8\u8bfb\u6570\uff08gate.chk \u53ea\u8bfb\uff0c\u672c\u8f6e\u5b9e\u6d4b\uff1b\u96f6\u7f16\u8f91\u6545\u6536\u5de1\u503c\u5373\u57fa\u7ebf\u503c\uff09')
    sys.path.insert(0, ROOT + u'/.tools')
    try:
        import gate as gate_mod
    except Exception as exc:  # noqa
        gate_mod = None
        w(u'   gate \u6a21\u5757\u5bfc\u5165\u5931\u8d25\uff1a%s' % exc)
    ids = [u'D595', u'D570', u'D542', u'D494', u'D486', u'D543', u'D452']
    for d in ids:
        rel = note_path(d)
        if not rel or not gate_mod:
            continue
        try:
            r = gate_mod.chk(ROOT + u'/' + rel, quiet=True)
        except TypeError:
            r = gate_mod.chk(ROOT + u'/' + rel)
        w(u'   %-6s size=%s secs=%s contig=%s rows=%s math=%s problems=%s' % (
            d, r.get('size'), r.get('secs'), r.get('contig'), r.get('rows'),
            r.get('math'), r.get('problems')))
    w(u'   sweep \u8f93\u51fa\uff1a\u5168\u90e8\u672a\u8dd1\u52a8\u3002sweep.py \u662f\u5199\u624b\u5de5\u5177\uff0c\u89c4\u5219 5 \u505c\u624b\u540e\u4e0d\u5f97\u89e6\u78b0\u7b14\u8bb0\u3002')
    w(u'')
    w(u'5) \u6700\u5927\u4e0d\u53ef\u6267\u884c\u65cf')
    w(u'   \u7c7b\u522b\uff1a%s' % LARGEST[0])
    w(u'   \u5178\u578b\u5f62\u72b6\uff1a%s' % LARGEST[1])
    w(u'   \u884c\u6570\uff1a%d / %d' % (len(per_cat.get('WAIVER', [])), len(rows)))
    w(u'   \u5176\u6b21\u5927\u65cf\uff1a\u642c\u5757/\u5220\u91cd/\u5931\u53e5\u63d2\u5165\uff08JUDGMENT \u4e3b\u4f53\uff09\u4e0e\u6574\u53e5\u5b9a\u4f4d\u5f15\u7528\u884c')
    w(u'')
    w(u'6) \u8fd1\u754c\uff1a\u5dee\u70b9\u8d8a\u754c\u4f46\u6301\u4f4f\u7684\u5730\u65b9')
    w(u'   a. D452 L229 \u7ed9\u9f50\u56db\u5904\u9010\u5b57\u66ff\u6362\uff08realize \u6210\u52a8\u529b\u5b66/\u5b9e\u73b0\u4e3a\u52a8\u529b\u5b66\u7b49\uff09\uff0c')
    w(u'      \u662f\u5168\u5e93\u6700\u4e30\u5bcc\u7684\u53ef\u673a\u68b0\u56de\u586b\u6837\u672c\uff1b\u8be5\u7a3f\u5728 inflight \u4e0a\u4e00\u76f4\u5b58\u5728 \u2192 \u8df3\u8fc7\u5e76\u767b\u8bb0\u3002')
    w(u'   b. D574 L220\u3001D646 L251 \u7b49\u5931\u53e5/\u642c\u5757\u7533\u62a5\u770b\u4f3c\u53ef\u56de\u586b\uff0c\u5b9e\u9700\u63d2\u884c\u6216\u6539\u884c\u6570 \u2192 \u672a\u52a8\u3002')
    w(u'   c. D543 L268 \u5176\u4e09\uff08\u5341\u4e03\u2194\u5341\u4e5d\u4e2a\u5c0f\u8282\uff09\u3001D474\u3001D493\u3001D435\u3001D689 \u7684\u8ba1\u6570\u53e3\u5f84')
    w(u'      \u90fd\u5e26\u9010\u5b57\u66f4\u6b63\uff0c\u4f46\u4e0d\u662f\u951a\u4f4d\u4e8b\u6545\u635f\u574f\u7684\u53e5\u5b50 \u2192 \u53ea\u767b\u8bb0\u3002')
    w(u'   d. D486 L142 \u7684\u9010\u5b57\u91cd\u8ff0\u8fde\u5e26\u628a\u7d20\u6750\u5f15\u7528 183 \u6539\u4e3a 184\uff0c\u5c5e\u4e8b\u5b9e\u53e3\u5f84 \u2192 \u964d\u4e3a JUDGMENT\u3002')
    w(u'   e. \u672a\u8bd1\u672f\u8bed\uff08D452/D537/D597/D454/D641 \u7b49\uff09\u5168\u90e8\u6309\u89c4\u5219 6 \u4e0d\u6539\u8bd1\u540d\u3002')
    w(u'')
    w(u'7) \u96f6\u5199\u5165\u7684\u5de6\u8bc1\uff08\u5b57\u8282\u4e0e\u4fee\u6539\u65f6\u95f4\uff0c\u672c\u811a\u672c\u5b9e\u6d4b\uff09')
    for d in ids:
        rel = note_path(d)
        if not rel:
            continue
        fp = ROOT + u'/' + rel
        st = os.stat(fp)
        w(u'   %-6s bytes=%-8d mtime=%s' % (
            d, st.st_size, __import__('time').strftime('%Y-%m-%d %H:%M:%S', __import__('time').localtime(st.st_mtime))))
    w(u'   \u4e0a\u8ff0\u5b57\u8282\u6570\u4e0e\u7f16\u8f91\u524d wc -c \u4e00\u81f4\uff0c\u65e0\u5b57\u8282\u589e\u91cf\uff1b\u672c\u4f1a\u8bdd\u5bf9\u8fd9\u4e9b\u7b14\u8bb0\u96f6\u5199\u5165\u3002')
    w(u'')
    w(u'8) \u9010\u884c\u53f0\u8d26\uff08plan\uff0c\u5171 %d \u884c\uff09\u89c1 _work/bodyside_upper_plan.txt' % len(rows))
    w(u'   下面附 KEEP / JUDGMENT 全部位置与一句话理由（同一份数据在 _work/bodyside_upper_plan.txt）。')
    for c in [u'KEEP', u'JUDGMENT']:
        w(u'')
        w(u'--- %s (%d) ---' % (c, len(per_cat.get(c, []))))
        for d, ln, cc, why in sorted(per_cat.get(c, []), key=lambda x: (x[0], x[1])):
            w(u'%s L%d %s %s' % (d, ln, cc, why))
    w(u'')
    w(u'--- WAIVER (%d) \u6309\u6587\u4ef6\u6c47\u603b ---' % len(per_cat.get('WAIVER', [])))
    byf = {}
    for d, ln, cc, why in per_cat.get('WAIVER', []):
        byf.setdefault(d, []).append(ln)
    for d in sorted(byf):
        w(u'%s: %s' % (d, u' '.join(u'L%d' % x for x in sorted(byf[d]))))
    io.open(OUT, 'wb').write((u'\n'.join(out) + u'\n').encode('utf-8'))
    print('report_rows=%d cats=%s files=%d bytes_written=%d' % (
        len(rows), {k: len(v) for k, v in per_cat.items()}, len(hit_files), os.path.getsize(OUT)))


if __name__ == '__main__':
    main()
