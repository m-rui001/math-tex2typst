# -*- coding: utf-8 -*-
# v7: tell-driven shortlist.
# Declaration lines carrying an explicit restoration tell (完整重述 / 原句在此 /
# 正确写法是 / 应读作 / 应改回 / 恢复为 / 重述 / 照抄 ...) yield candidate
# restatement strings (quoted, or the run after a full-width colon). For each
# such q that is absent verbatim from the note, look for a damaged relative
# (pure indel, 1..8 chars, ratio>=0.80) occurring exactly once in the file.
import io, os, re, glob, difflib, sys
from collections import Counter

sys.path.insert(0, u'E:/math/_work')
import bodyside_detect as bd

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
TELLS = [u'\u5b8c\u6574\u91cd\u8ff0',                  # 完整重述
         u'\u539f\u53e5\u5728\u6b64',                  # 原句在此
         u'\u6b63\u786e\u5199\u6cd5\u662f',             # 正确写法是
         u'\u5e94\u8bfb\u4f5c',                        # 应读作
         u'\u5e94\u6539\u56de',                        # 应改回
         u'\u6062\u590d\u4e3a',                        # 恢复为
         u'\u6539\u56de\u4e3a',                        # 改回为
         u'\u91cd\u8ff0\u4f9b',                        # 重述供
         u'\u9010\u5b57\u4ea4\u51fa',                  # 逐字交出
         u'\u5e94\u6062\u590d\u7684\u539f\u6587',        # 应恢复的原文
         u'\u539f\u6587\u5728\u6b64',                  # 原文在此
         u'\u6b63\u786e\u539f\u53e5',                  # 正确原句
         u'\u5b8c\u6574\u539f\u53e5',                  # 完整原句
         u'\u4fee\u590d\u5bf9\u7167']                  # 修复对照
COLON = u'\uff1a'


def cands_from_line(l):
    res = list(bd.quotes(l))
    # trailing run after the last full-width colon
    k = l.rfind(COLON)
    if k >= 0:
        t = l[k + 1:].strip(u' \u3000')
        if len(t) >= 10:
            res.append(t)
    return res


def scan(path):
    lines = bd.load(path)
    txt = u'\n'.join(lines)
    out = []
    for i, l in enumerate(lines):
        if not l or not any(t in l for t in TELLS):
            continue
        for q in cands_from_line(l):
            if len(q) < 10 or not bd.CJK.search(q):
                continue
            if q in txt:
                continue
            cq = Counter(q)
            found = []
            for j, x in enumerate(lines):
                if not x or abs(len(x) - len(q)) > 200:
                    continue
                cl = Counter(x)
                if sum(min(cq[ch], cl[ch]) for ch in cq) < 0.7 * len(q):
                    continue
                best = None
                for w in range(max(6, len(q) - 8), min(len(x), len(q) + 8) + 1):
                    for k in range(0, len(x) - w + 1):
                        d = x[k:k + w]
                        if d == q:
                            continue
                        rep, indel = bd.ops(q, d)
                        if rep == 0 and 1 <= indel <= 8:
                            r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
                            if r >= 0.80 and (best is None or r > best[0]):
                                best = (r, d, k)
                if best:
                    found.append((j + 1, best[0], best[1], best[2], txt.count(best[1])))
            if found:
                found.sort(key=lambda f: -f[1])
                out.append((i + 1, l, q, found))
    return out


if __name__ == '__main__':
    res = []
    tot = 0
    notes = 0
    for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
        m = re.match(u'^D([0-9]+)', os.path.basename(p))
        if not m or not (1 <= int(m.group(1)) <= 399):
            continue
        tag = u'D%03d' % int(m.group(1))
        for dl, decl, q, found in scan(p):
            tot += 1
            if not notes or res[-1][0] != tag:
                notes += 1
            res.append((tag, dl, decl, q, found))
    out = []
    for tag, dl, decl, q, found in res:
        out.append(u'#### %s DECL L%d' % (tag, dl))
        out.append(u'  DECLTEXT: %s' % decl[:600])
        out.append(u'  Q(%d): %s' % (len(q), q))
        for ln, r, d, off, cnt in found[:3]:
            out.append(u'  SITE L%d r=%.3f cnt=%d off=%d dlen=%d qlen=%d : %s' % (
                ln, r, cnt, off, len(d), len(q), d))
    io.open(u'E:/math/_work/bodyside_short7.txt', 'wb').write(
        (u'\n'.join(out) or u'none').encode('utf-8'))
    print('pairs=%d' % tot)
