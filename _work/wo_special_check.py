# -*- coding: utf-8 -*-
"""check the disk facts the hand-adjudicated rows rely on"""
import io, os, re
HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']
raw = io.open('_work/workorders.tsv', 'rb').read()
lines = [l for l in raw.decode('utf-8').split('\n') if l]
rows = dict((r['id'], r) for r in (dict(zip(HDR, ln.split('\t'))) for ln in lines[1:]))
def note_of(i):
    return rows[i]['note']
ND = u'\u7814\u7a76\u7b14\u8bb0'
def lines_of(note):
    p = os.path.join(ND, note)
    b = io.open(p, 'rb').read()
    assert b.count(b'\r') == 0
    return b.decode('utf-8').split('\n')

out = []
def show(tag, note, idxs, pat=None):
    L = lines_of(note)
    out.append(u'==== %s | %s | total lines %d' % (tag, note, len(L)))
    for i in idxs:
        if 0 < i <= len(L):
            out.append(u'  [%d] %s' % (i, L[i - 1]))
        else:
            out.append(u'  [%d] OUT-OF-RANGE' % i)
    if pat:
        for j, l in enumerate(L):
            if re.search(pat, l):
                out.append(u'  hit %d: %s' % (j + 1, l[:200]))
    return L

def note_for(rid):
    for ln in raw.decode('utf-8').split('\n')[1:]:
        if not ln:
            continue
        f = ln.split('\t')
        if f[0] == rid:
            return f[1]
    raise KeyError(rid)

BR = u'$s_n=' + chr(92) + u'frac{n}{2(n+1)}}$'
L = show('D365-delete-brace', note_for('D365-L468-I03'), [47], re.escape(BR))
# D370 ledger count sentence + probe comment
CNT = u'\u53f0\u8d26\u5171'
L = show('D370-count', note_for('D370-L415-I03'), [91, 413], CNT)
out.append(u'  D370 html comments: %s' % [i + 1 for i, l in enumerate(L) if u'<!--' in l])
# D556 destroyed ledger row
BCS = 'bcs-prefix' + chr(92)? if False else r'bcs-prefix\.tex:61'
L = show('D556-missing-row', note_for('D556-L238-I01'), [], BCS)
out.append(u'  D556 rows with 1/[16: %s' % [i + 1 for i, l in enumerate(L) if u'16(N+1)' in l or u'1/[16' in l])
io.open('_work/wo_special_check.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('lines', len(out))
