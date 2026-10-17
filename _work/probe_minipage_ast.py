# -*- coding: utf-8 -*-
r"""Dump the Figure/Div structure for the papers whose minipage pairs did not grid."""
import io, json, os, subprocess, sys

ROOT = r'E:/math'
FLAT = os.path.join(ROOT, '_work', 'flat')
sys.stdout.reconfigure(errors='replace')

PAPERS = [
    'Exact-quantum-factoring-over-a-fixed-finite-gate-set-September-25-2026',
    'The-equivariant-cohomological-Hikita-conjecture-for-arbitrary-quivers-September-24-2026',
    'Topological-triviality-of-mu-constant-families-of-surface-singularities-September-24-2026',
    'An-integral-scalar-curvature-bound-for-real-simplicial-volume-October-5-2026',
]


def desc(node):
    t = node.get('t')
    if t == 'Div':
        return 'Div%r' % (node['c'][0][1],)
    if t in ('Para', 'Plain'):
        txt = ''.join(x.get('c', '') for x in node['c'] if x.get('t') == 'Str')[:30]
        return '%s(%s)' % (t, txt)
    if t == 'RawBlock':
        return 'RawBlock(%s)' % node['c'][-1][:25].replace('\n', ' ')
    return t


def walk(nodes, out, depth=0):
    for n in nodes:
        t = n.get('t')
        if t == 'Figure':
            body = n['c'][2]
            out.append('  %sFigure body: %s' % ('  ' * depth, [desc(b) for b in body]))
            walk(body, out, depth + 1)
        elif t == 'Div':
            cls = n['c'][0][1]
            if any('minipage' in c for c in cls):
                out.append('  %sDiv%r body: %s' % ('  ' * depth, cls, [desc(b) for b in n['c'][1]]))
            walk(n['c'][1], out, depth + 1)


for paper in PAPERS:
    flat = os.path.join(FLAT, paper + '.tex')
    p = subprocess.run(['pandoc', flat, '-f', 'latex', '-t', 'json', '--wrap=none'],
                       capture_output=True, text=True, encoding='utf-8', errors='replace')
    ast = json.loads(p.stdout or '{}')
    out = []
    walk(ast.get('blocks', []), out)
    print('=== %s' % paper[:58])
    for line in out:
        print(line)
