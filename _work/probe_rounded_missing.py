r"""Which source statements ask for `rounded corners` and still emit nothing rounded?

The product scan (`_work/rounded_rect_scan.py`) pairs a per-paper count of rounded `rect(` paths and
rounded `#box(` node frames with the source's demand for the key inside a picture, and prints the
papers that ask and get neither. A keyword count cannot say what those are, so this rebuilds each
flagged picture the way the batch does -- preamble styles, in-picture declarations and macro expansion
all included, because a `box/.style={...,rounded corners}` in the preamble is the commonest way to ask
for the key -- and prints the statement that carried it, sorted by the shape it draws.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import convert, prep, cetz  # noqa: E402

KEY = re.compile(r"rounded\s+corners")
STATEMENT = re.compile(r"\\(?:draw|fill|filldraw|shade|node|path)[^;]*;")


def shape_of(stmt):
    if re.search(r"\\node|node\s*\[", stmt):
        return "node frame"
    if "rectangle" in stmt:
        return "rectangle path"
    for name in ("circle", "arc", "plot", "grid"):
        if re.search(r"\b%s\b" % name, stmt):
            return name
    return "polyline" if stmt.count("--") >= 2 or "to[bend" in stmt else "other"


def canvases(body, p):
    """Every picture of one paper, on the batch's basis: expanded and with its declarations folded in."""
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    scopes = convert.picture_scopes(body, p.macros)
    out = []
    for pic, (table, decls) in zip(convert.TIKZ_SPAN.findall(body), scopes):
        if decls:
            pic = convert.with_declarations(pic, decls)
        out.append(prep.expand_macros(pic, table))
    return out


def main():
    counts = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        if KEY.search(open(path, encoding="utf-8", errors="replace").read()):
            continue
        tex = os.path.join(ROOT, "_work", "flat", stem + ".tex")
        if not os.path.exists(tex):
            continue
        src = open(tex, encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        table = prep.parse_preamble(pre_text)
        for pic in canvases(body, table):
            if not KEY.search(pic):
                continue
            built = cetz.convert(pic, table.colors, convert.line_cm(table))
            if built is None:
                counts.setdefault("refused picture", []).append(stem)
                continue
            if "radius:" in built:
                counts.setdefault("rounded on the batch basis only", []).append(stem)
                continue
            for stmt in STATEMENT.findall(pic):
                if not KEY.search(stmt):
                    continue
                head = re.match(r"\\(draw|fill|filldraw|shade|node|path)", stmt).group(1)
                counts.setdefault((shape_of(stmt), head), []).append(
                    (stem, " ".join(stmt.split())[:132]))
    for kind, hits in sorted(counts.items(), key=lambda kv: -len(kv[1])):
        label = kind if isinstance(kind, str) else "%s via \\%s" % (kind[0], kind[1])
        papers = sorted({h[0] if isinstance(h, tuple) else h for h in hits})
        print("%-36s hits=%d  papers=%d" % (label, len(hits), len(papers)))
        if isinstance(kind, tuple):
            for stem, stmt in hits[:3]:
                print("      %s: %s" % (stem[:34], stmt))


if __name__ == "__main__":
    main()
