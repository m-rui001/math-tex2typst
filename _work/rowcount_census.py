# -*- coding: utf-8 -*-
# 找「台账自述行数 vs 实测行数」不一致的篇子。D370 §14 第八条就是这一族。
import io, glob, re, sys

sys.path.insert(0, u'.tools')
import gate

CN = {u'\u96f6': 0, u'\u4e00': 1, u'\u4e8c': 2, u'\u4e24': 2, u'\u4e09': 3, u'\u56db': 4,
      u'\u4e94': 5, u'\u516d': 6, u'\u4e03': 7, u'\u516b': 8, u'\u4e5d': 9}
NUM = u''.join([u'0-9', u'\u96f6\u4e00\u4e8c\u4e24\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d',
                u'\u5341\u767e'])


def cn2int(s):
    if s.isdigit():
        return int(s)
    total, cur = 0, 0
    for ch in s:
        if ch == u'\u767e':                       # 百
            cur = (cur or 1) * 100
            total += cur
            cur = 0
        elif ch == u'\u5341':                     # 十
            cur = (cur or 1) * 10
            total += cur
            cur = 0
        elif ch == u'\u96f6':                     # 零
            cur = cur * 10
        elif ch in CN:
            cur = cur * 10 + CN[ch]
        else:
            return None
    return total + cur


PAT = re.compile(u'[\u53f0\u8868][^\u3002\n]{0,14}?[\u5171\u542b]([' + NUM + u']+)(\u884c|\u6761)')
rows_out = []
for p in sorted(glob.glob(u'研究笔记/D*.md')):
    t = io.open(p, 'rb').read().decode('utf8')
    ms = list(PAT.finditer(t))
    if not ms:
        continue
    measured = gate.chk(p, quiet=True).get('rows')
    for m in ms:
        decl = cn2int(m.group(1))
        ln = t[:m.start()].count(u'\n') + 1
        flag = u'MISMATCH' if (decl is not None and measured is not None and decl != measured) else u'ok'
        rows_out.append((p.split(u'\\')[-1][:34], ln, m.group(0)[:26], decl, measured, flag))
mis = [r for r in rows_out if r[5] == u'MISMATCH']
out = [u'declarations=%d mismatches=%d notes_hit=%d'
       % (len(rows_out), len(mis), len(set(r[0] for r in mis)))]
out.append(u'--- MISMATCH:')
out += [u'%s L%d 「%s」 decl=%s measured=%s' % r[:5] for r in mis]
out.append(u'--- matching:')
out += [u'%s L%d 「%s」 decl=%s measured=%s' % r[:5] for r in rows_out if r[5] == u'ok']
io.open(u'_work/ledger_rowcount.txt', 'wb').write(u'\n'.join(out).encode('utf8'))
print(out[0])
