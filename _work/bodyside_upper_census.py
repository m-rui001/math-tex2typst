# -*- coding: utf-8 -*-
# 普查：D400-D734 内含常量「本体侧」的行，按是否携带"作者已给出完整重述"的工单形状分层。
# 只读，不写盘上笔记。输出 _work/bodyside_upper_census.txt（UTF-8）。
import io, re, glob, os

NS = u'\u7814\u7a76\u7b14\u8bb0'
BS = u'\u672c\u4f53\u4fa7'                     # 本体侧
# 重述动词：作者在此处逐字给出原句该怎么写
VERB = [u'\u56de\u586b',                       # 回填
        u'\u9010\u5b57\u6587\u672c',           # 逐字文本
        u'\u9010\u5b57\u7167\u5f55',           # 逐字照录
        u'\u9010\u5b57\u6062\u590d',           # 逐字恢复
        u'\u7167\u6284',                       # 照抄
        u'\u5e94\u4f5c',                       # 应作
        u'\u5e94\u4e3a',                       # 应为
        u'\u5e94\u5199\u4f5c',                 # 应写作
        u'\u5e94\u8bfb\u4f5c',                 # 应读作
        u'\u6062\u590d\u4f4d',                 # 恢复位
        u'\u6b63\u786e\u8868\u8ff0',           # 正确表述
        u'\u6b63\u786e\u5199\u6cd5',           # 正确写法
        u'\u671f\u671b\u5168\u6587',           # 期望全文
        u'\u671f\u671b\u6587\u672c',           # 期望文本
        u'\u5b8c\u6574\u91cd\u8ff0',           # 完整重述
        u'\u91cd\u8ff0']                       # 重述
QUOTE = [u'\u201c', u'\u201d', u'\u300c', u'\u300d']  # “ ” 「 」
DASHQ = [u'"']

def cls(line):
    v = [k for k in VERB if k in line]
    q = any(c in line for c in QUOTE)
    if v and q:
        return 'A1'
    if v:
        return 'A2'
    if q and (u'\u539f\u53e5' in line or u'\u539f\u6587' in line or u'\u5f15\u7528' in line):
        return 'B1'
    return 'C'

rows = []
for p in sorted(glob.glob(NS + '/D*.md')):
    m = re.match(r'D(\d+)', os.path.basename(p))
    if not m:
        continue
    n = int(m.group(1))
    if not (400 <= n <= 734):
        continue
    t = io.open(p, encoding='utf-8', errors='replace').read()
    lines = t.split('\n')
    for i, l in enumerate(lines):
        if BS not in l:
            continue
        rows.append((('D%03d' % n), i + 1, cls(l), l))

out = []
cnt = {}
for d, ln, c, l in rows:
    cnt[c] = cnt.get(c, 0) + 1
out.append('# census: hitlines=%d  A1=%d A2=%d B1=%d C=%d' % (
    len(rows), cnt.get('A1', 0), cnt.get('A2', 0), cnt.get('B1', 0), cnt.get('C', 0)))
io.open('_work/bodyside_upper_census.txt', 'wb').write('\n'.join(out).encode('utf-8') + b'\n')

with io.open('_work/bodyside_upper_census.txt', 'ab') as f:
    for d, ln, c, l in rows:
        if c in ('A1', 'A2', 'B1'):
            f.write(('%s L%d %s %s\n' % (d, ln, c, l)).encode('utf-8'))
print('hitlines=%d cats=%s' % (len(rows), sorted(cnt.items())))
