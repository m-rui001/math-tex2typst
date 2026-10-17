# -*- coding: utf-8 -*-
# Step B filter: for notes D001-D399, locate the restoration "tells" and dump
# a context window (whole 本体侧 neighbourhood) for manual adjudication.
import io, os, re, glob

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
PHR = u'\u672c\u4f53\u4fa7'
TELLS = {
    u'\u5b8c\u6574\u91cd\u8ff0': u'full_restate',            # 完整重述
    u'\u539f\u53e5\u5728\u6b64': u'orig_sentence_here',      # 原句在此
    u'\u6b63\u786e\u5199\u6cd5\u662f': u'correct_form_is',   # 正确写法是
    u'\u5e94\u8bfb\u4f5c': u'should_read_as',                # 应读作
    u'\u5e94\u6539\u56de': u'should_revert_to',              # 应改回
    u'\u539f\u6587': u'orig_text',                           # 原文
    u'\u539f\u53e5\u4e3a': u'orig_sentence_is',              # 原句为
    u'\u6062\u590d': u'restore',                             # 恢复
    u'\u91cd\u8ff0': u'restate',                             # 重述
    u'\u4e8b\u6545': u'accident',                            # 事故
    u'\u951a\u70b9': u'anchor',                               # 锚点
    u'\u635f\u574f': u'damaged',                             # 损坏
    u'\u635f\u6bc1': u'destroyed',                            # 损毁
    u'\u7838\u574f': u'wrecked',                              # 砸坏
}

def idnum(name):
    m = re.match(u'^D([0-9]+)', name)
    return int(m.group(1)) if m else None

out = []
nhits = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    n = idnum(os.path.basename(p))
    if n is None or n < 1 or n > 399:
        continue
    txt = io.open(p, 'rb').read().decode('utf-8')
    lines = txt.split(u'\n')
    phr_lines = [i for i, l in enumerate(lines) if PHR in l]
    if not phr_lines:
        continue
    # which tells appear on/near the 本体侧 lines
    near = set()
    blocks = []
    lo = max(0, phr_lines[0] - 6)
    hi = min(len(lines), phr_lines[-1] + 12)
    seg = lines[lo:hi]
    for t, lab in TELLS.items():
        if any(t in l for l in seg):
            near.add(lab)
    if not (u'accident' in near or u'anchor' in near):
        continue
    nhits += 1
    out.append(u'###### NOTE D%03d file=%s phr_lines=%s tells=%s' % (
        n, os.path.basename(p), ','.join(str(i + 1) for i in phr_lines),
        ','.join(sorted(near))))
    for i in range(lo, hi):
        mark = u'>' if PHR in lines[i] else u' '
        out.append(u'%s%5d| %s' % (mark, i + 1, lines[i]))
    out.append(u'')
io.open(u'E:/math/_work/bodyside_cand.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('notes_with_accident_context=%d' % nhits)
