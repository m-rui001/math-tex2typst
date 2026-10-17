# -*- coding: utf-8 -*-
# 验收门：所有中文literal一律用转义写，避免任何编码/串码事故。
import io, re, sys, glob, os

HDR = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
SEP = u'| --- | --- | --- | --- | --- |'
BAN = [u'\u503c\u5f97\u6ce8\u610f\u7684\u662f', u'\u9700\u8981\u6307\u51fa\u7684\u662f',
       u'\u6362\u53e5\u8bdd\u8bf4', u'\u7efc\u4e0a', u'\u603b\u4f53\u800c\u8a00']
EM = chr(8212)
ERSHI = u'\u800c\u662f'
BC = u'\u800c\u4e0d\u662f'
CONTRA = re.compile(u'\u4e0d\u662f[^\u3002\\n]{0,40}\u800c\u662f')
DUNPAI = u'\u3001\u4e0d\u662f'
COMMA2 = u'\uff0c\uff0c'
# 中文 literal 少转一个汉字不会报错，只会静默放行（2026-10-09 的 换句话说 存成 换句说 事故）。
# 字数对不上就当场炸，别让闸门带着坏常量判"零命中"。
assert [len(w) for w in BAN] == [6, 6, 4, 2, 4], 'BAN literal corrupted'
assert (len(EM), len(ERSHI), len(BC), len(DUNPAI), len(COMMA2)) == (1, 2, 3, 3, 2), 'ban literal corrupted'
assert (len(HDR), len(SEP)) == (44, 31), 'ledger header literal corrupted'


def chk(path, quiet=False):
    t = io.open(path, encoding='utf-8', errors='replace').read()
    lines = t.split('\n')
    secs = [l[3:].split()[0] for l in lines if l.startswith('## ')]
    problems = []
    if t.count(HDR) != 1:
        problems.append('hdr=%d' % t.count(HDR))
    if t.count(SEP) < 1:
        problems.append('sep=%d' % t.count(SEP))
    h = None
    for i, l in enumerate(lines):
        if l == HDR:
            h = i
    ledger = []
    if h is not None:
        j = h + 2
        while j < len(lines) and lines[j].startswith('| '):
            ledger.append(lines[j])
            j += 1
    bad = [i for i, l in enumerate(ledger) if l.count('|') != 6]
    if bad:
        problems.append('badLedgerRows=%s' % bad[:6])
    empt = [i for i, l in enumerate(ledger) if l.rstrip().endswith('| |') or ' |  | ' in l]
    if empt:
        problems.append('emptyCells=%s' % empt[:6])
    if len(ledger) < 28:
        problems.append('ledgerRows=%d' % len(ledger))
    counts = (('emDash', t.count(EM)), ('bareHRule', len(re.findall(r'(?m)^---$', t))),
              ('ershi', t.count(ERSHI)), ('bc', t.count(BC)),
              ('contrast', len(CONTRA.findall(t))), ('cc', t.count(COMMA2)))
    for label, val in counts:
        if val:
            problems.append('%s=%d' % (label, val))
    for w in BAN:
        if t.count(w):
            problems.append('ban=%d' % t.count(w))
    math = t.count('\\(') + t.count('$')
    if math < 1000:
        problems.append('math=%d' % math)
    size = len(t.encode('utf-8'))
    if size < 70000:
        problems.append('size=%d' % size)
    nums = [re.match(r'(\d+)', s).group(1) for s in secs if re.match(r'\d+', s)]
    contig = all(int(b) - int(a) == 1 for a, b in zip(nums, nums[1:]))
    if not quiet:
        print('%-50s size=%7d secs=%2d contig=%s rows=%d'
              % (os.path.basename(path)[:50], size, len(secs), contig, len(ledger)))
        print('    math=%d  %s' % (math, ' '.join(problems) if problems else 'CLEAN'))
    return {'size': size, 'secs': len(secs), 'contig': contig, 'rows': len(ledger),
            'math': math, 'problems': problems}


# 只在命令行直跑时扫 argv。close_one.py / other_cover.py 会 import 本模块，
# 循环写在模块级就会拿调用方的 argv 去 glob（D587 那趟凭空多出一行 "--acked NO FILE"）。
if __name__ == '__main__':
    for pat in sys.argv[1:]:
        hits = sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + pat + '*'))
        if not hits:
            print(pat, 'NO FILE')
        for hh in hits:
            if os.path.isfile(hh):
                chk(hh)
