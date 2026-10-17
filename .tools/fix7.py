# -*- coding: utf-8 -*-
import io, glob

ERSHI = u'\u800c\u662f'

jobs = {
    'D83': [(u'\u5370\u8bc1\u8fd9\u4e00\u6b65\u4e0d\u662f\u4fee\u8f9e\u800c\u662f\u5de5\u5e8f',
            u'\u5370\u8bc1\u8fd9\u4e00\u6b65\u5df2\u8d85\u51fa\u4fee\u8f9e\uff0c\u662f\u771f\u6b63\u7684\u5de5\u5e8f')],
    'D82': [(u'\u82e5 a(x,y) \u7684\u4f53\u79ef\u4fee\u6b63\u4e0d\u53d6\u5e73\u65b9\u6839\u578b\u800c\u662f\u522b\u7684\u6b63\u51fd\u6570',
            u'\u82e5 a(x,y) \u7684\u4f53\u79ef\u4fee\u6b63\u6362\u6389\u5e73\u65b9\u6839\u578b\uff0c\u53d6\u522b\u7684\u6b63\u51fd\u6570'),
           (u'\u5176\u4e00, \u82e5 \u03bb \u4e0d\u662f\u5355\u76f4\u7ebf\u5e73\u5747\u800c\u662f\u4e00\u822c\u6b63\u77e9\u9635\u6d4b\u5ea6',
            u'\u5176\u4e00, \u82e5 \u03bb \u8131\u5f00\u5355\u76f4\u7ebf\u5e73\u5747\uff0c\u653e\u5bbd\u4e3a\u4e00\u822c\u6b63\u77e9\u9635\u6d4b\u5ea6'),
           (u'\u771f\u6b63\u9ebb\u70e6\u7684\u53cd\u800c\u662f E \u7a7a\u96c6',
            u'\u771f\u6b63\u9ebb\u70e6\u7684\u6070\u662f E \u7a7a\u96c6'),
           (u'\u8ddd\u79bb\u6700\u5927\u7684\u6070\u597d\u4e0d\u662f\u65ad\u8a00\u70b9\u800c\u662f\u6982\u5ff5\u5c42',
            u'\u8ddd\u79bb\u6700\u5927\u7684\u6070\u597d\u843d\u5728\u6982\u5ff5\u5c42\uff0c\u79bb\u65ad\u8a00\u70b9\u66f4\u8fdc')],
}

for pid, pairs in jobs.items():
    p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % pid)[0]
    t = io.open(p, encoding='utf-8').read()
    for a, b in pairs:
        n = t.count(a)
        print(pid, 'hits', n, a[:14])
        t = t.replace(a, b)
    io.open(p, 'w', encoding='utf-8', newline='').write(t)
    lines = t.split('\n')
    print(pid, 'ershi_left', t.count(ERSHI), 'size', len(t.encode('utf-8')),
          'spec_hdr', sum(1 for l in lines if l.startswith(u'| \u7b26\u53f7 |')))
    for i, l in enumerate(lines, 1):
        k = l.find(ERSHI)
        if k >= 0:
            print('  LEFT@%d|%s' % (i, l[max(0, k - 60):k + 30]))
    for i, l in enumerate(lines, 1):
        if l.startswith(u'| \u8bb0\u53f7 |'):
            print('  alt_hdr@%d|%s' % (i, l[:90]))
