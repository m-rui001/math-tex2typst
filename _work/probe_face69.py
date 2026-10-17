# -*- coding: utf-8 -*-
r"""#69 的面：产物里「带描边/填充、正文是数学、且没写 height:」的 #box 节点有几行。

直读 typst/*/main.typ（名单必须由产物扫描驱动，静态 build 看不见 \linewidth 定轴的图）。
按行归属：一行 content(...) 里同时看 `#box(` 有没有 `height:`、正文里有没有 `$`。
"""
import glob
import io
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BOX = re.compile(r'#box\(')
DOLLAR = re.compile(r'\$[^$]*\$')


def main():
    hits = []
    papers = set()
    for path in sorted(glob.glob(os.path.join(ROOT, 'typst', '*', 'main.typ'))):
        name = os.path.basename(os.path.dirname(path))
        for ln, line in enumerate(io.open(path, encoding='utf-8').read().split('\n'), 1):
            if '#box(' not in line or '$' not in line:
                continue
            if 'height:' in line:
                continue
            if not DOLLAR.search(line):
                continue
            stroked = ('stroke: (thickness' in line) or ('fill: rgb' in line)
            hits.append((name, ln, stroked, line.strip()[:150]))
            papers.add(name)
    print('lines=%d papers=%d canvases=%d'
          % (len(hits), len(papers), len(set((h[0]) for h in hits))))
    print('stroked (draw/fill) lines=%d papers=%d'
          % (sum(1 for h in hits if h[2]), len({h[0] for h in hits if h[2]})))
    out = io.open(os.path.join(ROOT, '_work', 'face69.txt'), 'w', encoding='utf-8')
    for h in hits:
        out.write('%s:%d %s\n   %s\n' % (h[0], h[1], 'STROKED' if h[2] else 'plain', h[3]))
    out.close()
    for h in hits[:6]:
        print('%s:%d %s' % (h[0], h[1], h[3][:120]))


if __name__ == '__main__':
    main()
