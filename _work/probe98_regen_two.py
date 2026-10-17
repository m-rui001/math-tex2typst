r"""Regenerate the two papers #98's loop package changes, through the batch's own `run`.

The churn was measured statically (`_work/probe98_loop_stub_diff.py`: 932 pictures, 2 canvases changed
over 2 papers, 0 new refusals), so this rebuilds exactly those two and no more -- a full batch costs
the corpus's 325s and rewrites 724 products nobody touched.  The old products are copied aside first so
the page-side comparison has both generations to render.

  python _work/probe98_regen_two.py
"""
import io
import os
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import batch_typst  # noqa: E402

WORKS = os.path.join(ROOT, "_work")
STEMS = (
    "Finite-algebraic-envelopes-and-the-Boone-Higman-conjecture-September-23-2026",
    "Arithmetic-classification-and-non-Pisot-singularity-for-Bernoulli-convolutions-October-3-2026",
)


def main():
    items = []
    for stem in STEMS:
        src = os.path.join(WORKS, "flat", stem + ".tex")
        assert os.path.isfile(src), src
        old = os.path.join(ROOT, "typst", stem, "main.typ")
        keep = os.path.join(WORKS, "m98_before_%s.typ" % stem[:24])
        if os.path.isfile(old):
            shutil.copyfile(old, keep)
            before = io.open(old, encoding="utf-8", errors="replace").read()
        else:
            before = ""
        items.append((stem, src))
    for name, source in items:
        report = batch_typst.run((name, source))
        print("%s ok=%s compile_ok=%s" % (name[:44], report.get("ok"), report.get("compile_ok")))
        after = io.open(os.path.join(ROOT, "typst", name, "main.typ"),
                        encoding="utf-8", errors="replace").read()
        print("  product bytes %d -> %d, lines changed %d"
              % (len(before), len(after),
                 sum(1 for a, b in zip(before.splitlines(), after.splitlines()) if a != b)
                 + abs(len(before.splitlines()) - len(after.splitlines()))))
        for a, b in zip(before.splitlines(), after.splitlines()):
            if a != b:
                print("   - %s\n   + %s" % (a.strip()[:150], b.strip()[:150]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
