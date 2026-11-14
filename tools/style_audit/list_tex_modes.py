"""Mode-aware scan for real LaTeX leftovers (outside raw/string bodies)."""
import glob
import re
import sys

from typstscan import mode_map, NAMES, MARKUP, MATH, CODE

WORD = re.compile(r'[A-Za-z]+')


def main():
    hits = 0
    per = {}
    for f in sorted(glob.glob('typst/**/*.typ', recursive=True)):
        t = open(f, encoding='utf-8', errors='replace').read()
        m = mode_map(t)
        for i, c in enumerate(t):
            if c != '\\' or i + 1 >= len(t):
                continue
            w = WORD.match(t, i + 1)
            if not w or len(w.group(0)) < 2:
                continue
            md = m[i]
            if md in (MARKUP, MATH, CODE):
                hits += 1
                per.setdefault(f, []).append((t.count('\n', 0, i) + 1, NAMES[md], w.group(0)))
    print('real latex commands in markup/math/code:', hits, 'files', len(per))
    for f, v in per.items():
        print(f.replace('\\', '/'))
        for line, md, tok in v[:12]:
            print('   ', line, md, tok)


if __name__ == '__main__':
    main()
