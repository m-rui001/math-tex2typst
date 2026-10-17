r"""Feed the page gauge its known positive before believing its zero.

A gauge that has never said "yes" is not evidence (`_work/probe30_cd_page.py` reported 0 pairs over
the whole CD population on its first run, and the same after #48).  Two positives are run here.

The first is drawn from scratch: one CeTz arrow, one word on its shaft.  It has to be synthetic
because the corpus-side seam no longer reaches the withdrawn geometry -- `cd_label_off` is the only
law this probe can reinstall, and the round that measured tikz-cd's own side (#48, 轴 62) also flipped
the normal the offset is multiplied by, so "0.45 cm" today means 0.45 cm on the *correct* side, which
crosses nothing.  The synthetic case is what proves the ink basis still bites.

The second rebuilds a named paper under the flat 0.45 offset and under the live law and prints both
counts; the live rebuild runs last, so the corpus is left as shipped.

Usage: python _work/probe30_cd_control.py [stem-prefix]
"""
import io
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, ROOT)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
import fitz  # noqa: E402
from t2t import cetz  # noqa: E402
from t2t.convert import convert_paper  # noqa: E402
from _work.probe30_cd_page import crossings  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
# a shaft long enough to be an arrow (113 pt), its tip, and a word centred on it
SYNTH = ('#import "@preview/cetz:0.5.0"\n'
         '#set page(width: 8cm, height: 4cm)\n#set text(size: 11pt)\n'
         '#cetz.canvas({\n'
         '  import cetz.draw: *\n'
         '  line((0.5, 0), (4.5, 0), mark: (end: ">"))\n'
         '  content((2.5, 0), [$upright("crossed")$])\n'
         '  line((0.5, -1.5), (4.5, -1.5), mark: (end: ">"))\n'
         '  content((2.5, -1.13), [$upright("clear")$])\n'
         '})\n')


def synthetic():
    """Pairs the gauge reads on a page where one arrow crosses a word and one does not."""
    out = os.path.join(HERE, "_m48control")
    os.makedirs(out, exist_ok=True)
    open(os.path.join(out, "synth.typ"), "w", encoding="utf-8").write(SYNTH)
    done = subprocess.run(["typst", "compile", "--root", ROOT, "synth.typ"], cwd=out,
                          capture_output=True, text=True, encoding="utf-8", errors="replace")
    pdf = os.path.join(out, "synth.pdf")
    if not os.path.exists(pdf):
        raise RuntimeError("typst refused the synthetic page:\n" + done.stdout + done.stderr)
    doc = fitz.open(pdf)
    got = crossings(doc[0])
    doc.close()
    return got


def rebuild(name):
    out = os.path.join(ROOT, "typst", name)
    report = convert_paper(os.path.join(ROOT, "_work", "flat", name + ".tex"), out, name)
    doc = fitz.open(os.path.join(out, "main.pdf"))
    got = [(i + 1, h) for i, page in enumerate(doc) for h in crossings(page)]
    doc.close()
    return report, got


def show(tag, report, got):
    print("== %s: ok=%s compile=%s  shaft-through-letters pairs: %d"
          % (tag, report.get("ok"), report.get("compile_ok"), len(got)))
    for page_no, (d, seg, r, text) in sorted(got, key=lambda g: -g[1][0])[:6]:
        print("   p%-4d %5.1f pt through %r" % (page_no, d, text))


def main():
    got = synthetic()
    print("== synthetic page: one shaft through `crossed`, one 0.37cm under `clear` -> %d pairs"
          % len(got))
    for d, seg, r, text in sorted(got, key=lambda g: -g[0]):
        print("   %5.1f pt through %r" % (d, text))
    if len(sys.argv) < 2:
        return
    name = next(d for d in sorted(os.listdir(os.path.join(ROOT, "typst")))
                if d.startswith(sys.argv[1]))
    live = cetz.cd_label_off
    cetz.cd_label_off = lambda label, px, py: 0.45
    show("flat 0.45 offset, live side", *rebuild(name))
    cetz.cd_label_off = live
    show("live law          ", *rebuild(name))


if __name__ == "__main__":
    main()
