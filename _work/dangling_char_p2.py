# -*- coding: utf-8 -*-
# Read-only: show the actual text of dangling section-ref lines (主线2 subset).
import io, re, glob

TARGETS = ['D46', 'D79', 'D89', 'D90', 'D91', 'D298', 'D400', 'D418', 'D478']
OUT = []

def show(k, nums):
    hits = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % k)
    if not hits:
        OUT.append('%s NOFILE' % k); return
    lines = io.open(hits[0], encoding='utf-8').read().split('\n')
    heads = [l for l in lines if l.startswith('## ')]
    OUT.append('==== %s  heads=%d  last=%s' % (k, len(heads), heads[-1][:30] if heads else '-'))
    for i, l in enumerate(lines):
        if l.startswith('## '):
            continue
        for n in nums:
            if re.search(u'\u00a7\\s*%d(?!\\d)' % n, l):
                OUT.append('  L%d: %s' % (i + 1, l.strip()[:180]))
                break

show('D46', [16, 60])
show('D79', [121])
show('D89', [6])
show('D90', [6, 7, 8])
show('D91', [7, 9])
show('D298', [19])
show('D400', [41])
show('D418', [313])
show('D478', [13])

io.open('_work/dangling_char_p2.txt', 'w', encoding='utf-8', newline='\n').write('\n'.join(OUT) + '\n')
print('\n'.join(OUT))
