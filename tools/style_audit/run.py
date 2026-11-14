"""Apply the style passes to the corpus and record what changed, file by file.

Usage:
  python -X utf8 tools/style_audit/run.py --dry              # stats only
  python -X utf8 tools/style_audit/run.py                    # write files + log
  python -X utf8 tools/style_audit/run.py --only SUBSTR      # subset

Every pass only rewrites layout-level whitespace or symbol spelling:
  tidy   trailing spaces / blank runs / tabs / final newline
  hspace `#h(2em)` -> `wide` inside math (measured identical)
  rewrap long markup and math lines at existing spaces
"""
import argparse
import glob
import json
import os
import re
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import mathspace
import rewrap
import tidy
from typstscan import mode_map, MARKUP, MATH, CODE

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
LOG_DIR = os.path.join(ROOT, 'tools', 'style_audit', 'log')


def long_lines(text):
    return sum(1 for line in text.split('\n') if len(line) > 120 and not line.lstrip().startswith('//'))


def signature(text):
    """All non-whitespace characters; any pass must leave this invariant."""
    return ''.join(text.split())


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--dry', action='store_true')
    ap.add_argument('--only', default='')
    ap.add_argument('--limit', type=int, default=0)
    ap.add_argument('--log', default=None)
    ap.add_argument('--passes', default='all', choices=('all', 'tidy'),
                    help="'tidy' only re-normalises whitespace (used after other tools "\
                         "rewrote the files with CRLF line endings)")
    a = ap.parse_args()
    files = sorted(glob.glob(os.path.join(ROOT, 'typst', '**', '*.typ'), recursive=True))
    if a.only:
        files = [f for f in files if a.only in f]
    if a.limit:
        files = files[:a.limit]
    total = {'files': 0, 'changed': 0, 'trailing_ws': 0, 'tabs': 0, 'blank_removed': 0,
             'hspace': 0, 'breaks': 0, 'long_before': 0, 'long_after': 0,
             'lines_before': 0, 'lines_after': 0, 'rejected': 0}
    hk = {}
    rows = []
    for f in files:
        rel = os.path.relpath(f, ROOT).replace('\\', '/')
        orig = open(f, 'rb').read().decode('utf-8')
        st = {}
        rep = {}
        mode_map(orig, rep)
        dirty = len(rep['stack']) > 1 or rep['mode'] != MARKUP or rep['depth'] != 0
        if a.passes == 'tidy' or dirty:
            # the scanner cannot model this file; restrict it to whitespace work
            new = tidy.tidy(orig, st)
            ref = tidy.tidy(orig)
        else:
            text = tidy.tidy(orig, st)
            ref = mathspace.replace(text, {})
            text = mathspace.replace(text, st)
            breaks = {}
            new = rewrap.rewrap(text, stats=breaks)
            st.update(breaks)
            new = tidy.tidy(new)
        # content guard: the rewrite may only touch whitespace and the
        # #h(Nem) -> name substitution that mathspace already recorded
        if signature(ref) != signature(new):
            total['rejected'] += 1
            rows.append({'path': rel, 'changed': False, 'rejected': True})
            continue
        lb, la = long_lines(orig), long_lines(new)
        total['files'] += 1
        total['lines_before'] += orig.count('\n')
        total['lines_after'] += new.count('\n')
        for k in ('trailing_ws', 'tabs', 'blank_removed', 'hspace'):
            total[k] += st.get(k, 0)
        total['breaks'] += st.get('breaks', 0)
        total['long_before'] += lb
        total['long_after'] += la
        for k, v in st.get('hspace_kinds', {}).items():
            hk[k] = hk.get(k, 0) + v
        changed = new != orig
        if changed:
            total['changed'] += 1
            if not a.dry:
                with open(f, 'wb') as fh:
                    fh.write(new.encode('utf-8'))
        rows.append({'path': rel, 'changed': changed, 'long_before': lb, 'long_after': la,
                     'trailing_ws': st.get('trailing_ws', 0), 'blank_removed': st.get('blank_removed', 0),
                     'hspace': st.get('hspace', 0), 'breaks': st.get('breaks', 0),
                     'scanner_limited': dirty,
                     'lines_before': orig.count('\n'), 'lines_after': new.count('\n')})
    total['hspace_kinds'] = hk
    print(json.dumps(total, indent=2))
    if not a.dry:
        os.makedirs(LOG_DIR, exist_ok=True)
        name = a.log or time.strftime('run-%Y%m%d-%H%M%S.json')
        with open(os.path.join(LOG_DIR, name), 'w', encoding='utf-8') as fh:
            json.dump({'summary': total, 'files': rows}, fh, indent=0)
        print('log ->', os.path.join(LOG_DIR, name))


if __name__ == '__main__':
    main()
