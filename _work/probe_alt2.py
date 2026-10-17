r"""Hunt the Typst spelling of the circled-times symbol (\\otimes)."""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")
import fitz  # noqa: E402

CANDS = ["⊗", "times.circle", "times.circle.big", "circled.times", "circle.times",
         "times.square", "plus.circle", "otimes", "product.circle", "dot.circle",
         "times.big", "times.circle.stroked"]


def main():
    tmp = tempfile.mkdtemp(prefix="alt")
    for cand in CANDS:
        path = os.path.join(tmp, "s.typ")
        pdf = os.path.join(tmp, "s.pdf")
        open(path, "w", encoding="utf-8").write("$ %s $\n" % cand)
        r = subprocess.run(["typst", "compile", path, pdf], capture_output=True)
        if r.returncode:
            err = (r.stderr or b"").decode("utf-8", "replace").splitlines()
            print("  %-22s FAIL  %s" % (cand, (err[0] if err else "")[:60]))
            continue
        d = fitz.open(pdf)
        g = "".join(sp["text"] for pg in d for b in pg.get_text("dict")["blocks"]
                    for l in b.get("lines", []) for sp in l["spans"])
        d.close()
        print("  %-22s -> %r" % (cand, g.strip()[:20]))


if __name__ == "__main__":
    main()
