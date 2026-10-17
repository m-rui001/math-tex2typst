r"""Which pages still print a figure formula as a quoted string the converter would no longer emit.

The guard fix (`math_safe`'s "script with no base" test, cetz.py:1264) changes what a formula LOOKS
LIKE on the page: `$"P_(y,b)=P'_( iota (y),b')"$` becomes `$P_(y,b)=P'_( iota (y),b')$`. So the
regeneration list is a token comparison, not a count: read every quoted math string off the CANVAS
lines of the emitted page, build the same paper's pictures again with the batch's own column width
(`line_cm(prep.parse_preamble(src))` -- a probe that passes None cannot build a `\linewidth`-sized
picture and reports the whole page stale, the #45 trap), and call anything the page has and a fresh
build never emits stale. Writes `_work/regen_needed.txt`.
"""
import pathlib
import re
import sys
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from probe_tip_product import canvases  # noqa: E402  the proven line-position splitter
from t2t import cetz, prep  # noqa: E402
from t2t.convert import line_cm  # noqa: E402  the batch's own \linewidth -> cm

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
QUOTED = re.compile(r'\$"[^"]*"\$')


def tokens(text):
    got = Counter()
    for line in text.splitlines():
        for m in QUOTED.finditer(line):
            got[m.group(0)] += 1
    return got


def main():
    stale = []
    for typ in sorted((ROOT / "typst").glob("*/main.typ")):
        name = typ.parent.name
        src = ROOT / "_work" / "flat" / (name + ".tex")
        if not src.exists():
            continue
        source = src.read_text(encoding="utf-8", errors="replace")
        page = Counter()
        for body in canvases(typ.read_text(encoding="utf-8", errors="replace")):
            page += tokens("\n".join(body))
        if not page:
            continue
        try:
            wide = line_cm(prep.parse_preamble(source))
        except Exception:
            wide = None
        fresh = Counter()
        for m in PIC.finditer(source):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), wide)
            canvas = cetz.build(core) or cetz.build_cd(core)
            if canvas:
                fresh += tokens(canvas)
        gone = page - fresh
        if gone:
            stale.append((sum(gone.values()), name, gone.most_common(2)))
    stale.sort(reverse=True)
    print("pages printing a quoted formula the converter no longer emits: %d papers, %d lines"
          % (len(stale), sum(n for n, _s, _g in stale)))
    for n, name, sample in stale[:12]:
        print("  %3d  %s  %s" % (n, name[:44], sample[0][0][:60]))
    (ROOT / "_work" / "regen_needed.txt").write_text(
        "\n".join(name for _n, name, _s in stale), encoding="utf-8")
    print("wrote _work/regen_needed.txt with %d papers" % len(stale))


if __name__ == "__main__":
    main()
