"""Show samples of long lines that survived, per category."""
import glob
import json
import sys

BS = chr(92)


def cat_of(rel, s, dirty):
    if rel in dirty:
        return 'dirty-scan'
    if s.startswith('#align(center)'):
        return 'title'
    if s.startswith('='):
        return 'heading'
    if s.startswith('#let'):
        return 'preamble-let'
    if s.startswith('$'):
        return 'display-math'
    if s.startswith('- ') or s.startswith('+ '):
        return 'list-item'
    if '$' in s:
        return 'text+math'
    if ' ' not in s:
        return 'no-space-token'
    if '#' in s:
        return 'text+code'
    return 'other-prose'


def main():
    want = sys.argv[1] if len(sys.argv) > 1 else 'other-prose'
    log = json.load(open('tools/style_audit/log/pass1.json', encoding='utf-8'))
    dirty = {r['path'] for r in log['files'] if r.get('scanner_limited')}
    n = 0
    for f in glob.glob('typst/**/*.typ', recursive=True):
        rel = f.replace(BS, '/')
        t = open(f, encoding='utf-8').read()
        for i, line in enumerate(t.split('\n'), 1):
            if len(line) <= 120:
                continue
            s = line.strip()
            if cat_of(rel, s, dirty) != want:
                continue
            n += 1
            if n <= 6:
                print(i, len(line), repr(line[:160]))
    print('total', n)


if __name__ == '__main__':
    main()
