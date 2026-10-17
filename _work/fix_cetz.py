import io

P = "tools/t2t/cetz.py"
src = io.open(P, encoding="utf-8", newline="").read()
lines = src.split("\n")

assert lines[453].strip().startswith("return '\"%s\"' %"), lines[453]
assert lines[485].strip().startswith("return re.sub(r\"\\s+\""), lines[485]

NEW = r'''    return '"%s"' % re.sub(r"[\"$\\]", "", tex.strip())


LINEBREAK = re.compile(r"\\\\\s*(?:\[[^\]]*\])?")


def _markup_text(chunk):
    r"""TikZ prose -> Typst markup: commands go, markup specials are escaped."""
    chunk = re.sub(r"\\[a-zA-Z]+|[{}\\]", "", chunk)
    return re.sub(r"([#@`\[\]])", r"\\\1", chunk)


def _prose(chunk):
    r"""Prose between two math spans, with TikZ's '\\' as a forced line break."""
    pieces, pos = [], 0
    for m in LINEBREAK.finditer(chunk):
        pieces.append(_markup_text(chunk[pos:m.start()]))
        pos = m.end()
    pieces.append(_markup_text(chunk[pos:]))
    return "#linebreak()".join(pieces)


def node_text(inner):
    r"""A TikZ node body -> Typst markup: '$...$' stays math, '\\' breaks the line."""
    inner = re.sub(r"\$\$", "$ ", inner)
    out, pos = [], 0
    for m in re.finditer(r"\$([^$]*)\$", inner):
        out.append(_prose(inner[pos:m.start()]))
        body = _math_body(m.group(1))
        out.append("$" + body + "$" if body else "")
        pos = m.end()
    out.append(_prose(inner[pos:]))
    return re.sub(r"\s+", " ", "".join(out)).strip()'''

lines[453:486] = NEW.split("\n")
io.open(P, "w", encoding="utf-8", newline="\n").write("\n".join(lines))
print("patched")
