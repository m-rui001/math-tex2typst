"""The one picture that vanished from `Deforming-hypersymplectic…`: refused, or dropped silently?

Before the arrow change that paper's `main.typ` held one `#cetz.canvas(` and no quoted LaTeX; after
the regeneration it holds neither. So either `convert` now refuses the picture and the fallback writes
it in some spelling this guard does not count, or the figure disappeared on its way to the page. This
rebuilds each picture in the source, prints what `build`/`sane`/`compiles` answer, and shows the first
typst error line, so the mechanism is named instead of guessed.
"""
import glob
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
src = glob.glob(os.path.join(ROOT, "_work", "flat", "Deforming-hypersymplectic*.tex"))[0]
text = open(src, encoding="utf-8", errors="replace").read()
print("pictures in source: %d" % len(PIC.findall(text)))
for p in PIC.findall(text):
    print("\n--- picture (%d chars)" % len(p))
    print(p[:400].replace("\n", " ")[:400])
    built = cetz.build(p)
    print("build:", "None" if built is None else "%d lines" % len(built.splitlines()))
    if built is None:
        continue
    print("sane:", cetz.sane(built), "compiles:", cetz.compiles(built))
    # which line the guard trips on, and what it counts there
    for i, line in enumerate(built.splitlines()[2:-1]):
        s = re.sub(r"\\.", "", line)
        dollars = s.count("$") % 2
        p = re.sub(r"\$[^$]*\$", "", s)
        q = re.sub(r'"(?:[^"\\]|\\.)*"', "", p)
        if dollars or q.count("[") != q.count("]") or q.count("(") != q.count(")"):
            print("  BAD line %d: dollars=%d brackets %d/%d parens %d/%d"
                  % (i, dollars, q.count("["), q.count("]"),
                     q.count("("), q.count(")")))
            print("   as written: %s" % line[:220])
            print("   maths cut : %s" % p[:220])
            print("   strings cut: %s" % q[:220])
            break

    with tempfile.TemporaryDirectory() as tmp:
        f = os.path.join(tmp, "t.typ")
        open(f, "w", encoding="utf-8").write(
            cetz.HEADER + "#set page(width: 300pt, height: 300pt)\n" + built)
        r = subprocess.run(["typst", "compile", f, os.path.join(tmp, "t.pdf")],
                           capture_output=True)
        err = re.sub(r"[^\x20-\x7e\n]", "?", (r.stderr or b"").decode("utf-8", "replace"))
        print("typst rc=%d" % r.returncode)
        for line in err.splitlines():
            if line.strip():
                print("   " + line[:160])
    print(built[:600])
