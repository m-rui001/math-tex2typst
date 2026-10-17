# -*- coding: utf-8 -*-
import io, glob, re

targets = {
    'D139': [23, 113, 170, 276, 331, 362, 468, 472, 489, 491],
    'D140': [146, 821, 889, 895, 974, 1115, 1116, 1117, 1118, 1213, 1228],
}
out = []
for pat, nums in targets.items():
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + pat + '-*.md')[0]
    lines = io.open(p, encoding='utf-8').read().split('\n')
    out.append('=== %s ===' % pat)
    for n in nums:
        l = lines[n - 1]
        out.append('L%d(len=%d): %s' % (n, len(l), l[:520]))
io.open('.tools/win2.txt', 'w', encoding='utf-8').write('\n\n'.join(out))
print('ok')
