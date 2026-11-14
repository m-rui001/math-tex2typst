"""Explain the long lines that remain after the rewrite."""
import collections
import glob
import json
import os

BS = chr(92)


def main():
    log = json.load(open('tools/style_audit/log/pass1.json', encoding='utf-8'))
    dirty = {r['path'] for r in log['files'] if r.get('scanner_limited')}
    print('scanner_limited files', len(dirty))
    for d in sorted(dirty):
        print('   ', d)
    c = collections.Counter()
    for f in glob.glob('typst/**/*.typ', recursive=True):
        rel = f.replace(BS, '/')
        t = open(f, encoding='utf-8').read()
        for line in t.split('\n'):
            if len(line) <= 120:
                continue
            s = line.strip()
            if rel in dirty:
                k = 'dirty-scan'
            elif s.startswith('#align(center)'):
                k = 'title'
            elif s.startswith('='):
                k = 'heading'
            elif s.startswith('#let'):
                k = 'preamble-let'
            elif s.startswith('$'):
                k = 'display-math'
            elif s.startswith('- ') or s.startswith('+ '):
                k = 'list-item'
            elif '$' in s:
                k = 'text+math'
            elif ' ' not in s:
                k = 'no-space-token'
            elif '#' in s:
                k = 'text+code'
            else:
                k = 'other-prose'
            c[k] += 1
    print(sum(c.values()), c.most_common())


if __name__ == '__main__':
    main()
