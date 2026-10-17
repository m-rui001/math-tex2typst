"""Convert every refused-picture paper with the merged tree and count what is still quoted LaTeX.

`#raw(block: true, lang: "latex", ...)` is what the emitter writes when a picture cannot be
modelled, so this count IS the remaining refusal surface; the canvas count is what was drawn.
"""
import glob
import os
import sys

sys.path.insert(0, "tools")
from t2t import convert  # noqa: E402

MARKER = '#raw(block: true, lang: "latex"'

PREFIXES = [
    "A-sharp-entropy-bound-and-the-simplex-inequality",
    "Critical-bond-and-site-percolation-on-the-cubic-lattice",
    "Critical-strip-crossing-mass-on-the-honeycomb-lattice",
    "Cylinder-amplitudes-and-logarithmic-bridge-length-windows",
    "Elliptic-capacity-propagation-and-Fourier-restriction",
    "Finite-cylinder-approximation-of-ruled-sets",
    "Gaussian-free-field-limits-of-weighted-integer-Lipschitz-hei",
    "Mass-and-covering-exponents-for-fixed-length-honeycomb-walks",
    "No-percolation-at-criticality-on-quasi-transitive-graphs",
    "Nonuniqueness-with-local-conservation-for-the-hard-sphere",
    "Polynomial-PEPS-approximation-of-gapped-square-grid-ground-s",
    "Strong-diffeomorphic-approximation-in-three-dimensions",
    "The-Deligne-Drinfeld-conjecture",
    "The-joint-scaling-limit-of-critical-Ashkin-Teller-currents",
    "Thompsons-group-F-is-nonamenable",
    "Translative-covering-densities-of-order-n-log-n",
    "Universal-Tensor-Squares-for-Symmetric-Groups",
]


def main():
    total_raw = 0
    still = []
    for prefix in PREFIXES:
        hits = sorted(glob.glob(os.path.join("_work", "flat", prefix + "*")))
        if not hits:
            print("%-58s NO SUCH FLAT FILE" % prefix)
            continue
        for flat in hits:
            paper = os.path.basename(flat)[:-4]
            out = os.path.join("_work", "mg", "out", paper)
            os.makedirs(out, exist_ok=True)
            try:
                convert.convert_paper(flat, out, paper)
            except Exception as exc:
                print("%-58s CRASH %s: %s" % (paper[:58], type(exc).__name__, str(exc)[:80]))
                continue
            typ = os.path.join(out, "main.typ")
            text = open(typ, encoding="utf-8").read() if os.path.exists(typ) else ""
            raw = text.count(MARKER)
            canvas = text.count("#canvas(")
            total_raw += raw
            if raw:
                still.append((paper, raw))
            print("%-58s raw=%d canvas=%d" % (paper[:58], raw, canvas))
    print("---")
    print("quoted raw pictures across the refused set: %d" % total_raw)
    for paper, raw in still:
        print("  still refused: %s (%d)" % (paper[:70], raw))


if __name__ == "__main__":
    main()
