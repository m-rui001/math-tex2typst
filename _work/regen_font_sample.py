r"""Regenerate a sample of papers that name a node font size, and re-measure them end to end.

Runs the real converter (with its compile gate) on a handful of flagged papers, then checks each
regenerated `main.typ` for a node `size:` directive and reports compile_ok.
"""
import glob
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t.convert import convert_paper  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NAME = r"(small|footnotesize|scriptsize|tiny|large|Large|LARGE|huge|Huge|normalsize)"
SIZES = re.compile(r"font\s*=\s*\\?%s" % NAME
                   + r"|font\s*=\s*\\fontsize\{([\d.]+)\}"
                   + r"|\\fontsize\{([\d.]+)\}"
                   + r"|\\(%s)\b" % NAME)
TYP_SIZE = re.compile(r"size:\s*[\d.]+pt")
CANVAS = re.compile(r"canvas\(")


def canvas_blocks(text):
    out = []
    for m in CANVAS.finditer(text):
        i = text.find("{", m.end() - 1)
        if i < 0:
            continue
        depth = 0
        for j in range(i, len(text)):
            if text[j] == "{":
                depth += 1
            elif text[j] == "}":
                depth -= 1
                if depth == 0:
                    out.append(text[i + 1:j])
                    break
    return out


def main():
    sys.stdout.reconfigure(errors="replace")
    limit = int(sys.argv[1]) if len(sys.argv) > 1 else 15
    picked = []
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        name = os.path.basename(src)[:-4]
        if name.startswith("standalone-"):
            continue
        text = open(src, encoding="utf-8", errors="replace").read()
        if any(SIZES.search(p) for p in PIC.findall(text)):
            picked.append((name, src))
        if len(picked) >= limit:
            break
    ok = compiled = styled = 0
    for name, src in picked:
        out = os.path.join(ROOT, "typst", name)
        os.makedirs(out, exist_ok=True)
        try:
            rep = convert_paper(src, out, name)
        except Exception as exc:  # noqa: BLE001
            print("  EXC  %s %r" % (name[:50], exc))
            continue
        main_typ = os.path.join(out, "main.typ")
        blocks = canvas_blocks(open(main_typ, encoding="utf-8", errors="replace").read()) \
            if os.path.exists(main_typ) else []
        n = len(blocks)
        s = sum(1 for b in blocks if TYP_SIZE.search(b))
        compiled += 1 if rep.get("compile_ok") else 0
        ok += 1
        styled += s
        print("  %-52s compile=%s canvases=%d sized=%d"
              % (name[:52], rep.get("compile_ok"), n, s))
    print("papers %d, compiled %d, canvases sized %d" % (ok, compiled, styled))


if __name__ == "__main__":
    main()
