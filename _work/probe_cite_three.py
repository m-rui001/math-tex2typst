r"""The three maths citations that reach the page as a literal [??], measured before and after.

A \\cite written inside \\text{...} in a formula is stringified by the maths converter, and a
citation cannot be evaluated inside a Typst string, so the reader sees upright("[??]") even though
the same key cites correctly in the prose of the same paper. This runs the one-paper converter over
the three papers and prints every line that carries one of their cite keys, plus every [??] and
every citation token the maths channel left behind.

Usage: python _work/probe_cite_three.py before|after
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import convert  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PREFIXES = [
    "Kadisons-similarity-theorem-through-uniform-",
    "The-Restricted-Geometric-Langlands-Equivalen",
    "Uniform-indices-for-semi-log-canonical-log-C",
]
KEYS = ["Dickson2014", "Stacks", "Birkar2023"]


def main(mode):
    total_q = total_stringified = total_token = 0
    for prefix in PREFIXES:
        hits = [f for f in glob.glob(os.path.join(FLAT, "*.tex"))
                if os.path.basename(f)[:-4].startswith(prefix)]
        assert len(hits) == 1, (prefix, hits)
        paper = os.path.basename(hits[0])[:-4]
        out = os.path.join(ROOT, "_work", "_probe_cite", mode, paper)
        os.makedirs(out, exist_ok=True)
        res = convert.convert_paper(hits[0], out, paper)
        typ = io.open(os.path.join(out, "main.typ"), encoding="utf-8",
                      errors="replace").read()
        lines = typ.split("\n")
        q = len(re.findall(r"\[\?\?\]", typ))
        sq = typ.count('upright("[??]")')
        tok = typ.count("ZQCT")
        total_q += q
        total_stringified += sq
        total_token += tok
        stats = res.get("stats") or {}
        print("== %s" % paper)
        print("   ok=%s compile_ok=%s compile_errors=%s math_failed=%s tokens=%d"
              % (res.get("ok"), res.get("compile_ok"), res.get("compile_errors"),
                 res.get("math_failed"), stats.get("math_unconverted", 0)))
        if not res.get("compile_ok"):
            print("   compile stderr: %s" % (res.get("compile_err_full") or "")[:400])
        print("   [??]=%d  upright(\"[??]\")=%d  ZQCT=%d" % (q, sq, tok))
        for n, line in enumerate(lines, 1):
            if "[??" in line or "ZQCT" in line or any(k in line for k in KEYS):
                print("   %4d: %s" % (n, line.strip()[:220]))
    print("TOTAL over the three papers: [??]=%d stringified-cites=%d leftover-tokens=%d"
          % (total_q, total_stringified, total_token))


main(sys.argv[1] if len(sys.argv) > 1 else "before")
