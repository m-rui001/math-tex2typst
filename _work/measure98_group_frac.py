r"""#96's remaining branch: what does pandoc do to a `\frac` whose operands are MORE THAN ONE atom?

`measure98_frac_linear.py` sampled 700 real body maths and found the bare-slash population faithful:
every one sits where the TeX fraction had one atom per side (`beta^2 / 2` -- bar 8.42pt Typst against
8.76pt TeX, one glyph under each).  Its "group" flags were that gauge's operand reader failing on
control sequences (ATOM eats a backslash as one symbol, so `\beta^2` reads as three atoms).  What the
sample did NOT contain is the shape that could really break: `\frac{a+b}{2}` linearized as `a + b / 2`,
where Typst's bar covers `b` while TeX's covered `a+b`.

So ask that shape directly.  Count each operand's top-level TeX atoms (`\beta^2` and `\frac` count as
one, `a+b` as three), take the real spans with a multi-atom side, and read back what the pipeline's own
pandoc call writes.  `frac(...)` is the faithful answer; a bare slash here is the defect #96 was filed for.

  python _work/measure98_group_frac.py            # summary
  python _work/measure98_group_frac.py --page     # price the flagged spans against a pdflatex control
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from probe97_pictures import FRAC  # the `\frac` operand finder #97's face gauge uses
from tools.t2t.mathconv import convert_formulas

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SPAN = re.compile(r"\$([^$\n]+)\$")
CS = re.compile(r"\\[a-zA-Z]+|\\.")


def _step(s, i):
    """Index just past one atom or script argument starting at `i`."""
    if s[i] == "{":
        depth = 0
        while i < len(s):
            if s[i] == "{":
                depth += 1
            elif s[i] == "}":
                depth -= 1
                if depth == 0:
                    return i + 1
            i += 1
        return i
    if s[i].isdigit() or s[i] == ".":
        # a numeral is one atom in TeX and one number literal in Typst -- counting its digits apart
        # flags `\frac{43}{100}` as multi-atom, which it is not.
        while i < len(s) and (s[i].isdigit() or s[i] == "."):
            i += 1
        return i
    m = CS.match(s, i)
    return m.end() if m else i + 1


def atoms(s):
    """Top-level TeX atoms in an operand; scripts (_/, ^) stick to the atom before them."""
    i, n = 0, 0
    while i < len(s):
        if s[i].isspace():
            i += 1
            continue
        i = _step(s, i)
        n += 1
        while i < len(s) and s[i] in "_^":
            i = _step(s, i + 1)
    return n


def operands(tex):
    """[(numerator, denominator)] for every `\frac`-family command in the span."""
    out = []
    for m in FRAC.finditer(tex):
        if m.group(2) is not None:
            out.append((m.group(2), m.group(3)))
        elif m.group(4) is not None:
            out.append((m.group(4), m.group(5)))
    return out


def bare_slashes(typst):
    """Slashes Typst will read as a fraction bar: not `\\/` (ink), not `"/"` (the #93 glyph)."""
    return [m.start() for m in re.finditer(r"/", typst)
            if typst[max(m.start() - 1, 0):m.start()] not in ("\\", '"')]


def main():
    page = "--page" in sys.argv
    pool, multi = [], []
    for f in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        paper = os.path.basename(f)[:-4]
        text = open(f, encoding="utf-8", errors="replace").read()
        inside = set()
        for pic in PIC.finditer(text):
            for s in SPAN.finditer(pic.group(0)):
                inside.add(s.group(1))
        for s in SPAN.finditer(text):
            tex = s.group(1)
            if tex in inside or not FRAC.search(tex):
                continue
            ops = [(atoms(n), atoms(d)) for n, d in operands(tex)]
            pool.append((paper, tex, ops))
            if any(n > 1 or d > 1 for n, d in ops):
                multi.append((paper, tex, ops))

    print("body-channel `$...$` maths carrying a `\\frac`: %d spans over %d papers"
          % (len(pool), len({p[0] for p in pool})))
    print("operand lexer self-check: " + "  ".join(
          "%s->%d" % (w, atoms(w)) for w in
          (r"\beta^2", r"a_0^3", "a+b", r"c_*", "43", "6000n^2", "10(L-1)", r"\pi/4", r"2\delta")))
    print("of those, a MULTI-ATOM side in %d spans over %d papers"
          % (len(multi), len({p[0] for p in multi})))
    sel = multi[:250]
    got, refused, _err = convert_formulas([t for _p, t, _k in sel])
    print("fed %d to the pipeline's own pandoc call: answered %d, refused %d\n"
          % (len(sel), len(got), len(refused)))

    bare, stacked, other = [], 0, 0
    for i, (paper, tex, kinds) in enumerate(sel):
        body = got.get(i)
        if body is None:
            continue
        if bare_slashes(body):
            bare.append((paper, tex, body, kinds))
        elif "frac(" in body:
            stacked += 1
        else:
            other += 1
    print("multi-atom source fraction -> bare slash %d   -> `frac(...)` call %d   -> neither %d"
          % (len(bare), stacked, other))
    for paper, tex, body, kinds in bare[:20]:
        print("   %-38s %-58s" % (paper[:38], tex[:58].replace("\n", " ")))
        print("   %-38s -> %s   atoms %s" % ("", body[:60].replace("\n", " "), kinds))
    if page and bare:
        import measure93_slash_fidelity as ruler
        from measure97_bar_scope import bars
        tmp = os.path.join(ROOT, "_work", "_m98grp")
        ruler.TMP = tmp
        os.makedirs(tmp, exist_ok=True)
        print("\n== page reading of the flagged spans")
        for k, (paper, tex, body, _kinds) in enumerate(bare[:12]):
            key = "grp%d" % k
            ruler.control(key, "q", "$" + tex + "$")
            ctrl, _n = bars(os.path.join(tmp, key + ".pdf"), "")
            pdf = ruler.compile_(os.path.join(tmp, key + ".typ"),
                                 ruler.PRE + "#text(size: 10pt)[%s]\n" % body)
            print("\n   %-38s  TeX %s" % (paper[:38], tex[:56].replace("\n", " ")))
            print("   %-38s  CTRL %s" % ("", ["%.2fpt/%d glyphs" % (x1 - x0, u)
                                              for x0, x1, _y, u in ctrl]))
            if isinstance(pdf, list):
                print("   %-38s  TYPST failed %s" % ("", pdf))
                continue
            read, _n = bars(pdf, "")
            print("   %-38s  TYPST %s   %s" % ("", ["%.2fpt/%d glyphs" % (x1 - x0, u)
                                                    for x0, x1, _y, u in read],
                                               body[:50].replace("\n", " ")))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
