"""What are the 2830 `[??]` marks, and is each one faithful?

`emit.ref_text` prints `[??]` in three situations, and only the first records a `dangling_ref`:
an unresolved name (line 151), a label that resolved to an equation with no number (line 168), and
a bare reference with nothing to show (line 172).  The ledger's `dangling_ref: 4` counts only the
first, so the other two are invisible while still printing `??` on the page.

For the papers with the most marks this prints each reference the source actually wrote, the
environment its target's `\label` sits in, and what our book holds for it -- which is what
distinguishes "the author's own unnumbered `\[ \]`" from "we lost the equation number".
"""
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PAPERS = ['Tangent-flow-uniqueness-2026-09-24',
          'Giglis-distributional-curvature-characteriza',
          'The-canonical-massive-continuum-limit-of-the']
REF = re.compile(r'\\(?:eq)?ref\{([^{}]*)\}')
ENV_OF = {}


def label_environments(src):
    """Map each \label name to the environment it was written in, from the source."""
    out = {}
    for m in re.finditer(r'\\label\{([^{}]*)\}', src):
        before = src[max(0, m.start() - 400):m.start()]
        envs = re.findall(r'\\begin\{([a-zA-Z*]+)\}', before)
        # the innermost open environment is the one that owns the label
        depth, owner = {}, None
        for tok in re.findall(r'\\(?:begin|end)\{([a-zA-Z*]+)\}', src[:m.start()]):
            if re.search(r'\\begin\{' + re.escape(tok) + r'\}', 'x'):
                pass
        out[m.group(1)] = envs[-1] if envs else 'unknown'
    return out


def numbered(src, name):
    """The source text around the label, so the reader can see the environment themselves."""
    m = re.search(r'\\label\{' + re.escape(name) + r'\}', src)
    if not m:
        return 'NO SUCH LABEL IN SOURCE'
    return re.sub(r'\s+', ' ', src[max(0, m.start() - 90):m.start()])[-88:]


for prefix in PAPERS:
    flat = next((os.path.join(ROOT, '_work', 'flat', p) for p in os.listdir(os.path.join(ROOT, '_work', 'flat'))
                 if p.startswith(prefix)), None)
    typdir = next((p for p in os.listdir(os.path.join(ROOT, 'typst')) if p.startswith(prefix)), None)
    src = open(flat, encoding='utf-8', errors='replace').read()
    out = open(os.path.join(ROOT, 'typst', typdir, 'main.typ'), encoding='utf-8', errors='replace').read()
    marks = out.count('[??]')
    names = {n.strip() for n in REF.findall(src)}
    print('== %s  [??]=%d  refs in source=%d' % (prefix[:46], marks, len(names)))
    owners = label_environments(src)
    for name in sorted(names)[:6]:
        print('   %-28s env=%-12s ...%s' % (name, owners.get(name, '?'), numbered(src, name)[-70:]))
