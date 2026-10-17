r"""Change face of the `\hspace` length fix -- rebuild the touched papers and diff `main.typ`.

The two rows this measures:
  * `#h(0em)` -> `#h(0.27778em)`  (SPACE_VALUES, the `\;` price)
  * `\hspace{12mm}` -> `#h(12mm) `  (was `\,` = `thin`)

Both are produced on the maths channel, so the change face is the papers whose flat source
carries `\;`, `\enspace` or `\hspace{}` inside maths. The shipped `typst/<name>/main.typ` is the
run140 product (old code), so the diff against a rebuild IS the change face.

The rebuild calls `convert.convert_paper`, which normally shells out to `typst compile`; that call
is stubbed to a no-op so this probe never opens typst (the board allows one typst writer per round,
and the real regen is registered separately). Only `main.typ` is compared -- the compile is not.

  python _work/probe87e_hspace_changeface.py            # list the affected papers
  python _work/probe87e_hspace_changeface.py --run      # rebuild into a temp dir and diff
"""
import glob
import io
import os
import re
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe87_math_spans as B  # noqa: E402
from t2t import convert  # noqa: E402

RX = {"semi": r"\\;", "enspace": r"\\enspace(?![A-Za-z])", "hspace": r"\\hspace\s*\{[^{}]*\}"}


def affected():
    out = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        text = io.open(path, encoding="utf-8", errors="replace").read()
        maths = "".join(text[a:b] for a, b in B.spans(text))
        hit = {name: len(re.findall(rx, maths)) for name, rx in RX.items()}
        hit = {k: v for k, v in hit.items() if v}
        if hit:
            out.append((stem, hit))
    return out


def main():
    papers = affected()
    tot = {"semi": 0, "enspace": 0, "hspace": 0}
    for _stem, hit in papers:
        for k, v in hit.items():
            tot[k] += v
    print("affected papers = %d  (in-maths \\; %d, \\enspace %d, \\hspace{} %d)"
          % (len(papers), tot["semi"], tot["enspace"], tot["hspace"]))
    if "--run" not in sys.argv:
        for stem, hit in papers:
            print("  %-62s %s" % (stem, hit))
        return 0

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
    moved = lines_moved = 0
    for stem, hit in papers:
        shipped = os.path.join(ROOT, "typst", stem, "main.typ")
        if not os.path.exists(shipped):
            print("  MISSING product:", stem)
            continue
        old = io.open(shipped, encoding="utf-8").read()
        with tempfile.TemporaryDirectory() as tmp:
            try:
                convert.convert_paper(os.path.join(ROOT, "_work", "flat", stem + ".tex"),
                                      tmp, stem, keep_work=True)
            except Exception as exc:  # noqa: BLE001
                print("  FAIL", stem[:50], repr(exc)[:120])
                continue
            new = io.open(os.path.join(tmp, "main.typ"), encoding="utf-8").read()
        if new != old:
            d = sum(1 for x, y in zip(old.splitlines(), new.splitlines()) if x != y)
            d += abs(len(old.splitlines()) - len(new.splitlines()))
            moved += 1
            lines_moved += d
            print("  CHANGED %-58s %d lines  %s" % (stem, d, hit))
    print("changed papers = %d / %d, changed lines = %d" % (moved, len(papers), lines_moved))
    return 0


if __name__ == "__main__":
    sys.exit(main())
