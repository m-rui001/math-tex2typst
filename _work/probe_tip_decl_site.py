r"""Where does a `>=` declaration end up once the option reader is done with it?

The measurement (`_work/measure_tikz_tips.py`) says a `>=<name>` re-heads a bare `->` from any of the
three sites a statement's option list is built from -- the picture head, a `/.style` the statement
invokes, the statement's own brackets -- and that the ORDER inside the list is irrelevant. #43's guard
reads only the first of those, so six canvases still draw an open V (`_work/probe_tip_residue.py`).
Before choosing where to read from, this asks what the reader leaves behind:

- `opts()` for each spelling, braced and not, so a `{Stealth}` value reaches `TIP_WORDS` as `Stealth`;
- the picture head's own `>` value for the six, and whether a declaring statement's *merged* options
  carry `>` (which is what would let `arrow_mark` answer from `o` alone).
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
GE = re.compile(r">=\s*(?:\{\s*([A-Za-z]+)\s*\}|([A-Za-z]+))")
MARK = re.compile(r"mark: \([^)]*\)")
ANGLE = re.compile(r'"[<>]"')

for text in (r">=Stealth", r">={Stealth}", r">= {Latex}", r">=stealth",
             r">={latex},line width=.45pt"):
    got = cetz.opts(text)
    print("opts(%-22s) -> %r   guard: %r"
          % (text, got.get(">"), cetz.arrow_default(got.get(">"))))

RES = ("A-nondegenerate-counterexample-to-the-Morse-number-Arnold-bound",
       "A-power-saving-for-intersective-polynomial-differences",
       "An-unconditional-first-moment-for-cubic-Gauss-sums",
       "Bochner-Riesz-Multipliers-in-Three-Dimensions",
       "Combinatorial-Invariance-of-Kazhdan-Lusztig-Polynomials",
       "Exact-Derandomization-of-Logarithmic-Space-L-equals-RL-equ")

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    if not path.stem.startswith(RES):
        continue
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(src):
        if not GE.search(pic):
            continue
        built = cetz.build(pic)
        if built is None:
            continue
        bare = [l for l in built.splitlines()
                if "mark:" in l and "symbol:" not in l and ANGLE.search(l)]
        if not bare:
            continue
        m = re.match(r"\\begin\{tikzpicture\}\s*\[([^\]]*)\]", pic)
        hd = cetz.opts(m.group(1)) if m else {}
        print("== %s" % path.stem[:58])
        print("   head '>'  %r  -> guard %r" % (hd.get(">"), cetz.arrow_default(hd.get(">"))))
        styles = cetz.picture_styles(hd)
        for name, val in sorted(styles.items()):
            if ">" in val:
                print("   style %-14s '>' %r -> guard %r"
                      % (name, val.get(">"), cetz.arrow_default(val.get(">"))))
        for stmt in re.findall(r"\\(?:draw|path|fill|filldraw|shade)\s*(?:\[[^\]]*\])?", pic):
            o = cetz.resolve_opts(cetz.opts(re.match(r"\\?\w+\s*(?:\[([^\]]*)\])?",
                                                     stmt).group(1) or ""),
                                  styles, False)
            if ">" in o:
                print("   stmt %-40s merged '>' %r" % (stmt[-40:], o.get(">")))
