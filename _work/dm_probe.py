# -*- coding: utf-8 -*-
"""Read-only probe: dump the 'Can't use function $ in math mode' family from the
latest katex_sites jsonl, with per-occurrence character-level context."""
import io, json, sys, collections
sys.stdout.reconfigure(encoding='utf-8')
D = chr(36)
KEY = "in math mode"


def main(path, only_exact=True):
    rows = [json.loads(l) for l in io.open(path, encoding='utf-8') if l.strip()]
    fam = []
    for r in rows:
        ec = r.get('errClass') or ''
        if ("'" + D + "' " + KEY) in ec and "Can" in ec:
            fam.append(r)
    print('total rows in file:', len(rows))
    print('family rows (all variants):', len(fam))
    print(collections.Counter(len(r['errClass']) for r in fam))
    out = io.open('E:/math/_work/dm_dump.txt', 'w', encoding='utf-8')
    for i, r in enumerate(fam):
        out.write('=== %d | %s | line %d | %s | errlen %d\n'
                  % (i, r['file'], r['line'], r['kind'], len(r['errClass'])))
        out.write('BODY: ' + repr(r['body']) + '\n')
        out.write('LINE: ' + r['lineText'] + '\n\n')
    out.close()
    print('files:', len(set(r['file'] for r in fam)))
    print('dump bytes:', len(io.open('E:/math/_work/dm_dump.txt', encoding='utf-8').read().encode('utf-8')))


if __name__ == '__main__':
    main(sys.argv[1])
