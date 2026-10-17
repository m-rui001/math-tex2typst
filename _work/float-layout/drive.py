r"""Run the production prep chain over one extracted region and show pandoc's answer.

convert.py:18 resolves the repo root from its own path, so a copied tree cannot convert a whole
paper; the stages before pandoc are pure functions of the text, so a region driven through them
reaches pandoc exactly as the whole paper does. Prints the post-prep LaTeX and pandoc's block
kinds so a mechanism is read off the AST instead of inferred.

usage: python drive.py "<flat prefix>" <begin-env> <occurrence-index>
"""
import io
import json
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz, convert, prep  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
FLAT = os.path.join(ROOT, "_work", "flat")


def flat_for(prefix):
    for name in sorted(os.listdir(FLAT)):
        if name.startswith(prefix) and name.endswith(".tex"):
            return os.path.join(FLAT, name)
    raise SystemExit("no flat file for %r" % prefix)


def env_region(src, name, index):
    rx = re.compile(r"\\begin\{%s\*?\}(?:.|\n)*?\\end\{%s\*?\}" % (name, name))
    ms = list(rx.finditer(src))
    return ms[index].group(0), ms[index].start()


def run(region, out_dir):
    r"""The stage order of convert.convert_paper, from the picture lift to pandoc's JSON."""
    os.makedirs(out_dir, exist_ok=True)
    pre_text, _body = "", ""
    p = prep.Preamble()
    scopes = convert.picture_scopes(region, p.macros)
    tikz = []

    def preserve_tikz(match):
        text = match.group(0)
        if len(tikz) < len(scopes):
            table, decls = scopes[len(tikz)]
            if decls:
                text = convert.with_declarations(text, decls)
        else:
            table = p.macros
        tikz.append(prep.expand_macros(text, table))
        return "ZQT2TTIKZ%d" % (len(tikz) - 1)

    body = convert.prep.unwrap_boxes(region)
    body = convert.TIKZ_SPAN.sub(preserve_tikz, body)
    body = convert.float_pictures(body, preserve_tikz)
    body = body.replace("\\/", "")
    body = prep.expand_macros(body, p.macros)
    body = prep.fix_dialect_prose(body)
    body = prep.strip_dropped(body)
    body = prep.array_floats(body)
    body = prep.lift_captions(body)
    body = prep.fix_multicolumn_specs(body)
    tex = os.path.join(out_dir, "case.tex")
    with open(tex, "w", encoding="utf-8") as fh:
        fh.write("\\documentclass{article}\\begin{document}\n" + body + "\n\\end{document}\n")
    proc = subprocess.run(["pandoc", tex, "-f", "latex", "-t", "json"],
                          capture_output=True, text=True, encoding="utf-8", timeout=300)
    ast = json.loads(proc.stdout)
    return body, ast, tikz


def kinds(blocks, depth=0):
    for b in blocks:
        t = b["t"]
        c = b.get("c")
        if t == "Float":
            print("%sFloat %s ident=%r" % ("  " * depth, c[0][1], c[0][0]))
            kinds(c[2], depth + 1)
        elif t == "Figure":
            print("%sFigure ident=%r cap=%s" % ("  " * depth, c[0][0],
                                                json.dumps(c[1])[:80] if c[1] else ""))
            kinds(c[2] if len(c) > 2 else [], depth + 1)
        elif t == "Table":
            print("%sTable caption=%s cols=%s" % ("  " * depth, json.dumps(c[1])[:60], len(c[2])))
            for row in c[4] + c[3]:
                for cell in row:
                    print("%s  cell %s:" % ("  " * depth, cell[0][1] if cell[0] else None))
                    kinds(cell[2], depth + 2)
        elif t in ("Div", "BlockQuote"):
            print("%s%s cls=%r" % ("  " * depth, t, c[0][1]))
            kinds(c[1], depth + 1)
        else:
            s = json.dumps(c, ensure_ascii=False) if c is not None else ""
            print("%s%s %s" % ("  " * depth, t, s[:110]))


if __name__ == "__main__":
    prefix, env, index = sys.argv[1], sys.argv[2], int(sys.argv[3] if len(sys.argv) > 3 else 0)
    src = open(flat_for(prefix), encoding="utf-8").read()
    region, at = env_region(src, env, index)
    out_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "case")
    body, ast, tikz = run(region, out_dir)
    print("### post-prep LaTeX (%d chars, %d pictures held)" % (len(body), len(tikz)))
    print(body[:4000])
    print("### pandoc blocks")
    kinds(ast["blocks"])
