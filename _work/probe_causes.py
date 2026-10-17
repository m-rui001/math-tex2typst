"""Cluster why fallback-quoted formulas survived as raw LaTeX.

Every unconverted display equation is emitted as `$ "<cleaned latex>" $`, so the
quotes are the exact string pandoc refused. Feed each one back through pandoc
alone and keep the error's first clause: that is the cause, not a guess.

Run: python _work/probe_causes.py [max-samples]
"""
import collections
import io
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

QUOTE = re.compile(r'\$ "(.*?)" \$', re.S)
TIKZ = re.compile(r"\\begin\{tikz")
BIBCMD = re.compile(r"\\(?:href|url|emph|textbf|textit|MATHACTUAL)")
MATHACTUAL = re.compile(r"\\MathActualText")


def unquote(s):
    return s.replace("\\\\", "\x00").replace('\\"', '"').replace("\x00", "\\")


def depth(s):
    d = 0
    i = 0
    while i < len(s):
        if s[i] == "\\":
            i += 2
            continue
        if s[i] == "{":
            d += 1
        elif s[i] == "}":
            d -= 1
        i += 1
    return d


def classify(frag):
    if "$" in frag:
        return "nested-dollar"
    if TIKZ.search(frag):
        return "tikz-diagram"
    if MATHACTUAL.search(frag):
        return "MathActualText"
    if depth(frag) > 0:
        return "unclosed-group"
    _out, err = mathconv.run_pandoc(
        mathconv.BATCH_PREAMBLE + "$ " + frag + " $" + mathconv.BATCH_EPILOG)
    if not err.strip():
        return "converts-now"
    line = " ".join(err.split())
    m = re.search(r"Error at [^:]+: (.{0,60})", line)
    return (m.group(1) if m else line[:60]).strip()


def main(limit):
    samples = []
    for typ in sorted((ROOT / "typst").glob("*/*.typ")):
        text = typ.read_text(encoding="utf-8", errors="replace")
        for m in QUOTE.finditer(text):
            frag = unquote(m.group(1))
            if len(frag) > 3:
                samples.append((typ.parent.name, frag))
    print("fallback quotes in corpus:", len(samples))
    kinds = collections.Counter()
    first = {}
    for name, frag in samples[:limit]:
        tag = classify(frag)
        kinds[tag] += 1
        first.setdefault(tag, (name, frag))
    for tag, n in kinds.most_common(25):
        print("\n%-46s %d" % (tag[:46], n))
        name, frag = first[tag]
        print("    e.g. %s: %s" % (name[:34], " ".join(frag.split())[:160]))


if __name__ == "__main__":
    main(int(sys.argv[1]) if len(sys.argv) > 1 else 120)
