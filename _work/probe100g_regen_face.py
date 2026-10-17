"""Regenerate the papers the `node distance` fix moves, through the batch's own `run`.

The face was measured through the emitter (`_work/probe100e_change_face.py`: every paper whose
regenerated `main.typ` differs from the committed run148 product), so this rebuilds exactly those and
no more -- a full batch costs the corpus's 325 s and rewrites 724 products nobody touched. Each old
product is copied aside under its FULL stem first (#99's lesson: a truncated copy key put two
`A-Torsion-Free-Group-Algebra-*` papers on one file and faked a compile failure) so the page side has
both generations to render.

  python _work/probe100g_regen_face.py        # -> _work/label100g_regen.txt
"""
import difflib
import io
import os
import re
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import batch_typst  # noqa: E402

WORKS = os.path.join(ROOT, "_work")
FACE = os.path.join(WORKS, "label100e_change_face.txt")
LABEL = os.path.join(WORKS, "label100g_regen.txt")


def stems():
    """The papers probe100e listed as changed -- its own receipt, not a re-derivation."""
    row = re.compile(r"\s*(\d+)\s+(\S+)\s*$")
    out = []
    for line in io.open(FACE, encoding="utf-8"):
        # the row format is `  %3d  %s`: a count, two spaces, the full stem
        m = row.match(line)
        if m:
            out.append(m.group(2))
    return out


def main():
    lines = []
    done = changed_total = 0
    for stem in stems():
        src = os.path.join(WORKS, "flat", stem + ".tex")
        assert os.path.isfile(src), src
        old = os.path.join(ROOT, "typst", stem, "main.typ")
        assert os.path.isfile(old), old
        shutil.copyfile(old, os.path.join(WORKS, "m100_before_%s.typ" % stem))
        before = io.open(old, encoding="utf-8", errors="replace").read()
        report = batch_typst.run((stem, src))
        after = io.open(os.path.join(ROOT, "typst", stem, "main.typ"),
                        encoding="utf-8", errors="replace").read()
        changed = [l for l in difflib.unified_diff(before.splitlines(), after.splitlines(),
                                                   lineterm="")
                   if l[:1] in "-+" and l[:3] not in ("---", "+++")]
        changed_total += len(changed)
        done += 1 if report.get("compile_ok") else 0
        lines.append("%-52s ok=%s compile_ok=%s changed=%d"
                     % (stem, report.get("ok"), report.get("compile_ok"), len(changed)))
    lines.append("DONE %d compiled=%d  changed lines in products=%d"
                 % (len(stems()), done, changed_total))
    text = "\n".join(lines) + "\n"
    io.open(LABEL, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
