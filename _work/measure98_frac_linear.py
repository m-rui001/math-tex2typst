r"""#96's last open branch, read at corpus scale: does pandoc ever linearize a GROUP-sided `\frac`?

`probe96_attrib.py` settled the law on eleven hand-written shapes: a simple `\frac{a}{b}` reaches Typst
as a bare `a / b`, a group-sided `\frac{L}{10(L-1)}` as the `frac(L, 10 \( L - 1 \))` call.  With
`measure97_bar_scope.py` showing that a bare slash binds exactly one atom per side (bar widths 3.97pt
TeX vs 3.98pt Typst, one glyph under the bar, tail outside), the bare form is faithful ONLY where the
source fraction really had one atom per side.

So the question left is the one an eleven-shape sample cannot close: across the corpus, is there a
`\frac` whose numerator or denominator is more than one atom and which pandoc still wrote as a bare
slash?  That is the only way #96's population can contain a real defect.  Feed real source maths
through the pipeline's own batch call and read the output beside the source's operand scope.

  python _work/measure98_frac_linear.py            # summary
  python _work/measure98_frac_linear.py --tsv      # also write _work/m98_linear.tsv
  python _work/measure98_frac_linear.py --page     # price the flagged spans against pdflatex
"""
import csv
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe97_pictures import FRAC, one_atom  # the same operand reader as #97's face gauge
from probe96_face import ATOM               # Typst's one-atom reader, the bar's real scope

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
from tools.t2t.mathconv import convert_formulas  # the pipeline's own pandoc batch

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SPAN = re.compile(r"\$([^$\n]+)\$")
SAMPLE = 700


def spans():
    """Body-channel maths carrying a `\frac`-family command, spread over the corpus."""
    out = []
    for f in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        paper = os.path.basename(f)[:-4]
        text = open(f, encoding="utf-8", errors="replace").read()
        pic_spans = set()
        for pic in PIC.finditer(text):
            for s in SPAN.finditer(pic.group(0)):
                pic_spans.add(s.group(1))
        for s in SPAN.finditer(text):
            tex = s.group(1)
            if tex in pic_spans or not FRAC.search(tex):
                continue
            out.append((paper, tex))
    return out


def bare_slashes(typst):
    """Positions of slashes that Typst will read as a fraction bar: not `\\/`, not `"/"`, not `/` in a name."""
    got = []
    for m in re.finditer(r"/", typst):
        i = m.start()
        if i and typst[i - 1] == "\\":
            continue
        if i and typst[i - 1] == '"':
            continue
        got.append(i)
    return got


def scope_of(tex, at):
    """('simple'|'group', num, den) for the `\frac` occurrence starting at `at` in the source."""
    m = FRAC.match(tex, at)
    if not m:
        return None
    if m.group(2) is not None:
        num, den = m.group(2), m.group(3)
    else:
        num, den = m.group(4), m.group(5)
    return ("simple" if one_atom(num) and one_atom(den) else "group", num, den)


def page(bad):
    """Price the flagged shapes on the page: the emitted Typst against a pdflatex control of the source.

    The gauge is the bar's x-extent and the number of glyph centres under it -- if the bare slash
    really lost atoms, Typst's bar is narrower than TeX's and carries fewer glyphs.
    """
    import measure93_slash_fidelity as ruler      # compile_()/control(): #93's page ruler
    from measure97_bar_scope import bars          # the bar reader, one place in the corpus

    tmp = os.path.join(ROOT, "_work", "_m98lin")
    ruler.TMP = tmp
    os.makedirs(tmp, exist_ok=True)
    print("\n== page reading of the flagged spans (bar width, glyphs under the bar)")
    for k, (paper, tex, body, _groups) in enumerate(bad):
        key = "lin%d" % k
        ruler.control(key, "q", "$" + tex + "$")
        ctrl, _n = bars(os.path.join(tmp, key + ".pdf"), "")
        got = ruler.compile_(os.path.join(tmp, key + ".typ"),
                             ruler.PRE + "#text(size: 10pt)[%s]\n" % body)
        print("\n   %-40s  TeX %s" % (paper[:40], tex[:56].replace("\n", " ")))
        print("   %-40s  CTRL %s" % ("", ["%.2fpt/%d" % (x1 - x0, u) for x0, x1, _y, u in ctrl]))
        if isinstance(got, list):
            print("   %-40s  TYPST failed %s" % ("", got))
            continue
        read, _n = bars(got, "")
        print("   %-40s  TYPST %s   %s" % ("", ["%.2fpt/%d" % (x1 - x0, u) for x0, x1, _y, u in read],
                                           body[:58].replace("\n", " ")))


def main():
    tsv = "--tsv" in sys.argv
    pool = spans()
    step = max(1, len(pool) // SAMPLE)
    sample = pool[::step][:SAMPLE]
    got, refused, err = convert_formulas([t for _p, t in sample])
    print("pool=%d body-channel maths carrying a `\\frac`-family command, sampled=%d, "
          "pandoc answered=%d, refused=%d" % (len(pool), len(sample), len(got), len(refused)))
    if err:
        print("pandoc stderr: %s" % err[:300])

    rows, bad = [], []
    counts = {}
    for i, (paper, tex) in enumerate(sample):
        body = got.get(i)
        if body is None:
            continue
        slashes = bare_slashes(body)
        kinds = []
        for m in FRAC.finditer(tex):
            sc = scope_of(tex, m.start())
            if sc:
                kinds.append(sc[0])
        frac_calls = body.count("frac(")
        key = "%s|%s" % ("/".join(sorted(set(kinds))) or "none", "bare" if slashes else "stacked")
        counts[key] = counts.get(key, 0) + 1
        rows.append((paper, tex[:70].replace("\n", " "), key, str(len(slashes)),
                     str(frac_calls), body[:70].replace("\n", " ")))

    print("\nemitted form by source operand scope:")
    for k in sorted(counts, key=lambda x: -counts[x]):
        print("   %-28s %d" % (k, counts[k]))

    # the decisive count: group-sided source, no `frac(` call anywhere near, bare slash present
    for i, (paper, tex) in enumerate(sample):
        body = got.get(i)
        if body is None:
            continue
        slashes = bare_slashes(body)
        if not slashes:
            continue
        groups = [scope_of(tex, m.start()) for m in FRAC.finditer(tex)]
        groups = [g for g in groups if g and g[0] == "group"]
        if groups and "frac(" not in body:
            bad.append((paper, tex, body, groups))
    print("\nGROUP-sided source fraction emitted as a bare slash with no `frac(` call: %d spans" % len(bad))
    for p, tex, body, groups in bad[:12]:
        print("   %-40s  %s" % (p[:40], tex[:64].replace("\n", " ")))
        print("   %-40s  -> %s" % ("", body[:74].replace("\n", " ")))
        print("   %-40s     operands: %s" % ("", [(g[1][:18], g[2][:18]) for g in groups][:2]))
    if "--page" in sys.argv:
        page(bad)
    if tsv:
        out = os.path.join(ROOT, "_work", "m98_linear.tsv")
        with open(out, "w", encoding="utf-8", newline="") as fh:
            w = csv.writer(fh, delimiter="\t")
            w.writerow(["paper", "source", "form", "bare_slashes", "frac_calls", "typst"])
            w.writerows(rows)
        print("\nwrote %s" % out)
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
