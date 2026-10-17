# -*- coding: utf-8 -*-
# 三个「取证窗口」上界超出文件长度的行段：量出每个文件的最后内容行号，
# 再对同一篇笔记里作者自己的整篇声明核对口径。
import io, re, os, json
B = chr(92)
ROOT = u'E:' + B + B + u'math'
PRE = os.path.join(ROOT, u'preprints')
NOTES = os.path.join(ROOT, u'研究笔记')
TBL = json.load(io.open(os.path.join(ROOT, u'_work', u'preamble_tables.json'), encoding=u'utf-8'))
CASES = [(u'D101', u'transitions.tex'), (u'D420', u'05-pins.tex'), (u'D759', u'moments.tex')]
CITE = re.compile(u'([A-Za-z0-9_][A-Za-z0-9_.+-]*\\.(?:tex|bbl|sty|cls|bib)):(\\d+)(?:\\s*(?:-{1,2}|[\u2013\u2014])\\s*(\\d+))?')

for key, base in CASES:
    d = TBL[key][u'dir']
    root = os.path.join(PRE, d)
    files = [f for f in os.listdir(NOTES) if f.startswith(key + u'-') and f.endswith(u'.md')]
    txt = io.open(os.path.join(NOTES, files[0]), encoding=u'utf-8', errors=u'replace').read()
    print(u'== %s dir=%s' % (key, d))
    for dp, dn, fn in os.walk(root):
        for f in fn:
            if f != base:
                continue
            p = os.path.join(dp, f)
            raw = io.open(p, encoding=u'utf-8', errors=u'replace').read()
            parts = raw.split(u'\n')
            print(u'  rel=%s split=%d content=%d trail_nl=%s' % (
                os.path.relpath(p, root), len(parts),
                len(parts) - (1 if parts[-1] == u'' else 0), str(raw.endswith(u'\n'))))
    for m in CITE.finditer(txt):
        if m.group(1) == base:
            print(u'  claim %s:%s--%s' % (m.group(1), m.group(2), m.group(3)))
    for m in CITE.finditer(txt):
        if m.group(1) in (u'main.tex', u'paper.tex') and m.group(3):
            for dp, dn, fn in os.walk(root):
                if m.group(1) in fn:
                    p = os.path.join(dp, m.group(1))
                    raw = io.open(p, encoding=u'utf-8', errors=u'replace').read()
                    parts = raw.split(u'\n')
                    print(u' 整篇口径核对 %s:%s--%s vs content=%d split=%d' % (
                        m.group(1), m.group(2), m.group(3),
                        len(parts) - (1 if parts[-1] == u'' else 0), len(parts)))
                    break
            break
