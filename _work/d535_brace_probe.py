import io, glob, sys, re
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
B = chr(92)
p = glob.glob(u'研究笔记/D535-*.md')[0]
t = io.open(p, 'r', encoding='utf-8').read()
ls = t.split(NL)
print(u'lines=%d' % len(ls))
# brace stack check over the new region, treating \{ \} as literal (not grouping)
tot_o = tot_c = 0
for i in range(313, len(ls)):
    l = ls[i]
    o = len(re.findall(r'(?<!' + B + B + u')\{', l)) - len(re.findall(B + u'\{', l))
    c = len(re.findall(r'(?<!' + B + B + u')\}', l)) - len(re.findall(B + u'\}', l))
    o = l.count(u'{') - l.count(B + u'{')
    c = l.count(u'}') - l.count(B + u'}')
    tot_o += o; tot_c += c
    if o != c:
        print(u'line %d  open=%d close=%d diff=%d' % (i + 1, o, c, o - c))
        print(u'   ' + l[:260])
print(u'REGION totals  open=%d close=%d diff=%d' % (tot_o, tot_c, tot_o - tot_c))
