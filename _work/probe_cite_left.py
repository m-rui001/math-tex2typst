"""Show the source citation behind each surviving `[??]` mark."""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
CITE = re.compile(r"\\cite[pt]?\b(?![a-zA-Z])")

papers = [
    "Uniform-indices-for-semi-log-canonical-log-Calabi-Yau-pairs-Octo",
    "The-Restricted-Geometric-Langlands-Equivalence-in-Positive-Chara",
    "Kadisons-similarity-theorem-through-uniform-derivation-estimates",
    "Conditional-information-under-deterministic-coordinate-sweeps-Se",
]
for pre in papers:
    typ = list((ROOT / "typst").glob(pre + "*/main.typ"))
    flat = list((ROOT / "_work" / "flat").glob(pre + "*.tex"))
    if not typ:
        print("no typst for", pre)
        continue
    text = typ[0].read_text(encoding="utf-8", errors="replace")
    for m in re.finditer(r"\[\?\?\]", text):
        ctx = re.sub(r"\s+", " ", text[max(0, m.start() - 90):m.start() + 20])
        print("%-40s ... %s" % (typ[0].parent.name[:40], ctx[-105:]))
    if flat:
        src = flat[0].read_text(encoding="utf-8", errors="replace")
        keys = set(re.findall(r"\\cite[pt]?\s*(?:\[[^\]]*\])?\s*\{([^}]*)\}", src))
        print("    cite keys in flat: %s" % sorted(keys)[:8])
