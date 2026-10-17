r"""#99h: the change face read through the emitter, over the papers that carry `even odd rule`

probe99c counted the statements statically (hole=17 over 12 pictures / 12 papers).  This runs those
12 papers through `convert.convert_paper` into a scratch directory and counts what the batch will
actually ship -- a `compound-path(` line per punched hole -- so the face is the emission's, not the
source text's.  Nothing here touches `typst/`.

  python _work/probe99h_emitter_face.py         # -> _work/label99h_emitter_face.txt
"""
import io
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
OUTDIR = os.path.join(ROOT, "_work", "_m99h_out")
OUT = os.path.join(ROOT, "_work", "label99h_emitter_face.txt")
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert  # noqa: E402

LABEL = os.path.join(ROOT, "_work", "label99c_fill_rule_face.txt")


def hole_papers():
    """The papers probe99c bucketed as `hole`, with their statement count."""
    counts = {}
    for line in io.open(LABEL, encoding="utf-8"):
        if not line.startswith("[hole] "):
            continue
        name = line.split("] ", 1)[1].split("#")[0].strip()
        counts[name] = counts.get(name, 0) + 1
    return counts


def main():
    os.makedirs(OUTDIR, exist_ok=True)
    counts = hole_papers()
    stems = sorted(d[:-4] for d in os.listdir(FLAT) if d.endswith(".tex"))
    lines = ["== emitter face: papers with a nested `even odd rule` fill"]
    total_statements = total_emissions = 0
    for name in sorted(counts):
        # probe99c truncates the picture name to 44 characters, the flat directory does not
        hits = [s for s in stems if s.startswith(name)]
        if len(hits) != 1:
            lines.append("\n%s  NOFLAT (%s)" % (name, hits))
            continue
        paper = hits[0]
        src = os.path.join(FLAT, paper + ".tex")
        out = os.path.join(OUTDIR, paper)
        os.makedirs(out, exist_ok=True)
        convert.convert_paper(src, out, paper)
        path = os.path.join(out, "main.typ")
        typ = io.open(path, encoding="utf-8").read() if os.path.isfile(path) else ""
        shipped = [l.strip() for l in typ.splitlines() if "compound-path(" in l]
        lines.append("\n%s  statements=%d shipped=%d" % (paper, counts[name], len(shipped)))
        for s in shipped:
            lines.append("    " + s[:300])
        total_statements += counts[name]
        total_emissions += len(shipped)
    lines.append("\nTOTAL statements=%d over %d papers, shipped compound-path lines=%d"
                 % (total_statements, len(counts), total_emissions))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
