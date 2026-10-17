"""What does each TikZ arrow tip occupy?  (pdflatex + fitz)

Each spelling draws one horizontal arrow, and the head is whatever path pdflatex leaves behind that
is shorter than the line: its bbox is the tip's length and width, `fill` says whether it is a solid
head or an open V. This is the target the CeTz marks have to match -- measured, not named.

The log line prints `\\typeout` anchors, but geometry comes out of the PDF.

The last block is the picture-wide `>=<name>` default (axis 21, #43). pgf reads it as "this is what the
characters `>` and `<` now mean", so it re-drawes every bare `->` in the picture -- 453 of the corpus'
pictures write it (`_work/probe_tip_default_face.py`). The prelude loads `arrows.meta` because 476 flat
papers load it and the capitalized names are only defined by that library: without it
`\begin{tikzpicture}[>=Stealth]` is a fatal error, which is why the same name measured in two modes.
"""
import os
import re
import subprocess
import sys
import tempfile

sys.stdout.reconfigure(errors="replace")

PRELUDE = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\usetikzlibrary{arrows.meta}
\pagestyle{empty}
\begin{document}
"""

SPECS = [
    ("->", r"\draw[->] (0,0) -- (3,0);"),
    ("-latex", r"\draw[-latex] (0,0) -- (3,0);"),
    ("-Latex", r"\draw[-Latex] (0,0) -- (3,0);"),
    ("-Stealth", r"\draw[-Stealth] (0,0) -- (3,0);"),
    ("-Stealth2mm", r"\draw[-{Stealth[length=2mm]}] (0,0) -- (3,0);"),
    ("-Latex2mm", r"\draw[-{Latex[length=2mm]}] (0,0) -- (3,0);"),
    ("-stealth", r"\draw[-stealth] (0,0) -- (3,0);"),
    ("-to", r"\draw[-to] (0,0) -- (3,0);"),
    ("-Triangle", r"\draw[-Triangle] (0,0) -- (3,0);"),
    ("-o", r"\draw[-o] (0,0) -- (3,0);"),
    ("-x", r"\draw[-x] (0,0) -- (3,0);"),
    ("-|", r"\draw[-|] (0,0) -- (3,0);"),
    ("-]", r"\draw[-] (0,0) -- (3,0);"),
    ("bare >", r"\draw (0,0) -- (3,0);"),
    ("-Stealth3", r"\draw[-{Stealth[length=3mm,width=2mm]}] (0,0) -- (3,0);"),
    ("scale 2x", r"\draw[-{Stealth[scale=2]}] (0,0) -- (3,0);"),
    # the picture-wide default, `>=<name>`: same `->` line, different meaning of the character
    ("ge: none", r"\draw[->] (0,0) -- (3,0);", ""),
    ("ge: latex", r"\draw[->] (0,0) -- (3,0);", ">=latex"),
    ("ge: Latex", r"\draw[->] (0,0) -- (3,0);", ">=Latex"),
    ("ge: stealth", r"\draw[->] (0,0) -- (3,0);", ">=stealth"),
    ("ge: Stealth", r"\draw[->] (0,0) -- (3,0);", ">=Stealth"),
    ("ge: Stealth*", r"\draw[->] (0,0) -- (3,0);\draw[<-] (0,-1) -- (3,-1);", ">=Stealth"),
    # ...and where else a `>=` may legally be written. Six corpus canvases still draw an open V
    # (_work/probe_tip_residue.py) because their declaration sits on a statement or inside a
    # `/.style`, so each site is measured against the picture head, in both option orders.
    ("site: stmt >= then ->", r"\draw[>=stealth,->] (0,0) -- (3,0);"),
    ("site: stmt -> then >=", r"\draw[->,>=stealth] (0,0) -- (3,0);"),
    ("site: style >= then ->", r"\draw[c] (0,0) -- (3,0);", "",
     r"\tikzset{c/.style={>=stealth,->}}"),
    ("site: style -> then >=", r"\draw[c] (0,0) -- (3,0);", "",
     r"\tikzset{c/.style={->,>=stealth}}"),
    ("site: head + style ->", r"\draw[c] (0,0) -- (3,0);", ">=Stealth",
     r"\tikzset{c/.style={->}}"),
    ("site: head braced", r"\draw[->] (0,0) -- (3,0);", ">={Stealth}"),
    ("site: stmt later leak", r"\draw[>=stealth,->] (0,0) -- (3,0);\draw[->] (0,-1) -- (3,-1);"),
    ("site: scope leaks out", r"\begin{scope}[>=stealth]\draw[->] (0,0) -- (3,0);\end{scope}"
                              r"\draw[->] (0,-1) -- (3,-1);"),
]


def doc(spec, opts="", lib="meta", pre=""):
    prelude = PRELUDE if lib == "meta" else PRELUDE.replace(
        "\\usetikzlibrary{arrows.meta}\n", "")
    return (prelude + (pre + "\n" if pre else "")
            + "\\begin{tikzpicture}[x=1cm,y=1cm" + ("," + opts if opts else "")
            + "]\n" + spec + "\n\\end{tikzpicture}\n\\end{document}\n")


def heads(pdf):
    """Every drawn path on the page: (length, width, filled, item kinds, n)."""
    import fitz
    d = fitz.open(pdf)
    out = []
    for x in d[0].get_drawings():
        r = x["rect"]
        kinds = sorted({i[0] for i in x["items"]})
        out.append((round(r.width, 2), round(r.height, 2), x.get("fill") is not None,
                    kinds, len(x["items"])))
    d.close()
    return out


def main():
    tmp = tempfile.mkdtemp()
    tex = os.path.join(tmp, "t.tex")
    for case in SPECS:
        name, spec, opts, pre = (case + ("", "", ""))[:4]
        for suffix in ("pdf", "log", "aux"):
            try:
                os.remove(os.path.join(tmp, "t." + suffix))
            except OSError:
                pass
        open(tex, "w", encoding="utf-8").write(doc(spec, opts, pre=pre))
        r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", tmp, tex],
                           capture_output=True, cwd=tmp)
        pdf = os.path.join(tmp, "t.pdf")
        if r.returncode or not os.path.exists(pdf):
            err = (r.stdout or b"").decode("utf-8", "replace")
            line = next((l for l in err.splitlines() if l.startswith("!")), "(see log)")
            print("%-22s FAIL %s" % (name, line[:90]))
            continue
        got = heads(pdf)
        # the head is a short path; the line is the long one
        short = [g for g in got if g[0] < 20]
        long_ = [g for g in got if g[0] >= 20]
        print("%-22s paths=%d  line=%d  heads=%s" % (name, len(got), len(long_), short))


if __name__ == "__main__":
    main()
