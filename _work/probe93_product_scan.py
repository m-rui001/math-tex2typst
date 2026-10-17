r"""#93 emission-side scan of the SHIPPED products: what shape does a canvas slash have on disk?

The round's whole claim is about the glyph inside a canvas maths string, and the product `main.typ`
is the record of what the emitter sent: a `$...$` in a `#cetz.canvas({...})` whose slash sits BARE
is Typst's stacked fraction on the page, one whose slash sits inside the quoted string `"/"` is the
glyph.  Body maths is deliberately out of scope -- a fraction the author wrote in a display
equation is meant to stack -- so the scan walks each canvas's braces and reads only the maths
strings inside it.

Read-only against `typst/<paper>/main.typ`; no typst, no tools/.

  python _work/probe93_product_scan.py
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

TY = os.path.join(ROOT, "typst")
CANVAS = "#cetz.canvas("


def canvases(text):
    """the `{...}` argument of every #cetz.canvas( call, braces matched."""
    out = []
    at = 0
    while True:
        i = text.find(CANVAS, at)
        if i < 0:
            return out
        j = text.find("{", i, i + len(CANVAS) + 200)
        if j < 0:
            return out
        depth = 0
        k = j
        while k < len(text):
            if text[k] == "{":
                depth += 1
            elif text[k] == "}":
                depth -= 1
                if not depth:
                    break
            k += 1
        out.append(text[j:k + 1])
        at = k + 1


def spans(canvas):
    """every $...$ maths string in one canvas."""
    return re.findall(r"\$[^$]*\$", canvas)


def bare(maths):
    r"""a slash that sits outside a quoted string and outside pandoc's escape.

    `\/` is what pandoc's Typst writer puts a literal division slash through, and Typst prints the
    escaped form as the glyph itself -- `_work/measure94_channel.py` feeds the author's TeX through the
    pipeline's own `run_pandoc` and 10/10 shapes come back with every slash escaped.  Reading it as a
    bare one puts a stacked fraction on the page that is not there: the first version of this scan
    counted 12 such "residues" over 4 papers, and all 12 were `\/`.
    """
    stripped = re.sub(r'"[^"\n]*"', "", maths)
    return len(re.findall(r"(?<!\\)/", stripped))


def main():
    papers = sorted(d for d in os.listdir(TY)
                    if os.path.exists(os.path.join(TY, d, "main.typ")))
    total_math = slash_spans = bare_spans = quoted = 0
    bare_papers = quoted_papers = 0
    shown = 0
    for d in papers:
        path = os.path.join(TY, d, "main.typ")
        text = open(path, encoding="utf-8", errors="replace").read()
        has_bare = has_quoted = False
        for c in canvases(text):
            for s in spans(c):
                total_math += 1
                n_bare, n_quoted = bare(s), s.count('"/"')
                if n_bare:
                    slash_spans += n_bare
                    bare_spans += 1
                    has_bare = True
                    if shown < 20:
                        shown += 1
                        print("   BARE  %-44s %s" % (d[:44], re.sub(r"\s+", " ", s)[:90]))
                if n_quoted:
                    quoted += n_quoted
                    has_quoted = True
                if n_bare and n_quoted:
                    print("   MIXED %s %s" % (d[:44], s[:70]))
        bare_papers += has_bare
        quoted_papers += has_quoted
    print("papers scanned %d   canvas maths strings %d" % (len(papers), total_math))
    print("BARE slash   : %d slashes in %d strings over %d papers" % (slash_spans, bare_spans, bare_papers))
    print('QUOTED "/": %d glyphs in %d papers' % (quoted, quoted_papers))
    return 0


if __name__ == "__main__":
    sys.exit(main())
