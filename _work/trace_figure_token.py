"""Where does a float's picture placeholder go between prep, pandoc and the emitter?

For one paper the placeholder token is traced through the three stages that see it: the body
handed to pandoc, the pandoc AST, and the emitted lines. A token that reaches pandoc but not
the AST was dropped by pandoc; one that reaches the AST but not the output was dropped by us.
"""
import json
import os
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path("tools").resolve()))

from t2t import cetz, prep  # noqa: E402

ROOT = Path(".")
TIKZ = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def main():
    pattern = sys.argv[1]
    flat = next(Path("_work", "flat").glob(pattern + ".tex"))
    src = flat.read_text(encoding="utf-8", errors="replace")
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    pre_text = re.sub(r'\\begingroup[^\n]*\\catcode[^\n]*\\endgroup', '', pre_text)
    pre_text = prep.strip_pdf_noise(pre_text)
    tikz = []

    def preserve(match):
        tikz.append(match.group(0))
        return "ZQT2TTIKZ%d" % (len(tikz) - 1)

    body = prep.unwrap_boxes(body)
    body = TIKZ.sub(preserve, body)
    show = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    for i, chunk in enumerate(tikz):
        if i == show:
            print(" ".join(chunk.split()))
    for i, chunk in enumerate(tikz):
        print("chunk %d: %d chars -> %s" % (i, len(chunk),
                                            "draws" if cetz.build(chunk) else "refused"))
        if "endpoint/.style" in chunk:
            print(" ".join(chunk.split())[:300])
    body = body.replace("\\/", "")
    body = prep.expand_macros(body, p.macros)
    body = prep.fix_dialect_prose(body)
    body = prep.strip_dropped(body)
    body = prep.array_floats(body)
    body = re.sub(r"\\label\[[^\]]*\]", r"\\label", body)
    out = Path("_work", "_trace.tex")
    out.write_text(pre_text + "\\begin{document}\n" + body, encoding="utf-8")
    print("placeholders: %d ; in body: %d"
          % (len(tikz), len(re.findall(r"ZQT2TTIKZ\d+", body))))
    j = Path("_work", "_trace.json")
    subprocess.run([os.environ.get("PANDOC", "pandoc"), str(out), "-f", "latex",
                    "-t", "json", "-o", str(j)], capture_output=True)
    ast = json.loads(j.read_text(encoding="utf-8"))
    text = json.dumps(ast)
    print("in AST: %d" % len(re.findall(r"ZQT2TTIKZ\d+", text)))

    def walk(node, trail=()):
        if isinstance(node, dict):
            if node.get("t") == "Figure":
                dump = json.dumps(node["c"])
                has = re.findall(r"ZQT2TTIKZ\d+", dump)
                cap = re.findall(r"Str \"([^\"]{0,40})", dump)[:3]
                print("Figure %s token=%s head=%s" % (trail, has, cap))
            for v in node.values():
                walk(v, trail)
        elif isinstance(node, list):
            for v in node:
                walk(v, trail)

    walk(ast["blocks"])


main()
