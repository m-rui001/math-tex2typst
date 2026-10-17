# -*- coding: utf-8 -*-
r"""Change face of dropping `hspace\s*\{[^}]*\}` from `prep.PROSE_DIALECT`.

B's 10-14 22:36 item 7-2.  `PROSE_DIALECT[0]` ends on `\b`; for the `hspace{...}` branch that
boundary lands on the closing `}`, so the branch only fires when the NEXT char is a word char --
it eats the sites where the gap is followed by text (measured: 11 in maths, 1 in prose, 9 papers)
and keeps the rest.  Dropping the branch lets those maths sites reach `mathconv.clean()`, which
bakes the length into the ZQHSP token and restores it as `#h(<len>)`.

`typst compile` inside `convert_paper` is stubbed to a no-op, so this probe never opens typst; it
diffs `main.typ` only (the board allows one typst writer per round).  The two builds (branch
present / dropped) run on the SAME code base, so the diff is this patch's face and not a stale
product or somebody else's in-flight `cetz.py`.  `difflib` prints the exact lines so the maths
sites can be read as `#h(...)` and the one prose site can be judged by eye.

  python _work/probe98_hspace_prose_fix_face.py [--all]
"""
import difflib
import glob
import io
import os
import re
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import convert, prep  # noqa: E402

HSPACE = re.compile(r"\\hspace\s*\{[^}]*\}")
FLAT = os.path.join(WORK, "flat")


def eaten_papers():
    out = []
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)[:-4]
        text = io.open(path, encoding="utf-8", errors="replace").read()
        eaten = [m for m in prep.PROSE_DIALECT[0][0].finditer(text)
                 if m.group(0).startswith("\\hspace")]
        if eaten:
            out.append((stem, len(eaten)))
    return out


def patch():
    rx, rep = prep.PROSE_DIALECT[0]
    patched = rx.pattern.replace("hspace\\s*\\{[^}]*\\}|", "")
    assert patched != rx.pattern, "hspace branch not found in PROSE_DIALECT[0]"
    prep.PROSE_DIALECT = [(re.compile(patched), rep)] + list(prep.PROSE_DIALECT[1:])


def build(stem, tmp):
    convert.convert_paper(os.path.join(FLAT, stem + ".tex"), tmp, stem, keep_work=True)
    return io.open(os.path.join(tmp, "main.typ"), encoding="utf-8").read()


def main():
    papers = eaten_papers()
    print("papers with an eaten \\hspace = %d  (sites = %d)"
          % (len(papers), sum(n for _s, n in papers)))
    base = list(prep.PROSE_DIALECT)
    real = convert.subprocess.run

    def fake(cmd, *a, **k):
        if isinstance(cmd, (list, tuple)) and cmd and str(cmd[0]).endswith("typst"):
            class R:
                returncode = 0
                stdout = ""
                stderr = ""
            return R()
        return real(cmd, *a, **k)

    convert.subprocess.run = fake
    moved = 0
    show = "--all" in sys.argv
    for stem, n in papers:
        try:
            prep.PROSE_DIALECT = base
            with tempfile.TemporaryDirectory() as t1:
                old = build(stem, t1)
            patch()
            with tempfile.TemporaryDirectory() as t2:
                new = build(stem, t2)
        except Exception as exc:  # noqa: BLE001
            print("  FAIL %-52s %r" % (stem[:52], repr(exc)[:110]))
            continue
        finally:
            prep.PROSE_DIALECT = base
        if new == old:
            print("  same    %-52s eaten=%d" % (stem[:52], n))
            continue
        moved += 1
        d = list(difflib.unified_diff(old.splitlines(), new.splitlines(),
                                      lineterm="", n=0))
        added = [l for l in d if l.startswith("+") and not l.startswith("+++")]
        print("  CHANGED %-52s eaten=%d  diff-lines=%d" % (stem[:52], n, len(added)))
        if show:
            for l in added[:8]:
                print("        %s" % l[1:].strip()[:124])
    print("changed = %d / %d" % (moved, len(papers)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
