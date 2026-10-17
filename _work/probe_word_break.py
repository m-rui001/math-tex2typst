"""Why does a `text width` node break its words in half on our page?

The author's own style is `align=center, text width=3.2cm, inner sep=5pt`, so wrapping is right and
only the font metrics decide where. Our page renders the same label as `Finite FK compar / isons`,
which is not a TeX break. This re-compiles the paper's own `main.typ` with the two document settings
that could do it (`text.hyphenate`, `par.justify`) inserted at the top of its preamble, and reads the
label's words back off the figure page -- so the comparison is made with the paper's real font.
"""
import pathlib
import subprocess
import sys
import tempfile

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
import fitz  # noqa: E402

PAPER = "Self-dual-random-cluster-interfaces-below-one-September-23-2026"
src = pathlib.Path("typst/%s/main.typ" % PAPER).read_text(encoding="utf-8")

VARIANTS = {
    "as shipped": "",
    "no hyphenate": "#set text(hyphenate: false)\n",
    "no justify": "#set par(justify: false)\n",
    "neither": "#set text(hyphenate: false)\n#set par(justify: false)\n",
}

with tempfile.TemporaryDirectory() as tmp:
    for name, extra in VARIANTS.items():
        # the variant has to sit beside the original: the paper's own relative paths resolve there
        f = pathlib.Path("typst") / PAPER / "_variant.typ"
        f.write_text(extra + src, encoding="utf-8")
        out = pathlib.Path(tmp) / "t.pdf"
        r = subprocess.run(["typst", "compile", str(f), str(out)], capture_output=True)
        f.unlink()
        if r.returncode:
            print("%-13s FAIL %s" % (name, r.stderr.decode("utf-8", "replace")[:220]))
            continue
        doc = fitz.open(str(out))
        page = [p for p in doc if "Finite FK" in p.get_text()][0]
        words = [w[4] for w in page.get_text("words")]
        k = words.index("Finite")
        # U+00AD in a broken word is Typst's own soft hyphen, and the console here is GBK
        shown = " ".join(w.replace("\xad", "-") for w in words[k:k + 8])
        print("%-13s %s" % (name, shown.encode("ascii", "replace").decode()))
        doc.close()
