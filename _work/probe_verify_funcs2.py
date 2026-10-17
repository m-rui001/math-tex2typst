r"""Compile realistic function-argument forms: multi-letter names, subscripts, nested symbols."""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")
import fitz  # noqa: E402

CANDS = [
    "cal(M)_N", "cal(D)_N", "bb(P)(text[retained])", "upright(new)",
    "upright(d)", "upright(component)", "sans(U)", "frak(A)", "italic(d)",
    "overline(B)(z_(i j), s_(i j))", "macron(e)D macron(f)E", "tilde(Y)_u",
    "hat(A)_i", "arrow(iota)_t x", "sqrt(n(p, 0))", "sqrt(delta)", "sqrt(W)",
    "frac(v + s h, sqrt(1 + s^2))", "frac(1, 4)", "frac(1, 2)",
    "upright(Seq)", "cal(F)", "bb(E)", "bold(1)_(B(z, r)) h_j sigma",
    "x_(upright(f))^(0)", "cal(M)_N = cal(D)_N", "upright(c)", "sans(A) : (((12)3)4)",
    "macron(pi)", "upright(th)", "italic(ij)",
]


def main():
    tmp = tempfile.mkdtemp(prefix="fn")
    for cand in CANDS:
        path = os.path.join(tmp, "s.typ")
        pdf = os.path.join(tmp, "s.pdf")
        open(path, "w", encoding="utf-8").write("$ %s $\n" % cand)
        r = subprocess.run(["typst", "compile", path, pdf], capture_output=True)
        if r.returncode:
            err = (r.stderr or b"").decode("utf-8", "replace").splitlines()
            print("  FAIL  %-34s %s" % (cand, (err[0] if err else "")[:55]))
            continue
        d = fitz.open(pdf)
        g = "".join(sp["text"] for pg in d for b in pg.get_text("dict")["blocks"]
                    for l in b.get("lines", []) for sp in l["spans"])
        d.close()
        print("  ok    %-34s -> %r" % (cand, g.strip()[:26]))


if __name__ == "__main__":
    main()
