r"""Try alternative Typst spellings for the candidates that failed, reading back the glyph."""
import os
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")
import fitz  # noqa: E402

ALT = {
    "cap": ["sect", "intersection", "sect.intersection", "∩", "inter"],
    "otimes": ["times.circle", "circle.times", "otimes", "⊛", "circled.times"],
    "longmapsto": ["mapsto", "arrow.r.long.bar", "arrow.long.r.bar", "arrow.r.bar.long"],
    "varrho": ["rho.alt", "varrho"],
    "neg": ["not", "not"],
    "ast": ["*", "ast.op", "asterisk"],
}


def main():
    tmp = tempfile.mkdtemp(prefix="alt")
    for name, cands in ALT.items():
        for cand in cands:
            path = os.path.join(tmp, "s.typ")
            pdf = os.path.join(tmp, "s.pdf")
            open(path, "w", encoding="utf-8").write("$ %s $\n" % cand)
            r = subprocess.run(["typst", "compile", path, pdf], capture_output=True)
            if r.returncode:
                err = (r.stderr or b"").decode("utf-8", "replace")
                err = err.splitlines()[0] if err else "fail"
                print("  %-14s %-20s FAIL  %s" % (name, cand, err[:70]))
                continue
            d = fitz.open(pdf)
            g = "".join(sp["text"] for pg in d for b in pg.get_text("dict")["blocks"]
                        for l in b.get("lines", []) for sp in l["spans"])
            d.close()
            print("  %-14s %-20s -> %r" % (name, cand, g.strip()[:20]))


if __name__ == "__main__":
    main()
