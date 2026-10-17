"""Match each empty figure in the generated Typst back to its source float.

Counting every picture in a paper that has one empty figure blames the gate for drawings
that were in fact emitted, so each `#figure([], caption: ...)` is paired with the source float
carrying the same caption and only that float's picture is inspected.
"""
import re
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path("tools").resolve()))

from t2t import cetz, prep  # noqa: E402

TIKZ = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
FIGURE = re.compile(r"\\begin\{figure\*?\}(.*?)\\end\{figure\*?\}", re.S)
CAP_SRC = re.compile(r"\\caption\{(.*?)\}", re.S)
EMPTY_OUT = re.compile(r"#figure\(\s*\[\],\s*\n?\s*caption: \[[^:]*: (.*?)\],", re.S)


def norm(text):
    t = re.sub(r"\\(?:label|centering|nonumber|ref\{[^{}]*\}\{[^{}]*\})\{[^{}]*\}", "", text)
    t = re.sub(r"\\[a-zA-Z]+", "", t)
    t = re.sub(r"[{}$\\^_]", "", t)
    return re.sub(r"\s+", " ", t).strip().lower()[:60]


def main():
    limit = int(sys.argv[1]) if len(sys.argv) > 1 else 300
    kind = Counter()
    examples = {}
    for path in sorted(Path("typst").glob("*/main.typ")):
        out = path.read_text(encoding="utf-8", errors="replace")
        caps = [norm(c) for c in EMPTY_OUT.findall(out)]
        if not caps:
            continue
        flat = Path("_work", "flat", path.parent.name + ".tex")
        if not flat.exists():
            continue
        _pre, body = prep.split_document(flat.read_text(encoding="utf-8", errors="replace"))
        floats = {}
        for fig in FIGURE.findall(body):
            for c in CAP_SRC.findall(fig):
                floats[norm(c)] = fig
        for cap in caps:
            fig = floats.get(cap)
            if fig is None:
                kind["caption-not-matched"] += 1
                continue
            chunks = TIKZ.findall(fig)
            if not chunks:
                rest = CAP_SRC.sub("", fig)
                kind["no-picture: " + (cetz.PICTURE.search(rest).group(0)
                                       if cetz.PICTURE.search(rest) else "plain")[:20]] += 1
                continue
            core = cetz.MATH_ENVELOPE.sub("", chunks[0])
            canvas = cetz.build(core)
            if canvas is None:
                why = "build-refused"
            elif not cetz.sane(canvas):
                why = "sane-fail"
            elif not cetz.compiles(canvas):
                why = "compile-fail"
            else:
                why = "draws-fine"
            kind[why] += 1
            if why not in examples:
                examples[why] = (path.parent.name, chunks[0][:500])
        if sum(kind.values()) >= limit:
            break
    print("empty figures paired: %d" % sum(kind.values()))
    for k, v in kind.most_common():
        print("%5d  %s" % (v, k))
    print()
    for k, (name, chunk) in examples.items():
        print("=== %s  (%s)\n%s\n" % (k, name, chunk))


main()
