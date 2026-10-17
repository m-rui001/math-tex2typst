"""Which part of the \\node branch refuses? The three exits are counted separately.

translate_statement() drops a node when it cannot place it, when it finds no text group, or when
that group is not balanced. They need different fixes: relative placement is TikZ's measurement
machinery, while a label-less node is one line of code.
"""
import re
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path("tools").resolve()))

from t2t import cetz, prep  # noqa: E402

NODE = re.compile(r"\\node\b")


def reason(stmt, names, xf, pal):
    m = re.match(r"\\node\b\s*", stmt)
    if not m:
        return "not-node", ""
    o, pos = cetz._opts_at(stmt, m.end())
    if o is None:
        return "opts", ""
    head = cetz._node_at(stmt[pos:], names, xf, o)
    if head is None:
        rest = stmt[pos:].lstrip()
        if not rest.startswith("at"):
            opts = " ".join(sorted(o))
            return "no-at", ("positioned: " + opts)[:60] if opts else "bare name"
        return "coord-unresolved", rest[:60]
    _name, _at, rest = head
    brace = rest.find("{")
    if brace < 0:
        return "no-text-group", rest[:60]
    inner, _end = cetz.bracketed(rest, brace)
    if inner is None:
        return "unbalanced-group", rest[:60]
    if cetz.node_text(inner) is None:
        return "node_text", inner[:60]
    if cetz.emit_node(cetz.fmt(*_at), inner, o, pal) is None:
        return "emit_node", ""
    return "would-draw", ""


def main():
    why = Counter()
    detail = Counter()
    ex = {}
    for path in sorted(Path("_work", "flat").glob("*.tex")):
        out = Path("typst", path.stem, "main.typ")
        if not out.exists():
            continue
        text = out.read_text(encoding="utf-8", errors="replace")
        if "#raw(block: true, lang: \"latex\", \"\\\\begin{tikzpicture}" not in text:
            continue
        _pre, body = prep.split_document(path.read_text(encoding="utf-8", errors="replace"))
        for chunk in re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", body, re.S):
            core = cetz.MATH_ENVELOPE.sub("", chunk)
            m = re.match(r"\\begin\{tikzpicture\}", core)
            if not m:
                continue
            head, p = cetz._opts_at(core[m.end():].lstrip(), 0)
            if head is None:
                continue
            xf = cetz._transform(head)
            if xf is None:
                continue
            body_text = core[m.end():].lstrip()[p:]
            end = body_text.rfind("\\end{tikzpicture}")
            expanded = cetz.expand_foreach(body_text[:end if end >= 0 else len(body_text)])
            if expanded is None:
                continue
            cols = cetz._colors(expanded)
            if cols is None:
                continue
            pal, stripped = cols
            if cetz.UNSUPPORTED.search(stripped):
                continue
            placed = cetz.scoped(stripped, xf)
            if placed is None:
                continue
            names = {}
            for stmt, sxf in placed:
                cetz.register(stmt, names, sxf)
            for stmt, sxf in placed:
                if not NODE.match(stmt.strip()):
                    continue
                w, d = reason(stmt.strip(), dict(names), sxf, pal)
                if w == "would-draw":
                    continue
                why[w] += 1
                detail["%s | %s" % (w, d)] += 1
                ex.setdefault(w, stmt.strip()[:150])
    print("node statements refused, by exit:")
    for k, v in why.most_common():
        print("%6d  %s" % (v, k))
    print("\nexamples:")
    for k, s in ex.items():
        print("=== %s\n%s" % (k, s))
    print("\ntop details:")
    for k, v in detail.most_common(12):
        print("%6d  %s" % (v, k))


main()
