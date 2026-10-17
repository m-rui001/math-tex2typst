"""Byte-diff a sample of picture papers under the padded marker.

``preserve_tikz`` now writes its token with a space on each side. TeX ignores a space after a control
word, and pandoc collapses the whitespace between words, so the claim is that only the papers whose
picture is written *tight* against a preceding control word change at all -- ``_work/
probe_marker_fusion.py`` counts those at three pictures in one paper. This converts a sample of the
others and compares bytes with the shipped product, so the claim is a measurement and not a sentence.

The sample is drawn to cover the families that route a picture differently: a tikzcd float, a refused
picture quoted as raw LaTeX, subfigures, a minipage float, and ordinary inline figures.
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import convert_paper  # noqa: E402

# one paper per family, resolved by substring so the long dated names stay honest
FAMILIES = {
    "tikzcd float": "Kazhdan",
    "quoted refusal": "Novikov",
    "subfigure": "Square-lattice",
    "minipage float": "IID-threshold",
    "inline figure": "Kurosh",
    "many pictures": "Birman",
    "text width frame": "Deforming",
    "node labels": "Kaplansky",
}


def main():
    flat = {p.stem: p for p in (ROOT / "_work" / "flat").glob("*.tex")}
    for family, needle in FAMILIES.items():
        stem = next((s for s in sorted(flat) if needle.lower() in s.lower()), None)
        if stem is None:
            print("%-18s no paper matches %r" % (family, needle))
            continue
        out = ROOT / "_work" / "sample_out" / family.replace(" ", "-")
        report = convert_paper(str(flat[stem]), str(out), stem)
        new = (out / "main.typ").read_bytes()
        old = (ROOT / "typst" / stem / "main.typ").read_bytes()
        print("%-18s %-52s compile %s  %s  %d bytes%s"
              % (family, stem[:52], report["compile_ok"],
                 "IDENTICAL" if new == old else "DIFFERS",
                 len(new), "" if new == old else " (old %d)" % len(old)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
