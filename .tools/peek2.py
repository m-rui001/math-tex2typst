# -*- coding: utf-8 -*-
import io, glob, sys

for pid in sys.argv[1:]:
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % pid)[0]
    lines = io.open(p, encoding='utf-8').read().split('\n')
    print('==', pid)
    if pid == 'D19':
        print(repr(lines[56]))
    if pid == 'D87':
        print('L135:', repr(lines[134][-260:]))
        for k in (262, 263, 264):
            print('ctx263:', repr(lines[k][:160]))
        for i in range(380, 392):
            print('near384:', i + 1, repr(lines[i][:160]))
