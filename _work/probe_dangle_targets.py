"""Where did the 17 dangling reference targets go?

For every key the ledger reports as dangling, look in the paper's TeX source for a
`\label{key}` and in the generated Typst for the matching `<key>`, and print enough of
each side to tell a lost label apart from a renamed one.
"""
import re
import subprocess
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent


def entries():
    out = subprocess.run([sys.executable, str(ROOT / "_work" / "dangling_report.py")],
                         capture_output=True, text=True, encoding="utf-8").stdout
    pairs = re.findall(r"^\s+\d+\s+(\S+)\s+([\w:.-]+)$", out, re.M)
    seen = {}
    for paper, key in pairs:
        seen.setdefault(paper, []).append(key)
    return seen


def find(leaf, stem):
    hits = sorted(p for p in leaf.glob(stem + "*") if p.is_file() or p.is_dir())
    return hits[0] if hits else None


for paper, ks in sorted(entries().items()):
    src = find(ROOT / "_work" / "flat", paper)
    dst = find(ROOT / "typst", paper)
    if src is None or dst is None:
        print("== %s : src=%s typst=%s" % (paper, src and src.name, dst and dst.name))
        continue
    tex = src.read_text(encoding="utf-8", errors="replace")
    body = (dst / "main.typ").read_text(encoding="utf-8", errors="replace")
    for key in ks:
        had = list(re.finditer(r"\\label\{(" + re.escape(key) + r")\}", tex))
        lab = re.escape(key) + "|" + re.escape(key.replace(":", "-"))
        now = list(re.finditer(r"<(?:" + lab + r")>", body))
        print("== %-42s %-28s label=%d ref_in_typst=%d"
              % (paper[:42], key, len(had), len(now)))
        for m in had[:2]:
            seg = tex[max(0, m.start() - 70):m.start() + 30].replace("\n", " | ")
            print("     tex: …%s…" % seg)
