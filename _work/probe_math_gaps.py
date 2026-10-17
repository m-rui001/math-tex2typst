"""Feed real display math from the flat sources through the converter and keep the refusals.

The residue in main.typ is the quoted original, so it cannot tell us what texmath choked
on; this runs the same clean + batch path the pipeline uses and prints the isolated error.

Run: python _work/probe_math_gaps.py [limit]
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

FLAT = ROOT / "_work" / "flat"
DISPLAY = re.compile(r"\\begin\{((?:align|alignat|gather|eqnarray|split|cases|array|matrix|"
                     r"pmatrix|bmatrix|smallmatrix|multline|flalign|displaymath)[*]?)\}(.+?)\\end\{\1\}",
                     re.S)
INTEREST = re.compile(r"\\(?:text|textrm|mathrm|vrule|ref|eqref|multicolumn|substack|shortintertext|"
                      r"intertext|raisebox|parbox|substack|boxed|overset|underset|stackrel)\b"
                      r"|\\begin\{(?:array|aligned|split|subarray|gathered|cases|matrix)\}")


def main():
    limit = int(sys.argv[1]) if len(sys.argv) > 1 else 400
    cand = []
    for tex in sorted(FLAT.glob("*.tex")):
        body = tex.read_text(encoding="utf-8", errors="replace")
        for m in DISPLAY.finditer(body):
            src = m.group(0)
            if len(src) < 4000 and INTEREST.search(src):
                cand.append((tex.stem, m.group(1), src))
    print("candidates: %d" % len(cand))
    picked = cand[:limit]
    converted, refused, err = mathconv.convert_formulas([c[2] for c in picked])
    print("refused=%d / %d" % (len(refused), len(picked)))
    kinds = collections.Counter()
    for idx in sorted(refused):
        name, env, src = picked[idx]
        kinds[env] += 1
        if kinds[env] <= 2:
            print("\n[%s] %s\n    %s" % (env, name[:52], " ".join(src.split())[:190]))
            batch, skipped = mathconv.build_batch([src], {})
            out, e = mathconv.run_pandoc(batch)
            print("    isolated skipped=%s spans=%s warn=%s"
                  % (skipped, list(mathconv._parse_spans(out)), " ".join((e or "").split())[:150]))
    print("\nrefused by environment: %s" % dict(kinds))


if __name__ == "__main__":
    main()
