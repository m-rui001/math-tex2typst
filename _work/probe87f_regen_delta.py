r"""Papers the maths-span scanner missed: `\;` / `\enspace` / `\hspace{}` anywhere in the flat source.

`probe87e` scoped the change face with `probe87_math_spans.spans()`, and that scanner desyncs on a
`$` it does not understand -- `The-two-primary-Birch-...` carries a `\;` inside a `\[ ... \]`
`\substack` that the scanner left outside maths, so the paper was never regenerated and its one
`#h(0em)` survived. This probe takes the over-inclusive reading instead: any `\;`, `\enspace` or
`\hspace{}` anywhere in the flat source, then subtracts the papers already regenerated. The
difference is the delta to regenerate; over-inclusion only costs a rebuild, a miss costs a token.

  python _work/probe87f_regen_delta.py
"""
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import probe87_math_spans as B  # noqa: E402

ANY = (re.compile(r"\\;"), re.compile(r"\\enspace(?![A-Za-z])"),
       re.compile(r"\\hspace\s*\{[^{}]*\}"))


def scan():
    narrow, wide = set(), set()
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        text = io.open(path, encoding="utf-8", errors="replace").read()
        maths = "".join(text[a:b] for a, b in B.spans(text))
        if any(rx.search(maths) for rx in ANY):
            narrow.add(stem)
        if any(rx.search(text) for rx in ANY):
            wide.add(stem)
    return narrow, wide


def main():
    narrow, wide = scan()
    print("scanner (in-maths) set   = %d" % len(narrow))
    print("over-inclusive set       = %d" % len(wide))
    delta = sorted(wide - narrow)
    print("delta (missed by scanner) = %d" % len(delta))
    for stem in delta:
        print("  %s" % stem)
    with open(os.path.join(ROOT, "_work", "hspace_delta_names.txt"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(delta) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
