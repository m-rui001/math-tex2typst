# -*- coding: utf-8 -*-
r"""Change face of `convert.bake_math_hspace` -- the display-maths `\hspace` fix.

Builds each `\hspace`-bearing paper twice on the same code base -- once with the bake step stubbed
to identity (the old behaviour) and once live -- and diffs `main.typ`.  `typst compile` is stubbed
to a no-op, so this probe never opens typst.  It also greps both products for the `ZQHSP` sentinel,
which would mean a baked token leaked out of the maths channel instead of being restored.

  python _work/probe99_hspace_math_bake_face.py
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
from t2t import convert  # noqa: E402

FLAT = os.path.join(WORK, "flat")
HSPACE = re.compile(r"\\hspace")


def candidates():
    out = []
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        if HSPACE.search(io.open(path, encoding="utf-8", errors="replace").read()):
            out.append(os.path.basename(path)[:-4])
    return out


def build(stem, tmp):
    convert.convert_paper(os.path.join(FLAT, stem + ".tex"), tmp, stem, keep_work=True)
    return io.open(os.path.join(tmp, "main.typ"), encoding="utf-8").read()


def main():
    papers = candidates()
    print("papers carrying \\hspace = %d" % len(papers))
    real_bake = convert.bake_math_hspace
    real_run = convert.subprocess.run

    def fake_run(cmd, *a, **k):
        if isinstance(cmd, (list, tuple)) and cmd and str(cmd[0]).endswith("typst"):
            class R:
                returncode = 0
                stdout = ""
                stderr = ""
            return R()
        return real_run(cmd, *a, **k)

    convert.subprocess.run = fake_run
    changed = leak = fails = 0
    for stem in papers:
        try:
            convert.bake_math_hspace = lambda body: body
            with tempfile.TemporaryDirectory() as t1:
                old = build(stem, t1)
            convert.bake_math_hspace = real_bake
            with tempfile.TemporaryDirectory() as t2:
                new = build(stem, t2)
        except Exception as exc:  # noqa: BLE001
            fails += 1
            print("  FAIL %-52s %r" % (stem[:52], repr(exc)[:100]))
            continue
        finally:
            convert.bake_math_hspace = real_bake
        if "ZQHSP" in new or "ZQHSP" in old:
            leak += 1
            print("  LEAK %-52s ZQHSP in product" % stem[:52])
        if new == old:
            continue
        changed += 1
        d = list(difflib.unified_diff(old.splitlines(), new.splitlines(), lineterm="", n=0))
        added = [l for l in d if l.startswith("+") and not l.startswith("+++")]
        print("  CHANGED %-52s diff-lines=%d" % (stem[:52], len(added)))
        for l in added[:5]:
            print("        %s" % l[1:].strip()[:118])
    print("changed = %d / %d   ZQHSP leaks = %d   build failures = %d"
          % (changed, len(papers), leak, fails))
    return 0


if __name__ == "__main__":
    sys.exit(main())
