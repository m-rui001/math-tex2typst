"""Why does the product carry more named-head canvases than #43 changed?

``probe_tip_product.py`` reads the emitted ``main.typ`` and counts canvases with a ``symbol:`` mark
(463) inside the papers whose source writes ``>=`` somewhere. The stub-diff guard (
``probe_tip_regen_guard.py``) counts the canvases whose marks #43 actually reheads (432). Two gauges,
two numbers -- so this asks, over every picture that BUILDS in those papers, where a named head comes
from: the picture's own ``>=`` default, or a tip the author wrote on the arrow itself
(``-{Stealth}``, which #36 already taught the emitter). Anything left over is printed with its source
so the gap is a list of statements, not an argument.
"""
import pathlib
import re
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.path.insert(0, str(ROOT / "_work"))
from t2t import cetz  # noqa: E402
from probe_tip_product import SYMBOL, canvases  # noqa: E402  (one canvas splitter, two gauges)

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
GE = re.compile(r">=\s*(?:\{\s*[A-Za-z]+\s*\}|[A-Za-z]+)")
TIP = re.compile(r"-\s*\{|-(?:Stealth|Latex|latex|stealth|Triangle|Circle|Square|to)\b")
MARK = re.compile(r"mark: \([^\n]*")


def main():
    changed = decl_no_bare = explicit_only = unexplained = 0
    lines_changed = lines_dn = lines_exp = lines_un = 0
    unexplained_pics = []
    build_decl = {}
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        src = path.read_text(encoding="utf-8", errors="replace")
        if ">=" not in src:
            continue
        for pic in PIC.findall(src):
            built = cetz.build(pic)
            if built is None:
                continue
            marks = [m for m in MARK.findall(built) if "symbol:" in m]
            if not marks:
                continue
            bare = [m for m in MARK.findall(built)
                    if "symbol:" not in m and re.search(r'"[<>]"', m)]
            if GE.search(pic):
                build_decl[path.stem] = build_decl.get(path.stem, 0) + 1
                if bare:
                    changed += 1
                    lines_changed += len(marks)
                else:
                    decl_no_bare += 1
                    lines_dn += len(marks)
            elif TIP.search(pic):
                explicit_only += 1
                lines_exp += len(marks)
            else:
                unexplained += 1
                lines_un += len(marks)
                unexplained_pics.append((path.stem, pic[:300], marks[:3]))
    print("canvases with a named head, in papers whose source writes `>=`:")
    print("   declares `>=` and still emits a bare head (the #43 residue): %d canvases, %d lines"
          % (changed, lines_changed))
    print("   declares `>=`, every head now carries a symbol            : %d canvases, %d lines"
          % (decl_no_bare, lines_dn))
    print("   no `>=` in that picture, tip written on the arrow itself  : %d canvases, %d lines"
          % (explicit_only, lines_exp))
    print("   neither                                                   : %d canvases, %d lines"
          % (unexplained, lines_un))
    for stem, blob, marks in unexplained_pics[:8]:
        print("--- %s\n%s\n   marks: %s" % (stem[:58], blob, marks))

    # Same predicate, other gauge: how many canvases in the EMITTED typ of each of
    # those papers carry a named head. A declaring picture that the converter refused
    # never reaches the page, so the per-paper shortfall is the refusal list.
    print("\nper paper: declaring canvases that build vs canvases with a named head on the page")
    short = 0
    for stem, n in sorted(build_decl.items()):
        typ_path = ROOT / "typst" / stem / "main.typ"
        if not typ_path.is_file():
            print("   NO PRODUCT %s (%d)" % (stem[:58], n))
            continue
        typ = typ_path.read_text(encoding="utf-8", errors="replace")
        m = sum(1 for b in canvases(typ)
                if any("mark:" in l and SYMBOL.search(l) for l in b))
        if m < n:
            short += 1
            print("   %-58s build %d  page %d" % (stem[:58], n, m))
    print("   papers where the page carries fewer named canvases than build: %d" % short)
    return 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
