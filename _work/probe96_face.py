r"""#96 face: where does a BARE `/` sit in the product's body maths, and how far does its run go?

**Read this as a shape census, not as a defect list.** The walker was written to size a case against Typst
stacking a bare slash over the rest of the span (the 轴 75 律一 wording), and that premise was measured and
refuted in the round that followed: `_work/measure97_bar_scope.py` ruled on the bar itself -- one atom under it,
the same width and the same glyph count as a `frac(a, b)` call -- so the labels faithful/runaway below name the
*shape of the run*, not a fault.  See 轴 77; #96 was withdrawn.  The counts are still the population of that
shape in the products, and a future slash round starts from them.

Channel gauge established the population (`_work/probe94_bare_slash.py`, one walker with #93): the product's
`$ ... $` maths carries a **bare** `/` in **19,318 sites over 673 papers** (that old walker's *span* count was
14,367 over 672; this one reports 14,342 spans -- see `_work/probe96_reconcile.py`), **0 of them on a canvas**.
The reason is pandoc's Typst writer: a slash the author *typed* reaches Typst escaped (`G/P` -> `G \/ P`, which
is ink), while a `\\frac{a}{b}` whose two sides are each a single atom is written **bare** (`1 / 2`) --
`_work/probe96_attrib.py`, and at corpus scale `_work/measure98_group_frac.py`.

This answers three things per site, statically, and cross-checks the attribution against the flat source:
  1  is the bare slash the LAST thing in its span, or does the run continue past it?
  2  what does the run contain -- a relation, a comma/period, a bare letter?
  3  does the source really write `\\frac{num}{den}` there?  (num/den read off the product, matched in the .tex)

  python _work/probe96_face.py            # census
  python _work/probe96_face.py --tsv      # also write _work/m96_face.tsv
"""
import csv
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import canvases  # one canvas walker, #93's -- body is what is left

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MATH = re.compile(r"\$[^$\n]+\$")
# one denominator atom: a `\( ... \)` group, a word/number with optional sub/superscript, or one symbol
ATOM = re.compile(r"\\\((?:[^()]|\([^()]*\))*\\\)|[A-Za-z0-9]+(?:[_^]\([^)]*\)|[_^][A-Za-z0-9])?|[^\s]")
RELATION = re.compile(r"lt\.eq|gt\.eq|eq\.|neq|leq|geq|<|>|=|in|prec|sim|approx|parallel|vdash")


def unescape(typst):
    """pandoc's escaped punctuation back to the plain characters the source used."""
    return re.sub(r"\\([/(){}\[\]|,])", r"\1", typst)


def read_off(text, pos):
    """(numerator, denominator, rest) around the bare `/` at `pos` in a maths string."""
    before = text[:pos]
    after = text[pos + 1:]
    m = None
    for m in ATOM.finditer(before):
        pass
    num = m.group(0) if m else ""
    stripped = after.lstrip()
    lead = len(after) - len(stripped)
    dm = ATOM.match(stripped)
    den = dm.group(0) if dm else ""
    rest = stripped[len(den):].strip()
    spaced = lead > 0 and bool(after.strip())
    return num, den, rest, spaced


def main():
    tsv = "--tsv" in sys.argv
    flat = {}
    for f in glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")):
        flat[os.path.basename(f)[:-4]] = open(f, encoding="utf-8", errors="replace").read()

    sites = []
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        paper = os.path.basename(os.path.dirname(path))
        text = open(path, encoding="utf-8", errors="replace").read()
        blocks = canvases(text)
        body_text = text
        for c in blocks:
            body_text = body_text.replace(c, " ", 1)
        src = None
        for stem, t in flat.items():
            if stem.startswith(paper[:44]) or paper.startswith(stem[:44]):
                src = t
                break
        for span in MATH.findall(body_text):
            inner = span.strip("$")
            masked = re.sub(r'"[^"\n]*"', lambda m: " " * len(m.group(0)), inner)
            for m in re.finditer(r"(?<!\\)/", masked):
                num, den, rest, spaced = read_off(masked, m.start())
                kind = "last-in-span" if not rest else (
                    "relation" if RELATION.search(rest) else ("word" if re.match(r"[A-Za-z]", rest) else "symbol"))
                frac = ""
                if src is not None and num and den:
                    pat = r"\\[dt]?frac\s*\{\s*%s\s*\}\s*\{\s*%s\s*\}" % (
                        re.escape(unescape(num)), re.escape(unescape(den)))
                    frac = "yes" if re.search(pat, src) else "no"
                sites.append((paper, kind, "yes" if spaced else "no", frac, len(rest),
                              span.replace("\n", " ")[:150]))

    by_kind = {}
    for s in sites:
        by_kind[s[1]] = by_kind.get(s[1], 0) + 1
    papers = {s[0] for s in sites}
    print("bare `/` in body maths: %d sites over %d papers" % (len(sites), len(papers)))
    for kind, n in sorted(by_kind.items(), key=lambda kv: -kv[1]):
        sel = [s for s in sites if s[1] == kind]
        hit_yes = sum(1 for s in sel if s[3] == "yes")
        hit_no = sum(1 for s in sel if s[3] == "no")
        hit_none = sum(1 for s in sel if s[3] == "")
        spaced = sum(1 for s in sel if s[2] == "yes")
        print("   %-13s sites=%-7d papers=%-4d spaced=%-6d source-frac matched yes=%d no=%d no-source=%d"
              % (kind, len(sel), len(set(s[0] for s in sel)), spaced, hit_yes, hit_no, hit_none))
    runaway = [s for s in sites if s[1] != "last-in-span"]
    print("\nrunaway (denominator continues past the atom): %d sites over %d papers"
          % (len(runaway), len({s[0] for s in runaway})))
    for s in runaway[:12]:
        print("   %-42s %-9s %s" % (s[0][:42], s[1], s[5]))
    if tsv:
        out = os.path.join(ROOT, "_work", "m96_face.tsv")
        with open(out, "w", encoding="utf-8", newline="") as fh:
            w = csv.writer(fh, delimiter="\t")
            w.writerow(["paper", "kind", "spaced", "source_frac", "rest_len", "span"])
            w.writerows(sites)
        print("\nwrote %s" % out)
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
