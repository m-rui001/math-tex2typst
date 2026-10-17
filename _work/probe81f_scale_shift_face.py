r"""Corpus face for the `scale=` x `xshift=` defect: how many shifts sit under a non-unit scale?

The pdflatex control (`_work/probe81e_scale_shift.py`) says a picture's `scale=` multiplies a scope's
`xshift`/`yshift` (1.7cm -> 2.456cm at scale 1.45) while the axis scales `x=`/`y=` do not
(1.694cm). Our emitter uses the axis rule for both, so every shift under a `scale=` lands short by
that factor. Before writing a mapping, count the spelling that exists.

Walk each `tikzpicture` and its nested `scope`s, carrying the cumulative scale factor, and report the
shifts that are reached with a factor other than 1.

  python _work/probe81f_scale_shift_face.py [n]     # n = how many examples to print
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

PIC = re.compile(r"\\begin\{tikzpicture\}(\[[^\]]*\])?", re.S)
ENV = re.compile(r"\\(begin|end)\{(tikzpicture|scope)\}", re.S)
OPT = re.compile(r"\\begin\{(tikzpicture|scope)\}(\[[^\]]*\])?")
KEY = re.compile(r"(?:^|[,:\[{(])\s*(scale|xscale|yscale|xshift|yshift|shift)\s*=\s*(\{[^{}]*\}|\"[^\"]*\"|[^,=\s\[\]]+)")


def split_opts(text):
    """Top-level `key=value` pairs of an option list, ignoring nesting and quoted strings."""
    out, depth, buf, quoted = [], 0, [], False
    for ch in text:
        if ch == '"':
            quoted = not quoted
        if not quoted:
            if ch == "{":
                depth += 1
            elif ch == "}":
                depth -= 1
            elif ch == "," and depth == 0:
                out.append("".join(buf).strip())
                buf = []
                continue
        buf.append(ch)
    if buf:
        out.append("".join(buf).strip())
    return [o for o in out if o]


def length_pt(value):
    """A shift's own length in pt, or None when it is a node name rather than a dimension."""
    m = re.fullmatch(r"(-?[0-9.]+)\s*(cm|mm|pt|in|em|ex|bp)", value.strip())
    if not m:
        return None
    unit = {"cm": 28.45274, "mm": 2.845274, "pt": 1.0, "in": 72.0, "em": 10.0, "ex": 4.5,
            "bp": 1.0}[m.group(2)]
    return float(m.group(1)) * unit


def scan(text):
    """(shift sites under a non-unit scale) in one file, as (kind, length pt, x factor)."""
    hits, stack, pos = [], [(1.0, 1.0, 1.0)], 0

    def feed(segment, sx, sy, sc):
        for km in KEY.finditer(segment):
            name, value = km.group(1), km.group(2).strip("{}\"")
            if name in ("xshift", "yshift"):
                ln = length_pt(value)
                factor = sx if name == "xshift" else sy
                if ln is not None and abs(factor - 1.0) > 1e-9:
                    hits.append((name, round(ln, 2), round(factor, 3)))
            elif name == "shift" and (abs(sc - 1.0) > 1e-9 or abs(sx - 1.0) > 1e-9):
                hits.append(("shift", 0.0, round(sx, 3)))

    for m in ENV.finditer(text):
        # whatever was written before this marker belongs to the environment we are inside of
        feed(text[pos:m.start()], *stack[-1])
        if m.group(1) == "begin":
            om = OPT.match(text, m.start())
            opts = (om.group(2) or "").strip("[]") if om else ""
            local = {}
            for pair in split_opts(opts):
                if "=" in pair:
                    k, v = pair.split("=", 1)
                    local[k.strip()] = v.strip().strip("{}")
            num = {k: float(local[k]) for k in ("scale", "xscale", "yscale")
                   if re.fullmatch(r"-?[0-9.]+", local.get(k, ""))}
            sc = num.get("scale", 1.0)
            sx = num.get("xscale", sc)
            sy = num.get("yscale", sc)
            par_sx, par_sy, par_sc = stack[-1]
            stack.append((par_sx * sx, par_sy * sy, par_sc * sc))
        elif len(stack) > 1:
            stack.pop()
        pos = m.end()
    feed(text[pos:], *stack[-1])
    return hits


def main():
    show = int(sys.argv[1]) if len(sys.argv) > 1 else 8
    files = glob.glob(os.path.join(ROOT, "preprints", "*", "build", "**", "*.tex"), recursive=True)
    total = 0
    papers = set()
    pics = set()
    examples = []
    for path in files:
        text = open(path, encoding="utf-8", errors="replace").read()
        if "shift" not in text:
            continue
        hits = scan(text)
        if not hits:
            continue
        stem = os.path.relpath(path, ROOT).split(os.sep)[1]
        total += len(hits)
        papers.add(stem)
        for h in hits[:1]:
            pics.add((stem, os.path.basename(path)))
        if len(examples) < show:
            examples.append((stem, os.path.basename(path), hits))
    print("files scanned: %d" % len(files))
    print("shift sites under a non-unit `scale`: %d   in %d papers   in %d (paper,file) pairs"
          % (total, len(papers), len(pics)))
    for stem, name, hits in examples:
        print("  %-52s %-22s %s" % (stem[:52], name[:22], hits[:4]))


if __name__ == "__main__":
    main()
