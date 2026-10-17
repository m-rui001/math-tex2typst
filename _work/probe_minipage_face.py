# -*- coding: utf-8 -*-
r"""Change-face census for the side-by-side minipage fix (emit.minipage_grid).

Board rule: the face of a change is measured by stubbing the new code path back to the old
behaviour and diffing the emitted Typst on the same basis -- not by a keyword scan.  Here the
stub is `emit._side_by_side -> lambda run: False` (i.e. never grid a minipage run).

Candidates = every paper whose flat source holds >= 2 minipages.  For each, convert twice
(real vs stubbed, typst compile skipped) and compare `main.typ`.
"""
import io, os, re, sys, shutil, tempfile

sys.path.insert(0, r'E:/math/tools')
from t2t import convert as C

E = sys.modules['t2t.emit']  # the module convert actually calls

FLAT = r'E:/math/_work/flat'
TOKEN = re.compile(r'\\(?:begin|end)\{minipage\}')

# skip the typst compile (keep pandoc)
_real_run = C.subprocess.run


class _R:
    returncode = 0
    stdout = ''
    stderr = ''


def _run(cmd, *a, **k):
    if isinstance(cmd, (list, tuple)) and cmd and cmd[0] == 'typst':
        return _R()
    return _real_run(cmd, *a, **k)


C.subprocess.run = _run

_real_side = E._side_by_side


def convert_once(flat, paper, stub):
    E._side_by_side = (lambda run: False) if stub else _real_side
    out = os.path.join(tempfile.gettempdir(), 'mpface', paper)
    shutil.rmtree(out, ignore_errors=True)
    os.makedirs(out, exist_ok=True)
    C.convert_paper(flat, out, paper)
    with io.open(os.path.join(out, 'main.typ'), encoding='utf-8') as fh:
        return fh.read()


def main():
    sys.stdout.reconfigure(errors='replace')
    cands = []
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith('.tex'):
            continue
        src = io.open(os.path.join(FLAT, name), encoding='utf-8', errors='replace').read()
        if len(TOKEN.findall(src)) >= 4:
            cands.append(name[:-4])
    print('candidates (>=2 minipages): %d' % len(cands))
    face = []
    for paper in cands:
        flat = os.path.join(FLAT, paper + '.tex')
        try:
            new = convert_once(flat, paper, stub=False)
            old = convert_once(flat, paper, stub=True)
        except Exception as ex:
            print('  ERR', paper[:60], repr(ex)[:120])
            continue
        if new != old:
            n_new = new.count('#grid(')
            n_old = old.count('#grid(')
            face.append((paper, n_old, n_new))
    print('FACE (papers whose main.typ changed): %d' % len(face))
    with io.open(r'E:/math/_work/mp_face_names.txt', 'w', encoding='utf-8') as fh:
        for paper, o, n in face:
            fh.write(paper + '\n')
    for paper, o, n in face:
        print('  %-66s grid %d -> %d' % (paper[:66], o, n))


if __name__ == '__main__':
    main()
