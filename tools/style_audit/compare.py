"""Compare two verify.py snapshots: page counts and text fingerprints."""
import json
import sys


def load(p):
    return json.loads(open(p, encoding='utf-8').read())


def main():
    a = load(sys.argv[1])
    b = load(sys.argv[2])
    only = sys.argv[3:] or sorted(b)
    bad_compile = []
    page_diff = []
    text_diff = []
    for k in only:
        ra, rb = a.get(k), b.get(k)
        if rb is None:
            print('MISSING', k)
            continue
        if not rb.get('ok'):
            bad_compile.append((k, rb.get('err', '')[:300]))
            continue
        if ra is None:
            continue
        if ra.get('pages') != rb.get('pages'):
            page_diff.append((k, ra.get('pages'), rb.get('pages')))
        if ra.get('sha') != rb.get('sha'):
            text_diff.append((k, ra.get('chars'), rb.get('chars')))
    print('compared', len(only), 'compile_errors', len(bad_compile),
          'page_diffs', len(page_diff), 'text_diffs', len(text_diff))
    for k, e in bad_compile:
        print('ERR', k, e.replace('\n', ' '))
    for k, p1, p2 in page_diff:
        print('PAGES', k, p1, '->', p2)
    for k, c1, c2 in text_diff:
        print('TEXT', k, c1, '->', c2)


if __name__ == '__main__':
    main()
