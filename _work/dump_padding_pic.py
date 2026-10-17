r"""One paper's padding tokens, page against a fresh build, printed side by side.

The product scan flagged `Harmonic-heights...` with 21 lines whose `inset:` a fresh build never emits --
`0.07056cm`, `0.1411cm`, which are 2pt and 4pt and so are not any node's declared padding (nobody wrote
those). Before regenerating a page on the strength of that flag, print both sides: the page's canvas lines
that carry an `inset:`, and the same paper's freshly built canvases, so the tokens match the statements
that produced them. A flag that turns out to be a canvas the new code no longer builds at all would be a
loss, not a stale line.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
from probe_tip_product import canvases  # noqa: E402
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
INSET = re.compile(r"inset: (\((?:[^()]|\([^()]*\))*\)|[^,\]]+)")


def main():
    name = sys.argv[1]
    text = (ROOT / "typst" / name / "main.typ").read_text(encoding="utf-8", errors="replace")
    src = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8", errors="replace")
    page = list(canvases(text))
    print("page canvases %d" % len(page))
    for i, body in enumerate(page):
        hits = [(INSET.search(l).group(1).strip(), l.strip()) for l in body if INSET.search(l)]
        if hits:
            print(" canvas %d: %d inset lines" % (i, len(hits)))
            for tok, line in hits[:3]:
                print("   page>%-12s %s" % (tok, line[:90]))
    pics = list(PIC.finditer(src))
    print("source pictures %d" % len(pics))
    for j, m in enumerate(pics):
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), None)
        canvas = cetz.build(core) or cetz.build_cd(core)
        hits = [l for l in (canvas or "").splitlines() if INSET.search(l)]
        print(" pic %d: built=%s inset lines=%d" % (j, bool(canvas), len(hits)))
        for line in hits[:3]:
            print("   fresh>%s" % line.strip()[:100])


if __name__ == "__main__":
    main()
