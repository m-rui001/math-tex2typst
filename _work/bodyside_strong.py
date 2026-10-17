# -*- coding: utf-8 -*-
# High-precision tell grep over D001-D399: exact restoration-declaration idioms.
import io, os, re, glob

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
STRONG = {
    u'\u5b8c\u6574\u91cd\u8ff0': 'full_restate',           # 完整重述
    u'\u539f\u53e5\u5728\u6b64': 'orig_here',              # 原句在此
    u'\u4fee\u590d\u5bf9\u7167': 'repair_ref',             # 修复对照
    u'\u88ab\u66ff\u6362\u6210': 'was_replaced_by',        # 被替换成
    u'\u73b0\u5b58\u6587\u672c': 'current_text',           # 现存文本
    u'\u5e94\u6539\u56de': 'should_revert',                # 应改回
    u'\u6b63\u786e\u5199\u6cd5\u662f': 'correct_is',       # 正确写法是
    u'\u9010\u5b57\u4ea4\u51fa': 'char_by_char',           # 逐字交出
    u'\u5e94\u6062\u590d': 'should_restore',               # 应恢复
    u'\u539f\u53e5\u5982\u4e0b': 'orig_follows',           # 原句如下
    u'\u539f\u6587\u5982\u4e0b': 'origtext_follows',       # 原文如下
    u'\u884d\u5b57': 'surplus_char',                       # 衍字
    u'\u8131\u843d': 'dropped',                            # 脱落
    u'\u6f0f\u5b57': 'missing_char',                       # 漏字
    u'\u591a\u51fa': 'extra_char',                         # 多出
    u'\u6062\u590d\u5bf9\u7167': 'restore_ref',            # 恢复对照
    u'\u6b63\u786e\u5f62\u6001': 'correct_form',           # 正确形态
    u'\u5e94\u4e3a': 'should_be',                          # 应为
}


def idnum(name):
    m = re.match(u'^D([0-9]+)', name)
    return int(m.group(1)) if m else None


out = []
cnt = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    n = idnum(os.path.basename(p))
    if n is None or n < 1 or n > 399:
        continue
    lines = io.open(p, 'rb').read().decode('utf-8').split(u'\n')
    for i, l in enumerate(lines):
        labels = [v for k, v in STRONG.items() if k in l]
        if not labels:
            continue
        # require an anchor-accident flavour in the same line
        if not any(x in l for x in (u'\u951a\u70b9', u'\u4e8b\u6545', u'\u672c\u4f53\u4fa7',
                                    u'\u88ab\u541e', u'\u66ff\u6362', u'\u635f\u574f',
                                    u'\u6f0f\u5b57', u'\u884d\u5b57', u'\u8131\u843d')):
            continue
        cnt += 1
        out.append(u'[%s] D%03d L%d | %s' % (','.join(labels), n, i + 1, l[:700]))
io.open(u'E:/math/_work/bodyside_strong.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('strong_lines=%d' % cnt)
