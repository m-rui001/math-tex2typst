"""Collect every line that made typst fail, then measure a candidate repair."""
import json
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
WORK = ROOT / '_work'


def failing_lines():
    """(paper, line_number, source_line, error_kind) for every compile error."""
    items = []
    for rp in sorted((ROOT / 'typst').glob('*/report.json')):
        r = json.loads(rp.read_text(encoding='utf-8'))
        if r.get('compile_ok'):
            continue
        err = r.get('compile_err_full') or ''
        src = (rp.parent / 'main.typ').read_text(encoding='utf-8').split('\n')
        for m in re.finditer(r'^error: (.*)$', err, re.M):
            kind = m.group(1).split(':')[0][:60]
            rest = err[m.end():m.end() + 800]
            loc = re.search(r'main\.typ:(\d+):(\d+)', rest)
            if not loc:
                continue
            i = int(loc.group(1)) - 1
            if i < len(src):
                items.append((rp.parent.name, i + 1, src[i], kind))
    return items


def compile_lines(lines, tag):
    path = WORK / ('repro_%s.typ' % tag)
    body = ['#import "@preview/cetz:0.5.0"', '#let unconverted(x) = x']
    for i, line in enumerate(lines, 1):
        body.append('// %d' % i)
        body.append(line)
    path.write_text('\n'.join(body) + '\n', encoding='utf-8')
    proc = subprocess.run(['typst', 'compile', str(path), str(path)[:-4] + '.pdf'],
                          capture_output=True, text=True, encoding='utf-8',
                          errors='replace', timeout=600)
    err = proc.stderr or ''
    bad = set()
    kinds = {}
    for m in re.finditer(r'^error: (.*)$', err, re.M):
        kind = m.group(1).split(':')[0][:60]
        rest = err[m.end():m.end() + 800]
        loc = re.search(r'repro_%s\.typ:(\d+):' % tag, rest)
        if not loc:
            continue
        ln = int(loc.group(1))
        idx = (ln - 3) // 2
        bad.add(idx)
        kinds[idx] = kind
    return bad, kinds


def repair(line):
    sys.path.insert(0, str(ROOT / 'tools'))
    from t2t.mathconv import _fix_typst_math
    from t2t.emit import unescape_math
    return unescape_math(_fix_typst_math(line))


def main():
    items = failing_lines()
    lines = [it[2] for it in items]
    print('collected %d failing lines (%d unique)' % (len(lines), len(set(lines))))
    base_bad, base_kinds = compile_lines(lines, 'base')
    print('baseline still failing: %d' % len(base_bad))
    fixed = [repair(l) for l in lines]
    new_bad, new_kinds = compile_lines(fixed, 'fixed')
    print('after repair failing: %d' % len(new_bad))
    healed = sorted(base_bad - new_bad)
    print('healed: %d' % len(healed))
    for idx in sorted(new_bad)[:40]:
        print('---', items[idx][0], items[idx][1], new_kinds.get(idx, '?'), '(was %s)' % base_kinds.get(idx, 'ok'))
        print('   OLD', lines[idx][:220])
        if fixed[idx] != lines[idx]:
            print('   NEW', fixed[idx][:220])


if __name__ == '__main__':
    main()
