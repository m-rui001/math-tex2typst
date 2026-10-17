"""Taxonomy of TikZ refusals: which stage of cetz.build drops a picture.

build() returns None as soon as one stage cannot be drawn, so the useful question for the
corpus is *which* stage. Each stage is replayed here in order and the first one that refuses
is recorded, with the token or statement that caused it.
"""
import re
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path("tools").resolve()))

from t2t import cetz  # noqa: E402

TIKZ = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def stage(core):
    """First stage of build() that refuses, as (why, detail)."""
    m = re.match(r"\\begin\{tikzpicture\}", core)
    body = core[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    if head is None:
        return "opts", head
    base = cetz._transform(head)
    if base is None:
        return "head-options", str(sorted(head))[:70]
    body = body[pos:]
    end = body.rfind("\\end{tikzpicture}")
    body = body[:end] if end >= 0 else body
    expanded = cetz.expand_foreach(body)
    if expanded is None:
        return "foreach", " ".join(body.split())[:70]
    cols = cetz._colors(expanded)
    if cols is None:
        return "definecolor", ""
    if cetz.UNSUPPORTED.search(cols[1]):
        return "unsupported", cetz.UNSUPPORTED.search(cols[1]).group(0)
    placed = cetz.scoped(cols[1], base)
    if placed is None:
        return "scope", ""
    styles = cetz.picture_styles(head)
    names = {}
    for stmt, xf in placed:
        cetz.register(stmt, names, xf, styles)
    for stmt, xf in placed:
        if cetz.translate_statement(stmt, names, xf, cols[0], styles) is None:
            name = re.match(r"\\([a-zA-Z]+)", stmt.strip())
            verb = name.group(1) if name else stmt[:40]
            return "statement", "%s %s" % (verb, opts_of(stmt, styles))
    return "draws", ""


def opts_of(stmt, styles):
    """The option group of a refusing statement, with its styles merged in."""
    m = re.match(r"\\(?:node|draw|fill|filldraw|path|coordinate)\b\s*", stmt.strip())
    if not m:
        return ""
    o, _ = cetz._opts_at(stmt.strip(), m.end())
    if o is None:
        return ""
    return str(cetz.resolve_opts(o, styles))[:90]


def main():
    why = Counter()
    detail = Counter()
    for path in sorted(Path("_work", "flat").glob("*.tex")):
        for chunk in TIKZ.findall(path.read_text(encoding="utf-8", errors="replace")):
            w, d = stage(cetz.MATH_ENVELOPE.sub("", chunk))
            why[w] += 1
            if w != "draws":
                detail["%s: %s" % (w, d)] += 1
    print("pictures: %d" % sum(why.values()))
    for k, v in why.most_common():
        print("%5d  %s" % (v, k))
    print("\nrefusal details:")
    for k, v in detail.most_common(30):
        print("%5d  %s" % (v, k))


main()
