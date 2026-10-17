r"""What does pandoc's AST hold for a float that carries more than one \label?

Runs the same prep chain convert.convert_paper applies, calls pandoc for the JSON, and prints every
Figure/Table node near a label of interest with its ident, classes and attrs, plus the top-level
block sequence around it. This is the stage the corpus says the extra name is lost at.
"""
import io
import json
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
WORK = os.path.join(ROOT, "_work", "_probe_labels")
os.makedirs(WORK, exist_ok=True)


def ast_of(paper):
    src = open(os.path.join(FLAT, paper + ".tex"), encoding="utf-8", errors="replace").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.unwrap_boxes(body)
    body = re.sub(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}",
                  lambda m: "ZQT2TTIKZ0", body, flags=re.S)
    body = body.replace("\\/", "")
    body = prep.expand_macros(body, p.macros)
    body = prep.fix_dialect_prose(body)
    body = prep.strip_dropped(body)
    body = prep.array_floats(body)
    body = prep.lift_captions(body)
    body = prep.fix_multicolumn_specs(body)
    body = re.sub(r"\\label\[[^\]]*\]", r"\\label", body)
    out = os.path.join(WORK, paper[:30] + ".tex")
    open(out, "w", encoding="utf-8").write(pre_text + "\\begin{document}\n" + body)
    js = out[:-4] + ".json"
    subprocess.run([os.environ.get("PANDOC", "pandoc"), out, "-f", "latex", "-t", "json",
                    "-o", js], capture_output=True, text=True, encoding="utf-8")
    return json.load(open(js, encoding="utf-8"))


def brief(node, depth=0):
    t = node.get("t")
    c = node.get("c")
    pad = "  " * depth
    if t in ("Figure", "Table"):
        ident = c[0][0] if isinstance(c, list) and isinstance(c[0], list) else "?"
        classes = c[0][1] if isinstance(c, list) and isinstance(c[0], list) else "?"
        attrs = c[0][2] if isinstance(c, list) and isinstance(c[0], list) else "?"
        return ["%s%s ident=%r classes=%r attrs=%r" % (pad, t, ident, classes, attrs)]
    if t == "Div":
        return ["%sDiv ident=%r classes=%r attrs=%r" % (pad, c[0][0], c[0][1], c[0][2])]
    return ["%s%s" % (pad, t)]


def walk(node, out, depth=0):
    t = node.get("t")
    out.extend(brief(node, depth))
    c = node.get("c")
    if isinstance(c, list):
        for item in c:
            if isinstance(item, dict):
                walk(item, out, depth + 1)
            elif isinstance(item, list):
                for sub in item:
                    if isinstance(sub, dict):
                        walk(sub, out, depth + 1)
    elif isinstance(c, dict):
        walk(c, out, depth + 1)
    return out


def dump(paper, needles):
    ast = ast_of(paper)
    blocks = ast["blocks"]
    print("=" * 90)
    print(paper, "top-level blocks:", len(blocks))
    for i, node in enumerate(blocks):
        lines = walk(json.loads(json.dumps(node)), [])
        text = json.dumps(node, ensure_ascii=False)
        if any(n in text for n in needles) and (node["t"] in
                                                ("Figure", "Table", "Div") or "caption" in text.lower()):
            print("--- block %d %s" % (i, node["t"]))
            print("\n".join(lines[:40]))


dump("A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026",
     ["Every allowed entry", "All fifteen couplings", "apptr:"])
dump("Positive-scalar-curvature-and-uniform-codimension-two-width-September-23-2026",
     ["topology-compression", "packet:collar-figure", "two maps used"])
