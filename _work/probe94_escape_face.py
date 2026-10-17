r"""#94 census: which TeX escapes sit inside the maths the corpus ships, and what did the source say?

The 12 leftover `\/` that closed #93 are not a slash the converter wrote -- they are an escape that
arrives from the *other* channel (pandoc's Typst writer for body maths, which the canvas node labels
of a picture inside a display inherit).  Before asking what to fix, count three separate things:

  A  escapes carried inside `$ ... $` in `typst/*/main.typ` (`\/`, `\(`, `\)`, `\[`, `\]`, `\|`),
     by paper, with the line's channel (inside a `#cetz.canvas(` block or body text);
  B  the same control symbols in the FLAT sources (`_work/flat/*.tex`), which is what the author
     actually typed;
  C  for each paper whose SOURCE types `\/` (TeX's italic correction, which prints nothing), what the
     product carries: a slash the author typed as division reaches Typst escaped as `\/` and must print
     a slash, while an italic correction reaching the page as `\/` would print a slash TeX never drew.

  python _work/probe94_escape_face.py > _work/m94_face.txt
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import canvases  # one canvas walker, #93's

ESCAPES = [r"\/", r"\(", r"\)", r"\[", r"\]", r"\|"]
MATH = re.compile(r"\$[^$\n]+\$")


def count_of(text, esc):
    # for a bare `/` the escaped one must not count, or the two rows are the same population
    if esc == "/":
        return len(re.findall(r"(?<!\\)/", text))
    return text.count(esc)


def math_spans(text):
    """[$ ... $] spans, the same shape #93's scanner reads inside a canvas block."""
    return MATH.findall(text)


def channels(path):
    r"""[(channel, text)]: every #cetz.canvas block the #93 walker finds, then the file minus those blocks.

    Counting the two channels with two definitions is how the first version of this census reported 78
    `\/` as canvas while the established walker put 0 of them in a canvas of the same papers: the line
    by line brace counter here was opened by a `#cetz.canvas(` and closed by a stray `}` in a node, so a
    stretch of body ran under the canvas flag.  A canvas block has its newlines folded -- the emitter
    breaks a long node label across lines -- and the body is read line by line, where an unpaired `$`
    cannot drag the next equation into the span.
    """
    text = open(path, encoding="utf-8", errors="replace").read()
    blocks = canvases(text)
    rest = text
    for c in blocks:
        rest = rest.replace(c, " ", 1)
    return [("canvas", c.replace("\n", " ")) for c in blocks] \
        + [("body", ln) for ln in rest.splitlines()]


def main():
    prods = sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ")))
    spans = {}
    prods_with = set()
    for p in prods:
        for chan, text in channels(p):
            for m in math_spans(text):
                for esc in ESCAPES + ["/"]:
                    n = count_of(m, esc)
                    if n:
                        spans.setdefault((chan, esc), []).append((os.path.basename(os.path.dirname(p)), n, m))
                        prods_with.add(os.path.basename(os.path.dirname(p)))
    print("== A  escapes inside $...$ on the product page (%d papers carry at least one)" % len(prods_with))
    for chan in ("canvas", "body"):
        for esc in ESCAPES + ["/"]:
            rows = spans.get((chan, esc), [])
            print("   %-8s %-6s spans=%-5d occurrences=%-6d papers=%d"
                  % (chan, esc, len(rows), sum(r[1] for r in rows), len({r[0] for r in rows})))

    print("\n== B  the same control symbols in the flat sources")
    src = {}
    for f in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        t = open(f, encoding="utf-8", errors="replace").read()
        for esc in ESCAPES + ["/"]:
            n = count_of(t, esc)
            if n:
                src.setdefault(esc, []).append((os.path.basename(f)[:-4], n))
    for esc in ESCAPES + ["/"]:
        rows = src.get(esc, [])
        print("   %-6s sites=%-6d papers=%d" % (esc, sum(r[1] for r in rows), len(rows)))

    print("\n== C  attribution: is the product's `\\/` the author's division slash or his italic correction?")
    prod = {}
    for (chan, esc), rows in spans.items():
        for paper, n, _m in rows:
            d = prod.setdefault(paper, {"canvas": 0, "body": 0, "bare": 0})
            if esc == r"\/":
                d[chan] += n
            elif esc == "/":
                d["bare"] += n
    flat = {os.path.basename(f)[:-4]: open(f, encoding="utf-8", errors="replace").read()
            for f in glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))}
    prod_dirs = {os.path.basename(os.path.dirname(p)) for p in prods}

    def product_name(stem):
        for name in prod_dirs:
            if name.startswith(stem[:44]) or stem.startswith(name[:44]):
                return name
        return None

    for name in sorted(flat):
        text = flat[name]
        n_it = text.count(r"\/")
        if not n_it:
            continue
        pname = product_name(name)
        d = prod.get(pname, {"canvas": 0, "body": 0, "bare": 0})
        print("   %-44s source `\\/`=%d  product `\\/` canvas=%d body=%d  product bare `/`=%d"
              % (name[:44], n_it, d["canvas"], d["body"], d["bare"]))
        for m in re.finditer(r"\\/", text):
            print("        site: %s" % text[max(0, m.start() - 45):m.end() + 45].replace("\n", " "))

    esc_all = sum(d["canvas"] + d["body"] for d in prod.values())
    bare_all = sum(d["bare"] for d in prod.values())
    print("\n   products: escaped `\\/` %d over %d papers (canvas %d/%d, body %d/%d) ;"
          " bare `/` in maths %d over %d papers"
          % (esc_all, len([d for d in prod.values() if d["canvas"] + d["body"]]),
             sum(d["canvas"] for d in prod.values()),
             len([d for d in prod.values() if d["canvas"]]),
             sum(d["body"] for d in prod.values()),
             len([d for d in prod.values() if d["body"]]),
             bare_all, len([d for d in prod.values() if d["bare"]])))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
