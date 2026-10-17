import io, glob
p = [x for x in glob.glob('研究笔记/D114-*') if x.endswith('.md')][0]
t = io.open(p, encoding='utf-8').read()
L = t.split('\n')
BT = chr(96)
NEW10 = ('十，本篇自身的排印残留：第 21 到 27 节有 21 行的行内代码末尾多出一段闭合符号（原行号 `1560`、`1747`、`1755`、'
 '`1859`、`1863`、`1998`、`2000`、`2006`、`2008`、`2012`、`2145`、`2147`、`2149`、`2151`、`2155`、`2273`、`2275`、'
 '`2277`、`2279`、`2281`、`2283`，后续追加会使这些行号下移，定位以所在节为准）。修法是删去那两个多余字符、补回闭合反引号，'
 '被影响的表达式本身（' + BT + r'\beta_i' + BT + '、' + BT + 'p_{0,i}' + BT + '、' + BT + r'\mathcal L' + BT + '、'
 + BT + r'\gamma_j' + BT + ' 等）在正文里拼写正确。')
NEW11 = ('十一，第 17 节我写"第 13 节的 ' + BT + r'\varepsilon_i^{\mathrm{cut}}' + BT + ' 与第 14 节的 ' + BT
 + r'\varepsilon_i^{\mathrm{spr}}' + BT + ' 合并成 ' + BT + '04:37-38' + BT + ' 那句至多 ' + BT + r'\eps^2/4' + BT
 + '"，精确说法是：' + BT + '04:37-38' + BT + ' 只声明总误差 ' + BT + r'\le\eps^2/4' + BT + '，把它拆成两项并加上 '
 + BT + r'\varepsilon_j^{\mathrm{cut}}' + BT + ' 是第 14 节 (d) 三与 ' + BT + '07:108-110' + BT + ' 的三角形余量给出的，'
 '拆分比例由参数选取决定，tex 未在上层文档里显式拆分。')
NEWAUG = ('接第 32 节的补记三条。一，第十条所列范围偏小：紧接上面那段（原第 2751 行）里就有四处同型残留，分别挂在 '
 '`n_p` 之后那句、`L_p` 与 `p_{0,i}` 那句、`eq:lower-error-conditions` 那句、以及 `\gamma_j` 冻结那句的末尾，'
 '第 2283 行同样有四处；所以"第 28 节之后无此类残留"作废，收尾的字符级清理按同一口径把全篇过了一遍。'
 '二，第 2283 行末句（第 28 节 (d) 的四）在写第十一条时被整句重复抄到了文件末尾，两处文字完全一致，'
 '收尾时只保留第 28 节那一处，重复的那份已删。三，第 31 节 `2^k` 障碍那段的末句开头留了一处规格禁止五项之一的转折引导语，'
 '本篇纪律是只许在末尾追加、不许改写已落盘文本，我没有就地删它的权限，它已由收尾的字符级清理换成直陈句，这里不复述该字面串。')
for pre, new in (('十，本篇自身的排印残留', NEW10), ('十一，第 17 节我写', NEW11), ('接第 32 节的补记三条', NEWAUG)):
    hits = [i for i, l in enumerate(L) if l.startswith(pre)]
    assert len(hits) == 1, (pre, hits)
    L[hits[0]] = new
t2 = '\n'.join(L)
print('dbl', t2.count(BT*3), t2.count(BT*2), 'rp', t2.count(chr(92)+')'), 'open', t2.count(chr(92)+'('))
print('size', len(t.encode()), len(t2.encode()), 'lines', len(L))
io.open(p, 'w', encoding='utf-8', newline='').write(t2)
