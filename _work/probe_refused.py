"""Ask the batch path directly why one paper's formulas come back unconverted.

Refused maths are quoted as raw LaTeX, so the residue in main.typ is a symptom. This
loads the paper's own AST, runs the same build_batch + pandoc + span parse the pipeline
uses, and prints each missing index with the isolated retry and the warning texmath
gives for it.

Run: python _work/probe_refused.py <paper-name-prefix>
"""
import json
import pathlib
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

prefix = sys.argv[1] if len(sys.argv) > 1 else "The-PCP-for-PPAD"
paper = sorted(p.stem for p in (ROOT / "_work" / "flat").glob(prefix + "*.tex"))[0]
ast = json.loads((ROOT / "_work" / "flat" / "_work_tex" / (paper + ".json")).read_text(encoding="utf-8"))
formulas = emit.formula_list(ast) if hasattr(emit, "formula_list") else None
if formulas is None:
    sys.path.insert(0, str(ROOT / "tools" / "t2t"))
    import convert
    formulas = convert.formula_list(ast)

converted, refused, err = mathconv.convert_formulas(formulas)
print("paper=%s formulas=%d refused=%d" % (paper[:50], len(formulas), len(refused)))
for idx in sorted(refused)[:14]:
    tex = formulas[idx]
    batch, skipped = mathconv.build_batch([tex], {})
    out, e = mathconv.run_pandoc(batch)
    print("\n#%d %s" % (idx, " ".join(tex.split())[:110]))
    print("    isolated: skipped=%s spans=%s" % (skipped, list(mathconv._parse_spans(out))))
    print("    warn: %s" % " ".join((e or "").split())[:180])
