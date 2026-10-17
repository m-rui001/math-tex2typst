r"""Regenerate the twelve papers the `even odd rule` fix changes, through the batch's own `run`.

The face was measured through the emitter (`_work/probe99h_emitter_face.py`: 17 statements over 12
papers ship 17 `compound-path(` lines), so this rebuilds exactly those twelve and no more -- a full
batch costs the corpus's 325 s and rewrites 724 products nobody touched.  Each old product is copied
aside first so the page-side comparison has both generations to render.

  python _work/probe99i_regen_twelve.py        # -> _work/label99i_regen.txt
"""
import difflib
import io
import os
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import batch_typst  # noqa: E402

WORKS = os.path.join(ROOT, "_work")
LABEL = os.path.join(WORKS, "label99i_regen.txt")


def stems():
    """The papers probe99h converted -- the change face, read off its own receipt."""
    out = []
    for line in io.open(os.path.join(WORKS, "label99h_emitter_face.txt"), encoding="utf-8"):
        line = line.strip()
        if " statements=" in line and not line.startswith("TOTAL"):
            out.append(line.split("  statements=")[0])
    return out


def main():
    lines = []
    done = shipped_before = shipped_after = 0
    for stem in stems():
        src = os.path.join(WORKS, "flat", stem + ".tex")
        assert os.path.isfile(src), src
        old = os.path.join(ROOT, "typst", stem, "main.typ")
        assert os.path.isfile(old), old
        keep = os.path.join(WORKS, "m99_before_%s.typ" % stem[:24])
        shutil.copyfile(old, keep)
        before = io.open(old, encoding="utf-8", errors="replace").read()
        report = batch_typst.run((stem, src))
        after = io.open(os.path.join(ROOT, "typst", stem, "main.typ"),
                        encoding="utf-8", errors="replace").read()
        changed =  [l for l in difflib.unified_diff(before.splitlines(), after.splitlines(), lineterm="")
              if l[:1] in "-+" and l[:3] not in ("---", "+++")]
        cb = before.count("compound-path(")
        ca = after.count("compound-path(")
        shipped_before += cb
        shipped_after += ca
        done += 1 if report.get("compile_ok") else 0
        lines.append("%-44s ok=%s compile_ok=%s lines=%d->%d changed=%d compound=%d->%d"
                     % (stem[:44], report.get("ok"), report.get("compile_ok"),
                        len(before.splitlines()), len(after.splitlines()), len(changed), cb, ca))
        for l in changed:
            lines.append("   " + l[:170])
    lines.append("DONE %d compiled=%d  compound-path lines in products %d -> %d"
                 % (len(stems()), done, shipped_before, shipped_after))
    text = "\n".join(lines) + "\n"
    io.open(LABEL, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
