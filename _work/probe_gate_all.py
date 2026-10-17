r"""Compile-gate every picture rebuilt from the flat sources, to catch a canvas the change broke.

Prints each canvas typst refuses, with the first line of its error, so a bad mapping is visible
without a full batch.
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

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def gate(canvas):
    with tempfile.TemporaryDirectory() as tmp:
        src = os.path.join(tmp, "t.typ")
        open(src, "w", encoding="utf-8").write(
            cetz.HEADER + "#set page(width: 300pt, height: 300pt)\n" + canvas)
        r = subprocess.run(["typst", "compile", src, os.path.join(tmp, "t.pdf")],
                           capture_output=True)
    return r


def main():
    built = refused = bad = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(text):
            got = cetz.build(p)
            if got is None:
                refused += 1
                continue
            built += 1
            r = gate(got)
            if r.returncode:
                bad += 1
                err = (r.stderr or b"").decode("utf-8", "replace")
                err = re.sub(r"[^\x20-\x7e\n]", "?", err)
                first = next((l for l in err.splitlines() if "error" in l),
                             (err.splitlines() or ["(typst returned %d, no output)"
                                                   % r.returncode])[0])
                print("FAIL %s" % os.path.basename(src)[:40])
                print("     %s" % first[:110])
                print("     canvas: %s" % got.splitlines()[3][:150] if len(got.splitlines()) > 3
                      else "     canvas: %s" % got[:150])
                if bad >= 25:
                    print("... stopping after 25")
                    return
    print("built %d, refused %d, compile-failed %d" % (built, refused, bad))


if __name__ == "__main__":
    main()
