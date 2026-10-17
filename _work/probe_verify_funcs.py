r"""Compile candidate Typst FUNCTION spellings for the argument-taking TeX commands."""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")
import fitz  # noqa: E402

CANDS = [
    ("mathcal", "cal(Q)"), ("mathbb", "bb(R)"), ("mathbf", "bold(x)"),
    ("mathrm", "upright(d)"), ("mathsf", "sans(A)"), ("mathfrak", "frak(A)"),
    ("mathit", "italic(x)"), ("boldsymbol", "bold(iota)"),
    ("overline", "overline(B)"), ("bar", "macron(e)"), ("bar2", "bar(e)"),
    ("widetilde", "tilde(Y)"), ("widehat", "hat(A)"), ("vec", "arrow(v)"),
    ("dot", "dot(x)"), ("ddot", "dot.double(x)"), ("hat", "hat(f)"),
    ("tilde", "tilde(a)"), ("sqrt", "sqrt(2)"), ("sqrt2", "sqrt(x+1)"),
    ("frac", "frac(a, b)"), ("frac2", "(a)/(b)"), ("frac3", "(v+s h)/(sqrt(1+s^2))"),
    ("rm", "upright(d)"), ("bf", "bold(x)"), ("it", "italic(x)"),
    ("sf", "sans(A)"), ("tt", "mono(x)"),
    ("cal_r", "cal(M)_N"), ("upright_sub", "x_(upright(f))^(0)"),
]


def main():
    tmp = tempfile.mkdtemp(prefix="fn")
    for name, cand in CANDS:
        path = os.path.join(tmp, "s.typ")
        pdf = os.path.join(tmp, "s.pdf")
        open(path, "w", encoding="utf-8").write("$ %s $\n" % cand)
        r = subprocess.run(["typst", "compile", path, pdf], capture_output=True)
        if r.returncode:
            err = (r.stderr or b"").decode("utf-8", "replace").splitlines()
            print("  %-12s %-26s FAIL  %s" % (name, cand, (err[0] if err else "")[:55]))
            continue
        d = fitz.open(pdf)
        g = "".join(sp["text"] for pg in d for b in pg.get_text("dict")["blocks"]
                    for l in b.get("lines", []) for sp in l["spans"])
        d.close()
        print("  %-12s %-26s -> %r" % (name, cand, g.strip()[:24]))


if __name__ == "__main__":
    main()
