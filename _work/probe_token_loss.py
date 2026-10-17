"""For every paper with an empty figure: does pandoc keep the picture placeholder?

convert.py hides each tikzpicture behind a token and puts the canvas back after emission, so a
float can come out empty for two different reasons: pandoc discarded the token on its way
through the float, or our emitter did. The two numbers separate them.
"""
import json
import os
import re
import subprocess
import sys
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path

sys.path.insert(0, str(Path("tools").resolve()))

TIKZ = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TOKEN = re.compile(r"ZQT2TTIKZ\d+")
EMPTY = re.compile(r"#figure\(\s*\[\],", re.S)


def work(name):
    from t2t import prep
    flat = Path("_work", "flat", name + ".tex")
    out = Path("typst", name, "main.typ")
    if not flat.exists() or not out.exists():
        return (name, -1, 0, 0, 0)
    n_empty = len(EMPTY.findall(out.read_text(encoding="utf-8", errors="replace")))
    if not n_empty:
        return (name, 0, 0, 0, 0)
    src = flat.read_text(encoding="utf-8", errors="replace")
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    pre_text = re.sub(r'\\begingroup[^\n]*\\catcode[^\n]*\\endgroup', '', pre_text)
    pre_text = prep.strip_pdf_noise(pre_text)
    chunks = []

    def preserve(match):
        chunks.append(match.group(0))
        return "ZQT2TTIKZ%d" % (len(chunks) - 1)

    body = TIKZ.sub(preserve, body)
    body = body.replace("\\/", "")
    body = prep.expand_macros(body, p.macros)
    body = prep.fix_dialect_prose(body)
    body = prep.strip_dropped(body)
    body = prep.array_floats(body)
    body = re.sub(r"\\label\[[^\]]*\]", r"\\label", body)
    tokens = len(TOKEN.findall(body))
    work_dir = Path("_work", "_loss")
    work_dir.mkdir(exist_ok=True)
    tex = work_dir / (name[:60] + ".tex")
    tex.write_text(pre_text + "\\begin{document}\n" + body, encoding="utf-8")
    js = tex.with_suffix(".json")
    subprocess.run([os.environ.get("PANDOC", "pandoc"), str(tex), "-f", "latex",
                    "-t", "json", "-o", str(js)], capture_output=True)
    in_ast = 0
    if js.exists():
        in_ast = len(TOKEN.findall(js.read_text(encoding="utf-8", errors="replace")))
        js.unlink()
        tex.unlink()
    return (name, n_empty, tokens, in_ast, len(chunks))


def main():
    names = sorted(d.name for d in Path("typst").glob("*") if (d / "main.typ").exists())
    rows = []
    with ProcessPoolExecutor(max_workers=8) as pool:
        for r in pool.map(work, names):
            rows.append(r)
    print("names=%d  no-file=%d  no-empty=%d  paired=%d"
          % (len(rows), sum(1 for r in rows if r[1] < 0),
             sum(1 for r in rows if r[1] == 0), sum(1 for r in rows if r[1] > 0)))
    rows = [r for r in rows if r[1] > 0]
    tot_empty = sum(r[1] for r in rows)
    tot_tok = sum(r[2] for r in rows)
    tot_ast = sum(r[3] for r in rows)
    tot_pic = sum(r[4] for r in rows)
    print("papers: %d  empty figures: %d  pictures: %d  tokens after prep: %d  in AST: %d"
          % (len(rows), tot_empty, tot_pic, tot_tok, tot_ast))
    print("pandoc dropped %d token(s); %d never became a token"
          % (tot_tok - tot_ast, tot_pic - tot_tok))
    print("\nworst pandoc-drop papers:")
    for name, n_empty, tok, ast, pic in sorted(rows, key=lambda r: r[2] - r[3], reverse=True)[:12]:
        print("  empty=%d tok=%d ast=%d  %s" % (n_empty, tok, ast, name[:70]))


if __name__ == "__main__":
    main()
