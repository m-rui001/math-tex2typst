r"""The last refused display: Exact-Birch-Swinnerton-Dyer's aligned block.

13 of the corpus' 14 remaining residue occurrences are this one display. split->aligned and
operatorname->mathrm did not unblock it, so the blocker is something else in the source. Read the
display out of the flat file and bisect it: drop the tag, drop the row break before \end,
flatten \text{\rm unit}, and try the combinations.
"""
import io
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import mathconv  # noqa: E402

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FLAT = ROOT / "_work" / "flat"

VARIANTS = [
    ("drop tag", lambda s: re.sub(r"\\tag\s*\*?\{[^{}]*\}", "", s)),
    ("trailing row break", lambda s: re.sub(r"\\\\\s*(?=\\end\{(?:split|aligned)\})", "", s)),
    ("text{rm}->mathrm", lambda s: re.sub(r"\\text\s*\{\s*\\mathrm\s*\{([^{}]*)\}\s*\}",
                                          r"\\mathrm{\1}", s)),
    ("trailing comma", lambda s: re.sub(r",\s*(?=\\\\\s*\\end\{(?:split|aligned)\})", "", s)),
    ("drop label", lambda s: re.sub(r"\\label\{[^{}]*\}", "", s)),
]


def main():
    path = next(FLAT.glob("Exact-Birch-Swinnerton*.tex"))
    src = path.read_text(encoding="utf-8", errors="replace")
    spans = [m.group(0) for m in re.finditer(r"\\begin\{(split|aligned)\}.*?\\end\{\1\}", src, re.S)]
    print("%s: %d split/aligned blocks" % (path.name[:40], len(spans)))
    for tex in spans[:2]:
        print("\n  block: %s" % " ".join(tex.split())[:200])
        # the display around it, which is what the emitter actually hands over
        i = src.find(tex)
        start = max(src.rfind("\\[", 0, i), src.rfind("\\begin{equation", 0, i),
                    src.rfind("\\begin{align", 0, i), src.rfind("\\begin{gather", 0, i))
        whole = src[start:src.find("\\end{", i + len(tex)) + 12] if start >= 0 else tex
        for name, cand in (("bare block", tex), ("whole display", whole)):
            ok = bool(mathconv.convert_formulas([cand], None)[0].get(0))
            print("    %-14s converts: %s" % (name, ok))
        for label, fix in VARIANTS:
            got = mathconv.convert_formulas([fix(whole)], None)[0].get(0)
            if got:
                print("    UNBLOCKED by %-18s -> %s" % (label, " ".join(got.split())[:160]))
        acc = whole
        hits = []
        for label, fix in VARIANTS:
            nxt = fix(acc)
            if nxt != acc:
                hits.append(label)
            acc = nxt
        print("    all together (%s): %s"
              % (",".join(hits), bool(mathconv.convert_formulas([acc], None)[0].get(0))))


main()
